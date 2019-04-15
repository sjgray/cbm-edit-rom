; PET/CBM EDIT ROM - ColourPET - Colour RAM Address Table - 40 Column screen
; ================
; These tables are used to calculate the starting address of each colour line on the screen
; Addresses are for ColourPET hardware Ver 2 with colour ram at $8800
; This is an additional 40-column table for Switchable 40/80 features

;--------- LO Bytes Table

CLine_Addr_Lo2
	!byte $00,$28,$50,$78,$a0,$c8,$f0,$18
	!byte $40,$68,$90,$b8,$e0,$08,$30,$58
	!byte $80,$a8,$d0,$f8,$20,$48,$70,$98
	!byte $c0

;---------- HI Bytes Table

CLine_Addr_Hi2
	!byte $88,$88,$88,$88,$88,$88,$88,$89
	!byte $89,$89,$89,$89,$89,$8A,$8A,$8A
	!byte $8A,$8A,$8A,$8A,$8B,$8B,$8B,$8B
	!byte $8B
