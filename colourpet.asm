; PET/CBM EDIT ROM - ColourPET - Add colour to a standard PET/CBM machine
; ================
; The EVEN ram is re-defined for use as colour RAM. There are 8 bits (one byte) that corresponds
; to each character on the screen. These 8 bits are defined differently according to the hardware.
;
; DIGITAL VERSION (development in progress):
; ---------------
; Supports 16 colours
; The 4 bits are arranged like: RGBI (1 level for RGB plus INTENSITY)
; The foreground colour is stored in the lower nibble
; The background colour is stored in the upper nibble
; The border colour is set via a register (to be determined)
;
; ANALOG VERSION (future development):
; --------------
; Supports 256 colours
; The 8 bits are arranged like: RRRGGGBB  (8 levels for RED, 8 for GREEN, and 4 for BLUE)
; The foreground colour is definable as above
; The background colour is selectable for the entire screen using a register (to be determined)
; The border colour is set via a register (to be determined)
; ---------------------------------------------------------------------------------------------

;---------------- Zero Page Storage
; NOTE: These locations were used for TAPE. Do not use TAPE on ColourPET!!!!!!!!

COLOURPTR	= $C0		; Pointer for screen writes (WAS: Tape Pointer)
COLOURPTR2	= $C2		; Pointer for scrolling etc (WAS: Tape Pointer)
CursorColour    = $ED		; Storage for Colour at Cursor position

;---------------- Colour Screen RAM

!if COLOURVER = 0 { COLOUR_RAM = $8400 }		; 40 Col = $8400-87FF, 80 Col = $8800-8FFF
!if COLOURVER = 1 { COLOUR_RAM = $8800 }		; 40 Col = $8800-8BFF, 80 Col = $8800-8FFF


;---------------- Storage (Currently in Screen RAM - To be moved?)

COLOURSTOR = COLOUR_RAM + 25 * COLUMNS	; Calculate Last visible colour mem

COLOURV 	= COLOURSTOR+1	; Combined FG and BG value
COLOURFG	= COLOURSTOR+2	; Foreground Colour
COLOURBG	= COLOURSTOR+3	; Background Colour
COLOURBORDER	= COLOURSTOR+4	; Border Colour
COLOURCOUNT	= COLOURSTOR+5	; Count to track colour change codes 	(1=FG,2=BG,3=BORDER)

COLOURREGBG	= COLOURSTOR+6	; Colour Background Register		(dummy location for now)
COLOURREGBORDER = COLOURSTOR+7	; Colour Border Register		(dummy location for now)
COLOURREGMODE   = COLOURSTOR+8	; Colour Mode Register 			(For future use)

