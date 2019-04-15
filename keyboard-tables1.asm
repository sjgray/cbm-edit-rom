; PET/CBM EDIT ROM - Keyboard Matrix Tables for KEYSCAN-N, KEYSCAN-B scanner code
; ================
; 
; Notes: 00 = Shift , 10 = Repeat, +80 = Unshiftable , FF   = No Key
;        KP = Keypad, S- = Shift , GR- = Graphic Code, NONE = No Key
;        CTRL- = CTRL+key , SHC- = Shift-CTRL+key, A- = Accent

KEYBOARD_NORMAL

;---------- Normal/Graphic Keyboard - QWERTY Layout (chicklet or standard type)
;
!IF KEYBOARD=0 {
;     C0  C1  C2  C3  C4  C5  C6  C7    COL0   COL1   COL2   COL3   COL4   COL5   COL6   COL7   NOTES 
;     === === === === === === === ===   ====== ====== ====== ====== ====== ====== ====== ====== =====
!byte $3d,$2e,$10,$03,$3c,$20,$5b,$12 ; KP =   KP .   CTRL-P STOP   <      SPACE  [      RVS    ROW0/A
!byte $2d,$30,$00,$3e,$ff,$5d,$40,$00 ; KP -   KP 0   SHIFT  >      NONE   ]      @      SHIFT  ROW1/B
!byte $2b,$32,$ff,$3f,$2c,$4e,$56,$58 ; KP +   KP 2   NONE   ?      ,      n      v      x      ROW2/C
!byte $33,$31,$0d,$3b,$4d,$42,$43,$5a ; KP 3   KP 1   RETURN ;      m      b      c      z      ROW3/D
!byte $2a,$35,$ff,$3a,$4b,$48,$46,$53 ; KP *   KP 5   NONE   :      k      h      f      s      ROW4/E
!byte $36,$34,$ff,$4c,$4a,$47,$44,$41 ; KP 6   KP 4   NONE   l      j      g      d      a      ROW5/F
!byte $2f,$38,$ff,$50,$49,$59,$52,$57 ; KP /   KP 8   NONE   p      i      y      r      w      ROW6/G
!byte $39,$37,$5e,$4f,$55,$54,$45,$51 ; KP 9   KP 7   UP-ARR o      u      t      e      q      ROW7/H
!byte $14,$11,$09,$29,$5c,$27,$24,$22 ; DEL    DOWN   TAB??? )      \      '      $      "      ROW8/I
!byte $1d,$13,$5f,$28,$26,$25,$23,$21 ; RIGHT  HOME   BK-ARR (      &      %      #      !      ROW9/J
}

;---------- Business Keyboard - QWERTY Layout
;
!IF KEYBOARD=1 {
;     C0  C1  C2  C3  C4  C5  C6  C7    COL0   COL1   COL2   COL3   COL4   COL5   COL6   COL7   NOTES 
;     === === === === === === === ===   ====== ====== ====== ====== ====== ====== ====== ====== =====
!byte $16,$04,$3A,$03,$39,$36,$33,$DF ; CTRL-V CTRL-D :      STOP   9      6      3      BK-ARR ROW0/A
!byte $B1,$2F,$15,$13,$4D,$20,$58,$12 ; KP 1   /      CTRL-U HOME   m      SPACE  x      RVS    ROW1/B
!byte $B2,$10,$0F,$B0,$2C,$4E,$56,$5A ; KP 2   RPT    CTRL-O KP 0   ,      n      v      z      ROW2/C 
!byte $B3,$00,$19,$AE,$2E,$42,$43,$00 ; KP 3   SHIFT  CTRL-Y KP .   .      b      c      SHIFT  ROW3/D
!byte $B4,$DB,$4F,$11,$55,$54,$45,$51 ; KP 4   [      o      DOWN   u      t      e      q      ROW4/E 
!byte $14,$50,$49,$DC,$59,$52,$57,$09 ; DEL    p      i      \      y      r      w      TAB    ROW5/F 
!byte $B6,$C0,$4C,$0D,$4A,$47,$44,$41 ; KP 6   @      l      RETURN j      g      d      a      ROW6/G
!byte $B5,$3B,$4B,$DD,$48,$46,$53,$9B ; KP 5   ;      k      ]      h      f      s      ESC    ROW7/H
!byte $B9,$06,$DE,$B7,$B0,$37,$34,$31 ; KP 9   CTRL-F UP-ARR KP 7   0      7      4      1      ROW8/I
!byte $05,$0E,$1D,$B8,$2D,$38,$35,$32 ; CTRL-E CTRL-N RIGHT  KP 8   -      8      5      2      ROW9/J
}

;---------- Business Keyboard - German DIN, QWERTZ (Version 1) Layout
;
!IF KEYBOARD=2 {
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
}

;---------- C64/VIC-20 Keyboard
;
; Keyboard will plug directly into the PET keyboard connector.
; It is electrically compatible, but only uses an 8x8 matrix of keys.
; Due to the nature of the keyboard and different labelling, the following changes are made:
;
; * Code Change: SHIFT=01 with 00
; * Reassign   : POUND as \=5C, CTRL as RVS=12, C= as ESC=9B
; * Reassign   : F1 as TEXT=0E, F3 as DELETE LINE=15, F5 as ERASE TO START=16, F7 as SCROLL DOWN=19

!IF KEYBOARD=3 {
;     C0  C1  C2  C3  C4  C5  C6  C7    COL0   COL1   COL2   COL3   COL4   COL5   COL6   COL7   NOTES 
;     === === === === === === === ===   ====== ====== ====== ====== ====== ====== ====== ====== =====
!byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; NONE   NONE   NONE   NONE   NONE   NONE   NONE   NONE   ROW0/A
!byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; NONE   NONE   NONE   NONE   NONE   NONE   NONE   NONE   ROW1/B
!byte $19,$13,$2D,$30,$38,$36,$34,$32 ; F7     HOME   -      0      8      6      4      2      ROW2/C
!byte $16,$5E,$40,$4F,$55,$54,$45,$51 ; F5     UP-ARR @      O      U      T      E      Q      ROW3/D
!byte $15,$3D,$3A,$4B,$48,$46,$53,$9B ; F3     =      :      K      H      F      S      C=     ROW4/E
!byte $0E,$00,$2E,$4D,$42,$43,$5A,$20 ; F1     SHIFT  .      M      B      C      Z      SPACE  ROW5/F
!byte $11,$2F,$2C,$4E,$56,$58,$00,$03 ; DOWN   /      ,      N      V      X      SHIFT  STOP   ROW6/G
!byte $1D,$3B,$4C,$4A,$47,$44,$41,$12 ; RIGHT  ;      L      J      G      D      A      CTRL   ROW7/H
!byte $0D,$2A,$50,$49,$59,$52,$57,$DF ; RETURN *      P      I      Y      R      W      BK-ARR ROW8/I
!byte $14,$5C,$2B,$39,$37,$35,$33,$31 ; DEL    POUND  +      9      7      5      3      1      ROW9/J
}

;---------- Business Keyboard - Modified QWERTY Layout - BSJG
;
; This is a B keyboard with re-arranged layout to make it closer to C64 keyboard
; ESC moved to top left. Cursor keys to bottom CLR/HOME and INS/DEL moved to top row
; REPEAT moved to bottom left.
;
!IF KEYBOARD=4 {
;     C0  C1  C2  C3  C4  C5  C6  C7    COL0   COL1   COL2   COL3   COL4   COL5   COL6   COL7   NOTES 
;     === === === === === === === ===   ====== ====== ====== ====== ====== ====== ====== ====== ======
!byte $16,$04,$3A,$14,$39,$36,$33,$9B ; CTRL-V CTRL-D :      DEL    9      6      3      ESC    ROW0/A 
!byte $B1,$2F,$15,$1D,$4D,$20,$58,$10 ; KP 1   /      CTRL-U RIGHT  m      SPACE  x      REPT   ROW1/B 
!byte $B2,$11,$0F,$B0,$2C,$4E,$56,$5A ; KP 2   DOWN   CTRL-O KP 0   ,      n      v      z      ROW2/C
!byte $B3,$00,$19,$AE,$2E,$42,$43,$00 ; KP 3   SHIFT  CTRL-Y KP .   .      n      c      SHIFT  ROW3/D
!byte $B4,$DB,$4F,$DF,$55,$54,$45,$51 ; KP 4   [      o      BK-ARR u      t      e      q      ROW4/E
!byte $DE,$50,$49,$DD,$59,$52,$57,$09 ; UP-ARR p      i      ]      y      r      w      TAB    ROW5/F
!byte $B6,$C0,$4C,$0D,$4A,$47,$44,$41 ; KP 6   @      l      RETURN j      g      d      a      ROW6/G
!byte $B5,$3B,$4B,$DC,$48,$46,$53,$03 ; KP 5   ;      k      \      h      f      s      STOP   ROW7/H
!byte $B9,$06,$12,$B7,$B0,$37,$34,$31 ; KP     CTRL-F RVS    KP 7   0      7      4      1      ROW8/I
!byte $05,$0E,$13,$B8,$2D,$38,$35,$32 ; CTRL-E CTRL-N HOME   KP 8   -      8      5      2      ROW9/J
}

;---------- Graphic Keyboard - Modified QWERTY Layout - NSJG
;
; In order to use ESC codes, the keyboard must have an ESC key. The standard Graphic keyboard has none,
; so the "@" key is used instead as it occupies the position an ESC key would normally be. The BACKARROW
; key will become the "@" symbol so that the DOS wedge is usable (BACKARROW is rarely used).
;
!IF KEYBOARD=5 {
;     C0  C1  C2  C3  C4  C5  C6  C7    COL0   COL1   COL2   COL3   COL4   COL5   COL6   COL7   NOTES 
;     === === === === === === === ===   ====== ====== ====== ====== ====== ====== ====== ====== =====
!byte $3d,$2e,$10,$03,$3c,$20,$5b,$12 ; KP =   KP .   CTRL-P STOP   <      SPACE  [      RVS    
!byte $2d,$30,$00,$3e,$ff,$5d,$9b,$00 ; KP -   KP 0   SHIFT  >      NONE   ]      ESC    SHIFT  @ replaced with ESC
!byte $2b,$32,$ff,$3f,$2c,$4e,$56,$58 ; KP +   KP 2   NONE   ?      ,      n      v      x
!byte $33,$31,$0d,$3b,$4d,$42,$43,$5a ; KP 3   KP 1   RETURN ;      m      b      c      z
!byte $2a,$35,$ff,$3a,$4b,$48,$46,$53 ; KP *   KP 5   NONE   :      k      h      f      s
!byte $36,$34,$ff,$4c,$4a,$47,$44,$41 ; KP 6   KP 4   NONE   l      j      g      d      a
!byte $2f,$38,$ff,$50,$49,$59,$52,$57 ; KP /   KP 8   NONE   p      i      y      r      w
!byte $39,$37,$5e,$4f,$55,$54,$45,$51 ; KP 9   KP 7   UP-ARR o      u      t      e      q
!byte $14,$11,$09,$29,$5c,$27,$24,$22 ; DEL    DOWN   TAB??? )      \      '      $      "
!byte $1d,$13,$40,$28,$26,$25,$23,$21 ; RIGHT  HOME   @      (      &      %      #      !      BACKARROW replaced by @
}

;---------- Business Keyboard - QWERTZ Layout
;
!IF KEYBOARD=6 {
;     C0  C1  C2  C3  C4  C5  C6  C7    COL0   COL1   COL2   COL3   COL4   COL5   COL6   COL7   NOTES 
;     === === === === === === === ===   ====== ====== ====== ====== ====== ====== ====== ====== =====
!byte $16,$04,$3A,$03,$39,$36,$33,$DF ; CTRL-V CTRL-D :      STOP   9      6      3      BK-ARR ROW0 
!byte $B1,$2F,$15,$13,$4D,$20,$58,$12 ; KP 1   /      CTRL-U HOME   m      SPACE  x      RVS    ROW1 
!byte $B2,$10,$0F,$B0,$2C,$4E,$56,$59 ; KP 2   RPT    CTRL-O KP 0   ,      n      v      y      ROW2 
!byte $B3,$00,$19,$AE,$2E,$42,$43,$00 ; KP 3   SHIFT  CTRL-Y KP .   .      b      c      SHIFT  ROW3
!byte $B4,$DB,$4F,$11,$55,$54,$45,$51 ; KP 4   ]      o      DOWN   u      t      e      q      ROW4 
!byte $14,$50,$49,$DC,$5A,$52,$57,$09 ; DEL    p      i      @      z      r      w      TAB    ROW5 
!byte $B6,$C0,$4C,$0D,$4A,$47,$44,$41 ; KP 6   [      l      RETURN j      g      d      a      ROW6
!byte $B5,$3B,$4B,$DD,$48,$46,$53,$9B ; KP 5   \      k      ;      h      f      s      ESC    ROW7
!byte $B9,$06,$DE,$B7,$B0,$37,$34,$31 ; KP 9   CTRL-F UP-ARR KP 7   0      7      4      1      ROW8
!byte $05,$0E,$1D,$B8,$2D,$38,$35,$32 ; CTRL-E CTRL-N RIGHT  KP 8   -      8      5      2      ROW9
}

;----------- Business Keyboard - French AZERTY Layout
;
!IF KEYBOARD=7 {
;     C0  C1  C2  C3  C4  C5  C6  C7    COL0   COL1   COL2   COL3   COL4   COL5   COL6   COL7   NOTES 
;     === === === === === === === ===   ====== ====== ====== ====== ====== ====== ====== ====== =====
!byte $16,$04,$3A,$03,$39,$36,$33,$DF ; CTRL-V CTRL-D :      STOP   9      6      3      BK-ARR ROW0/A
!byte $B1,$2F,$15,$13,$4D,$20,$58,$12 ; KP 1   /      CTRL-U HOME   m      SPACE  x      RVS    ROW1/B
!byte $B2,$10,$0F,$B0,$2C,$4E,$56,$5A ; KP 2   RPT    CTRL-O KP 0   ,      n      v      z      ROW2/C 
!byte $B3,$00,$19,$AE,$2E,$42,$43,$00 ; KP 3   SHIFT  CTRL-Y KP .   .      b      c      SHIFT  ROW3/D
!byte $B4,$DB,$4F,$11,$55,$54,$45,$51 ; KP 4   [      o      DOWN   u      t      e      q      ROW4/E 
!byte $14,$50,$49,$DC,$59,$52,$57,$09 ; DEL    p      i      \      y      r      w      TAB    ROW5/F 
!byte $B6,$C0,$4C,$0D,$4A,$47,$44,$41 ; KP 6   @      l      RETURN j      g      d      a      ROW6/G
!byte $B5,$3B,$4B,$DD,$48,$46,$53,$9B ; KP 5   ;      k      ]      h      f      s      ESC    ROW7/H
!byte $B9,$06,$DE,$B7,$B0,$37,$34,$31 ; KP 9   CTRL-F UP-ARR KP 7   0      7      4      1      ROW8/I
!byte $05,$0E,$1D,$B8,$2D,$38,$35,$32 ; CTRL-E CTRL-N RIGHT  KP 8   -      8      5      2      ROW9/J
}

;----------- CBM-II (B-Series, P-Series) - QWERTY Layout
;
; The CBM-II keyboard has a 16*6 matrix, so it requires a hardware modification to work on the PET,
; and a small modification to the keyboard scanning routine.
; It also has many extra keys with no equivilent function, and so will have some non-functioning keys.
;
; *** WORK IN PROGRESS!!!!!!!
;
!IF KEYBOARD=8 {
;     C0  C1  C2  C3  C4  C5    COL0   COL1   COL2   COL3   COL4   COL5   NOTES 
;     === === === === === ===   ====== ====== ====== ====== ====== ====== =====
!BYTE $E0,$1B,$09,$FF,$00,$01 ; F1     ESCAPE TAB    NONE   SHIFT  CTRL   ROW0/A
!BYTE $E1,$31,$51,$41,$5A,$FF ; F2     1      Q      A      Z      NONE   ROW1/B
!BYTE $E2,$32,$57,$53,$58,$43 ; F3     2      W      S      X      C      ROW2/C
!BYTE $E3,$33,$45,$44,$46,$56 ; F4     3      E      D      F      V      ROW3/D
!BYTE $E4,$34,$52,$54,$47,$42 ; F5     4      R      T      G      B      ROW4/E
!BYTE $E5,$35,$36,$59,$48,$4E ; F6     5      6      Y      H      N      ROW5/F
!BYTE $E6,$37,$55,$4A,$4D,$20 ; F7     7      U      J      M      SPACE  ROW6/G
!BYTE $E7,$38,$49,$4B,$2C,$2E ; F8     8      I      K      ,      .      ROW7/H
!BYTE $E8,$39,$4F,$4C,$3B,$2F ; F9     9      O      L      ;      /      ROW8/I
!BYTE $E9,$30,$2D,$50,$5B,$27 ; F10    0      -      P      [      '      ROW9/J
!BYTE $11,$3D,$5F,$5D,$0D,$DE ; DOWN   =      _      ]      RETURN PI     ROW10/K
!BYTE $91,$9D,$1D,$14,$02,$FF ; UP     LEFT   RIGHT  DEL    CMDR   NONE   ROW11/L
!BYTE $13,$3F,$37,$34,$31,$30 ; HOME   ?      7      4      1      0      ROW12/M
!BYTE $12,$04,$38,$35,$32,$2E ; RVS    CE     8      5      2      .      ROW13/N
!BYTE $8E,$2A,$39,$36,$33,$30 ; GRAPH  *      9      6      3      00     ROW14/O
!BYTE $03,$2F,$2D,$2B,$0D,$FF ; STOP   /      -      +      ENTER  NONE   ROW15/P
}

;----------- Normal/Graphic Keyboard - Modified QWERTY Layout with [ESC] modification
;
; In order to use ESC codes, the keyboard must have an ESC key. The standard Graphic keyboard has none.
; This layout changes the BACKARROW to ESC.
;
!IF KEYBOARD=9 {
;     C0  C1  C2  C3  C4  C5  C6  C7    COL0   COL1   COL2   COL3   COL4   COL5   COL6   COL7   NOTES 
;     === === === === === === === ===   ====== ====== ====== ====== ====== ====== ====== ====== =====
!byte $3d,$2e,$10,$03,$3c,$20,$5b,$12 ; KP =   KP .   CTRL-P STOP   <      SPACE  [      RVS    ROW0/A
!byte $2d,$30,$00,$3e,$ff,$5d,$40,$00 ; KP -   KP 0   SHIFT  >      NONE   ]      @      SHIFT  ROW1/B
!byte $2b,$32,$ff,$3f,$2c,$4e,$56,$58 ; KP +   KP 2   NONE   ?      ,      n      v      x      ROW2/C
!byte $33,$31,$0d,$3b,$4d,$42,$43,$5a ; KP 3   KP 1   RETURN ;      m      b      c      z      ROW3/D
!byte $2a,$35,$ff,$3a,$4b,$48,$46,$53 ; KP *   KP 5   NONE   :      k      h      f      s      ROW4/E
!byte $36,$34,$ff,$4c,$4a,$47,$44,$41 ; KP 6   KP 4   NONE   l      j      g      d      a      ROW5/F
!byte $2f,$38,$ff,$50,$49,$59,$52,$57 ; KP /   KP 8   NONE   p      i      y      r      w      ROW6/G
!byte $39,$37,$5e,$4f,$55,$54,$45,$51 ; KP 9   KP 7   UP-ARR o      u      t      e      q      ROW7/H
!byte $14,$11,$09,$29,$5c,$27,$24,$22 ; DEL    DOWN   TAB??? )      \      '      $      "      ROW8/I
!byte $1d,$13,$1b,$28,$26,$25,$23,$21 ; RIGHT  HOME   BK-ARR (      &      %      #      !      ROW9/J   BACKARROW replaced by @
}

;----------- TED Series (C116/C16/Plus4) QWERTY Layout
;
; The TED keyboards have different connectors depending on model. Also, the pinouts
; do not group the ROWs and COLs so you will need to make an adapter cable.
; TED keyboard have 4 separate cursor keys meaning no SHIFT is needed. This will likely
; conflict with the keyboard scanner which uses the TOP BIT of the character to indicate
; it cannot be shifted. Cursor UP and LEFT are normally shifted.
;
; Due to the nature of the keyboard and different labelling, the following changes are made:
;
; * Code Change: SHIFT=01 with 00
; * Reassign   : POUND as \=5C, C= as TEXT/GRAPHICS mode
; * Reassign   : F1 as TEXT=0E, F2 as DELETE LINE=15, F3 as ERASE TO START=16, HELP as SCROLL DOWN=19
;
; NOTE: Pin 3=LED, Pin 4=GND
; *** THIS KEYBOARD MATRIX HAS NOT BEEN TESTED!!!!
;
!IF KEYBOARD=11 {
;PIN: 17  14  13  2   6   8   9   16
;     C0  C1  C2  C3  C4  C5  C6  C7    COL0   COL1   COL2   COL3   COL4   COL5   COL6   COL7   NOTES  PIN
;     === === === === === === === ===   ====== ====== ====== ====== ====== ====== ====== ====== =====  ===
!byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; NONE   NONE   NONE   NONE   NONE   NONE   NONE   NONE   ROW0/A -
!byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF ; NONE   NONE   NONE   NONE   NONE   NONE   NONE   NONE   ROW1/B -
!byte $31,$13,$  ,$03,$20,$0E,$51,$32 ;	1      CLR    CTRL   STOP   SPACE  C=     Q      2      ROW2/C 5
!byte $33,$57,$41,$00,$5A,$53,$45,$34 ; 3      W      A      SHIFT  Z      S      E      4      ROW3/D 7
!byte $35,$52,$44,$58,$43,$46,$54,$36 ; 5      R      D      X      C      F      T      6      ROW4/E 11
!byte $37,$59,$47,$56,$42,$48,$55,$38 ; 7      Y      G      V      B      H      U      8      ROW5/F 10
!byte $39,$49,$4A,$4E,$4D,$4B,$4F,$30 ; 9      I      J      N      M      K      O      0      ROW6/G 12
!byte $11,$50,$4C,$2C,$2E,$3B,$2D,$91 ; DOWN   P      L      ,      .      :      -      UP     ROW7/H 1
!byte $9D,$2A,$3B,$2F,$1B,$3D,$2B,$1D ; LEFT   *      ;      /      ESC    =      +      RIGHT  ROW8/I 15
!byte $14,$0D,$5C,$40,$0E,$15,$16,$19 ; DEL    RETURN POUND  @      F1     F2     F3     HELP   ROW9/J 18
}
