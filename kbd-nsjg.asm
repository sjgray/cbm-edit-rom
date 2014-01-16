; PET/CBM EDIT ROM - Keyboard Matrix Table - N keyboard modified for ESC to test ESCAPE sequences
; ================
; This file contains the keyboard matrix decoding tables.
; Normal/Graphic Layout

;---------- Normal (no modifiers) Table
KEYBOARD_NORMAL
;                                          COL0  COL1  COL2  COL3  COL4  COL5  COL6  COL7
;         -------------------------------  ----- ----- ----- ----- ----- ----- ----- -----
    !byte $3d,$2e,$10,$03,$3c,$20,$5b,$12 ; =    .     ????? STOP  <     SPACE [     RVS    
    !byte $2d,$30,$00,$3e,$ff,$5d,$9b,$00 ; -    0     SHIFT >     NONE  ]     ESC*  SHIFT    *=Change: ESC was @
    !byte $2b,$32,$ff,$3f,$2c,$4e,$56,$58 ; +    2     NONE  ?     ,     N     V     X
    !byte $33,$31,$0d,$3b,$4d,$42,$43,$5a ; 3    1     RETRN ;     M     B     C     Z
    !byte $2a,$35,$ff,$3a,$4b,$48,$46,$53 ; *    5     NONE  :     K     H     F     S
    !byte $36,$34,$ff,$4c,$4a,$47,$44,$41 ; 6    4     NONE  L     J     G     D     A
    !byte $2f,$38,$ff,$50,$49,$59,$52,$57 ; /    8     NONE  P     I     Y     R     W
    !byte $39,$37,$5e,$4f,$55,$54,$45,$51 ; 9    7     UARRW O     U     T     E     Q
    !byte $14,$11,$09,$29,$5c,$27,$24,$22 ; DEL  DOWN  TAB   )     \     '     $     "
    !byte $1d,$13,$5f,$28,$26,$25,$23,$21 ; RGHT HOME  BARRW (     &     %     #     !
