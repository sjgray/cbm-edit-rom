; PET/CBM EDIT ROM - CRTC Setup Tables
; ================
; FORMAT: 40 Column x 25 Lines, 60 Hz, 15.75 kHz (NTSC) for external monitor/TV
; ROM   : Custom
;
; These tables are used to program the CRTC chip to set the screen to the proper rows, columns, and timing 

;--------- Text Mode - 40 Column, 60 Hz, NTSC

CRT_CONFIG_TEXT
    		!byte $3f,$28,$32,$12,$1e,$06,$19,$1C
    		!byte $00,$07,$00,$00,$10,$00,$00,$00
    		!byte $00,$00 

;--------- Graphics Mode - 40 Column, 60 Hz, NTSC

CRT_CONFIG_GRAPHICS
    		!byte $3f,$28,$32,$12,$1e,$06,$19,$1C
    		!byte $00,$07,$00,$00,$10,$00,$00,$00
    		!byte $00,$00
