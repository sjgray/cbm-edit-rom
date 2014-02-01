; PET/CBM EDIT ROM - Code to check for ESC Sequence
; ================
; Goal is to support as many C128/CBM-II ESC codes as possible
;

CheckESC
		LDX LASTCHAR 		; Previous character printed
		CPX #$1B		; <ESC>?
		BEQ ESC_YES		; Yes, process it
		JMP ESC_DONE		; No, back to normal checking

;-------------- Process ESC sequence

ESC_YES		CMP #$1b		; Is current char <ESC>?
		BEQ DoESCESC		; Yes, Do <ESC><ESC>
		BNE DoEscapeCode	; No,  Do <ESC>+KEY

;-------------- Do <ESC><ESC>

DoESCESC
		LDA #0			; Clear character
		JMP ESCAPE_O		; <ESC>+O (escape)


;-------------- Do <ESC>+KEY Sequence

DoEscapeCode	AND #$7F		; Strip top bit
		SEC
!IF COLOURPET = 1 {
		SBC #$30		; Subtract 30 (Start at "0")
		CMP #$2B		; Out of range?
} ELSE {
		SBC #$40		; Subtract 40 (Start at "@")
		CMP #$1B		; Out of range?
}
		BCS DoESCDONE		; Yes, skip

		LDX #0
		STX LASTCHAR		; Clear Last Char

		ASL
		TAX
		LDA ESCVECTORS+1,X	; ESC Sequence Vectors
		PHA
		LDA ESCVECTORS,X	; ESC Sequence Vectors
		PHA			; Push address to stack so RTS will jump to selected routine
		LDA #0			; Clear Character
		RTS

DoESCDONE	JMP ESC_DONE

;-------------- Esc Sequence Vectors    (*=changed from C128)

ESCVECTORS
!IF COLOURPET = 1 {
		!WORD ESCAPE_NUM-1	; Esc-0 Set Colour to Black
		!WORD ESCAPE_NUM-1	; Esc-1 Set Colour to Medium Grey
		!WORD ESCAPE_NUM-1	; Esc-2 Set Colour to Blue
		!WORD ESCAPE_NUM-1	; Esc-3 Set Colour to Light Blue
		!WORD ESCAPE_NUM-1	; Esc-4 Set Colour to Green
		!WORD ESCAPE_NUM-1	; Esc-5 Set Colour to Light Green
		!WORD ESCAPE_NUM-1	; Esc-6 Set Colour to Dark Cyan
		!WORD ESCAPE_NUM-1	; Esc-7 Set Colour to Light Cyan
		!WORD ESCAPE_NUM-1	; Esc-8 Set Colour to Red
		!WORD ESCAPE_NUM-1	; Esc-9 Set Colour to Light Red
		!WORD ESCAPE_NUM-1	; Esc-: Set Colour to Dark Purple
		!WORD ESCAPE_NUM-1	; Esc-; Set Colour to Purple
		!WORD ESCAPE_NUM-1	; Esc-< Set Colour to Dark Yellow
		!WORD ESCAPE_NUM-1	; Esc-= Set Colour to Yellow
		!WORD ESCAPE_NUM-1	; Esc-> Set Colour to Light Grey
		!WORD ESCAPE_NUM-1	; Esc-? Set Colour to White
}
		!WORD ESCAPE_AT-1	; Esc-@ Clear Remainder of Screen
		!WORD ESCAPE_A-1	; Esc-a Auto Insert
		!WORD ESCAPE_B-1	; Esc-b Bottom
		!WORD ESCAPE_C-1	; Esc-c Cancel Auto Insert
		!WORD ESCAPE_D-1	; Esc-d Delete Line
		!WORD ESCAPE_E-1	; Esc-e Cursor Non Flash
		!WORD ESCAPE_F-1	; Esc-f Cursor Flash
		!WORD ESCAPE_G-1	; Esc-g Bell Enable
		!WORD ESCAPE_H-1	; Esc-h Bell Disable
		!WORD ESCAPE_I-1	; Esc-i Insert Line
		!WORD ESCAPE_J-1	; Esc-j Start-of-Line
		!WORD ESCAPE_K-1	; Esc-k End-of-Line
		!WORD ESCAPE_L-1	; Esc-l Scroll On
		!WORD ESCAPE_M-1	; Esc-m Scroll Off
		!WORD ESCAPE_N-1	; Esc-n Screen Normal
		!WORD ESCAPE_O-1	; Esc-o (escape) Also: <ESC><ESC>
		!WORD ESCAPE_P-1	; Esc-p Erase Begin
		!WORD ESCAPE_Q-1	; Esc-q Erase End
		!WORD ESCAPE_R-1	; Esc-r Screen Reverse
		!WORD ESCAPE_S-1	; Esc-s Text/Lowercase Mode * (was: Block Cursor)
		!WORD ESCAPE_T-1	; Esc-t Top
		!WORD ESCAPE_U-1	; Esc-u Graphics/Uppercase Mode * (was: Underline Cursor)
		!WORD ESCAPE_V-1	; Esc-v Scroll Up
		!WORD ESCAPE_W-1	; Esc-w Scroll Down
		!WORD ESCAPE_X-1	; Esc-x Switch 40/80 Col
		!WORD ESCAPE_Y-1	; Esc-y Normal Chr Set * (was: Set Default Tabs)
		!WORD ESCAPE_Z-1	; Esc-z Alternate Chr Set * (was: Clear All Tabs)


;=============== ESCAPE CODES not in normal PET code
;
; The following ESCAPE CODE entry points need to be assigned
; and/or additional code must be written to support them.

ESCAPE_AT	; Esc-@ Clear Remainder of Screen
ESCAPE_A	; Esc-a Auto Insert
ESCAPE_C	; Esc-c Cancel Auto Insert
ESCAPE_E	; Esc-e Cursor Non Flash
ESCAPE_F	; Esc-f Cursor Flash
ESCAPE_K	; Esc-k End-of-Line
ESCAPE_L	; Esc-l Scroll On
ESCAPE_M	; Esc-m Scroll Off

ESCAPE_X	; Esc-x Switch 40/80 Col

		JMP IRQ_EPILOG				; Ignore sequence for now


;-------------- New ESC sequences

!IF COLOURPET = 1 {
ESCAPE_NUM
		LDA DATAX				; Character
		SEC
		SBC #$30				; Subtract 30 (Start at "0")
		STA COLOURFG
		JSR SetColourValue
		JMP IRQ_EPILOG
}

ESCAPE_G						; Esc-g Bell Enable
		LDA #1
		STA BELLMODE
		JMP IRQ_EPILOG

ESCAPE_H						; Esc-h Bell Disable
		LDA #0
		STA BELLMODE
		JMP IRQ_EPILOG


ESCAPE_Q						; Esc-q Erase End
		JSR Erase_To_EOL
		JMP IRQ_EPILOG
ESCAPE_S						; Esc-s Standard Lowercase (was: Block Cursor)
		JSR CRT_SET_TEXT			; Set Lowercase/Text Mode
		JMP IRQ_EPILOG
ESCAPE_U						; Esc-u Uppercase (was: Underline Cursor - not supported on PET)
		JSR CRT_SET_GRAPHICS			; Set Uppercase/Graphics Mode
		JMP IRQ_EPILOG

;-------------- CRTC Chip Functions
; CRTC controller REGISTER 12 is used for Screen RAM Address HI
; BIT 4 controls the INVERT line     (normal=1,rvs=0)
; BIT 5 controls the CHR OPTION line (normal=0,alternate=1)

ESCAPE_N						; Esc-n Screen Normal
		SEI
		LDA #12					; CRTC Register#12 - Display Address HI
		STA CRT_Address				; Select the Register 
		LDA CRT_Status				; Read the Value
		ORA #%00010000				; Set BIT 4
		JMP CRTUPDATE

ESCAPE_R						; Esc-r Screen Reverse
		SEI
		LDA #12					; CRTC Register#12 - Display Address HI
		STA CRT_Address				; Select the Register 
		LDA CRT_Status				; Read the Value
		AND #%11101111				; Clear BIT 4
		JMP CRTUPDATE

ESCAPE_Y						; Esc-y Normal Chr Set    (B-series). Was: Set Default Tabs (C128)
		SEI
		LDA #12					; CRTC Register#12 - Display Address HI
		STA CRT_Address				; Select the Register 
		LDA CRT_Status				; Read the Value
		AND #%11011111				; Clear BIT 5
		JMP CRTUPDATE
				
ESCAPE_Z						; Esc-z Alternate Chr Set (B-Series). Was: Clear All Tabs (C128)
		SEI
		LDA #12					; CRTC Register#12 - Display Address HI
		STA CRT_Address				; Select the Register 
		LDA CRT_Status				; Read the Value
		ORA #%00100000				; Set BIT 5
CRTUPDATE
		STA CRT_Status				; Write the Value to previously selected register
		CLI					; Enable Interrupts
		JMP IRQ_EPILOG				; Continue

