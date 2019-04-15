; PET/CBM EDIT ROM - Keyboard Matrix Table
; ================   CBM-II Keyboard - North American Layout (See notes)
; 
; Notes: 00 = Shift , 10 = Repeat, +80 = Unshiftable , FF   = No Key
;        KP = Keypad, S- = Shift , GR- = Graphic Code, NONE = No Key
;        CTRL- = CTRL+key , SHC- = Shift-CTRL+key, A- = Accent
;
; The CBM-II keyboard has a 16*6 matrix, so it requires a hardware modification to work on the PET,
; and a small modification to the keyboard scanning routine.
; It also has many extra keys with no equivilent function, and so will have some non-functioning keys.
;
;---------- Normal (no modifiers) Table

KEYBOARD_NORMAL

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

; NOTE: These bytes are directly from the CBM-II kernal:
; $EA29 - Normal Table
; $EA89 - Shifted Table
