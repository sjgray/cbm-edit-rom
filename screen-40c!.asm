; PET/CBM EDIT ROM - ColourPET - Colour RAM Address Table - 40 Column screen
; ================ ****** ADJUSTED FOR COLOUR SHIFT!!!!!!!!!!!!!!!!!!!!!!!!!
;
; These tables are used to calculate the starting address of each colour line on the screen

;--------- LO Bytes Table

CLine_Addr_Lo
	!byte $01,$29,$51,$79,$a1,$c9,$f1,$19
	!byte $41,$69,$91,$b9,$e1,$09,$31,$59
	!byte $81,$a9,$d1,$f9,$21,$49,$71,$99
	!byte $c1

;---------- HI Bytes Table

CLine_Addr_Hi
	!byte $84,$84,$84,$84,$84,$84,$84,$85
	!byte $85,$85,$85,$85,$85,$86,$86,$86
	!byte $86,$86,$86,$86,$87,$87,$87,$87
	!byte $87
