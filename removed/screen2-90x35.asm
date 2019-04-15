; PET/CBM EDIT ROM - Screen Line Address Table - EXPERIMENTAL 90x35 screen
; ================
; These tables are used to calculate the starting address of each line on the screen
; This is an additional 90-column table for Switchable 80/90 features

;--------- LO Bytes Table

Line_Addr_Lo2
	!byte $00,$5a,$b4,$0e,$68,$c2,$1c,$76
	!byte $d0,$2a,$84,$de,$38,$92,$ec,$46
	!byte $a0,$fa,$54,$ea,$08,$62,$bc,$16
	!byte $70,$ca,$24,$7e,$d8,$32,$8c,$e6
	!byte $40,$9a,$f4

;---------- HI Bytes Table

Line_Addr_Hi2
	!byte $80,$80,$80,$81,$81,$81,$82,$82
	!byte $82,$83,$83,$83,$84,$84,$84,$85
	!byte $85,$85,$86,$86,$87,$87,$87,$88
	!byte $88,$88,$89,$89,$89,$8a,$8a,$8a
	!byte $8b,$8b,$8b
