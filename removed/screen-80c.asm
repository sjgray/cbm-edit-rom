; PET/CBM EDIT ROM - ColourPET - Colour RAM Address Table - 80 Column screen
; ================   (For FUTURE HARDWARE)
;
; These tables are used to calculate the starting address of each colour line on the screen.

;--------- LO Bytes Table

CLine_Addr_Lo
	!byte $00,$50,$a0,$f0,$40,$90,$e0,$30
	!byte $80,$d0,$20,$70,$c0,$10,$60,$b0
	!byte $00,$50,$a0,$f0,$40,$90,$e0,$30
	!byte $80

;---------- HI Bytes Table

CLine_Addr_Hi
	!byte $88,$88,$88,$88,$89,$89,$89,$8a
	!byte $8a,$8a,$8b,$8b,$8b,$8c,$8c,$8c
	!byte $8d,$8d,$8d,$8d,$8e,$8e,$8e,$8f
	!byte $8f
