; PET/CBM EDIT ROM   Screen Line Address Table - Standard 40 Column screen
; ================
; This table is used to calculate the starting address of each line on the screen
; This is for 40-column "core" which uses only the LO address. The HI address is calculated
; in the screen clear routine and also used for line-linking purposes.

;--------- LO Bytes Table

Line_Addr_Lo
	!byte $00,$28,$50,$78,$a0,$c8,$f0,$18
	!byte $40,$68,$90,$b8,$e0,$08,$30,$58
	!byte $80,$a8,$d0,$f8,$20,$48,$70,$98
	!byte $c0

