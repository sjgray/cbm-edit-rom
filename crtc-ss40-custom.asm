; PET/CBM EDIT ROM - CRTC Setup Tables
; ================   Custom settings
;
; These tables are used to program the CRTC chip to set the screen to the proper rows, columns, and timing 
; Soft40 = Hardware setup for 80 column, but only showing 40 columns by increasing LEFT/RIGHT margins
;          Similar to how the "80240.PRG" software does it.

;--------- Text Mode - Soft40, ?? Hz, ?? kHz

CRT_CONFIG_TEXT2
    		!byte $31,$14,$1f,$0f,$28,$05,$19,$21
    		!byte $00,$09,$00,$00,$10,$00,$00,$00
    		!byte $00,$00 

;--------- Graphics Mode - Soft40, ?? Hz, ?? kHz

CRT_CONFIG_GRAPHICS2
    		!byte $31,$14,$1f,$0f,$28,$05,$19,$21
    		!byte $00,$07,$00,$00,$10,$00,$00,$00
    		!byte $00,$00
