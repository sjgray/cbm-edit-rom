; PET/CBM EDIT ROM - Keyboard Matrix Table
; ================   German DIN
;
; Notes: 00 = Shift , 10 = Repeat, +80 = Unshiftable , FF   = No Key
;        KP = Keypad, S- = Shift , GR- = Graphic Code, NONE = No Key
;        CTRL- = CTRL+key , SHC- = Shift-CTRL+key, A- = Accent
; 
;---------- Normal (no modifiers) Table

KEYBOARD_NORMAL

;     C0  C1  C2  C3  C4  C5  C6  C7    COL0   COL1   COL2   COL3   COL4   COL5   COL6   COL7   NOTES   x=changed from standard b keyboard
;     === === === === === === === ===   ====== ====== ====== ====== ====== ====== ====== ====== =====
!byte $16,$04,$40,$03,$39,$36,$33,$5F ; CTRL-V CTRL-D @      STOP   9      6      3      BK-ARR ..x....x
!byte $B1,$2F,$15,$13,$4D,$20,$58,$12 ; KP 1   /      CTRL-U RETURN M      SPACE  X      RVS    ........
!byte $B2,$80,$0F,$01,$2C,$4E,$56,$59 ; KP 2   CTRL   CTRL-O CTRL-A ,      N      V      Y      .x.x...x <- $80=CTRL (was $10=REPEAT)
!byte $B3,$00,$19,$AE,$2E,$42,$43,$00 ; KP 3   SHIFT  CTRL-Y KP .   .      B      C      SHIFT  ........ <- $00=SHIFT
!byte $B4,$5B,$4F,$11,$55,$54,$45,$51 ; KP 4   [      O      DOWN   U      T      E      Q      .x......
!byte $14,$50,$49,$3A,$5A,$52,$57,$09 ; DEL    P      I      :      Z      R      W      TAB    ...xx...
!byte $B6,$5D,$4C,$0D,$4A,$47,$44,$41 ; KP 6   ]      L      RETURN J      G      D      A      .x......
!byte $B5,$5C,$4B,$3B,$48,$46,$53,$1B ; KP 5   \      K      ;      H      F      S      ESC    .......x
!byte $B9,$06,$5E,$B7,$B0,$37,$34,$31 ; KP 9   CTRL-F UP-ARR KP 7   KP 0   7      4      1      ..x.....
!byte $05,$0E,$1D,$B8,$2D,$38,$35,$32 ; CTRL-E CTRL-N RIGHT  KP 8   -      8      5      2      ........
