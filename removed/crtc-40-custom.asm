; PET/CBM EDIT ROM - CRTC Setup Tables - CUSTOM SETTINGS!!!!!!!!!!!!
; ================   40 Column x 25 Lines, 60 Hz, 15.75 kHz (NTSC) for external monitor/TV
;
; THIS IS FOR CUSTOM SCREEN PARAMETERS
; These settings are for testing my RGBIHV to RGBs conversion board to Apple IIgs monitor.
;
; These tables are used to program the CRTC chip to set the screen to the proper rows, columns, and timing 

;--------- Text Mode - 40 Column, 60 Hz, NTSC

CRT_CONFIG_TEXT
    		!byte $3e,$28,$32,$12,$1e,$06,$19,$1C
    		!byte $00,$07,$00,$00,$10,$00,$00,$00
    		!byte $00,$00 

;--------- Graphics Mode - 40 Column, 60 Hz, NTSC

CRT_CONFIG_GRAPHICS
    		!byte $3e,$28,$32,$12,$1e,$06,$19,$1C
    		!byte $00,$07,$00,$00,$10,$00,$00,$00
    		!byte $00,$00
