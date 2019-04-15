; PET/CBM EDIT ROM - Keyboard Matrix Table
; ================   Graphic Keyboard - North American (Standard) Layout with [ESC] key substitution - By Steve J Gray
; 
; Notes: 00 = Shift , 10 = Repeat, +80 = Unshiftable , FF   = No Key
;        KP = Keypad, S- = Shift , GR- = Graphic Code, NONE = No Key
;        CTRL- = CTRL+key , SHC- = Shift-CTRL+key, A- = Accent
;
; In order to use ESC codes, the keyboard must have an ESC key. The standard Graphic keyboard has none.
; This layout changes the BACKARROW to ESC.

;---------- Normal (no modifiers) Table

KEYBOARD_NORMAL

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
