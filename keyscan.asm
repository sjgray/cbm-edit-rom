; PET/CBM EDIT ROM - Keyboard Scan - Business Keyboards
; ================
; Standard Business Keyboard scanner. Requires one keyboard table.
;
; TODO: sub names. comment

;--------------- Scan Keyboard (scnkey)

SCAN_KEYBOARD
		LDY #$FF
		STY Key_Image	;$A6		; Key Image
 E4C2		INY
 E4C3		STY KEYFLAGS	; Flag: Print Shifted Chars.
 E4C5		LDA $E4		; Flag: REPEAT Key Used, $80 = Repeat, $40 = disable
 E4C7		AND #$7F
 E4C9		STA $E4		; Flag: REPEAT Key Used, $80 = Repeat, $40 = disable
 E4CB		LDX #$50
 E4CD	iE4CD	LDY #$08
 E4CF		LDA $E812
 E4D2		CMP $E812
 E4D5		BNE $E4CD
 E4D7	iE4D7	LSR
 E4D8		BCS iE4F9
 E4DA		PHA
 E4DB		LDA $E6D0,X
 E4DE		BNE iE4E6
 E4E0		LDA #$01
 E4E2		STA KEYFLAGS	; Flag: Print Shifted Chars.
 E4E4		BNE iE4F8
 E4E6	iE4E6	CMP #$10
 E4E8		BNE iE4F2
 E4EA		LDA $E4		; Flag: REPEAT Key Used, $80 = Repeat, $40 = disable
 E4EC		ORA #$80
 E4EE		STA $E4		; Flag: REPEAT Key Used, $80 = Repeat, $40 = disable
 E4F0		BMI iE4F8
 E4F2	iE4F2	CMP #$FF
 E4F4		BEQ iE4F8
 E4F6		STA $A6		; Key Image
 E4F8	iE4F8	PLA
 E4F9	iE4F9	DEX
 E4FA		BEQ iE504	; Process Key Image
 E4FC		DEY
 E4FD		BNE iE4D7
 E4FF		INC $E810	; PIA 1						CHIP
 E502		BNE iE4CD

;-------------- Process Key Image

 E504	iE504	LDA $A6		; Key Image
 E506		CMP $97		; Current Key Pressed: 255 = No Key
 E508		BEQ iE510
 E50A		LDX #$10
 E50C		STX $E6		; Repeat Delay Counter
 E50E		BNE iE53F
 E510	iE510	BIT RPTFLG
 E512		BMI iE532
 E514		BVS iE56F
 E516		CMP #$FF
 E518		BEQ iE56F
 E51A		CMP #$14
 E51C		BEQ iE52A
 E51E		CMP #$20
 E520		BEQ iE52A
 E522		CMP #$1D
 E524		BEQ iE52A
 E526		CMP #$11
 E528		BNE iE56F
 E52A	iE52A	LDX DELAY		; Repeat Delay Counter
 E52C		BEQ iE532
 E52E		DEC DELAY		; Repeat Delay Counter
 E530		BNE iE56F
 E532	iE532	DEC KOUNT		; Repeat Speed Counter
 E534		BNE iE56F
 E536		LDX #$04
 E538		STX $E5		; Repeat Speed Counter
 E53A		LDX CharsInBuffer	; No. of Chars. in Keyboard Buffer (Queue)
 E53C		DEX
 E53D		BPL iE56F
 E53F	iE53F	STA KEYPRESSED		; Current Key Pressed: 255 = No Key
 E541		CMP #$FF
 E543		BEQ iE56F
 E545		TAX
 E546		PHP
 E547		AND #$7F
 E549		PLP
 E54A		BMI iE563
 E54C		LSR KEYFLAGS	; Flag: Print Shifted Chars.
 E54E		BCC iE563
 E550		CMP #$2C
 E552		BCC iE561
 E554		CMP #$3C
 E556		BCS iE561
 E558		SBC #$0F
 E55A		CMP #$20
 E55C		BCS iE563
 E55E		ADC #$20
 E560		BIT $8009

 E563	iE563	LDX CharsInBuffer	; No. of Chars. in Keyboard Buffer (Queue)
 E565		CPX XMAX		; Size of Keyboard Buffer
 E567		BCS iE56F
 E569		STA $026F,X
 E56C		INX
 E56D		STX CharsInBuffer	; No. of Chars. in Keyboard Buffer (Queue)
 E56F	iE56F	RTS