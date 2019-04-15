; PET/CBM EDIT ROM - Screen line address table - Screen 2 @ $8800 Attributes (colour)
; ================
;
; These tables are used to calculate the starting address of each line on the screen

;---------- 32 characters wide 
!IF COLUMNS=32 {
CLine_Addr_Lo2	!byte $00,$20,$40,$60,$80,$a0,$c0,$e0,$00,$20,$40,$60,$80,$a0,$c0,$e0
		!byte $00,$20,$40,$60,$80,$a0,$c0,$e0,$00
CLine_Addr_Hi2	!byte $88,$88,$88,$88,$88,$88,$88,$88,$89,$89,$89,$89,$89,$89,$89,$89
		!byte $8a,$8a,$8a,$8a,$8a,$8a,$8a,$8a,$8b
}

;---------- 40 characters wide 
!IF COLUMNS=40 {
CLine_Addr_Lo2	!byte $00,$28,$50,$78,$a0,$c8,$f0,$18,$40,$68,$90,$b8,$e0,$08,$30,$58
		!byte $80,$a8,$d0,$f8,$20,$48,$70,$98,$c0
CLine_Addr_Hi2	!byte $88,$88,$88,$88,$88,$88,$88,$89,$89,$89,$89,$89,$89,$8A,$8A,$8A
		!byte $8A,$8A,$8A,$8A,$8B,$8B,$8B,$8B,$8B
}

;---------- 64 characters wide
!IF COLUMNS=64 {
CLine_Addr_Lo2	!byte $00,$40,$80,$c0,$00,$40,$80,$c0,$00,$40,$80,$c0,$00,$40,$80,$c0
		!byte $00,$40,$80,$c0,$00,$40,$80,$c0,$00
CLine_Addr_Hi2	!byte $88,$88,$88,$88,$89,$89,$89,$89,$8a,$8a,$8a,$8a,$8b,$8b,$8b,$8b
		!byte $8c,$8c,$8c,$8c,$8d,$8d,$8d,$8d,$8e
}

;---------- 80 characters wide 
!IF COLUMNS=80 {
CLine_Addr_Lo2	!byte $00,$50,$a0,$f0,$40,$90,$e0,$30,$80,$d0,$20,$70,$c0,$10,$60,$b0
		!byte $00,$50,$a0,$f0,$40,$90,$e0,$30,$80
CLine_Addr_Hi2	!byte $88,$88,$88,$88,$89,$89,$89,$8a,$8a,$8a,$8b,$8b,$8b,$8c,$8c,$8c
		!byte $8d,$8d,$8d,$8d,$8e,$8e,$8e,$8f,$8f
}

; 90 characters wide not applicable
