; PET/CBM EDIT ROM - Screen line address table - Screen 1 @ $8800 Attributes (colour)
; ================
;
; These tables are used to calculate the starting address of each line on the screen
; These tables are shifted on byte to correct for colour shift in ColourPET BETA design,
; and colour memory starts at $8400.

;---------- 32 characters wide 
!IF COLUMNS=32 {
CLine_Addr_Lo	!byte $01,$21,$41,$61,$81,$a1,$c1,$e1,$01,$21,$41,$61,$81,$a1,$c1,$e1
		!byte $01,$21,$41,$61,$81,$a1,$c1,$e1,$01
CLine_Addr_Hi	!byte $84,$84,$84,$84,$84,$84,$84,$84,$85,$85,$85,$85,$85,$85,$85,$85
		!byte $86,$86,$86,$86,$86,$86,$86,$86,$87
}

;---------- 40 characters wide 
!IF COLUMNS=40 {
CLine_Addr_Lo	!byte $01,$29,$51,$79,$a1,$c9,$f1,$19,$41,$69,$91,$b9,$e1,$09,$31,$59
		!byte $81,$a9,$d1,$f9,$21,$49,$71,$99,$c1
CLine_Addr_Hi	!byte $84,$84,$84,$84,$84,$84,$84,$85,$85,$85,$85,$85,$85,$86,$86,$86
		!byte $86,$86,$86,$86,$87,$87,$87,$87,$87
}

;---------- 64 characters wide
!IF COLUMNS=64 {
CLine_Addr_Lo	!byte $01,$41,$81,$c1,$01,$41,$81,$c1,$01,$41,$81,$c1,$01,$41,$81,$c1
		!byte $01,$41,$81,$c1,$01,$41,$81,$c1,$01
CLine_Addr_Hi	!byte $84,$84,$84,$84,$85,$85,$85,$85,$86,$86,$86,$86,$87,$87,$87,$87
		!byte $88,$88,$88,$88,$89,$89,$89,$89,$8a
}

;---------- 80 characters wide 
!IF COLUMNS=80 {
CLine_Addr_Lo	!byte $01,$51,$a1,$f1,$41,$91,$e1,$31,$81,$d1,$21,$71,$c1,$11,$61,$b1
		!byte $01,$51,$a1,$f1,$41,$91,$e1,$31,$81
CLine_Addr_Hi	!byte $84,$84,$84,$84,$85,$85,$85,$86,$86,$86,$87,$87,$87,$88,$88,$88
		!byte $89,$89,$89,$89,$8a,$8a,$8a,$8b,$8b
}

; 90 characters wide not applicable
