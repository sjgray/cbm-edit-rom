; PET/CBM EDIT ROM - Keyboard Matrix Table
; ================   Business Keyboard - Modified Layout, more like C64 - Layout by Steve Gray
; 
; Notes: 00 = Shift , 10 = Repeat, +80 = Unshiftable , FF   = No Key
;        KP = Keypad, S- = Shift , GR- = Graphic Code, NONE = No Key
;        CTRL- = CTRL+key , SHC- = Shift-CTRL+key, A- = Accent

; This is a B keyboard with re-arranged layout to make it closer to C64 keyboard
; ESC moved to top left. Cursor keys to bottom CLR/HOME and INS/DEL moved to top row
; REPEAT moved to bottom left.
; 
;---------- Normal (no modifiers) Table

KEYBOARD_NORMAL

;     C0  C1  C2  C3  C4  C5  C6  C7    COL0   COL1   COL2   COL3   COL4   COL5   COL6   COL7   NOTES 
;     === === === === === === === ===   ====== ====== ====== ====== ====== ====== ====== ====== =====
!byte $16,$04,$3A,$14,$39,$36,$33,$9B ; CTRL-V CTRL-D :      DEL    9      6      3      ESC    ROW0 
!byte $B1,$2F,$15,$1D,$4D,$20,$58,$10 ; KP 1   /      CTRL-U RIGHT  m      SPACE  x      REPT   ROW1 
!byte $B2,$11,$0F,$B0,$2C,$4E,$56,$5A ; KP 2   DOWN   CTRL-O 0      ,      n      v      z      ROW2 
!byte $B3,$00,$19,$AE,$2E,$42,$43,$00 ; KP 3   SHIFT  CTRL-Y .      .      n      c      SHIFT  ROW3
!byte $B4,$DB,$4F,$DF,$55,$54,$45,$51 ; KP 4   [      o      BK-ARR u      t      e      q      ROW4 
!byte $DE,$50,$49,$DD,$59,$52,$57,$09 ; UARRW  P      i      ]      y      r      w      TAB    ROW5 
!byte $B6,$C0,$4C,$0D,$4A,$47,$44,$41 ; KP 6   @      l      RETURN j      g      d      a      ROW6
!byte $B5,$3B,$4B,$DC,$48,$46,$53,$03 ; KP 5   ;      k      \      h      f      s      STOP   ROW7
!byte $B9,$06,$12,$B7,$B0,$37,$34,$31 ; KP     CTRL-F RVS    7      0      7      4      1      ROW8
!byte $05,$0E,$13,$B8,$2D,$38,$35,$32 ; CTRL-E CTRL-N HOME   8      -      8      5      2      ROW9
