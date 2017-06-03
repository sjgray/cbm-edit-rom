; PET/CBM EDIT ROM   Screen Line Address Table - 6847 CRT Controller with ram at $A000
; ================
; These tables are used to calculate the starting address of each line on the screen

;--------- LO Bytes Table

Line_Addr_Lo
	!byte $00,$20,$40,$60,$80,$A0,$C0,$E0
	!byte $00,$20,$40,$60,$80,$A0,$C0,$E0

;---------- HI Bytes Table

Line_Addr_Hi
	!byte $A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0
	!byte $A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1

