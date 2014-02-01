; PET/CBM EDIT ROM - Keyboard Scan - Business Keyboards
; ================
; Standard Business Keyboard scanner. Requires one keyboard table.
;

;--------------- Scan Keyboard (scnkey)
; NOTE: The keyboard ROW select is reset to zero in IRQ routine

SCAN_KEYBOARD
;!if DEBUG = 1 { INC DBLINE+5 }		; DEBUG - 6th character on top line

		LDY #$FF		; No Key
		STY Key_Image		; Key Image
		INY
		STY KEYFLAGS		; Flag: Print Shifted Chars.
		LDA RPTFLG		; Flag: REPEAT Key Used, $80 = Repeat, $40 = disable
		AND #$7F
		STA RPTFLG		; Flag: REPEAT Key Used, $80 = Repeat, $40 = disable
		LDX #$50		; 80 bytes in table. X is used as offset into the table

SCAN_ROW	LDY #$08
		LDA PIA1_Port_B 	; Keyboard COL result
		CMP PIA1_Port_B 	; Keyboard COL result
		BNE SCAN_COL		; Debounce

SCAN_COL	LSR			; Shift the value right
		BCS SCAN_NEXT2		; If the bit was "1" then key is NOT down. Skip

;-------------- We have a key press. Look it up in the keyboard matrix

		PHA			; Save for later
		LDA KEYBOARD_NORMAL-1,X	; Read Keyboard Matrix (X is offset)
		BNE SCAN_NOSH		; Is it SHIFT key? No, skip

;-------------- SHIFT key Detected

		LDA #$01		; Set the SHIFT flag
		STA KEYFLAGS		; Flag: Print Shifted Chars.
		BNE SCAN_NEXT		; No, skip

;-------------- Non-SHIFT key

SCAN_NOSH	CMP #$10		; Is it REPEAT?
		BNE SCAN_NORPT		; No, skip

;-------------- REPEAT key

		LDA RPTFLG		; Flag: REPEAT Key Used, $80 = Repeat, $40 = disable
		ORA #$80
		STA RPTFLG		; Flag: REPEAT Key Used, $80 = Repeat, $40 = disable
		BMI SCAN_NEXT

SCAN_NORPT	CMP #$FF		; Is it "no key"?
		BEQ SCAN_NEXT		; Yes, skip

;-------------- Normal key

		STA Key_Image		; Store the key

SCAN_NEXT	PLA			; Restore value from keyboard scan for next loop
SCAN_NEXT2	DEX			; Decrement keyboard table offset
		BEQ SCAN_GOT		; Process Key Image

		DEY			; Next COLUMN
		BNE SCAN_COL		; Go back up for next column bit

;-------------- Completed all bits in ROW, Increment ROW

		INC PIA1_Port_A		; Next Keyboard ROW
		BNE SCAN_ROW		; More? Yes, loop back

;-------------- Process Key Image

SCAN_GOT	LDA Key_Image		; Key Image
		CMP KEYPRESSED		; Current Key Pressed: 255 = No Key
		BEQ SCAN_PRESS		; If key is the same then it's being held down

		LDX #$10
		STX DELAY		; Repeat Delay Counter
		BNE SCAN_REC

SCAN_PRESS	BIT RPTFLG		; Check Repeat Flag: $80 = Repeat, $40 = disable
		BMI SCAN_DELAY2
		BVS SCAN_OUT		; Exit
		CMP #$FF		; No key?
		BEQ SCAN_OUT		; Exit
		CMP #$14
		BEQ SCAN_DELAY
		CMP #$20
		BEQ SCAN_DELAY
		CMP #$1D
		BEQ SCAN_DELAY
		CMP #$11
		BNE SCAN_OUT		; Exit

SCAN_DELAY	LDX DELAY		; Repeat Delay Counter
		BEQ SCAN_DELAY2
		DEC DELAY		; Repeat Delay Counter
		BNE SCAN_OUT		; Exit

SCAN_DELAY2	DEC KOUNT		; Repeat Speed Counter
		BNE SCAN_OUT		; Exit
		LDX #$04
		STX KOUNT		; Repeat Speed Counter
		LDX CharsInBuffer	; No. of Chars. in Keyboard Buffer (Queue)
		DEX			; One less
		BPL SCAN_OUT		; Exit

SCAN_REC	STA KEYPRESSED		; Current Key Pressed: 255 = No Key
		CMP #$FF		; No Key?
 		BEQ SCAN_OUT		; Yes, exit

		TAX
		PHP
		AND #$7F		; Mask off upper bit (non-shiftable flag in key matrix byte)
		PLP
		BMI SCAN_NORM

;-------------- Process SHIFT key flag with Numeric Keys or Graphic keys

		LSR KEYFLAGS		; Check for SHIFT
		BCC SCAN_NORM		; No, store as-is
		CMP #$2C		; Is it less than 2C? 
		BCC SCAN_SHIFT		; Yes, skip
		CMP #$3C		; Is it greater than 3C?
		BCS SCAN_SHIFT		; Yes, skip
		SBC #$0F		; No, it must me Numeric so subtract 15
		CMP #$20		; Is it above <SPACE>
		BCS SCAN_NORM		; Yes

		ADC #$20		; Add 32 to convert to shifted symbol on number key
		!byte $2C		; Hide the next instruction trick

SCAN_SHIFT	ORA #$80		; Set upper bit for Graphics Symbol

;-------------- Put the KEY into the Buffer (Key in accumulator)

SCAN_NORM	LDX CharsInBuffer	; No. of Chars. in Keyboard Buffer (Queue)
		CPX XMAX		; Size of Keyboard Buffer
		BCS iE56F		; Exit if buffer full
		STA KEYD,X		; Put the key into the buffer
		INX			; Increment character count
		STX CharsInBuffer	; No. of Chars. in Keyboard Buffer (Queue)

SCAN_OUT	RTS