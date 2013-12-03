; PET/CBM EDIT ROM - CRTC Setup Tables
; ================   80 Column x 25 Line, 60 Hz Line, 20 kHz Horizontal (for internal monitor)
;
; These tables are used to program the CRTC chip to set the screen to the proper rows, columns, and timing 

;--------- Text Mode - 80 Column, 60 Hz, 20 kHz

CRT_CONFIG_TEXT_OLD
           !byte $31,$28,$29,$0F,$20,$03,$19,$1D
           !byte $00,$09,$00,$00,$10,$00,$00,$00
           !byte $00,$00

;--------- Graphics Mode - 80 Column, 60 Hz, 20 kHz

CRT_CONFIG_GRAPHICS_OLD
		!byte $31,$28,$29,$0F,$28,$05,$19,$21
		!byte $00,$07,$00,$00,$10,$00,$00,$00
		!byte $00,$00