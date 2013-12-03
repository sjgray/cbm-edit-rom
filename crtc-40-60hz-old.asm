; PET/CBM EDIT ROM - CRTC Setup Tables
; ================   40 Column x 25 Lines, 60 Hz Line, 20 kHz Horizonal (for built-in monitor)

; These tables are used to program the CRTC chip to set the screen to the proper rows, columns, and timing 

;--------- Text Mode - 40 Column, 60 Hz, 20 kHz

CRT_CONFIG_TEXT_OLD
    		!byte $31,$28,$29,$0f,$20,$03,$19,$1d
    		!byte $00,$09,$00,$00,$10,$00,$00,$00
    		!byte $00,$00 

;--------- Graphics Mode - 40 Column, 60hz, 20k Hz

CRT_CONFIG_GRAPHICS_OLD
    		!byte $31,$28,$29,$0f,$28,$05,$19,$21
    		!byte $00,$07,$00,$00,$10,$00,$00,$00
    		!byte $00,$00
