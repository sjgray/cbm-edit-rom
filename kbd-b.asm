; PET/CBM EDIT ROM - Keyboard Matrix Table - Business Keyboard
; ================   For simple keyboard scanner
;
 
;---------- Normal (no modifiers) Table

KEYBOARD_NORMAL
;                                               COL0  COL1  COL2  COL3  COL4  COL5  COL6  COL7  
;       -------------------------------------   ----- ----- ----- ----- ----- ----- ----- -----        
	!byte $16,$04,$3A,$03,$39,$36,$33,$DF ; $$-16 $$-04 :     STOP  9     6     3     BARRW | ROW0 
	!byte $B1,$2F,$15,$13,$4D,$20,$58,$12 ; 1     ^/    $$-15 HOME  M     SPACE X     RVS   | ROW1 
	!byte $B2,$10,$0F,$B0,$2C,$4E,$56,$5A ; 2     RPT   $$-0F 0     ,     N     V     Z     | ROW2 
	!byte $B3,$00,$19,$AE,$2E,$42,$43,$00 ; 3     SHIFT $$-19 .     .     B     C     SHIFT | ROW3
	!byte $B4,$DB,$4F,$11,$55,$54,$45,$51 ; 4     ]     O     DOWN  U     T     E     Q     | ROW4 
	!byte $14,$50,$49,$DC,$59,$52,$57,$09 ; DEL   P     I     @     Y     R     W     TAB   | ROW5 
	!byte $B6,$C0,$4C,$0D,$4A,$47,$44,$41 ; 6     [     L     RETRN J     G     D     A     | ROW6
	!byte $B5,$3B,$4B,$DD,$48,$46,$53,$9B ; 5     \     K     ;     H     F     S     ESC   | ROW7
	!byte $B9,$06,$DE,$B7,$B0,$37,$34,$31 ; 9     $$-06 UARRW 7     0     7     4     1     | ROW8
	!byte $05,$0E,$1D,$B8,$2D,$38,$35,$32 ; $$-05 $$-0E RIGHT 8     -     8     5     2     | ROW9

