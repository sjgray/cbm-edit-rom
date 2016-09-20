; PET/CBM EDIT ROM - Keyboard Matrix Table
; ================   German DIN
;
; Notes: 00 = Shift , 10 = Repeat, +80 = Unshiftable , FF   = No Key
;        KP = Keypad, S- = Shift , GR- = Graphic Code, NONE = No Key
;        CTRL- = CTRL+key , SHC- = Shift-CTRL+key, A- = Accent
;
; There seems to be two variations of the DIN keyboard. This one seems to be the most common.
;
;---------- Normal (no modifiers) Table

KEYBOARD_NORMAL

;     C0  C1  C2  C3  C4  C5  C6  C7    COL0   COL1   COL2   COL3   COL4   COL5   COL6   COL7   NOTES
;     === === === === === === === ===   ====== ====== ====== ====== ====== ====== ====== ====== =====
!byte $16,$04,$40,$03,$39,$36,$33,$5F ; CTRL-V CTRL-D @      STOP   9      6      3      BK-ARR ROW0/A  ..x....x
!byte $B1,$2F,$15,$13,$4D,$20,$58,$12 ; KP 1   /      CTRL-U HOME   M      SPACE  x      RVS    ROW1/B  ........
!byte $B2,$80,$0F,$01,$2C,$4E,$56,$59 ; KP 2   CTRL   CTRL-O KP 0   ,      n      v      y      ROW2/C  .x.x...x <- $80=CTRL (was $10=REPEAT)
!byte $B3,$00,$19,$AE,$2E,$42,$43,$00 ; KP 3   SHIFT  CTRL-Y KP .   .      b      c      SHIFT  ROW3/D  ........ <- $00=SHIFT
!byte $B4,$5B,$4F,$11,$55,$54,$45,$51 ; KP 4   [      o      DOWN   u      t      e      q      ROW4/E  .x......
!byte $14,$50,$49,$3A,$5A,$52,$57,$09 ; DEL    p      i      :      z      r      w      TAB    ROW5/F  ...xx...
!byte $B6,$5D,$4C,$0D,$4A,$47,$44,$41 ; KP 6   ]      l      RETURN j      g      d      a      ROW6/G  .x......
!byte $B5,$5C,$4B,$3B,$48,$46,$53,$1B ; KP 5   \      k      ;      h      f      s      ESC    ROW7/H  .......x
!byte $B9,$06,$5E,$B7,$B0,$37,$34,$31 ; KP 9   CTRL-F UP-ARR KP 7   0      7      4      1      ROW8/I  ..x.....
!byte $05,$0E,$1D,$B8,$2D,$38,$35,$32 ; CTRL-E CTRL-N RIGHT  KP 8   -      8      5      2      ROW9/J  ........
