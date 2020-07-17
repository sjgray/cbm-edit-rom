; PET/CBM EDIT ROM - Keyboard Matrix Tables for KEYSCAN-DIN scanner code
; ================
; 
; Notes: 00 = Shift or CTRL, 10 = Repeat, +80 = Unshiftable , FF   = No Key
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
!byte $31,$2D,$15,$14,$4D,$20,$58,$00 ; KP 1   -      CTRL-U RIGHT  m      SPACE  x      CTRL   <--CTRL
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
!byte $A2,$5F,$95,$94,$CD,$A0,$D8,$00 ; GR-A2  UNDRLN SHC-U  LEFT   M      SH-SPC X      CTRL
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

;----------- C128 Keyboard - Requires hardware mod for larger matrix
; These tables are taken from a C128 ROM disassembly and re-formatted
; This has not been tested! It looks like the ROWS and COLUMNS are
; reversed compared to the PET/CBM keyboard scanner. This will either
; require re-ordering the matrix, or re-wiring/adapting the connector.
;
; CHANGES:
;           SHIFT ($01) to SHIFT ($00)
;           CTRL  ($04) to CTRL  ($80)
;           ALT   ($08) to SHIFT ($00)
;           NOSCRL($FF) to SHIFT ($00)
; PIN
; 1   GROUND
; 2   NO PIN (keyed)
; 4   +5V
; 
; Keys not in matrix:
;    RESTORE  = pin 1 and pin 3
;    40/80    = pin 1 and pin 24
;    CAPS LOCK= pin 1 and pin 25
;
; *** THESE KEYBOARD MATRICES HAVE NOT BEEN TESTED!!!!

!IF KEYBOARD=12 {

KEYBOARD_NORMAL
;PIN: 12  11  10  5   8   7   6   9
;     C0  C1  C2  C3  C4  C5  C6  C7    COL0   COL1   COL2   COL3   COL4   COL5   COL6   COL7   NOTES  PIN
;     === === === === === === === ===   ====== ====== ====== ====== ====== ====== ====== ====== =====  ===
!byte $14,$0D,$1D,$88,$85,$86,$87,$11 ; DEL    RETURN RIGHT  .      .      .      .      DOWN   ROW0   13
!byte $33,$57,$41,$34,$5A,$53,$45,$00 ; 3      w      a      4      z      s      e      SHIFT  ROW1   19
!byte $35,$52,$44,$36,$43,$46,$54,$58 ; 5      r      d      6      c      f      t      x      ROW2   18
!byte $37,$59,$47,$38,$42,$48,$55,$56 ; 7      y      g      8      b      h      u      v      ROW3   17
!byte $39,$49,$4A,$30,$4D,$4B,$4F,$4E ; 9      i      j      0      m      k      o      n      ROW4   16
!byte $2B,$50,$4C,$2D,$2E,$3A,$40,$2C ; +      p      l      -      .      :      @      ,      ROW5   15
!byte $5C,$2A,$3B,$13,$00,$3D,$5E,$2F ; \      *      ;      HOME   SHIFT  =      ^      /      ROW6   14
!byte $31,$5F,$80,$32,$20,$02,$51,$03 ; 1      BARROW CTRL   2      SPACE  CBM    q      STOP   ROW7   20
!byte $84,$38,$35,$09,$32,$34,$37,$31 ; HELP   8      5      TAB    2      4      7      1      ROW8   21
!byte $1B,$2B,$2D,$0A,$0D,$36,$39,$33 ; ESC    +      -      LF     ENTER  6      9      3      ROW9   22
!byte $08,$30,$2E,$91,$11,$9D,$1D,$00 ; ALT    0      .      UP     DOWN   LEFT   RIGHT  NOSCRL ROW10  23

; Keyboard Matrix Shifted

KEYBOARD_SHIFTED
!byte $94,$8D,$9D,$8C,$89,$8A,$8B,$91 ; INS    SHCR   LEFT   .      .      .      .      UP
!byte $23,$D7,$C1,$24,$DA,$D3,$C5,$01 ; #      W      A      $      Z      S      E      SHIFT
!byte $25,$D2,$C4,$26,$C3,$C6,$D4,$D8 ; %      R      D      &      C      F      T      X
!byte $27,$D9,$C7,$28,$C2,$C8,$D5,$D6 ; '      Y      G      (      B      H      U      V
!byte $29,$C9,$CA,$30,$CD,$CB,$CF,$CE ; )      I      J      0      M      K      O      N
!byte $DB,$D0,$CC,$DD,$3E,$5B,$BA,$3C ; .      P      L      .      >      [      .      <
!byte $A9,$C0,$5D,$93,$00,$3D,$DE,$3F ; .      .      ]      CLR    SHIFT  =      .      ?
!byte $21,$5F,$80,$22,$A0,$02,$D1,$83 ; !      BARROW CTRL   .      "      .      ULON   Q
!byte $84,$38,$35,$18,$32,$34,$37,$31 ; HELP   8      5      {TABT} 2      4      7      1
!byte $1B,$2B,$2D,$0A,$8D,$36,$39,$33 ; ESC    +      -      LF     SHCR   6      9      3
!byte $00,$30,$2E,$91,$11,$9D,$1D,$00 ; ALT    0      .      UP     DOWN   LEFT   RIGHT  NOSCRL

; The following are included for completeness, but these modifiers are not supported yet
;
; Keyboard Matrix C-Key
;
;!byte $94,$8D,$9D,$8C,$89,$8A,$8B,$91	; '{INS}{SHCR}{LEFT}....{UP}'
;!byte $96,$B3,$B0,$97,$AD,$AE,$B1,$01	; '{LTRED}..{GRAY1}....'
;!byte $98,$B2,$AC,$99,$BC,$BB,$A3,$BD	; '{GRAY2}..{LTGREEN}....'
;!byte $9A,$B7,$A5,$9B,$BF,$B4,$B8,$BE	; '{LTBLUE}..{GRAY3}....'
;!byte $29,$A2,$B5,$30,$A7,$A1,$B9,$AA	; ')..0....'
;!byte $A6,$AF,$B6,$DC,$3E,$5B,$A4,$3C	; '....>[.<'
;!byte $A8,$DF,$5D,$93,$01,$3D,$DE,$3F	; '..]{CLR}.=.?'
;!byte $81,$5F,$04,$95,$A0,$02,$AB,$03	; '{ORANGE}_.{BROWN}.{ULON}.{STOP}'
;!byte $84,$38,$35,$18,$32,$34,$37,$31	; '.85{TABT}2471'
;!byte $1B,$2B,$2D,$0A,$8D,$36,$39,$33	; '{ESC}+-{LF}{SHCR}693'
;!byte $08,$30,$2E,$91,$11,$9D,$1D,$FF	; '.0.{UP}{DOWN}{LEFT}{RIGHT}.'
;!byte $FF                     	
;
; Keyboard Matrix Control
;
;!byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF	; '........'
;!byte $1C,$17,$01,$9F,$1A,$13,$05,$FF	; '{RED}..{CYAN}.{HOME}{WHITE}.'
;!byte $9C,$12,$04,$1E,$03,$06,$14,$18	; '{PURPLE}{RVSON}.{GREEN}{STOP}.{DEL}{TABT}'
;!byte $1F,$19,$07,$9E,$02,$08,$15,$16	; '{BLUE}.{BELL}{YELLOW}{ULON}...'
;!byte $12,$09,$0A,$92,$0D,$0B,$0F,$0E	; '{RVSON}{TAB}{LF}{RVSOFF}{CR}{LOCK}{FLSHON}{LOWTEXT}'
;!byte $FF,$10,$0C,$FF,$FF,$1B,$00,$FF	; '..{UNLOCK}..{ESC}{0}.'
;!byte $1C,$FF,$1D,$FF,$FF,$1F,$1E,$FF	; '{RED}.{RIGHT}..{BLUE}{GREEN}.'
;!byte $90,$06,$FF,$05,$FF,$FF,$11,$FF	; '{BLACK}..{WHITE}..{DOWN}.'
;!byte $84,$38,$35,$18,$32,$34,$37,$31	; '.85{TABT}2471'
;!byte $1B,$2B,$2D,$0A,$8D,$36,$39,$33	; '{ESC}+-{LF}{SHCR}693'
;!byte $08,$30,$2E,$91,$11,$9D,$1D,$FF	; '.0.{UP}{DOWN}{LEFT}{RIGHT}.'
;!byte $FF                     	      
;
; Keyboard Matrix Caps-Lock
;
;!byte $14,$0D,$1D,$88,$85,$86,$87,$11	; '{DEL}{CR}{RIGHT}....{DOWN}'
;!byte $33,$D7,$C1,$34,$DA,$D3,$C5,$01	; '3WA4ZSE.'
;!byte $35,$D2,$C4,$36,$C3,$C6,$D4,$D8	; '5RD6CFTX'
;!byte $37,$D9,$C7,$38,$C2,$C8,$D5,$D6	; '7YG8BHUV'
;!byte $39,$C9,$CA,$30,$CD,$CB,$CF,$CE	; '9IJ0MKON'
;!byte $2B,$D0,$CC,$2D,$2E,$3A,$40,$2C	; '+PL-.:@,'
;!byte $5C,$2A,$3B,$13,$01,$3D,$5E,$2F	; '\*;{HOME}.=^/'
;!byte $31,$5F,$04,$32,$20,$02,$D1,$03	; '1_.2 {ULON}Q{STOP}'
;!byte $84,$38,$35,$09,$32,$34,$37,$31	; '.85{TAB}2471'
;!byte $1B,$2B,$2D,$0A,$0D,$36,$39,$33	; '{ESC}+-{LF}{CR}693'
;!byte $08,$30,$2E,$91,$11,$9D,$1D,$FF	; '.0.{UP}{DOWN}{LEFT}{RIGHT}.'
;!byte $FF                     	        ; '.'
}
