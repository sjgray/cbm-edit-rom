; PET/CBM EDIT ROM - Code to check for ESC Sequence
; ================
; Goal is to support as many C128/CBM-II ESC codes as possible
;

;-------------- Kernal Analyze Esc Sequence

DoEscapeCode
		CMP #$1B		; <ESC> again?
		BNE DoESC2		; No, skip

;-------------- Do <ESC><ESC>

DoESC1
		LSR $EF 		; Current Character to Print
		JMP ESCAPE_O		; <ESC>+O (escape)

;-------------- Do <ESC>+KEY

DoESC2		AND #$7F		; Strip top biy
		SEC
		SBC #$40
		CMP #$1B		; <ESC> ?
		BCS DoESCDONE

		ASL
		TAX
		LDA ESCVECTORS+1,X	; ESC Sequence Vectors
		PHA
		LDA ESCVECTORS,X	; ESC Sequence Vectors
		PHA

		LDX #0			; Clear Last Character
		STX LASTCHAR

DoESCDONE	RTS

; Esc Sequence Vectors

ESCVECTORS
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
		!WORD ESCAPE_S-1	; Esc-s Block Cursor
		!WORD ESCAPE_T-1	; Esc-t Top
		!WORD ESCAPE_U-1	; Esc-u Underline Cursor
		!WORD ESCAPE_V-1	; Esc-v Scroll Up
		!WORD ESCAPE_W-1	; Esc-w Scroll Down
		!WORD ESCAPE_X-1	; Esc-x Switch 40/80 Col
		!WORD ESCAPE_Y-1	; Esc-y Set Default Tabs
		!WORD ESCAPE_Z-1	; Esc-z Clear All Tabs
