; PET/CBM EDIT ROM - ColourPET - Routine to change colours
; ================
; Standard C128 colour codes will be used.
; To set colours you can use 1 to 3 contiguous color code characters
; The FIRST code will set the FG colour
; The SECOND code will set the BG colour
; The THIRD code will set the BORDER colour (future hardware)
; Any NON-Colour Code will reset the count (where????)
; ------------------------------------------------------------------
; NOTE: Some code is included for possible future hardware options
; ------------------------------------------------------------------
; TODO: This code must be inserted somewhere in print routine (check C64 code for ideas)
; ------------------------------------------------------------------

CheckColour
		PHA				; Save the character
   		LDX #$0F			; Table has 15 entries
ccloop	CMP COLOURS,X		; Does it match code from table?
		BEQ ccfound		; Yes, done
		DEX				; 
		BPL ccloop			; loop for more

		LDA #0
		STA COLOURCOUNT		; Clear the Count
		BMI ccexit			; no match, exit 
cfound
		INC COLOURCOUNT		; Count code
		LDA COLOURCOUNT		; 
		CMP #1			; FIRST?
		BNE cc3		
		STX COLOURFG		; Set the FG colour		
cc3		CMP #2			; SECOND?
		BNE cc4
		STX COLOURBG		; Set the BG colour
cc4		CMP #3			; THIRD?
		BNE cc5
		STX COLOURBORDER	; Set the BORDER colour
		STX COLOURREGBORDER	; Store it in the BORDER register
cc5		JSR SetColourValue   ; Set the FG/BG value
ccexit	PLA
		RTS

;--------- Set Colour

SetColourAndBorder
		STA COLOURBORDER	; Set the BORDER colour
		STA COLOURREGBORDER	; Store it in the BORDER register
SetColourValue
		LDA COLOURBG		; Get the BG colour
		ASL				; move BG colour to upper nibble
		ASL
		ASL
		ASL
		ADC COLOURFG		; Add the FG colour
		STA COLOURV		; Store it
		RTS


; colour key codes (C64 code at E8DA)
;			C64 colour		C128 colour (*=changed)
;               ----------		-----------
COLOURS
	!byte $90	;0=black		0=black
	!byte $98	;12=medium grey	1=medium grey
	!byte $1F	;6=blue		2=blue
	!byte $9A	;14=light blue	3=light blue
	!byte $1E	;5=green		4=green
	!byte $99	;13=light green	5=light green
	!byte $97	;11=dark grey	6=dark cyan*
	!byte $9F	;3=cyan		7=light cyan*
	!byte $1C	;2=red		8=red
	!byte $96	;10=light red	9=light red
	!byte $81	;8=orange		10=dark purple*
	!byte $9C	;4=magenta		11=magenta/purple
	!byte $95	;9=brown		12=dark yellow*
	!byte $9E	;7=yellow		13=yellow
	!byte $9B	;15=light grey	14=light grey
	!byte $05	;1=white		15=white

	!byte 0 ; separator

