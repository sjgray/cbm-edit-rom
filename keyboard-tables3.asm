; PET/CBM EDIT ROM - Keyboard Matrix Tables for KEYSCAN-C64 scanner code
; ================
; 
; The C64 Keyboard scanner requires eight keyboard matrix tables:
; 1) Normal (un-shifted)
; 2) Shifted
; 3) with CBM key
; 4) CBM + shift
; 5) Ctrl
; 6) Ctrl + shift
; 7) Ctrl + CBM
; 8) Ctrl + CBM + shift
;
; note that same may be pointing to the same table
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

KBD_NORMAL           ; keyboard decode table - unshifted
KBD_CBMKEY           ; keyboard decode table - commodore
KBD_CONTROL          ; keyboard decode table - control
KBD_CTRLCBM          ; keyboard decode table - control - cbm
;
;                                         ---- ---- ---- ---- ---- ---- ---- ----
   !byte $31,$33,$35,$37,$39,$2B,$5C,$14 ;   1    3    5    7    9    +    £  DEL
   !byte $5F,$57,$52,$59,$49,$50,$2A,$0D ; LFT    W    R    Y    I    P    *  RET
   !byte $04,$41,$44,$47,$4A,$4C,$3B,$1D ; CTL    A    D    G    J    L    ;  RGT    
   !byte $03,$01,$58,$56,$4E,$2C,$2F,$11 ; RUN  LSH    X    V    N    -  HOM   DN
   !byte $20,$5A,$43,$42,$4D,$2E,$01,$85 ; SPC    Z    C    B    M    .  RSH   F1
   !byte $02,$53,$46,$48,$4B,$3A,$3D,$86 ; CBM    S    F    H    K    :    =   F3
   !byte $51,$45,$54,$55,$4F,$40,$5E,$87 ;   Q    E    T    U    O    @   UP   F5
   !byte $32,$34,$36,$38,$30,$2D,$13,$88 ;   2    4    6    8    0    ,    /   F7

KBD_SHIFTED          ; keyboard decode table - shifted
KBD_CBMSHIFT         ; keyboard decode table - shift - cbm
KBD_CTRLSHIFT        ; keyboard decode table - shift - ctrl
KBD_CTRLCBMSHIFT     ; keyboard decode table - shift - ctrl - cbm

   !byte $21,$23,$25,$27,$29,$DB,$A9,$94
   !byte $5F,$D7,$D2,$D9,$C9,$D0,$C0,$8D
   !byte $04,$C1,$C4,$C7,$CA,$CC,$5D,$9D
   !byte $83,$01,$D8,$D6,$CE,$3C,$3F,$91
   !byte $A0,$DA,$C3,$C2,$CD,$3E,$01,$89
   !byte $02,$D3,$C6,$C8,$CB,$5B,$3D,$8A
   !byte $D1,$C5,$D4,$D5,$CF,$BA,$DE,$8B
   !byte $22,$24,$26,$28,$30,$DD,$93,$8C

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
