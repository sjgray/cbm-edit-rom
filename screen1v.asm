; PET/CBM EDIT ROM - Screen line address table - Screen 1 @ $8000 Video (characters)
; ================
; Variables: ROWS,COLUMNS
; These tables are used to calculate the starting address of each line on the screen.
; The standard screens are 40x25 and 80x25. Experimental screens can be up to 90x35.
; 32 and 64 are included for future support of non-cbm type screens.
; When ROWS>25 it assumes maximum 35 rows although less are supported as well.

;---------- 32 characters wide (32x32 = 1K RAM)
!IF COLUMNS=32 {
Line_Addr_Lo	!byte $00,$20,$40,$60,$80,$A0,$C0,$E0,$00,$20,$40,$60,$80,$A0,$C0,$E0
		!byte $00,$20,$40,$60,$80,$A0,$C0,$E0,$00,$20,$40,$60,$80,$A0,$C0,$E0
Line_Addr_Hi	!byte $80,$80,$80,$80,$80,$80,$80,$80,$81,$81,$81,$81,$81,$81,$81,$81
		!byte $82,$82,$82,$82,$82,$82,$82,$82,$83,$83,$83,$83,$83,$83,$83,$83
}

;---------- 40 characters wide 
!IF COLUMNS=40 {
Line_Addr_Lo	!byte $00,$28,$50,$78,$a0,$c8,$f0,$18,$40,$68,$90,$b8,$e0,$08,$30,$58
		!byte $80,$a8,$d0,$f8,$20,$48,$70,$98,$c0
!if ROWS>25 {	!byte $e8,$10,$38,$60,$88,$b0,$d8,$00,$28,$50 }

Line_Addr_Hi	!byte $80,$80,$80,$80,$80,$80,$80,$81,$81,$81
		!byte $81,$81,$81,$82,$82,$82,$82,$82,$82,$82
		!byte $83,$83,$83,$83,$83
!if ROWS>25 {	!byte $83,$84,$84,$84,$84,$84,$84,$85,$85,$85 }
}

;---------- 64 characters wide (64x32 = 2K RAM)
!IF COLUMNS=64 {
Line_Addr_Lo	!byte $00,$40,$80,$C0,$00,$40,$80,$C0,$00,$40,$80,$C0,$00,$40,$80,$C0
		!byte $00,$40,$80,$C0,$00,$40,$80,$C0,$00,$40,$80,$C0,$00,$40,$80,$C0
Line_Addr_Hi	!byte $80,$80,$80,$80,$81,$81,$81,$81,$82,$82,$82,$82,$83,$83,$83,$83
		!byte $84,$84,$84,$84,$85,$85,$85,$85,$86,$86,$86,$86,$87,$87,$87,$87
}

;---------- 80 characters wide 
!IF COLUMNS=80 {
Line_Addr_Lo	!byte $00,$50,$a0,$f0,$40,$90,$e0,$30,$80,$d0
		!byte $20,$70,$c0,$10,$60,$b0,$00,$50,$a0,$f0
		!byte $40,$90,$e0,$30,$80
!if ROWS>25 {	!byte $d0,$20,$70,$c0,$10,$60,$b0,$00,$50,$a0,$f0 }

Line_Addr_Hi	!byte $80,$80,$80,$80,$81,$81,$81,$82,$82,$82
		!byte $83,$83,$83,$84,$84,$84,$85,$85,$85,$85
		!byte $86,$86,$86,$87,$87
!if ROWS>25 {	!byte $87,$88,$88,$88,$89,$89,$89,$8a,$8a,$8a,$8a }
}

;---------- 90 characters wide
!IF COLUMNS=90 {
Line_Addr_Lo	!byte $00,$5a,$b4,$0e,$68,$c2,$1c,$76,$d0,$2a,$84,$de,$38,$92,$ec,$46
		!byte $a0,$fa,$54,$ea,$08,$62,$bc,$16,$70,$ca,$24,$7e,$d8,$32,$8c,$e6
		!byte $40,$9a,$f4
Line_Addr_Hi	!byte $80,$80,$80,$81,$81,$81,$82,$82,$82,$83,$83,$83,$84,$84,$84,$85
		!byte $85,$85,$86,$86,$87,$87,$87,$88,$88,$88,$89,$89,$89,$8a,$8a,$8a
		!byte $8b,$8b,$8b
}
