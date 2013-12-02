; PET/CBM EDIT ROM - Code to check for ESC Sequence
; ================
; Goal is to support as many C128/CBM-II ESC codes as possible
;
;-----------------------------------------------------------------------
; TODO: Remove opcode bytes. Change storage locations. Change jump table
;-----------------------------------------------------------------------


;- code to call ESC check

C74D: A6 F0	LDX $F0 	; Previous character printed (For <ESC> Test)
C74F: E0 1B	CPX #$1B
C751: D0 03	BNE $C756
C753: 4C BE C9	JMP $C9BE	; Analyze Esc Sequence

;-----------------------------------------------------------------------------
; Analyze Esc Sequence

C9BE: 6C 38 03	JMP ($0338)	; Print ESC Sequence Link [C9C1]

;-----------------------------------------------------------------------------

; Kernal Analyze Esc Sequence

C9C1: C9 1B	CMP #$1B
C9C3: D0 05	BNE $C9CA
C9C5: 46 EF	LSR $EF 	; Current Character to Print
C9C7: 4C 7D C7	JMP $C77D	; Esc-o (escape)

C9CA: 29 7F	AND #$7F
C9CC: 38	SEC
C9CD: E9 40	SBC #$40
C9CF: C9 1B	CMP #$1B
C9D1: B0 0A	BCS $C9DD
C9D3: 0A	ASL A
C9D4: AA	TAX
C9D5: BD DF C9	LDA $C9DF,X
C9D8: 48	PHA
C9D9: BD DE C9	LDA $C9DE,X	; Esc Sequence Vectors
C9DC: 48	PHA

C9DD: 60	RTS

; Esc Sequence Vectors

C9DE: 9E CA	.WORD $CA9F-1	; Esc-@ Clear Remainder of Screen
C9E0: EC CA	.WORD $CAED-1	; Esc-a Auto Insert
C9E2: 15 CA	.WORD $CA16-1	; Esc-b Bottom
C9E4: E9 CA	.WORD $CAEA-1	; Esc-c Cancel Auto Insert
C9E6: 51 CA	.WORD $CA52-1	; Esc-d Delete Line
C9E8: 0A CB	.WORD $CB0B-1	; Esc-e Cursor Non Flash
C9EA: 20 CB	.WORD $CB21-1	; Esc-f Cursor Flash
C9EC: 36 CB	.WORD $CB37-1	; Esc-g Bell Enable
C9EE: 39 CB	.WORD $CB3A-1	; Esc-h Bell Disable
C9F0: 3C CA	.WORD $CA3D-1	; Esc-i Insert Line
C9F2: B0 CB	.WORD $CBB1-1	; Esc-j Start-of-Line
C9F4: 51 CB	.WORD $CB52-1	; Esc-k End-of-Line
C9F6: E1 CA	.WORD $CAE2-1	; Esc-l Scroll On
C9F8: E4 CA	.WORD $CAE5-1	; Esc-m Scroll Off
C9FA: 47 CB	.WORD $CB48-1	; Esc-n Screen Normal
C9FC: 7C C7	.WORD $C77D-1	; Esc-o (escape)
C9FE: 8A CA	.WORD $CA8B-1	; Esc-p Erase Begin
CA00: 75 CA	.WORD $CA76-1	; Esc-q Erase End
CA02: 3E CB	.WORD $CB3F-1	; Esc-r Screen Reverse
CA04: F1 CA	.WORD $CAF2-1	; Esc-s Block Cursor
CA06: 13 CA	.WORD $CA14-1	; Esc-t Top
CA08: FD CA	.WORD $CAFE-1	; Esc-u Underline Cursor
CA0A: BB CA	.WORD $CABC-1	; Esc-v Scroll Up
CA0C: C9 CA	.WORD $CACA-1	; Esc-w Scroll Down
CA0E: 2B CD	.WORD $CD2C-1	; Esc-x Switch 40/80 Col
CA10: 82 C9	.WORD $C983-1	; Esc-y Set Default Tabs
CA12: 7F C9	.WORD $C980-1	; Esc-z Clear All Tabs
