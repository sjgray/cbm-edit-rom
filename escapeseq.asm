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

DoESCESC	;LSR $EF 		; Current Character to Print
		JMP ESCAPE_O		; <ESC>+O (escape)


;-------------- Do <ESC>+KEY Sequence

DoEscapeCode	AND #$7F		; Strip top bit
		SEC
		SBC #$40
		CMP #$1B		; Out of range?
		BCS DoESCDONE		; Yes, skip

		ASL
		TAX
		LDA ESCVECTORS+1,X	; ESC Sequence Vectors
		PHA
		LDA ESCVECTORS,X	; ESC Sequence Vectors
		PHA			; Push address to stack so RTS will jump to selected routine
		RTS

DoESCDONE	JMP ESC_DONE

;-------------- Esc Sequence Vectors

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

;=============== ESCAPE CODES no in normal PET code

ESCAPE_Y	; Esc-y Set Default Tabs
		RTS


;************** Clear Tab Stops (80 bits)

ESCAPE_Z					; Esc-z Clear All Tabs
		LDX #12
		LDA #0
ESCZ1		STA TABS_SET,X			; Table of 80 bits to set TABs
		DEX
		BPL ESCZ1
		JMP IRQ_EPILOG

