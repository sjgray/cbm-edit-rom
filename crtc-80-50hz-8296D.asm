; PET/CBM EDIT ROM - CRTC Setup Tables
; ================   80 Column x 25 Lines, 50 Hz Line, 20 kHz for 8296D internal monitor
; Set to match 324243-04 (4V4E) ROM
;
; These tables are used to program the CRTC chip to set the screen to the proper rows, columns, and timing 
;
; NOTE: Due to the 8296D's power supply and different monitor, setup is different than normal 80 column machines.
;

;--------- Text Mode - 80 column, 50 Hz, 20 kHz

CRT_CONFIG_TEXT
           !byte $3A,$28,$2C,$08,$20,$09,$19,$1D
           !byte $00,$09,$00,$00,$10,$00,$00,$00
           !byte $00,$00

;--------- Graphics Mode - 80 column, 50 Hz, 20 kHz

CRT_CONFIG_GRAPHICS
           !byte $3A,$28,$2C,$08,$29,$03,$19,$22
           !byte $00,$07,$00,$00,$10,$00,$00,$00
           !byte $00,$00
