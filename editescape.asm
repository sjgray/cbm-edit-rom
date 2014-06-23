; PET/CBM EDIT ROM - Code to check for ESC Sequence
; ================
; Goal is to support as many C128/CBM-II ESC codes as possible
;

;-------------- Check for ESC as LAST character
;
; NOTE: We JMP here from EDITROM.ASM. Accumulator holds code of CURRENT character
;       If we want to continue processing as normal we need to JMP ESC_DONE.
;       If we need to modify the action we set DATAX with the new character.
;       If we want to skip the rest of the character processing we should JMP IRQ_EPILOG .

CheckESC
		LDX LASTCHAR 		; Previous character printed
		CPX #$1B		; <ESC>?
		BEQ ESC_YES		; Yes, process it
		CMP #$1B		; Is current Chr ESC?
		BEQ ESC_NOW		; Yes, 
		JMP ESC_DONE		; No, back to normal checking

;-------------- ESC is current Chr

ESC_NOW		STA LASTCHAR		; Remember it
		JMP IRQ_EPILOG		; don't process anything

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
		CMP #$2F		; Greater than "uparrow"?
} ELSE {
		SBC #$40		; Subtract 40 (Start at "@")
		CMP #$1F		; Greater than "uparrow"?
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
;		LDA #0			; Clear Character
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
		!WORD ESCAPE_E-1	; Esc-e ?     / Fill BG    (was: Cursor Non Flash)
		!WORD ESCAPE_F-1	; Esc-f Flash / Fill FG+BG (was: Cursor Flash)
		!WORD ESCAPE_G-1	; Esc-g Bell Enable
		!WORD ESCAPE_H-1	; Esc-h Bell Disable
		!WORD ESCAPE_I-1	; Esc-i Insert Line
		!WORD ESCAPE_J-1	; Esc-j Start-of-Line
		!WORD ESCAPE_K-1	; Esc-k End-of-Line
		!WORD ESCAPE_L-1	; Esc-l Scroll On
		!WORD ESCAPE_M-1	; Esc-m Scroll Off
		!WORD ESCAPE_N-1	; Esc-n Screen Normal
		!WORD ESCAPE_O-1	; Esc-o Escape all modes (Also: <ESC><ESC>)
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
		!WORD ESCAPE_LB-1	; Esc-[ Mark Start
		!WORD ESCAPE_BS-1	; Esc-\ Toggle ASCII / DIN
		!WORD ESCAPE_RB-1	; Esc-] Mark End (Copy)
		!WORD ESCAPE_UA-1	; Esc-UPARROW Paste

;		!WORD ESCAPE_BA-1	; Esc-BACKARROW

;=============== ESCAPE CODES not in normal PET code
;
; The following ESCAPE CODE entry points need to be assigned
; and/or additional code must be written to support them.

ESCAPE_AT	; Esc-@ Clear Remainder of Screen
ESCAPE_A	; Esc-a Auto Insert
ESCAPE_C	; Esc-c Cancel Auto Insert
ESCAPE_K	; Esc-k End-of-Line
ESCAPE_L	; Esc-l Scroll On
ESCAPE_M	; Esc-m Scroll Off

!IF SS40=0 {
ESCAPE_X	; Esc-x Switch 40/80 Col
}

		JMP IRQ_EPILOG				; Ignore sequence for now


;-------------- New ESC sequences

!IF COLOURPET = 1 {
ESCAPE_NUM
		LDA DATAX				; Character
		SEC
		SBC #$30				; Subtract 30 (Start at "0")
ESC_NUM2
		TAX					; The Colour number becomes the index
		LDA COLOURS,X				; Lookup the correct PETSCII code
		STA DATAX				; replace ESC code with colour code
		LDA #0					;
		JMP ESC_DONE2				; return and process

}

; ESC-E = Fill BG Colour
; For NormalPET ?
; For ColourPET will fill the screen with the current BG colour (ignores window)
;               The FG of each character is not changed.
; Note: This might be changed in the future to work with windows!

ESCAPE_E

!if COLOURPET=1 {
		LDA COLOURV
		AND #$F0
		STA TMPZB7
		LDX #0
ESCELoop
		LDA COLOUR_RAM,X
		AND #$0F
		ORA TMPZB7
		STA COLOUR_RAM,X

		LDA COLOUR_RAM+250,X
		AND #$0F
		ORA TMPZB7
		STA COLOUR_RAM+250,X

		LDA COLOUR_RAM+500,X
		AND #$0F
		ORA TMPZB7
		STA COLOUR_RAM+500,X

		LDA COLOUR_RAM+750,X
		AND #$0F
		ORA TMPZB7
		STA COLOUR_RAM+750,X	; don't overwrite non-visible locations (used for storage)

!IF COLUMNS = 80 {
		LDA COLOUR_RAM+1000,X
		AND #$0F
		ORA TMPZB7
		STA COLOUR_RAM+1000,X

		LDA COLOUR_RAM+1250,X
		AND #$0F
		ORA TMPZB7
		STA COLOUR_RAM+1250,X

		LDA COLOUR_RAM+1500,X
		AND #$0F
		ORA TMPZB7
		STA COLOUR_RAM+1500,X

		LDA COLOUR_RAM+1750,X
		AND #$0F
		ORA TMPZB7
		STA COLOUR_RAM+1750,X	; don't overwrite non-visible locations (used for storage)
}
		INX
		CPX #250
		BNE ESCELoop

}
		JMP IRQ_EPILOG



; ESC-F = Flash Screen / Fill FG+BG Colour (was: Cursor Flash)
; For NormalPET this will toggle the REVERSE bit (bit 7) of each character on the screen (ignores window)
; For ColourPET this will fill the screen with the current colour FG+BG (ignores window)
; Note: This might be changed in the future to work with windows!

ESCAPE_F

!if COLOURPET=1 {
		LDX #0
		LDA COLOURV
ESCFLoop
		STA COLOUR_RAM,X
		STA COLOUR_RAM+$100,X
		STA COLOUR_RAM+$200,X
		STA COLOUR_RAM+$300-24,X	; don't overwrite non-visible locations (used for storage)
!IF COLUMNS = 80 {
		STA COLOUR_RAM+$400-24,X
		STA COLOUR_RAM+$500-24,X
		STA COLOUR_RAM+$600-24,X
		STA COLOUR_RAM+$700-48,X	; don't overwrite non-visible locations (used for storage)
}
		INX
		BNE ESCFLoop
}

!if COLOURPET=0 {
		LDX #0
ESCFLoop2
		LDA SCREEN_RAM,X
		EOR #$80
		STA SCREEN_RAM,X

		LDA SCREEN_RAM+250,X
		EOR #$80
		STA SCREEN_RAM+250,X

		LDA SCREEN_RAM+500,X
		EOR #$80
		STA SCREEN_RAM+500,X

		LDA SCREEN_RAM+750,X
		EOR #$80
		STA SCREEN_RAM+750,X	; don't overwrite non-visible locations (used for storage)

!IF COLUMNS = 80 {
		LDA SCREEN_RAM+1000,X
		EOR #$80
		STA SCREEN_RAM+1000,X

		LDA SCREEN_RAM+1250,X
		EOR #$80
		STA SCREEN_RAM+1250,X

		LDA SCREEN_RAM+1500,X
		EOR #$80
		STA SCREEN_RAM+1500,X

		LDA SCREEN_RAM+1750,X
		EOR #$80
		STA SCREEN_RAM+1750,X	; don't overwrite non-visible locations (used for storage)
}
		INX
		CPX #250
		BNE ESCFLoop2

}
		JMP IRQ_EPILOG

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

;-------------- Copy/Paste functions
;
; These functions use Tape Buffer#1 to store copied byte(s)
; TAPEB1   - Set to "ESC" character to indicate valid Start Marker
; TAPEB+1  - Length of string (Max 160 characters)
; TAPEB+2/3- Pointer to screen marked starting position 
; TAPEB+4..- Buffer
;
; TODO: Add check for buffer start > buffer end !!!!

;-------------- ESC-[ Mark Start

ESCAPE_LB
		LDA TAPEB1				; Read Buffer Identifier
		CMP #27					; is it ESC?
		BEQ ESCLB_SET				; Yes, Start Mark, so skip initialize

		LDA #0					; Initialize buffer -
		STA TAPEB1+1				; Set Buffer Length to zero
		LDA #27					; Buffer identifier = ESC
		STA TAPEB1				; Set Buffer identifier
ESCLB_SET	
		LDA ScrPtr+1				; Copy HI byte of line pointer
		STA TAPEB1+3				; to buffer
		LDA ScrPtr				; Get LO byte of line pointer
		CLC
		ADC CursorCol				; Add cursor offset
		STA TAPEB1+2				;   to buffer
		BCC ESCLB_SKIP				; do we need to update HI byte?
		INC TAPEB1+3				; yes, increment it
ESCLB_SKIP	JMP IRQ_EPILOG				; Return

;--------------- ESC-] Mark End (Copy to buffer)

ESCAPE_RB	
		LDA TAPEB1				; Read Buffer Identifier
		CMP #27					; is it ESC?
		BNE ESCRB_EXIT				; No Start Mark, so exit out
		
ESCRB_INIT
		LDA TAPEB1+3				; Copy Hi byte of paste buffer pointer
		STA SAL+1				;   to work pointer
		LDA TAPEB1+2				; Copy Lo byte of paste buffer pointer
		STA SAL					;   to work pointer

		LDA ScrPtr+1				; Copy Hi byte of screen pointer
		STA EAL+1				;   to work pointer 2
		LDA ScrPtr				; Copy Lo byte of screen pointer
		CLC
		ADC CursorCol				; Add cursor position
		STA EAL					;   to work pointer 2
		BCC ESCRB_SKIP				; do we need to update Hi byte?
		INC EAL+1				; yes, increment it

ESCRB_SKIP	LDX #0					; length counter
		LDY #0					; offet for pointer
ESCRB_LOOP
		LDA (SAL),Y				; read byte from screen (SAL is updated, y never changes)
		STA TAPEB1+4,X				; Store in buffer (x is index)

		LDA SAL+1				; Get HI byte
		CMP EAL+1				; Does it match?
		BNE ESCRB_CHECK				; no, keep going
		LDA SAL					; get lo byte of pointer
		CMP EAL					; does it match?

		BCS ESCRB_DONE				; yes, finish up

ESCRB_CHECK	INX
		INC SAL					; Increment pointer LO byte
		LDA SAL					; read it
		BNE ESCRB2				; is byte 0? No, skip hi byte
		INC SAL+1				; yes, increment hi byte

ESCRB2		CPX #160				; Are we at maximum buffer length?
		BNE ESCRB_LOOP				; No, loop back for more

ESCRB_DONE	STX TAPEB1+1				; Store string length
		LDA #0
		STA TAPEB1+5,X				; Store a ZERO at end for STROUT routine
ESCRB_EXIT	JMP IRQ_EPILOG				; Return

;--------------- ESC-UPARROW - Copy from buffer to screen
ESCAPE_UA	
		LDA TAPEB1				; Read Buffer Identifier
		CMP #27					; is it ESC?
		BNE ESCUA_OUT				; No Start Mark, so exit out

		JSR BEEP
		lda #<TAPEB1+4				; setup string address
		STA SAL
		ldy #>TAPEB1+4
		STA SAL+1

ESCUA_LOOP	LDY #0					; counter
		LDA (SAL),Y				; get byte from buffer
		BEQ ESCUA_OUT
		JSR BSOUT				; print it
		INC SAL
		BNE ESCUA_LOOP
		INC SAL+1
		BNE ESCUA_LOOP

ESCUA_OUT	JMP IRQ_EPILOG				; Return		


;-------------- Eurokey Functions
;
; These functions SET or CLEAR the EUROFLAG location.
; A '0' means use ASCII layout. A '1' means use DIN layout (swap Y and Z)

ESCAPE_BS	LDA EUROFLAG
		EOR #1

EuroSet		STA EUROFLAG
		JSR BEEP
		JMP IRQ_EPILOG

;-------------- Check if Euro keys need swapping
;
; .A contains character to add to keyboard buffer. If EUROFLAG=1 then check if Y or Z need swapping.

EUROSWAP
		LDX EUROFLAG		; Flag to swap Z and Y keys; 1=Swap
		BEQ EUROSWAP_OUT

		CMP #'Z'		; Is it "Z"?
		BNE EUROSWAP2
		LDA #'Y'		; Yes, swap with "Y"
		BNE EUROSWAP_OUT
EUROSWAP2	CMP #'Y'		; Is it "Y"?
		BNE EUROSWAP_OUT
		LDA #'Z'		; Yes, swap with "Z"
EUROSWAP_OUT	JMP SCAN_NORM2		; Return to keyboard routine


;-------------- Switchable 40/80 column Functions
;
; When SS40=1, ESC-X switches between 40/80 column mode.
; Currently this is done with SOFT40 method where the 80 column screen is
; reprogrammed to 40 column by increasing the left and right margins.
; With future hardware we may be able to switch between REAL 40/80 column mode.

!IF SS40=1 {
ESCAPE_X	
		JSR SS40_SwapModes	; Swap 40/80 Modes
		JMP IRQ_EPILOG		
}

;-------------- CRTC Chip Functions
;
; CRTC controller REGISTER 12 is used for Screen RAM Address HI
; BIT 4 controls the INVERT line     (normal=1,rvs=0)
; BIT 5 controls the CHR OPTION line (normal=0,alternate=1)

ESCAPE_N						; ESC-N = Screen Normal
		JSR CRTPREP
		LDA CRT_Status				; Read the Value
		ORA #%00010000				; Set BIT 4
		JMP CRTUPDATE

ESCAPE_R						; ESC-R = Screen Reverse
		JSR CRTPREP
		LDA CRT_Status				; Read the Value
		AND #%11101111				; Clear BIT 4
		JMP CRTUPDATE

ESCAPE_Y						; ESC-Y = Normal Chr Set    (B-series). Was: Set Default Tabs (C128)
		JSR CRTPREP
		LDA CRT_Status				; Read the Value
		AND #%11011111				; Clear BIT 5
		JMP CRTUPDATE
				
ESCAPE_Z						; ESC-Z = Alternate Chr Set (B-Series). Was: Clear All Tabs (C128)
		JSR CRTPREP
		LDA CRT_Status				; Read the Value
		ORA #%00100000				; Set BIT 5
CRTUPDATE
		STA CRT_Status				; Write the Value to previously selected register
		CLI					; Enable Interrupts
		JMP IRQ_EPILOG				; Continue

CRTPREP		SEI
		LDA #12					; CRTC Register#12 - Display Address HI
		STA CRT_Address				; Select the Register 
		RTS