; PET/CBM EDIT ROM - Extended Keyboard Matrix Table
; ================   German DIN
;
; Notes: 00 = Shift , 10 = Repeat, +80 = Unshiftable , FF   = No Key
;        KP = Keypad, S- = Shift , GR- = Graphic Code, NONE = No Key
;        CTRL- = CTRL+key , SHC- = Shift-CTRL+key, A- = Accent

;--------- Normal Table

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

;--------- Shifted Table

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

!byte $00				;??
