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


;---------------- Storage (Currently in Screen RAM - To be moved?)

COLOURV 	= $87F0		; Combined FG and BG value (poke 33776)
COLOURFG	= $87F1		; Foreground Colour
COLOURBG	= $87F2		; Background Colour
COLOURBORDER	= $87F3		; Border Colour
COLOURCOUNT	= $87F4		; Count to track colour change codes 	(1=FG,2=BG,3=BORDER)

COLOURREGBG	= $87F5		; Colour Background Register		(dummy location for now)
COLOURREGBORDER = $87F6		; Colour Border Register		(dummy location for now)
COLOURREGMODE   = $87F7		; Colour Mode Register 			(For future use)

