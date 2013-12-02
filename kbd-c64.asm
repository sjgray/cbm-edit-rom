; PET/CBM EDIT ROM - Keyboard Matrix Table - C64 Keyboard
; ================   For simple keyboard scanner
 
;---------- Normal (no modifiers) Table

KEYBOARD_NORMAL

;     C64 KEYBOARD TABLE                COL0  COL1  COL2  COL3  COL4  COL5  COL6  COL7
;     -------------------------------   ----- ----- ----- ----- ----- ----- ----- -----
!byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; not used                                        | ROW0
!byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; not used                                        | ROW1
!byte $19,$13,$2D,$30,$38,$36,$34,$32 ; F7    HOME  -     0     8     6     4     2     | ROW2
!byte $16,$5E,$40,$4F,$55,$54,$45,$51 ; F5    UARRW @     O     U     T     E     Q     | ROW3
!byte $15,$3D,$3A,$4B,$48,$46,$53,$9B ; F3    =     :     K     H     F     S     C=    | ROW4
!byte $0E,$00,$2E,$4D,$42,$43,$5A,$20 ; F1    SHIFT .     M     B     C     Z     SPACE | ROW5
!byte $11,$2F,$2C,$4E,$56,$58,$00,$03 ; DOWN  /     ,     N     V     X     SHIFT STOP  | ROW6
!byte $1D,$3B,$4C,$4A,$47,$44,$41,$12 ; RIGHT ;     L     J     G     D     A     CTRL  | ROW7
!byte $0D,$2A,$50,$49,$59,$52,$57,$DF ; RETRN *     P     I     Y     R     W     BARRW | ROW8
!byte $14,$5C,$2B,$39,$37,$35,$33,$31 ; DEL   POUND +     9     7     5     3     1     | ROW9
;                                       ----- ----- ----- ----- ----- ----- ----- ----- 
; Notes:
; * Code Change: SHIFT=01 with 00
; * Reassign   : POUND as \=5C, CTRL as RVS=12, C= as ESC=9B
; * Reassign   : F1 as TEXT=0E, F3 as DELETE LINE=15, F5 as ERASE TO START=16, F7 as SCROLL DOWN=19
