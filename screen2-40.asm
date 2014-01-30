; PET/CBM EDIT ROM   Screen Line Address Table - Standard 40 Column screen
; ================
; These tables are used to calculate the starting address of each line on the screen
; This is an additional 40-column table for Switchable 40/80 features

;--------- LO Bytes Table

Line_Addr_Lo2
	!byte $00,$28,$50,$78,$a0,$c8,$f0,$18
	!byte $40,$68,$90,$b8,$e0,$08,$30,$58
	!byte $80,$a8,$d0,$f8,$20,$48,$70,$98
	!byte $c0

;---------- HI Bytes Table

Line_Addr_Hi2
	!byte $80,$80,$80,$80,$80,$80,$80,$81
	!byte $81,$81,$81,$81,$81,$82,$82,$82
	!byte $82,$82,$82,$82,$83,$83,$83,$83
	!byte $83
