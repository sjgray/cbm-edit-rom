; PET/CBM EDIT ROM - Keyboard Matrix Table - Business Keyboard - AZERTY Layout
; ================   For simple keyboard scanner
; 
; French AZERTY layout (needs verification)
 
;---------- Normal (no modifiers) Table

KEYBOARD_NORMAL
;                                               COL0  COL1  COL2  COL3  COL4  COL5  COL6  COL7    ROW   NOTES/CHANGES
;       -------------------------------------   ----- ----- ----- ----- ----- ----- ----- -----   ----  -------------       
	!byte $16,$04,$3A,$03,$39,$36,$33,$DF ; $$-16 $$-04 :     STOP  9     6     3     BARRW | ROW0
	!byte $B1,$2F,$15,$13,$3B,$20,$58,$12 ; 1     /     $$-15 HOME  ;     SPACE X     RVS   | ROW1  C4: M>; 4D>3B
	!byte $B2,$10,$0F,$B0,$2C,$4E,$56,$57 ; 2     RPT   $$-0F 0     ,     N     V     W     | ROW2  C7: Z>W 5A>57
	!byte $B3,$00,$19,$AE,$2E,$42,$43,$00 ; 3     SHIFT $$-19 .     .     B     C     SHIFT | ROW3
	!byte $B4,$DB,$4F,$11,$55,$54,$45,$41 ; 4     [     O     DOWN  U     T     E     A     | ROW4  C7: Q>A 51>41
	!byte $14,$50,$49,$DC,$59,$52,$5A,$09 ; DEL   P     I     \     Y     R     Z     TAB   | ROW5  C6: W>Z 57>5A
	!byte $B6,$C0,$4C,$0D,$4A,$47,$44,$51 ; 6     @     L     RETRN J     G     D     Q     | ROW6  C7: A>Q 41>51
	!byte $B5,$4D,$4B,$DD,$48,$46,$53,$9B ; 5     M     K     ]     H     F     S     ESC   | ROW7  C1: ;>M 3B>4D
	!byte $B9,$06,$DE,$B7,$B0,$37,$34,$31 ; 9     $$-06 UARRW 7     0     7     4     1     | ROW8
	!byte $05,$0E,$1D,$B8,$2D,$38,$35,$32 ; $$-05 $$-0E RIGHT 8     -     8     5     2     | ROW9
;