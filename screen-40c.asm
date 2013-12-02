; PET/CBM EDIT ROM - ColourPET - Colour RAM Address Table - 40 Column screen
; ================
; These tables are used to calculate the starting address of each colour line on the screen

;--------- LO Bytes Table

CLine_Addr_Lo
	!byte $00,$28,$50,$78,$a0,$c8,$f0,$18
	!byte $40,$68,$90,$b8,$e0,$08,$30,$58
	!byte $80,$a8,$d0,$f8,$20,$48,$70,$98
	!byte $c0

;---------- HI Bytes Table

CLine_Addr_Hi
	!byte $84,$84,$84,$84,$84,$84,$84,$85
	!byte $85,$85,$85,$85,$85,$86,$86,$86
	!byte $86,$86,$86,$86,$87,$87,$87,$87
	!byte $87
