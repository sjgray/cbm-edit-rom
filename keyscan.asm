; PET/CBM EDIT ROM - Keyboard Scan - Business Keyboards
; ================
; Standard Business Keyboard scanner. Requires one keyboard table.
;
; TODO: sub names. comment

;--------------- Scan Keyboard (scnkey)

SCAN_KEYBOARD
		LDY #$FF		; No Key
		STY Key_Image		; Key Image
		INY
		STY KEYFLAGS		; Flag: Print Shifted Chars.
		LDA $E4			; Flag: REPEAT Key Used, $80 = Repeat, $40 = disable
		AND #$7F
		STA $E4			; Flag: REPEAT Key Used, $80 = Repeat, $40 = disable
		LDX #$50
iE4CD		LDY #$08
		LDA PIA1_Port_B 	; Keyboard COL result
		CMP PIA1_Port_B 	; Keyboard COL result
		BNE iE4CD		; debounce
iE4D7		LSR
		BCS iE4F9
		PHA
		LDA KEYBOARD_NORMAL-1,X	; Read Keyboard Matrix
		BNE iE4E6		; No match, skip

		LDA #$01
		STA KEYFLAGS		; Flag: Print Shifted Chars.
		BNE iE4F8
iE4E6		CMP #$10
		BNE iE4F2
		LDA RPTFLG		; Flag: REPEAT Key Used, $80 = Repeat, $40 = disable
		ORA #$80
		STA RPTFLG		; Flag: REPEAT Key Used, $80 = Repeat, $40 = disable
		BMI iE4F8
iE4F2		CMP #$FF
		BEQ iE4F8
		STA Key_Image		; Key Image
iE4F8		PLA
iE4F9		DEX
		BEQ iE504		; Process Key Image
		DEY
		BNE iE4D7
		INC PIA1_Port_A		; Next Keyboard ROW
		BNE iE4CD		; more? yes, loop back

;-------------- Process Key Image

iE504		LDA Key_Image		; Key Image
		CMP KEYPRESSED		; Current Key Pressed: 255 = No Key
		BEQ iE510
		LDX #$10
		STX DELAY		; Repeat Delay Counter
		BNE iE53F
iE510		BIT RPTFLG		; Flag: REPEAT Key Used, $80 = Repeat, $40 = disable
		BMI iE532
		BVS iE56F
		CMP #$FF		; No key?
		BEQ iE56F
		CMP #$14
		BEQ iE52A
		CMP #$20
		BEQ iE52A
		CMP #$1D
		BEQ iE52A
		CMP #$11
		BNE iE56F
iE52A		LDX DELAY		; Repeat Delay Counter
		BEQ iE532
		DEC DELAY		; Repeat Delay Counter
		BNE iE56F
iE532		DEC KOUNT		; Repeat Speed Counter
		BNE iE56F
		LDX #$04
		STX $E5			; Repeat Speed Counter
		LDX CharsInBuffer	; No. of Chars. in Keyboard Buffer (Queue)
		DEX
		BPL iE56F
iE53F		STA KEYPRESSED		; Current Key Pressed: 255 = No Key
		CMP #$FF		; No Key?
 		BEQ iE56F		; Yes, exit

		TAX
		PHP
		AND #$7F		; Mask off upper bit
		PLP
		BMI iE563

		LSR KEYFLAGS		; Check for SHIFT
		BCC iE563		; No, store as-is
		CMP #$2C		;  
		BCC iE561
		CMP #$3C		;
		BCS iE561
		SBC #$0F
		CMP #$20		; <SPACE>
		BCS iE563

		ADC #$20
		!byte $2C		; hide the next instruction trick
iE561		ORA #$80

iE563		LDX CharsInBuffer	; No. of Chars. in Keyboard Buffer (Queue)
		CPX XMAX		; Size of Keyboard Buffer
		BCS iE56F		; Exit if buffer full
		STA KEYD,X		; Put the key into the buffer
		INX			; Increment character count
		STX CharsInBuffer	; No. of Chars. in Keyboard Buffer (Queue)
iE56F		RTS