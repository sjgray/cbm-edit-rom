; PET/CBM EDIT ROM - CRTC Setup Tables
; ================   40 Column x 25 Lines, 50 Hz Line, 20kHz Horizonal (for built-in monitor)
;
; These tables are used to program the CRTC chip to set the screen to the proper rows, columns, and timing 

;--------- Text Mode - 40 Column, 50 Hz, 20 kHz

CRT_CONFIG_TEXT_OLD
    		!byte $31,$28,$29,$0f,$27,$00,$19,$20
    		!byte $00,$09,$00,$00,$10,$00,$00,$00
    		!byte $00,$00 

;--------- Graphics Mode - 40 Column, 50 Hz, 20 kHz

CRT_CONFIG_GRAPHICS_OLD
    		!byte $31,$28,$29,$0f,$31,$00,$19,$25
    		!byte $00,$07,$00,$00,$10,$00,$00,$00
    		!byte $00,$00
