; PET/CBM Editor ROM Project - Checks for ESC key sequence then dispatch action
; ==========================   EDITESCAPE.ASM
;
; This is an Extended feature to add ESCAPE codes like in later CBM machine.
; The goal is to support as many C128/CBM-II ESC codes as possible

;*********************************************************************************************************
;** Key Handler
;*********************************************************************************************************
; All key presses will be checked. We keep track of ESC key presses.
; - If the previous character was ESC then we process the key as an escape sequence.
;
; NOTE: We JMP here from EDITROMxx.ASM. Accumulator holds code of CURRENT character
;       If we want to continue processing as normal we need to JMP ESC_DONE.
;       If we need to modify the action we set DATAX with the new character.
;       If we want to skip the rest of the character processing we should JMP IRQ_EPILOG .
;*********************************************************************************************************

CheckESC	LDX LASTCHAR 		; Previous character printed
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

DoESCESC	LDA #0			; Clear character
		JMP ESCAPE_O		; <ESC>+O (escape)

;-------------- Do <ESC>+KEY Sequence

DoEscapeCode	AND #$7F		; Strip top bit
		SEC
!IF (COLOURPET=1) OR (VIDSWITCH=1) {
		SBC #$30		; Subtract 30 (Start at "0")
		CMP #$2F		; Make sure it is in range!
} ELSE {
		SBC #$40		; Subtract 40 (Start at "@")
		CMP #$20		; Make sure it is in range!
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

;*********************************************************************************************************
;** ESC Sequence Vectors    (*=changed from C128)
;*********************************************************************************************************
; COLOURPET ESC Codes: ESC 0 to 9 plus :;<=>?
; Set Colour to specified value (0 to 15).

ESCVECTORS

!IF COLOURPET+VIDSWITCH>0 {
  !IF COLOURPET=1 {
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
} ELSE {

;--------------- VIDSWITCH ESC Codes: ESC 0 to 9
; Sets a specific video mode immediately (and temporarily)
; For manually setting the video mode, when testing different
; monitors and/or NTSC/PAL composite adapters.
;  COLOURPET and VIDSWITCH cannot be combined!

		!WORD ESCAPE_SETVID-1	; Esc-0 Set to Video MODE 0
		!WORD ESCAPE_VID-1	; Esc-1 Set to Video MODE 1
		!WORD ESCAPE_VID-1	; Esc-2 Set to Video MODE 2
		!WORD ESCAPE_VID-1	; Esc-3 Set to Video MODE 3
		!WORD ESCAPE_VID-1	; Esc-4 Set to Video MODE 4
		!WORD ESCAPE_VID-1	; Esc-5 Set to Video MODE 5
		!WORD ESCAPE_VID-1	; Esc-6 Set to Video MODE 6
		!WORD ESCAPE_VID-1	; Esc-7 Set to Video MODE 7
		!WORD ESCAPE_VID-1	; Esc-8 Set to Video MODE 8
		!WORD ESCAPE_VID-1	; Esc-9 Set to Video MODE 9
		!WORD NOESCAPE-1	; NONE
		!WORD NOESCAPE-1	; NONE
		!WORD NOESCAPE-1	; NONE
		!WORD NOESCAPE-1	; NONE
		!WORD NOESCAPE-1	; NONE
		!WORD NOESCAPE-1	; NONE
  }
}
;-------------- Normal ESC Codes

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
		!WORD ESCAPE_BA-1	; Esc-BACKARROW Display Project Info

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

!IF INFO=0 {
ESCAPE_BA	; Esc-Backarrow Display Project info
}

;-------------- These are codes that are not in 40-COL Codebase C0

!IF CODEBASE=0 {
ESCAPE_B	; ESC-B Set Window Bottom
ESCAPE_T	; ESC-T Set Window Top
ESCAPE_D	; ESC-D Delete Line
ESCAPE_I	; ESC-I Insert Line
ESCAPE_J	; ESC-J Start of Line
}

NOESCAPE	JMP IRQ_EPILOG				; Ignore sequence for now



;*********************************************************************************************************
;** New ESC sequences
;*********************************************************************************************************

;-------------- ColourPET Colours

!IF COLOURPET=1 {
ESCAPE_NUM	LDA DATAX				; Character
		SEC
		SBC #$30				; Subtract 30 (Start at "0")

ESC_NUM2	TAX					; The Colour number becomes the index
		LDA COLOURS,X				; Lookup the correct PETSCII code
		STA DATAX				; replace ESC code with colour code
		LDA #0					;
		JMP ESC_DONE2				; return and process
}

;-------------- Video Configuration Switching

!IF VIDSWITCH=1 {
ESCAPE_VID	LDA DATAX				; Character
		SEC
		SBC #$30				; Subtract 30 (Start at "0")
		ASL
		ASL
		ASL
		ASL					; multiply by 16 (# of bytes per each set)
		TAY					; Y is offset into table
		LDX #0					; byte counter

ESCVLOOP	LDA VIDMODE0,Y				; Get byte from table at offset Y
		STX CRT_Address				; Select the CRTC register 			CHIP
		STA CRT_Status				; Write to the register				CHIP
		INY					; Next table byte
		INX					; count
		CPX #14					; We copy R0 to R13. 14/15 are always zero.
		BMI ESCVLOOP				; loop for more
		LDA #0					;
		JMP IRQ_EPILOG				; Ignore sequence for now

;*********************************************************************************************************
;** VIDEO MODES TABLE
;*********************************************************************************************************
; These are CRTC register sets. There are 16 bytes per set to make calculations simpler.
; Use ESC+0 to ESC+9 to select a set to configure the CRTC controller.
; NOTE: The CRTC registers can be updated using CHR codes 14 and 142 causing the video
;       to revert to the default CRTC settings as set from the main code. This feature
;       is handy for hardware testing or using an external composite adapter.
;
;         REGISTER -> R0 R1 R2 R3 R4  R5 R6 R7 R8 R9 R10 R11 R12 R13 Rxx Rxx   DESCRIPTION
;                     -- -- -- -- -- --- -- -- -- -- --- --- --- --- --- ---   -----------
VIDMODE0 	!byte 49,40,41,15,40,  3,25,29, 0, 9,  0,  0, 16,  0,  0,  0 ; 40/80 TEXT     NA
VIDMODE1        !byte 49,40,41,15,32,  5,25,33, 0, 7,  0,  0, 16,  0,  0,  0 ; 40/80 GRAPHIC  NA
VIDMODE2	!byte 49,40,41,15,39,  0,25,32, 0, 9,  0,  0, 16,  0,  0,  0 ; 40/80 TEXT     EURO
VIDMODE3	!byte 49,40,41,15,49,  0,25,37, 0, 7,  0,  0, 16,  0,  0,  0 ; 40/80 GRAPHIC  EURO
VIDMODE4	!byte 58,40,44, 8,32,  9,25,29, 0, 9,  0,  0, 16,  0,  0,  0 ; 8296D TEXT     EURO
VIDMODE5	!byte 58,40,44, 8,41,  3,25,34, 0, 7,  0,  0, 16,  0,  0,  0 ; 8296D GRAPHIC  EURO
VIDMODE6        !byte 63,40,50,18,30,  6,25,28, 0, 7,  0,  0, 16,  0,  0,  0 ; NTSC
VIDMODE7	!byte 63,40,50,18,30,  6,25,28, 0, 7,  0,  0,  0,  0,  0,  0 ; NTSC / INVERT VIDEO
VIDMODE8	!byte 63,40,47,20,36,123,25,32, 0, 7,  0,  0, 16,  0,  0,  0 ; PAL
VIDMODE9        !byte 63,40,47,20,36,123,25,32, 0, 7,  0,  0,  0,  0,  0,  0 ; PAL  / INVERT VIDEO
;
; Extra Modes. You can substitute this mode for any above if you want
;VIDMODEXXXX	!byte 49,20,31,15,40,  5,25,33, 0, 9,  0,  0, 16,  0,  0,  0 ; 20/40 TEXT     NA

}

;*********************************************************************************************************
;** ESCAPE BACKARROW - Display Project Info or Font
;*********************************************************************************************************
; ESC-BACKARROW Display Project Info

!IF INFO>0 {
ESCAPE_BA

;-------------- DISPLAY FONT ON SCREEN
!IF INFO = 2 {
		LDY #0				; Y=0
INFLOOP		TYA				; LOOP[  A=Y
		STA SCREEN_RAM,Y		; Put it on the screen
		INY				; Next position and character
		BNE INFLOOP			; ] Loop for more
}

;-------------- DISPLAY PROJECT INFO
!IF INFO > 0 {
		LDA #<INFOSTRING		; point to INFO string
		LDY #>INFOSTRING
		JSR STROUTZ
		JMP IRQ_EPILOG
}
}

;*********************************************************************************************************
;** ESCAPE E - Fill BG Colour
;*********************************************************************************************************
; For NormalPET ?
; For ColourPET will fill the screen with the current BG colour (ignores window)
;               The FG of each character is not changed.
; Note: This might be changed in the future to work with windows!

ESCAPE_E

!IF COLOURPET=1 {
		LDA ColourV
		AND #$F0
		STA TMPZB7
		LDX #0
ESCELOOP
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

!IF COLUMNS=80 {
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
		BNE ESCELOOP
}
		JMP IRQ_EPILOG


;*********************************************************************************************************
;** ESCAPE F - Flash Screen / Fill FG+BG Colour (was: Cursor Flash)
;*********************************************************************************************************
; For NormalPET this will toggle the REVERSE bit (bit 7) of each character on the screen (ignores window)
; For ColourPET this will fill the screen with the current colour FG+BG (ignores window)
; Note: This might be changed in the future to work with windows!

ESCAPE_F

!IF COLOURPET=1 {
		LDX #0
		LDA ColourV

ESCFLOOP	STA COLOUR_RAM,X
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
		BNE ESCFLOOP
}

!IF COLOURPET=0 {
		LDX #0
ESCFLOOP2
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
		BNE ESCFLOOP2

}
		JMP IRQ_EPILOG

;*********************************************************************************************************
;** ESC+G - Bell Enable
;*********************************************************************************************************

ESCAPE_G
		LDA #1
		STA BELLMODE
		JMP IRQ_EPILOG

;*********************************************************************************************************
;** ESC+H - Bell Disable
;*********************************************************************************************************

ESCAPE_H
		LDA #0
		STA BELLMODE
		JMP IRQ_EPILOG

;*********************************************************************************************************
;** ESC-Q - Erase to End of Line
;*********************************************************************************************************

ESCAPE_Q
		!IF COLOURPET=0 {JSR ERASE_TO_EOL }
		!IF COLOURPET>0 {JSR ColourPET_Erase_To_EOL }
		JMP IRQ_EPILOG

;*********************************************************************************************************
;** ESC+S - Text Mode
;*********************************************************************************************************
; Esc-s Standard Lowercase (was: Block Cursor)

ESCAPE_S
		JSR CRT_SET_TEXT			; Set Lowercase/Text Mode
		JMP IRQ_EPILOG

;*********************************************************************************************************
;** ESC+U - Uppercase (Grapics) mode
;*********************************************************************************************************
; Esc-u Uppercase (was: Underline Cursor - not supported on PET)

ESCAPE_U
		JSR CRT_SET_GRAPHICS			; Set Uppercase/Graphics Mode
		JMP IRQ_EPILOG

;*********************************************************************************************************
;** Copy/Paste Functions
;*********************************************************************************************************
; These functions use Tape Buffer#1 to store copied byte(s)
; TAPEB1   - Set to "ESC" character to indicate valid Start Marker
; TAPEB+1  - Length of string (Max 160 characters)
; TAPEB+2/3- Pointer to screen marked starting position
; TAPEB+4..- Buffer
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


;*********************************************************************************************************
;** Euro Key functions
;*********************************************************************************************************
; These functions SET or CLEAR the EUROFLAG location.
; 0=ASCII layout
; 1=DIN layout (swap Y and Z)

ESCAPE_BS	LDA EUROFLAG
		EOR #1

EuroSet		STA EUROFLAG
		JSR BEEP
		JMP IRQ_EPILOG

;-------------- Check if Euro keys need swapping
;
; .A contains character to add to keyboard buffer. If EUROFLAG=1 then check if Y or Z need swapping.

EUROSWAP	LDX EUROFLAG		; Flag to swap Z and Y keys; 1=Swap
		BEQ EUROSWAP_OUT

		CMP #'Z'		; Is it "Z"?
		BNE EUROSWAP2
		LDA #'Y'		; Yes, swap with "Y"
		BNE EUROSWAP_OUT
EUROSWAP2	CMP #'Y'		; Is it "Y"?
		BNE EUROSWAP_OUT
		LDA #'Z'		; Yes, swap with "Z"
EUROSWAP_OUT	JMP SCAN_NORM2		; Return to keyboard routine


;*********************************************************************************************************
;** Switchable 40/80 column Functions
;*********************************************************************************************************
; When SS40=1, ESC-X switches between 40/80 column mode.
; Currently this is done with SOFT40 method where the 80 column screen is
; reprogrammed to 40 column by increasing the left and right margins.
; With my "Multi-EditROM 40/80" board we can switch between REAL 40/80 column mode.

!IF SS40=1 {
ESCAPE_X	JSR SS40_SwapModes	; Swap 40/80 Modes
		JMP IRQ_EPILOG
}

;*********************************************************************************************************
;** CRTC Chip Functions
;*********************************************************************************************************
; CRTC controller REGISTER 12 is used for Screen RAM Address HI
; BIT 4 controls the INVERT line     (normal=1,rvs=0)
; BIT 5 controls the CHR OPTION line (normal=0,alternate=1)
;
; NOTE: Only the MOTOROLA 6845 CRTC chip can READ register 12!
; If MOT6845=0 then Register 12 is simply set (default for compatibility with most PET machines!)
; If MOT6845=1 then Register 12 is read and then manipulated.

ESCAPE_N						; ESC-N = Screen Normal
		JSR CRTPREP
	!IF MOT6845=1 {
		ORA #%00010000				; Set BIT 4
	} else {
		LDA #16					; Normal screen, Normal chr set
	}
		JMP CRTUPDATE

ESCAPE_R						; ESC-R = Screen Reverse
		JSR CRTPREP
	!IF MOT6845=1 {
		AND #%11101111				; Clear BIT 4
	} else {
		LDA #0					; Reverse screen, Normal chr set
	}
		JMP CRTUPDATE

ESCAPE_Y						; ESC-Y = Normal Chr Set    (B-series). Was: Set Default Tabs (C128)
		JSR CRTPREP
	!IF MOT6845=1 {
		AND #%11011111				; Clear BIT 5
	} else {
		LDA #16					; Normal screen, Normal chr set
	}
		JMP CRTUPDATE

ESCAPE_Z						; ESC-Z = Alternate Chr Set (B-Series). Was: Clear All Tabs (C128)
		JSR CRTPREP
	!IF MOT6845=1 {
		ORA #%00100000				; Set BIT 5
	} else {
		LDA #48					; Normal screen, Alternate chr set
	}
CRTUPDATE
		STA CRT_Status				; Write the Value to previously selected register
		CLI					; Enable Interrupts
		JMP IRQ_EPILOG				; Continue

CRTPREP		SEI
		LDA #12					; CRTC Register#12 - Display Address HI
		STA CRT_Address				; Select the Register
		LDA CRT_Status				; Read the Value (if CRTC chip is NOT a Motorola6845 then this will not work)
		RTS
