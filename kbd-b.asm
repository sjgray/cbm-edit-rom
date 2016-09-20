; PET/CBM EDIT ROM - Keyboard Matrix Table
; ================   Business Keyboard - North American (Standard) Layout
; 
; Notes: 00 = Shift , 10 = Repeat, +80 = Unshiftable , FF   = No Key
;        KP = Keypad, S- = Shift , GR- = Graphic Code, NONE = No Key
;        CTRL- = CTRL+key , SHC- = Shift-CTRL+key, A- = Accent

;---------- Normal (no modifiers) Table

KEYBOARD_NORMAL

;     C0  C1  C2  C3  C4  C5  C6  C7    COL0   COL1   COL2   COL3   COL4   COL5   COL6   COL7   NOTES 
;     === === === === === === === ===   ====== ====== ====== ====== ====== ====== ====== ====== =====
!byte $16,$04,$3A,$03,$39,$36,$33,$DF ; CTRL-V CTRL-D :      STOP   9      6      3      BK-ARR ROW0
!byte $B1,$2F,$15,$13,$4D,$20,$58,$12 ; KP 1   /      CTRL-U HOME   m      SPACE  x      RVS    ROW1 
!byte $B2,$10,$0F,$B0,$2C,$4E,$56,$5A ; KP 2   RPT    CTRL-O 0      ,      n      v      z      ROW2 
!byte $B3,$00,$19,$AE,$2E,$42,$43,$00 ; KP 3   SHIFT  CTRL-Y KP .   .      b      c      SHIFT  ROW3
!byte $B4,$DB,$4F,$11,$55,$54,$45,$51 ; KP 4   [      o      DOWN   u      t      e      q      ROW4 
!byte $14,$50,$49,$DC,$59,$52,$57,$09 ; DEL    p      i      \      y      r      w      TAB    ROW5 
!byte $B6,$C0,$4C,$0D,$4A,$47,$44,$41 ; KP 6   @      l      RETURN j      g      d      a      ROW6
!byte $B5,$3B,$4B,$DD,$48,$46,$53,$9B ; KP 5   ;      k      ]      h      f      s      ESC    ROW7
!byte $B9,$06,$DE,$B7,$B0,$37,$34,$31 ; KP 9   CTRL-F UP-ARR 7      0      7      4      1      ROW8
!byte $05,$0E,$1D,$B8,$2D,$38,$35,$32 ; CTRL-E CTRL-N RIGHT  8      -      8      5      2      ROW9

