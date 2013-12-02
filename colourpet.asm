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
; -------------------------------------------------------------------------------------------------

COLOURV 		= $83F0		; Combined FG and BG value (poke 33776)
COLOURFG		= $83F1		; Foreground Colour
COLOURBG		= $83F2		; Background Colour
COLOURBORDER	= $83F3		; Border Colour
COLOURCOUNT	= $83F4		; Count to track colour change codes (0=FG,1=BG,2=BORDER)

COLOURREGBG	= $83F5		; Colour Background Register	(dummy location for now)
COLOURREGBORDER = $83F6		; Colour Border Register		(dummy location for now)
COLOURREGMODE   = $83F7		; Colour Mode Register - For future use
