; PET/CBM EDIT ROM - ColourPET Routines; Init, Change colours, Set Registers
; ================

!source "copyright-colourpet.asm"

; Standard C128 colour codes will be used.
; To set colours you can use 1 to 3 contiguous color code characters.
; The FIRST code will set the FG colour (normal behaviour)
; The SECOND code will set the BG colour
; The THIRD code will set the BORDER colour (future hardware)
; Any NON-Colour Code will reset the count (where????)
; ------------------------------------------------------------------
; NOTE: Some code is included for possible future hardware options
;       Colour key codes (C64 code at E8DA)
; ------------------------------------------------------------------
; TODO: This code must be inserted somewhere in print routine (check C64 code for ideas)
; ------------------------------------------------------------------

CheckColourCodes
		PHA				; Save the character
   		LDX #$0F			; Table has 15 entries
ccloop		CMP COLOURS,X			; Does it match code from table?
		BEQ ccfound			; Yes, done
		DEX				; 
		BPL ccloop			; loop for more

ccnotfound	LDA #0				; not found
		STA COLOURCOUNT			; Clear the Count
		BMI ccexit			; no match, exit 

ccfound		INC COLOURCOUNT			; Count code
		LDA COLOURCOUNT			; 
		CMP #1				; FIRST?
		BNE cc3		
		STX COLOURFG			; Set the FG colour		

cc3		CMP #2				; SECOND?
		BNE cc4
		STX COLOURBG			; Set the BG colour

cc4		CMP #3				; THIRD?
		BNE cc5
		STX COLOURBORDER		; Set the BORDER colour
		STX COLOURREGBORDER		; Store it in the BORDER register

cc5		JSR SetColourValue   		; Set the FG/BG value
ccexit		PLA
		RTS

;-------------- Initialize ColourPET

ColourPET_Init
		LDA #5				; Light Green
		STA COLOURFG
		LDA #0				; Black
		STA COLOURBG			; Background=Black
		STA COLOURCOUNT			; Reset Colour Count
		JSR ClearColourRAM		; Clear Colour RAM
		LDA #0				; Black

;-------------- Set Border Colour and update Register

SetColourAndBorder
		STA COLOURBORDER		; Set the BORDER colour
		STA COLOURREGBORDER		; Store it in the BORDER register

;-------------- Set Colour

SetColourValue
		LDA COLOURBG			; Get the BG colour
		ASL				; move BG colour to upper nibble
		ASL
		ASL
		ASL
		ADC COLOURFG			; Add the FG colour
		STA COLOURV			; Store it
		RTS

ClearColourRAM
		LDA #5
		LDX #0
CCRAM1		
		STA COLOUR_RAM,X
		STA COLOUR_RAM+$100,X
		STA COLOUR_RAM+$200,X
		STA COLOUR_RAM+$300,X
		INX
		BNE CCRAM1
		RTS


;-------------- Subs for Scrolling/INS/DEL etc

ColourPET_SyncPointers
		LDA Line_Addr_Lo+1,X			; Screen line address table LO + 1
		STA SAL					; Pointer: Tape Buffer/ Screen Scrolling
		LDA Line_Addr_Hi+1,X			; Screen line address table HI + 1
		STA SAL+1				; Pointer: Tape Buffer/ Screen Scrolling

		LDA CLine_Addr_Lo-1,X     		; Screen Line address table LO - 1	@@@@@@@@@@@@@@@ COLOURPET
		STA COLOURPTR2				; Second Colour RAM Pointer		@@@@@@@@@@@@@@@ COLOURPET
		LDA CLine_Addr_Hi-1,X 			; Screen Line address table HI - 1	@@@@@@@@@@@@@@@ COLOURPET
		STA COLOURPTR2+1			;					@@@@@@@@@@@@@@@ COLOURPET
		RTS

ColourPET_Scroll_Left
CPSL1		INY
		LDA (ScrPtr),Y				; Read Character from Screen RAM
		DEY					; move to the left
		STA (ScrPtr),Y				; Write Character to Screen RAM
		INY
		LDA (COLOURPTR),Y			; Read Colour from Colour RAM	@@@@@@@@@@@@@@ ColourPET
		DEY					; move to the left
		STA (COLOURPTR),Y			; Write Colour to Colour RAM	@@@@@@@@@@@@@@ ColourPET
		INY
		CPY RigMargin
		BNE CPSL1
		RTS

ColourPET_Insert
CPI1		DEY
		LDA (ScrPtr),Y				; Read Character from Screen RAM
		INY					; move to the left
		STA (ScrPtr),Y				; Write Character to Screen RAM
		DEY
		LDA (COLOURPTR),Y			; Read Colour from Colour RAM	@@@@@@@@@@@@@@ ColourPET
		INY					; move to the left
		STA (COLOURPTR),Y			; Write Colour to Colour RAM	@@@@@@@@@@@@@@ ColourPET
		DEY
		CPY CursorCol
		BNE CPI1

		LDA COLOURV				; Current Colour              	@@@@@@@@@@@@@@ COLOURPET
		STA (COLOURPTR),Y			; Write it to the Colour RAM	@@@@@@@@@@@@@@ COLOURPET

		RTS

;--------------- Copy Character and Colour from SOURCE to DEST

ColourPET_Scroll_Dest
		LDA (SAL),Y				; Read Character from Screen SOURCE
		STA (ScrPtr),Y				; Write it to Screen DESTINATION
		LDA (COLOURPTR2),Y			; Read Colour from Colour RAM SOURCE	@@@@@@@@@@@@@@@ COLOURPET
		STA (COLOURPTR),Y			; Write it to Screen DESTINATION	@@@@@@@@@@@@@@@ COLOURPET
		RTS

;-------------- Colour Codes Table
;
;	PETSCII Code	C64 colour		C128 colour (*=changed)
;       ------------   	----------		-----------
COLOURS
	!byte $90	;0=black		0=black
	!byte $98	;12=medium grey		1=medium grey
	!byte $1F	;6=blue			2=blue
	!byte $9A	;14=light blue		3=light blue
	!byte $1E	;5=green		4=green
	!byte $99	;13=light green		5=light green
	!byte $97	;11=dark grey		6=dark cyan*
	!byte $9F	;3=cyan			7=light cyan*
	!byte $1C	;2=red			8=red
	!byte $96	;10=light red		9=light red
	!byte $81	;8=orange		10=dark purple*
	!byte $9C	;4=magenta		11=magenta/purple
	!byte $95	;9=brown		12=dark yellow*
	!byte $9E	;7=yellow		13=yellow
	!byte $9B	;15=light grey	14=light grey
	!byte $05	;1=white		15=white

	!byte 0 ; separator

;#############################################################
!fill $F000-*,$FF	; PAD to 4K ##########################
;#############################################################
