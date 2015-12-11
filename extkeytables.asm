; PET/CBM EDIT ROM - Extended Keyboard Scanning Tables
; ================   Handles two keystroke characters and graphics

;--------- TABSTOP Table

TABSTOPS
           !byte $50,$48,$40,$38,$30,$28,$20,$18
           !byte $10,$08

!IF CRUNCH=0 {	!fill $ee85-*,$ff }			; 560 bytes!!!!!!!!!!!!!!!!!!!!!!!!!!!

;--------- VOCALS Table

VOCALS
           !byte $01,$05,$09,$0f,$15,$61,$66,$20
           !byte $40,$6f

;--------- Key Flag Trigger

KEYFLAG_TRIGGER
           !byte $40,$6f,$7f,$61,$66
           !byte $9d,$aa,$aa,$aa,$aa,$aa,$aa,$aa
           !byte $aa
Vee9d      !byte $05,$07,$04,$04,$05,$10,$08,$07
           !byte $02,$01
           !byte $aa,$aa,$aa,$aa,$aa,$aa
Veead      !byte $07
Veeae      !byte $07

;---------- BIT MASK Table				(local)

BITMASK    !byte $01,$02,$04,$08,$10,$20	; $EEAF

;---------- Set V Flag Table

SET_V_FLAG
           !byte $40,$80
Veeb7      !byte $00,$02,$05,$06,$07,$09,$09,$0a
           !byte $0c,$0c,$aa,$aa,$aa,$aa,$aa,$aa

;--------- Diacritic Codes Table

DIACRITIC_CODES
           !byte $72 ; a grave
           !byte $74 ; a circumflex
           !byte $6e ; e grave
           !byte $6c ; e acute
           !byte $75 ; e circumflex
           !byte $76 ; i circumflex
           !byte $77 ; o circumflex
           !byte $73 ; u grave
           !byte $78 ; u circumflex
           !byte $eb ; graphic cross
           !byte $40 ; grave
           !byte $6f ; acute
           !byte $7f ; circumflex

!IF CRUNCH=0 {	!fill $eedf-*,$aa }			; 11 bytes

;--------- Diacritic Index Table

DIACRITIC_INDEX
           !byte $02 ; a grave
           !byte $05 ; a circumflex
           !byte $07 ; e grave
           !byte $09 ; e acute
           !byte $0c ; e circumflex
           !byte $0f ; i circumflex
           !byte $12 ; o circumflex
           !byte $14 ; u grave
           !byte $17 ; u circumflex
           !byte $00 ; graphic cross
           !byte $19 ; grave
           !byte $1b ; acute
           !byte $1e ; circumflex

!IF CRUNCH=0 {	!fill $eef6-*,$aa }			; 10 bytes

;--------- Diacritic Action Table

DIACRITIC_ACTION

           !byte $aa 					; 00 <- graphic cross
           !byte $00 					; 01
           !byte $2a 					; 02 <- a grave
           !byte $00,$2a,$2e,$04,$2a,$04,$2e,$04
           !byte $2a,$2e,$08,$2a,$2e,$0c,$2a,$2e
           !byte $10,$2a,$10,$2a,$2e,$1c,$2a,$1c
           !byte $2e,$1c,$2a,$2e,$aa,$aa,$aa,$aa
           !byte $aa,$aa,$aa,$aa,$aa,$aa,$aa,$aa
           !byte $aa,$aa,$aa,$aa,$aa,$aa,$aa,$aa
           !byte $aa,$aa,$aa,$aa,$aa,$aa,$aa,$aa
           !byte $aa,$aa,$aa,$aa,$aa,$aa
PET_REP    !byte $1d,$9d,$ad,$af,$b0,$bb,$bc,$bd
           !byte $be,$c0,$db,$dc,$dd,$df
ASC_REP    !byte $20,$08,$23,$5e,$40,$7b,$7c,$7d
           !byte $7e,$5e,$5b,$5c,$5d,$5f
           !byte $aa,$aa,$aa,$aa,$aa,$aa,$aa,$aa
           !byte $aa,$aa,$aa,$aa

