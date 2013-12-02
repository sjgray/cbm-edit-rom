; PET/CBM EDIT ROM - Screen Line Address Table - Standard 80 Column screen
; ================
; These tables are used to calculate the starting address of each line on the screen

;--------- LO Bytes Table

Line_Addr_Lo
	!byte $00,$50,$a0,$f0,$40,$90,$e0,$30
	!byte $80,$d0,$20,$70,$c0,$10,$60,$b0
	!byte $00,$50,$a0,$f0,$40,$90,$e0,$30
	!byte $80

;---------- HI Bytes Table

Line_Addr_Hi
	!byte $80,$80,$80,$80,$81,$81,$81,$82
	!byte $82,$82,$83,$83,$83,$84,$84,$84
	!byte $85,$85,$85,$85,$86,$86,$86,$87
	!byte $87
