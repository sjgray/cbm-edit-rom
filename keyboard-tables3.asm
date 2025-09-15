; PET/CBM Editor ROM Project - Keyboard Matrix Tables for KEYSCAN-C64 scanner code
; ==========================   KEYBOARD-TABLES3.ASM
; 
; The C64 Keyboard scanner requires eight keyboard matrix tables:
; 	1) Normal (un-shifted)
; 	2) Shifted
; 	3) with CBM key
; 	4) CBM + shift
; 	5) Ctrl
; 	6) Ctrl + shift
; 	7) Ctrl + CBM
; 	8) Ctrl + CBM + shift
;
; NOTE: Some may point to the same table
;
; Also, for the C64 scanner, all tables must fit into a 1 page 
; area (256 consecutive bytes), or code changes are required

; ==================
KBD_Decode_Pointer
; ==================

                ; for any of the 8 combinations of shift, ctrl, and cbm
                ; using an offset from the KBD_NORMAL table

                !BYTE $00                       ; unshifted
                !BYTE KBD_SHIFTED-KBD_NORMAL    ; shifted
                !BYTE KBD_CBMKEY-KBD_NORMAL     ; CBM
                !BYTE KBD_CBMSHIFT-KBD_NORMAL   ; CBM+Shift 
                !BYTE KBD_CONTROL-KBD_NORMAL    ; Ctrl
                !BYTE KBD_CTRLSHIFT-KBD_NORMAL  ; Ctrl+Shift 
                !BYTE KBD_CTRLCBM-KBD_NORMAL    ; Ctrl+CBM 
                !BYTE KBD_CTRLCBMSHIFT-KBD_NORMAL ; Ctrl+shift+CBM (ctrl table)

;---------- Graphic Keyboard - North American (Standard) Layout
;
!IF KEYBOARD=0 {
}

;---------- Business Keyboard - North American (Standard) Layout
;
!IF KEYBOARD=1 {
}

;---------- Business Keyboard - German DIN, Version 1 Layout
;
!IF KEYBOARD=2 {
}

;---------- C64/VIC-20 Keyboard
;
!IF KEYBOARD=3 {

;********** Vic 20 keyboard matrix layout
;
;      c7   c6   c5   c4   c3   c2   c1   c0
;   +---------------------------------------
; r7|  F7   F5   F3   F1   DN  RGT  RET  DEL
; r6|   /   UP    =  RSH HOME    ;    *    £
; r5|   ,    @    :    .    -    L    P    +
; r4|   0    O    K    M    N    J    I    9
; r3|   8    U    H    B    V    G    Y    7
; r2|   6    T    F    C    X    D    R    5
; r1|   4    E    S    Z  LSH    A    W    3
; r0|   2    Q  CBM   SP  RUN  CTL  LFT    1
;   +----------------------------------------

; NOTE: I've seen this before, and this shows how messed up things are...
; The ROWS and COLS are reversed and INVERTED. C0 should be R7, C1 should be R6
; ... which probably all just depends on how your keyboard scanner interprets them,
; as I had to transpose the scanner tables below from what the comment refers to

KBD_NORMAL           ; keyboard decode table - unshifted
KBD_CBMKEY           ; keyboard decode table - commodore
KBD_CONTROL          ; keyboard decode table - control
KBD_CTRLCBM          ; keyboard decode table - control - cbm
;
;                                         ---- ---- ---- ---- ---- ---- ---- ----
   !byte $88,$13,$2D,$30,$38,$36,$34,$32 ;  F7    /    ,    0    8    6    4    2
   !byte $87,$5E,$40,$4F,$55,$54,$45,$51 ;  F5   UP    @    O    U    T    E    Q
   !byte $86,$3D,$3A,$4B,$48,$46,$53,$02 ;  F3    =    :    K    H    F    S  CBM
   !byte $85,$01,$2e,$4d,$42,$43,$5a,$20 ;  F1  RSH    .    M    B    C    Z  SPC
   !byte $11,$2f,$2c,$4e,$56,$58,$01,$03 ;  DN  HOM    -    N    V    X  LSH  STP
   !byte $1D,$3B,$4C,$4A,$47,$44,$41,$04 ; RGT    ;    L    J    G    D    A  CTL
   !byte $0D,$2A,$50,$49,$59,$52,$57,$5F ; RET    *    P    I    Y    R    W  LFT
   !byte $14,$5C,$2B,$39,$37,$35,$33,$31 ; DEL    £    +    9    7    5    3    1

KBD_SHIFTED          ; keyboard decode table - shifted
KBD_CBMSHIFT         ; keyboard decode table - shift - cbm
KBD_CTRLSHIFT        ; keyboard decode table - shift - ctrl
KBD_CTRLCBMSHIFT     ; keyboard decode table - shift - ctrl - cbm

   !byte $8c,$93,$dd,$30,$28,$26,$24,$22
   !byte $8b,$de,$ba,$cf,$d5,$d4,$c5,$d1
   !byte $8a,$3d,$5b,$cb,$c8,$c6,$d3,$02
   !byte $89,$01,$3e,$cd,$c2,$c3,$da,$a0
   !byte $91,$3f,$3c,$ce,$d6,$d8,$01,$83
   !byte $9d,$5d,$cc,$ca,$c7,$c4,$c1,$04
   !byte $8d,$c0,$d0,$c9,$d9,$d2,$d7,$5f
   !byte $94,$a9,$db,$29,$27,$25,$23,$21


; note: the following are not tranposed yet
;
; CBM key
;   !byte $21,$23,$25,$27,$29,$A6,$A8,$94
;   !byte $5F,$B3,$B2,$B7,$A2,$AF,$DF,$8D
;   !byte $04,$B0,$AC,$A5,$B5,$B6,$5D,$9D
;   !byte $83,$01,$BD,$BE,$AA,$3C,$3F,$91
;   !byte $A0,$AD,$BC,$BF,$A7,$3E,$01,$89
;   !byte $02,$AE,$BB,$B4,$A1,$5B,$3D,$8A
;   !byte $AB,$B1,$A3,$B8,$B9,$A4,$DE,$8B
;   !byte $22,$24,$26,$28,$30,$DC,$93,$8C

;KBD_CONTROL          ; keyboard decode table - control
;KBD_CTRLSHIFT           ; keyboard decode table - shift - control
;
;   !byte $90,$1C,$9C,$1F,$12,$FF,$FF,$FF
;   !byte $06,$FF,$12,$FF,$FF,$FF,$FF,$FF
;   !byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
;   !byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
;   !byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
;   !byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
;   !byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
;   !byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF

; ctrl + cbm
;KBD_CTRLCBM             ; keyboard decode table - cbm - control
;KBD_CTRLCBMSHIFT        ; keyboard decode table - shift - cbm - control
;   !byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
;   !byte $FF,$04,$FF,$FF,$FF,$FF,$FF,$E2
;   !byte $9D,$83,$01,$FF,$FF,$FF,$FF,$FF
;   !byte $91,$A0,$FF,$FF,$FF,$FF,$EE,$01
;   !byte $89,$02,$FF,$FF,$FF,$FF,$E1,$FD
;   !byte $8A,$FF,$FF,$FF,$FF,$FF,$B0,$E0
;   !byte $8B,$F2,$F4,$F6,$FF,$F0,$ED,$93
;   !byte $8C,$FF,$FF,$FF,$FF,$FF,$FF,$FF

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
;
!IF KEYBOARD=12 {
}
