; PET/CBM EDIT ROM   Colour RAM Address Table - 6847 CRT Controller with ram at $A000
; ================
; These tables are used to calculate the starting address of each line on the screen

;--------- LO Bytes Table

CLine_Addr_Lo
	!byte $00,$20,$40,$60,$80,$A0,$C0,$E0
	!byte $00,$20,$40,$60,$80,$A0,$C0,$E0

;---------- HI Bytes Table

CLine_Addr_Hi
	!byte $A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2
	!byte $A3,$A3,$A3,$A3,$A3,$A3,$A3,$A3

