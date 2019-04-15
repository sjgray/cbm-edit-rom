; PET/CBM EDIT ROM - CRTC Setup Tables
; ================   8296D Ver 2
; Format: 80 Column x 25 Lines, 50 Hz Line, 20 kHz for 8296D monitor
; ROM   : 901474-04
;
; Note: The 8296D has a different monitor than normal 80-column PETs
;
; These tables are used to program the CRTC chip to set the screen to the proper rows, columns, and timing 

;--------- Text Mode - 80 column, 50 Hz, 19.608 kHz

CRT_CONFIG_TEXT
           !byte $32,$28,$28,$08,$26,$02,$19,$20
           !byte $00,$09,$00,$00,$10,$00,$00,$00
           !byte $00,$00

;--------- Graphics Mode - 80 column, 50 Hz, 19.608 kHz

CRT_CONFIG_GRAPHICS
           !byte $32,$28,$28,$08,$30,$00,$19,$25
           !byte $00,$07,$00,$00,$10,$00,$00,$00
           !byte $00,$00
