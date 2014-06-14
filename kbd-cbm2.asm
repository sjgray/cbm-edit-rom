; PET/CBM EDIT ROM - Keyboard Table for CBM-II keyboard (16x6 matrix)
; ================   Business keyscan routine (modified for CBM-II)

;---------- Normal (no modifiers) Table

KEYBOARD_NORMAL
;     DATA                      ROW       COL0   COL1   COL2   COL3   COL4   COL5
;     -----------------------   -------   ------ ------ ------ ------ ------ ------

!BYTE $E0,$1B,$09,$FF,$00,$01	;LINE 0   F1     ESCAPE TAB    NULL   SHIFT  CONTROL
!BYTE $E1,$31,$51,$41,$5A,$FF	;LINE 1   F2     1      Q      A      Z      NULL
!BYTE $E2,$32,$57,$53,$58,$43	;LINE 2   F3     2      W      S      X      C
!BYTE $E3,$33,$45,$44,$46,$56	;LINE 3   F4     3      E      D      F      V
!BYTE $E4,$34,$52,$54,$47,$42	;LINE 4   F5     4      R      T      G      B
!BYTE $E5,$35,$36,$59,$48,$4E	;LINE 5   F6     5      6      Y      H      N
!BYTE $E6,$37,$55,$4A,$4D,$20	;LINE 6   F7     7      U      J      M      SPACE
!BYTE $E7,$38,$49,$4B,$2C,$2E	;LINE 7   F8     8      I      K      ,      .
!BYTE $E8,$39,$4F,$4C,$3B,$2F	;LINE 8   F9     9      O      L      ;      /
!BYTE $E9,$30,$2D,$50,$5B,$27	;LINE 9   F10    0      -      P      [      '
!BYTE $11,$3D,$5F,$5D,$0D,$DE	;LINE 10  DOWN   =      _      ]      RETURN PI
!BYTE $91,$9D,$1D,$14,$02,$FF	;LINE 11  UP     LEFT   RIGHT  DEL    CMDR   NULL
!BYTE $13,$3F,$37,$34,$31,$30	;LINE 12  HOME   ?      7      4      1      0
!BYTE $12,$04,$38,$35,$32,$2E	;LINE 13  RVSON  CE     8      5      2      .
!BYTE $8E,$2A,$39,$36,$33,$30	;LINE 14  GRAPH  MULT   9      6      3      00
!BYTE $03,$2F,$2D,$2B,$0D,$FF	;LINE 15  STOP   /      -      +      ENTER  NULL

