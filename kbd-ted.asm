; PET/CBM EDIT ROM - Keyboard Matrix Table
; ================   TED Series Keyboard - C116/C16/Plus4 etc with 8x8 matrix
;
; ****************************************************
; *** THIS KEYBOARD MATRIX HAS NOT BEEN TESTED!!!! ***
; ****************************************************
; 
; Notes: 00 = Shift , 10 = Repeat, +80 = Unshiftable , FF   = No Key
;        KP = Keypad, S- = Shift , GR- = Graphic Code, NONE = No Key
;        CTRL- = CTRL+key , SHC- = Shift-CTRL+key, A- = Accent
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
;---------- Normal (no modifiers) Table

KEYBOARD_NORMAL

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
;
; NOTE: Pin 3=LED, Pin 4=GND