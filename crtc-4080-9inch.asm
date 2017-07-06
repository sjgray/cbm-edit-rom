; PET/CBM EDIT ROM - CRTC Setup Tables
; ================   40 or 80 Column x 25 Lines, 50 Hz Line, 16kHz Horizontal?? (for built-in 9" monitor)
;
; These CRTC values were supplied by Toni Ellis. They are for use with the small 9" CRTC monitor.
;
; These tables are used to program the CRTC chip to set the screen to the proper rows, columns, and timing.
; NOTE: for 9" Monitors the video is NOT inverted like the 12"! 

;--------- Text Mode - 40/80 Column, 50 Hz, 15 kHz

CRT_CONFIG_TEXT
    		!byte $3F,$28,$30,$8E,$20,$00,$19,$1C
    		!byte $00,$09,$00,$00,$00,$00,$00,$00
    		!byte $00,$00 

;--------- Graphics Mode - 40/80 Column, 50 Hz, 15 kHz

CRT_CONFIG_GRAPHICS
    		!byte $3F,$28,$30,$8E,$20,$00,$19,$1C
    		!byte $00,$07,$00,$00,$00,$00,$00,$00
    		!byte $00,$00 
