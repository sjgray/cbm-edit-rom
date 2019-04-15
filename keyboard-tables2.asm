; PET/CBM EDIT ROM - Keyboard Matrix Tables for KEYSCAN-DIN scanner code
; ================
; 
; Notes: 00 = Shift , 10 = Repeat, +80 = Unshiftable , FF   = No Key
;        KP = Keypad, S- = Shift , GR- = Graphic Code, NONE = No Key
;        CTRL- = CTRL+key , SHC- = Shift-CTRL+key, A- = Accent
;
; The DIN Keyboard scanner requires two keyboard matrix tables:
; 1) Normal (un-shifted)
; 2) Shifted

;---------- Graphic Keyboard - North American (Standard) Layout
;
!IF KEYBOARD=0 {
KEYBOARD_NORMAL
;     C0  C1  C2  C3  C4  C5  C6  C7    COL0   COL1   COL2   COL3   COL4   COL5   COL6   COL7   NOTES 
;     === === === === === === === ===   ====== ====== ====== ====== ====== ====== ====== ====== =====
!byte $3d,$2e,$10,$03,$3c,$20,$5b,$12 ; KP =   KP .   CTRL-P STOP   <      SPACE  [      RVS    
!byte $2d,$30,$00,$3e,$ff,$5d,$40,$00 ; KP -   KP 0   SHIFT  >      NONE   ]      @      SHIFT
!byte $2b,$32,$ff,$3f,$2c,$4e,$56,$58 ; KP +   KP 2   NONE   ?      ,      n      v      x
!byte $33,$31,$0d,$3b,$4d,$42,$43,$5a ; KP 3   KP 1   RETURN ;      m      b      c      z
!byte $2a,$35,$ff,$3a,$4b,$48,$46,$53 ; KP *   KP 5   NONE   :      k      h      f      s
!byte $36,$34,$ff,$4c,$4a,$47,$44,$41 ; KP 6   KP 4   NONE   l      j      g      d      a
!byte $2f,$38,$ff,$50,$49,$59,$52,$57 ; KP /   KP 8   NONE   p      i      y      r      w
!byte $39,$37,$5e,$4f,$55,$54,$45,$51 ; KP 9   KP 7   UP-ARR o      u      t      e      q
!byte $14,$11,$09,$29,$5c,$27,$24,$22 ; DEL    DOWN   TAB??? )      \      '      $      "
!byte $1d,$13,$5f,$28,$26,$25,$23,$21 ; RIGHT  HOME   BK-ARR (      &      %      #      !
;
KEYBOARD_SHIFTED
;     C0  C1  C2  C3  C4  C5  C6  C7    COL0   COL1   COL2   COL3   COL4   COL5   COL6   COL7   NOTES 
;     === === === === === === === ===   ====== ====== ====== ====== ====== ====== ====== ====== =====
!byte $3d,$2e,$10,$03,$3c,$20,$5b,$12 ; KP =   KP .   CTRL-P STOP   <      SPACE  [      RVS    
!byte $2d,$30,$00,$3e,$ff,$5d,$40,$00 ; KP -   KP 0   SHIFT  >      NONE   ]      @      SHIFT
!byte $2b,$32,$ff,$3f,$2c,$4e,$56,$58 ; KP +   KP 2   NONE   ?      ,      n      v      x
!byte $33,$31,$0d,$3b,$4d,$42,$43,$5a ; KP 3   KP 1   RETURN ;      m      b      c      z
!byte $2a,$35,$ff,$3a,$4b,$48,$46,$53 ; KP *   KP 5   NONE   :      k      h      f      s
!byte $36,$34,$ff,$4c,$4a,$47,$44,$41 ; KP 6   KP 4   NONE   l      j      g      d      a
!byte $2f,$38,$ff,$50,$49,$59,$52,$57 ; KP /   KP 8   NONE   p      i      y      r      w
!byte $39,$37,$5e,$4f,$55,$54,$45,$51 ; KP 9   KP 7   UP-ARR o      u      t      e      q
!byte $14,$11,$09,$29,$5c,$27,$24,$22 ; DEL    DOWN   TAB??? )      \      '      $      "
!byte $1d,$13,$5f,$28,$26,$25,$23,$21 ; RIGHT  HOME   BK-ARR (      &      %      #      !
}

;---------- Business Keyboard - North American (Standard) Layout
;
!IF KEYBOARD=1 {
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
;
; *** TODO: FIX THE SHIFTED TABLE ***
;
KEYBOARD_SHIFTED
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
}

;---------- Business Keyboard - German DIN, Version 1 Layout
;
!IF KEYBOARD=2 {
KEYBOARD_NORMAL
;     C0  C1  C2  C3  C4  C5  C6  C7    COL0   COL1   COL2   COL3   COL4   COL5   COL6   COL7   NOTES 
;     === === === === === === === ===   ====== ====== ====== ====== ====== ====== ====== ====== =====
!byte $16,$00,$BE,$13,$39,$36,$33,$3C ; CTRL-V SHIFT  GR-BE  STOP   9      6      3	  <
!byte $31,$2D,$15,$14,$4D,$20,$58,$00 ; KP 1   -      CTRL-U RIGHT  m      SPACE  x      CTRL
!byte $32,$03,$0F,$30,$2C,$4E,$56,$59 ; KP 2   DOWN   CTRL-O KP 0   ,      n      v      y
!byte $33,$00,$19,$2E,$2E,$42,$43,$00 ; KP 3   SHIFT  CTRL-Y KP .   .      b      c      SHIFT
!byte $34,$BD,$4F,$5B,$55,$54,$45,$51 ; KP 4   GR-BD  o      [      u      t      e      q
!byte $5D,$50,$49,$2B,$5A,$52,$57,$09 ; ]      p      i      +      z      r      w      TAB
!byte $36,$BB,$4C,$0D,$4A,$47,$44,$41 ; KP 6   GR-BB  l      RETURN j      g      d      a
!byte $35,$BC,$4B,$23,$48,$46,$53,$1B ; KP 5   GR-BC  k      #      h      f      s      ESC
!byte $39,$00,$11,$37,$30,$37,$34,$31 ; KP 9   SHIFT  HOME   KP 7   0      7      4      1
!byte $00,$0E,$1D,$38,$AF,$38,$35,$32 ; SHIFT  CTRL-N DEL    KP 8   A-ACUT 8      5      2
;


KEYBOARD_SHIFTED
;     C0  C1  C2  C3  C4  C5  C6  C7    COL0   COL1   COL2   COL3   COL4   COL5   COL6   COL7   NOTES
;     === === === === === === === ===   ====== ====== ====== ====== ====== ====== ====== ====== =====
!byte $96,$00,$3F,$93,$29,$26,$40,$3E ; SHC-V  SHIFT  ?      RUN    )      &      @      >
!byte $A2,$5F,$95,$94,$CD,$A0,$D8,$00 ; GR-A2  UNDRLN SHC-U  LEFT   M      SH-SPC X      RUN
!byte $A3,$83,$8F,$A1,$3B,$CE,$D6,$D9 ; GR-A3  UP     SHC-O  GR-A1  ;      N      V      Y
!byte $A4,$00,$99,$DE,$3A,$C2,$C3,$00 ; GR-A4  RSHIFT SHC-Y  PI     :      B      C      SHIFT
!byte $A5,$DD,$CF,$5E,$D5,$D4,$C5,$D1 ; GR-A5  UE     O      UP     U      T      E      Q
!byte $5C,$D0,$C9,$2A,$DA,$D2,$D7,$89 ; \      P      I      *      Z      R      W      SH-TAB
!byte $A7,$DB,$CC,$8D,$CA,$C7,$C4,$C1 ; GR-A7  GR-DB  L      S-RTRN J      G      D      A
!byte $A6,$DC,$CB,$27,$C8,$C6,$D3,$1B ; GR-A6  GR-DC  K      '      H      F      S      ESC
!byte $AA,$00,$91,$A8,$3D,$2F,$24,$21 ; GR-AA  SHIFT  CLR    GR-A8  =      /      $      !
!byte $00,$8E,$9D,$A9,$C0,$28,$25,$22 ; SHIFT  SHC-N  INS    GR-A9  A-GRAV (      %      "
}

;---------- C64/VIC-20 Keyboard
;
!IF KEYBOARD=3 {
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
;
; *** TODO: FIX THE SHIFTED TABLE ***
;
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
}

;---------- Business Keyboard - Custom Layout - BSJG
;
!IF KEYBOARD=4 {
}

;---------- Graphic Keyboard - Custom Layout - NSJG
;
!IF KEYBOARD=5 {
}

;---------- Business Keyboard - QWERTZ Layout
;
!IF KEYBOARD=6 {
}

;----------- Business Keyboard - AZERTY (French) Layout
;
!IF KEYBOARD=7 {
}

;----------- CBM-II (B-Series, P-Series) Layout - North American Layout
;
!IF KEYBOARD=8 {
}

;----------- Graphic Keyboard - North American (Standard) Layout with [ESC] key substitution - By Steve J Gray
;
!IF KEYBOARD=9 {
}

;----------- TED Series Keyboard - C116/C16/Plus4 etc with 8x8 matrix
;
!IF KEYBOARD=11 {
}

