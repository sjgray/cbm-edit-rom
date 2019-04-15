; PET/CBM EDIT ROM - Extended Keyboard Matrix Table
; ================   C64 Keyboard - Standard C64/VIC keyboard with 8x8 matrix
; 
; Notes: 00 = Shift , 10 = Repeat, +80 = Unshiftable , FF   = No Key
;        KP = Keypad, S- = Shift , GR- = Graphic Code, NONE = No Key
;        CTRL- = CTRL+key , SHC- = Shift-CTRL+key, A- = Accent
;
; A standard C64 keyboard is plugged directly into the PET keyboard connector.
; It is electrically compatible, but only uses an 8x8 matrix of keys.
;
; Due to the nature of the keyboard and different labelling, the following changes are made:
;
; * Code Change: SHIFT=01 with 00
; * Reassign   : POUND as \=5C, CTRL as RVS=12, C= as ESC=9B
; * Reassign   : F1 as TEXT=0E, F3 as DELETE LINE=15, F5 as ERASE TO START=16, F7 as SCROLL DOWN=19
;
;---------- Normal (no modifiers) Table

KEYBOARD_NORMAL

;     C0  C1  C2  C3  C4  C5  C6  C7    COL0   COL1   COL2   COL3   COL4   COL5   COL6   COL7   NOTES 
;     === === === === === === === ===   ====== ====== ====== ====== ====== ====== ====== ====== =====
!byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; NONE   NONE   NONE   NONE   NONE   NONE   NONE   NONE   ROW0
!byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; NONE   NONE   NONE   NONE   NONE   NONE   NONE   NONE   ROW1
!byte $19,$13,$2D,$30,$38,$36,$34,$32 ; F7     HOME   -      0      8      6      4      2      ROW2
!byte $16,$5E,$40,$4F,$55,$54,$45,$51 ; F5     UP-ARR @      O      U      T      E      Q      ROW3
!byte $15,$3D,$3A,$4B,$48,$46,$53,$9B ; F3     =      :      K      H      F      S      C=     ROW4
!byte $0E,$00,$2E,$4D,$42,$43,$5A,$20 ; F1     SHIFT  .      M      B      C      Z      SPACE  ROW5
!byte $11,$2F,$2C,$4E,$56,$58,$00,$03 ; DOWN   /      ,      N      V      X      SHIFT  STOP   ROW6
!byte $1D,$3B,$4C,$4A,$47,$44,$41,$12 ; RIGHT  ;      L      J      G      D      A      CTRL   ROW7
!byte $0D,$2A,$50,$49,$59,$52,$57,$DF ; RETURN *      P      I      Y      R      W      BK-ARR ROW8
!byte $14,$5C,$2B,$39,$37,$35,$33,$31 ; DEL    POUND  +      9      7      5      3      1      ROW9

;---------- Shifted Table
; TODO: FIX THE TABLE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

KEYBOARD_SHIFTED

!byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; NONE   NONE   NONE   NONE   NONE   NONE   NONE   NONE   ROW0
!byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; NONE   NONE   NONE   NONE   NONE   NONE   NONE   NONE   ROW1
!byte $19,$13,$2D,$30,$38,$36,$34,$32 ; F7     HOME   -      0      8      6      4      2      ROW2
!byte $16,$5E,$40,$4F,$55,$54,$45,$51 ; F5     UP-ARR @      O      U      T      E      Q      ROW3
!byte $15,$3D,$3A,$4B,$48,$46,$53,$9B ; F3     =      :      K      H      F      S      C=     ROW4
!byte $0E,$00,$2E,$4D,$42,$43,$5A,$20 ; F1     SHIFT  .      M      B      C      Z      SPACE  ROW5
!byte $11,$2F,$2C,$4E,$56,$58,$00,$03 ; DOWN   /      ,      N      V      X      SHIFT  STOP   ROW6
!byte $1D,$3B,$4C,$4A,$47,$44,$41,$12 ; RIGHT  ;      L      J      G      D      A      CTRL   ROW7
!byte $0D,$2A,$50,$49,$59,$52,$57,$DF ; RETURN *      P      I      Y      R      W      BK-ARR ROW8
!byte $14,$5C,$2B,$39,$37,$35,$33,$31 ; DEL    POUND  +      9      7      5      3      1      ROW9
