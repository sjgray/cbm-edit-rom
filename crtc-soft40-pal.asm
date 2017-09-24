; PET/CBM EDIT ROM - CRTC Setup Tables
; ================   Soft 40 Column x 25 Line, 50 Hz Line, 20 kHz Horizontal (for internal monitor)
;
; These tables are used to program the CRTC chip to set the screen to the proper rows, columns, and timing 
; Soft40 = Hardware setup for 80 column, but only showing 40 columns by increasing LEFT/RIGHT margins
;          Similar to how the "80240.PRG" software does it.

;--------- Text Mode - Soft40, 50 Hz, PAL 15.7 kHz

CRT_CONFIG_TEXT
;    		!byte $31,$14,$1f,$0f,$28,$05,$19,$21
    		!byte $3f,$14,$28,$14,$24,$7b,$19,$20	
    		!byte $00,$09,$00,$00,$10,$00,$00,$00
    		!byte $00,$00 

;--------- Graphics Mode - Soft40, 50 Hz, PAL 15.7 kHz

CRT_CONFIG_GRAPHICS
 ;   		!byte $31,$14,$1f,$0f,$28,$05,$19,$21
    		!byte $3f,$14,$28,$14,$24,$7b,$19,$20
    		!byte $00,$07,$00,$00,$10,$00,$00,$00
    		!byte $00,$00

; Thanks to Dave Curran for the providing the above fix!