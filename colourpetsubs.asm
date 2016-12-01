; PET/CBM EDIT ROM - ColourPET Routines; Init, Change colours, Set Registers, Sync Pointers
; ================
;
; Standard C128 colour codes will be used.
; ------------------------------------------------------------------
; NOTE: Some code is included for possible future hardware options
;       Colour key codes (C64 code at E8DA)
; ------------------------------------------------------------------

;-------------- Check Colour Codes
;
; Checks if the character to print is a colour code.
; If so it sets the proper foreground, background or border COLOUR.
; To set colours you can use 1 to 3 contiguous color code characters.
; The FIRST code will set the FG colour (normal behaviour)
; The SECOND code will set the BG colour
; The THIRD code will set the BORDER colour (future hardware)
; Any NON-Colour Code will reset the count

CheckColourCodes

!if DEBUG = 1 { INC DBLINE+9 }			; DEBUG

		PHA				; Save the character
   		LDX #$0F			; Table has 15 entries
ccloop		CMP COLOURS,X			; Does it match code from table?
		BEQ ccfound			; Yes, done
		DEX				; 
		BPL ccloop			; loop for more

ccnotfound	LDX #0				; not found
		STX COLOURCOUNT			; Clear the Count
		BEQ ccexit			; no match, exit 

ccfound		INC COLOURCOUNT			; Count code
		TXA
		LDX COLOURCOUNT			; 
		CPX #1				; FIRST?
		BNE cc3		
		STA COLOURFG			; Set the FG colour		

cc3		CPX #2				; SECOND?
		BNE cc4
		STA COLOURBG			; Set the BG colour

cc4		CPX #3				; THIRD?
		BNE cc5
		STA COLOURBORDER		; Set the BORDER colour
		STA COLOURREGBORDER		; Store it in the BORDER register
		LDA #0
		STA COLOURCOUNT			; Reset count

cc5		JSR SetColourValue   		; Set the FG/BG value
ccexit		PLA				; Restore the Character
		RTS

;-------------- Initialize ColourPET
;
; This is called from the RESET_EDITOR routine.
; It sets the default foreground, background and border colours.

ColourPET_Init

		!IF COLOURPET = 2 { JSR ClearColourRAM }

		JSR INIT_EDITOR			; Do Normal Initialization

		LDA #0
		STA COLOURCOUNT			; Reset Colour Count

		LDA #DEFAULTFG			; Default Foreground Colour
		STA COLOURFG
		LDA #DEFAULTBG			; Default Background Colour
		STA COLOURBG
		LDA #DEFAULTBO			; Default Border Colour
		
;-------------- Set Border Colour and update Register

SetColourAndBorder
		STA COLOURBORDER		; Set the BORDER colour
		STA COLOURREGBORDER		; Store it in the BORDER register

;-------------- Set Colour
;
; COLOURMODE OPTION: 0=DIGITAL, 1=ANALOG
;
; DIGITAL: Takes the FG colour and BG colour and combines them into one value
;          RGBIRGBI - Lower bits for FG, Upper bits for BG
;
; ANALOG : Takes the FG colour and uses it as an index to the RGB Conversion table.
;          RRRGGGBB All bits for FG. Background colour set for entire screen

SetColourValue

!if COLOURMODE=0 {
		LDA COLOURBG			; Get the BG colour
		ASL				; move BG colour to upper nibble
		ASL
		ASL
		ASL
		CLC
		ADC COLOURFG			; Add the FG colour
} ELSE {
		LDX COLOURFG			; Get the FG index
		LDA RGBTABLE,X			; Convert it to Analog RRRGGGBB
}
		STA COLOURV			; Store it
		RTS

;-------------- Clear Colour Ram - Green on Black
;
; This was a temporary solution until colour routines were debugged.
; Not needed now since Colour Erase_To_EOL completed. But might come in handly later.
; NOTE: This routine clears ALL colour ram INCLUDING areas used for storage!!!!!!

ClearColourRAM
		LDA #5
		LDX #0
CCRAM1		
		STA COLOUR_RAM,X
		STA COLOUR_RAM+$100,X
		STA COLOUR_RAM+$200,X
		STA COLOUR_RAM+$300,X
!IF COLUMNS = 80 {
		STA COLOUR_RAM+$400,X
		STA COLOUR_RAM+$500,X
		STA COLOUR_RAM+$600,X
		STA COLOUR_RAM+$700,X
}
		INX
		BNE CCRAM1
		RTS

;-------------- Sync Pointers - Current Line
;
; This takes the current line number in X and then uses the lookup tables
; to find the screen and colour ram address of the start of the line and stores them
; in the Character and Colour pointers.

ColourPET_SyncPointersX
		STA ScrPtr				; Pointer: Current Screen Line Address LO
		LDA Line_Addr_Hi,X			; Screen Line Addresses HI
		STA ScrPtr+1         			; Pointer: Current Screen Line Address HI

		LDA CLine_Addr_Lo,X			; Colour Screen Line Addresses LO
		STA COLOURPTR				; Colour Pointer: Current Screen Line Address LO
		LDA CLine_Addr_Hi,X			; Colour Screen Line Addresses HI
		STA COLOURPTR + 1      			; Colour Pointer: Current Screen Line Address HI

		RTS

;-------------- Sync Pointers - Next Line
;
; This takes the current line number in X and then uses the lookup tables
; to find the screen and colour ram address of the start of the NEXT line and stores them
; in the Character and Colour pointers.

ColourPET_SyncPointers
		LDA Line_Addr_Lo+1,X			; Screen line address table LO + 1
		STA SAL					; Pointer: Tape Buffer/ Screen Scrolling
		LDA Line_Addr_Hi+1,X			; Screen line address table HI + 1
		STA SAL+1				; Pointer: Tape Buffer/ Screen Scrolling

		LDA CLine_Addr_Lo+1,X     		; Screen Line address table LO + 1
		STA COLOURPTR2				; Second Colour RAM Pointer
		LDA CLine_Addr_Hi+1,X 			; Screen Line address table HI + 1
		STA COLOURPTR2+1			;
		RTS

ColourPET_SyncPointers2
		LDA Line_Addr_Lo-1,X			; Screen line address table LO + 1
		STA SAL					; Pointer: Tape Buffer/ Screen Scrolling
		LDA Line_Addr_Hi-1,X			; Screen line address table HI + 1
		STA SAL+1				; Pointer: Tape Buffer/ Screen Scrolling

		LDA CLine_Addr_Lo-1,X     		; Screen Line address table LO + 1
		STA COLOURPTR2				; Second Colour RAM Pointer
		LDA CLine_Addr_Hi-1,X 			; Screen Line address table HI + 1
		STA COLOURPTR2+1			;
		RTS


;-------------- Scroll Left

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

;-------------- Insert

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

;-------------- Erase to End of Line
;
; Clears ONE line on the screen from current cursor to RIGHT margin
; Called from WINDOW_CLEAR and WINDOW_SCROLL_UP.
; Replaces equivilent non-colour routine.
; Must not modify X since it is used as a line counter in WINDOW_CLEAR.

Erase_To_EOL
		TYA					; Save the Current offset
		PHA					; to the stack

		LDA #$20 				; <SPACE>
CEOL		INY					; next character
		STA (ScrPtr),Y				; Pointer: Current Screen Line Address @@@@@@@@@@@@@@ ColourPET
		CPY RigMargin
		BCC CEOL				; loop up for more

		PLA					; Pull the offset from the stack
		TAY					; 

		LDA COLOURV				; The current colour
CEOL2		INY					; Next colour ram location
		STA (COLOURPTR),Y			; Clear Colour RAM
		CPY RigMargin
		BCC CEOL2				; loop up for more
		RTS

;============== Routines from C64 - Might be needed (IRQ routine?)
; TODO: Fix variable names / memory locations
;
;============== Display Character 'A' with Colour 'X'
;
;Display_Char_A_And_Color_X
;
;		TAY               			; copy character
;		LDA #$02          			; set count to $02, usually $14 ??
;		STA BLNCT         			; set cursor countdown
;		JSR Set_COLRAM_Pointer
;		TYA               			; get character back
;
;============== Display Character and Colour
;
;Display_Char_And_Color
;
;		LDY CSRIDX        			; get cursor column
;		STA (LINPTR),Y    			; save character from current screen line
;		TXA               			; copy colour to A
;		STA (USER),Y				; save to colour RAM
;		RTS
;
;============== Set ColourRAM Pointer
;
;Set_COLRAM_Pointer
;
;		LDA LINPTR				; get current screen line pointer low byte
;		STA USER				; save pointer to colour RAM low byte
;		LDA LINPTR+1				; get current screen line pointer high byte
;		AND #$03				; mask 0000 00xx, line memory page
;		ORA #COLRAM_PAGE			; set  1001 01xx, colour memory page
;		STA USER+1				; save pointer to colour RAM high byte
;		RTS

;-------------- Colour Codes Table
;
; These are the Colour PETSCII codes. We use C128 ordering to be compatible with it.
;
;	PETSCII Code	C64 colour		C128 colour (*=changed)
;       ------------   	----------		-----------
COLOURS
	!byte $90	;0=black		0=black
	!byte $98	;12=medium grey		1=medium grey
	!byte $1F	;6=blue			2=blue
	!byte $9A	;14=light blue		3=light blue
	!byte $1E	;5=green		4=green
	!byte $99	;13=light green		5=light green	(CONFLICT! PET = SCROLL UP!)
	!byte $97	;11=dark grey		6=dark cyan*
	!byte $9F	;3=cyan			7=light cyan*
	!byte $1C	;2=red			8=red
	!byte $96	;10=light red		9=light red	(CONFLICT! PET = ERASE END!)
	!byte $81	;8=orange		10=dark purple*
	!byte $9C	;4=magenta		11=magenta/purple
	!byte $95	;9=brown		12=dark yellow* (CONFLICT! PET = INS LINE!)
	!byte $9E	;7=yellow		13=yellow
	!byte $9B	;15=light grey		14=light grey
	!byte $05	;1=white		15=white

	!byte 0 ; separator

!IF COLOURMODE=1 {

;-------------- Analog Colour Conversion Table
; 
; Converts colour code index to RRRGGGBB value for Analog ColourPET board
; R and G have a range of 0 to 7, B has 0 to 3
; If "I" is off, R and G have values of 4, B is 2.
; If "I" is on, R and G have values of 7, B is 3.

RGBTABLE
;              RRRGGGBB
	!byte %00000000	;0=black
	!byte %01101101	;1=medium grey
	!byte %00000010	;2=blue
	!byte %00000011	;3=light blue
	!byte %00010000	;4=green
	!byte %00011100	;5=light green
	!byte %10010000	;6=dark cyan*
	!byte %11111100	;7=light cyan*
	!byte %10000000	;8=red
	!byte %11100000	;9=light red
	!byte %10000010	;10=dark purple*
	!byte %11100011	;11=magenta/purple
	!byte %00010010	;12=dark yellow*
	!byte %00011111	;13=yellow
	!byte %11011010	;14=light grey
	!byte %11111111	;15=white
}
