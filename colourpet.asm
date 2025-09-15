; PET/CBM Editor ROM Project - Common ColourPET routines
; ==========================   COLOURPET.ASM
;
; COLOURPET Project - This code supports my ColourPET Hardware. Currently the DIGITAL pcb has been created.
;
; DIGITAL VERSION - 16 Colours
; ---------------
; The digital ColourPET 40-column board is a simple board with a multiplexer to drive an RGBI monitor. It
; requires that the PET be modified to add the extra "80-column" video ram but configure it to be mapped
; differently. This then becomes the colour RAM. One byte will hold 4 bits for the foreground colour and
; 4 bits for the background colour. The 4 bits are arranged like: RGBI (1 level for RGB plus INTENSITY).
; The foreground colour is stored in the lower nibble and background in the upper nibble.
;
; ANALOG VERSION - 256 Colours (future development):
; --------------
; The analog version is a variation that uses all 8 bits as foreground colour allowing 256 colours. There
; is currently no board for this. Possible options in consideration are:
;
; Option 1: RRRGGGBB  (8 levels for RED, 8 for GREEN, and 4 for BLUE. May result in unbalanced colours)
; Option 2: RRGGBBII  (4 levels for RED/GREEN/BLUE (64 colours), then 4 intensity levels for that colour)
;
; The background colour could be hardcoded as black, or perhaps be selectable for the entire screen using a
; register. The border colour could also be set via a register.
;
; 80-Column
; ---------
; We can extend these concepts to 80-column but this would involve more complicated circuitry.
;
; VICE
; ----
;
; The VICE emulator can emulate ColourPET, both 40 and 80 column and both Digital and Analog (RRGGBB format).
;
; Common Colour routines to:
; Initialize ColourPET, Handle colour print codes, colour conversion.

;*********************************************************************************************************
;** Check Colour Codes
;*********************************************************************************************************
; Checks if the character to print (in .A) is a colour code. If so it sets the proper foreground,
; background or border COLOUR. To set colours you can use 1 to 3 contiguous colour code characters:
; - The FIRST code will set the FG colour     (normal behaviour on C64, VIC etc).
; - The SECOND code will set the BG colour.   (modified behaviour)
; - The THIRD code will set the BORDER colour (modified behaviour - future hardware).
; Any NON-colour code will reset the count. Standard C128 colour codes will be used.

CheckColourCodes
		LDX QuoteMode			; Get Quote Mode (1=ON)
		BNE ccabort			; If ON then abort.

		PHA				; Save the character
   		LDX #$0F			; Table has 15 entries
ccloop		CMP COLOURS,X			; Does it match code from table?
		BEQ ccfound			; Yes, done
		DEX				;
		BPL ccloop			; loop for more

ccnotfound	LDX #0				; not found
		STX ColourCount			; Clear the Count
		BEQ ccexit			; no match, exit

ccfound		INC ColourCount			; Count code
		TXA				; Transfer colour index to A
		LDX ColourCount			;
		CPX #1				; FIRST?
		BNE cc3
		STA ColourFG			; Set the FG colour

cc3		CPX #2				; SECOND?
		BNE cc4
		STA ColourBG			; Set the BG colour

cc4		CPX #3				; THIRD?
		BNE cc5
;		STA ColourBorder		; Set the BORDER colour

		LDA #0				; Reached max colour count, so reset
		STA ColourCount			; Reset count

cc5		JSR SetColourValue   		; Set the FG/BG value

ccexit		PLA				; Restore the Character
ccabort		RTS

;*********************************************************************************************************
;** Initialize ColourPET
;*********************************************************************************************************
; This is called from the RESET_EDITOR routine.
; It sets the default foreground, background and border colours.

ColourPET_Init

!IF COLOURMODE = 1 {						;---- Analog Colour Mode
		LDA COLOURPAL					; Default Colour Palette# = 0
		STA ColourPNum					; Palette# for Analog Mode
}
		LDA #0
		STA ColourCount					; Reset Colour Count
		LDA #DEFAULTFG					; Default Foreground Colour
		STA ColourFG
		LDA #DEFAULTBG					; Default Background Colour
		STA ColourBG
		JSR ColourPET_SyncPointers
		LDA #5
		STA ColourV	;*** DEBUG
		JSR INIT_EDITOR					; Do Normal Initialization

;*********************************************************************************************************
;** Set Colour
;*********************************************************************************************************
; Sets Colour for screen printing.  COLOURMODE OPTION: 0=DIGITAL, 1=ANALOG
;
; DIGITAL: Takes the FG colour and BG colour and combines them into one value
;          RGBIRGBI - Lower bits for FG, Upper bits for BG
;
; ANALOG : Takes the FG colour and uses it as an index to the RGB Conversion table.
;          RRRGGGBB All bits for FG. Background colour set for entire screen
;
; PETSCII: Commodore machines use PETSCI Colour codes to print to the screen. These codes are translated
;          to Colour Values which are poked to colour memory to produce the colours you see.
;          Due to differences in colour generation, not all PETSCII colours have an equivilent RGBI Colour
;          in DIGITAL (RGBI) mode. In Analog mode (RRGGBBII) there are more levels for each colour
;	   component, so the translation will result in a closer, but not always exact colour match.

SetColourValue

;---- Digital/Analog Colour FG/BG (Analog ignores BG!)

		CLC
		LDA ColourBG			; Get the BG colour
		ASL				; move BG colour to upper nibble
		ASL
		ASL
		ASL
		CLC
		ADC ColourFG			; Add the FG colour

;---- ANALOG Colour

!IF COLOURMODE=1 {

		LDX ColourFG			; Get the FG index
		LDA ColourPNum			; Current Palette
SCV_check1	CMP #1				; C64 Palette?
		BNE SCV_check2			; No, Skip
		LDA C64COLOURS,X		; C64 Colour to Analog RRRGGGBB
		JMP SCV_exit

SCV_check2	CMP #2				; Custom Palette? (Stored in hidden colour memory)
		BNE SCV_Set			; No, must be 3, so Skip ahead
		LDA ColourStor,X		; Custom Palette Colour to Analog RRRGGGBB
		JMP SCV_exit
						; Any other value defaults to Palette 0
SCV_Set		LDA C128COLOURS,X		; C128 Colour to Analog RRRGGGBB
}

;---- Store resulting Colour

SCV_exit	STA ColourV			; Store it
		RTS


;*********************************************************************************************************
;** Colour Codes Table
;*********************************************************************************************************
; These are the Colour PETSCII codes. We use RGBI ordering to be compatible with it.

COLOURS
;	PETSCII Code	CODE	##=C64 NAME	RGBI ##=NAME     ( )=grayscale order
;       ------------   	---	-----------	---- -------      *=different colour
	!byte $90	;144	00=Black   (0)	0000 00=Black    (0)
	!byte $98	;152	12=Md.Grey (2)	0001 01=Md.Grey  (2)
	!byte $1F	; 31 	06=Blue		0010 02=Blue
	!byte $9A	;154	14=Lt.Blue	0011 03=Lt.blue
	!byte $1E	; 30	05=Green 	0100 04=Green
	!byte $99	;153	13=Lt.Green	0101 05=Lt.Green	(CONFLICT! PET = SCROLL UP!)
	!byte $97	;151	11=Dk.Grey (1)	0110 06=Cyan      *
	!byte $9F	;159	03=Cyan		0111 07=Lt.Cyan
	!byte $1C	; 28	02=Red		1000 08=Red
	!byte $96	;150	10=Lt.Red	1001 09=Lt.Red   	(CONFLICT! PET = ERASE END!)
	!byte $81	;129	08=Orange	1010 10=Purple    *
	!byte $9C	;156	04=Magenta	1011 11=Lt.Purple
	!byte $95	;149	09=Brown	1100 12=Brown     *	(CONFLICT! PET = INS LINE!)
	!byte $9E	;158	07=Yellow	1101 13=Yellow
        !byte $9B	;155 	15=Lt.Grey (3)	1110 14=Lt.Grey  (3)
	!byte $05	;  5	01=White   (4)	1111 15=White    (4)


;*********************************************************************************************************
;** Colour Conversion Tables
;*********************************************************************************************************
; The Analog ColourPET hardware generates RGB Analog video. Colour is stored in the format: RRRGGGBB.
; Where: R=Red, G=Green, B=Blue. R and G use 3 bits for 8 levels, and B uses 2 bits for 4 levels.
; The COLOURPAL setting selects which PALETTE is used:
;
; * C128/RGBI - Uses Red/Green/Blue colour with one Intensity bit to generate unique 16 colours.
; * C64       - Uses a palette of 16 unique colours generated for NTSC or PAL televisions.
; Colours are converted to their closest RRRGGGBB equivalent values and may vary from the original.
; The PETSCII colour code (CHR) is used as an index to the conversion table.

!IF COLOURMODE=1 {

C128COLOURS
;			Native RGBI Colours (same as C128 VDC)
;
;             %RRRGGGBB <-RGBI IDX CHR ## RGBI NAME
;             ---------   ---- --- --- -- ---------
	!byte %00000000	; 0000 00  144 00 Black
	!byte %01001001	; 0001 01  152 01 Md Grey
	!byte %00000001	; 0010 02   31 02 Blue
	!byte %00000011	; 0011 03  154 03 Lt Blue
	!byte %00010000	; 0100 04   30 04 Green
	!byte %00011100	; 0101 05  153 05 Lt Green
	!byte %00001101	; 0110 06  151 06 Dark Cyan
	!byte %00011111	; 0111 07  159 07 Lt Cyan
	!byte %01000000	; 1000 08   28 08 Red
	!byte %11100000	; 1001 09  150 09 Lt Red
	!byte %10000001	; 1010 10  129 10 Dark Magenta
	!byte %11100011	; 1011 11  156 11 Magenta
	!byte %01101100	; 1100 12  149 12 Dark Yellow
	!byte %11011100	; 1101 13  158 13 Yellow
	!byte %10110110	; 1110 14  155 14 Lt Grey
	!byte %11111111	; 1111 15    5 15 White

C64COLOURS
;			C64 NTSC/PAL Colours
;
;              RRRGGGBB <-HEX IDX CHR ## C64 NAME
;	       --------   --- --- --- -----------
	!byte %00000000	; $00 00  144 00 Black
	!byte %01101101	; $6D 01  152 12 Grey
	!byte %00100110	; $26 02  031 06 Blue
	!byte %01001010	; $4A 03  154 14 Lt Blue
	!byte %01010000	; $50 04  030 05 Green
	!byte %01011001	; $59 05  153 13 Lt Green
	!byte %01001001	; $49 06  151 11 Dark Grey
	!byte %01110111	; $77 07  159 03 Cyan
	!byte %11100100	; $E4 08  028 02 Red
	!byte %11001101	; $CD 09  150 10 Lt Red
	!byte %10001000	; $88 10  129 08 Orange
	!byte %01100111	; $67 11  156 04 Purple
	!byte %01000100	; $44 12  149 09 Brown
	!byte %10110101	; $B5 13  158 07 Yellow
	!byte %10010010	; $92 14  155 15 Lt Grey
	!byte %11111111	; $FF 15  005 01 White
}
