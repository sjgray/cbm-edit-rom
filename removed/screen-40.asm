; PET/CBM EDIT ROM   Screen Line Address Table - Standard 40 Column screen with support for extended screens
; ================
; These tables are used to calculate the starting address of each line on the screen

;--------- LO Bytes Table

Line_Addr_Lo
	!byte $00,$28,$50,$78,$a0,$c8,$f0,$18
	!byte $40,$68,$90,$b8,$e0,$08,$30,$58
	!byte $80,$a8,$d0,$f8,$20,$48,$70,$98
	!byte $c0
!if ROWS>25 {
	!byte $e8,$10,$38,$60,$88,$b0,$d8,$00
	!byte $28,$50
}
;---------- HI Bytes Table

Line_Addr_Hi
	!byte $80,$80,$80,$80,$80,$80,$80,$81
	!byte $81,$81,$81,$81,$81,$82,$82,$82
	!byte $82,$82,$82,$82,$83,$83,$83,$83
	!byte $83
!if ROWS>25 {
	!byte $83,$84,$84,$84,$84,$84,$84,$85
	!byte $85,$85