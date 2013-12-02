; PET/CBM EDIT ROM - CRTC Setup Tables
; ================   40 Column x 25 Line, 50 Hz, PAL for external monitor/TV
;
; These tables are used to program the CRTC chip to set the screen to the proper rows, columns, and timing 
; 40 column, PAL as provided by Christian Dirk

;--------- Text Mode - 40 column, 50 Hz, PAL

CRT_CONFIG_TEXT
    		!byte $3f,$28,$2f,$14,$24,$7b,$19,$20
    		!byte $00,$07,$00,$00,$10,$00,$00,$00
    		!byte $00,$00 

;--------- Graphics Mode - 40 column, 50 Hz, PAL

CRT_CONFIG_GRAPHICS
    		!byte $3f,$28,$2f,$14,$24,$7b,$19,$20
    		!byte $00,$07,$00,$00,$10,$00,$00,$00
    		!byte $00,$00
