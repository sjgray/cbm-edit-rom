; PET/CBM EDIT ROM - Extended ROM Code
; ================
; This code goes in the upper half of the 4K EDIT ROMS
; NOTE: The code from $E800-E8FF is not visible - fill with copyright or comments
;
;*=e800
;---------- Copyright Notice or Comments

		!if COLOURPET = 0 { !source "copyright-4v4e.asm" }
		!if COLOURPET = 1 { !source "copyright-colourpet.asm" }

		!fill $e900-*,$ff  

;*=e900
;--------- Start of Visible Code

           !byte $16,$44,$20,$20,$07,$01	;??????????

;--------- Extended Screen Editor Jump Table
; (Does anything use this table? - not called from EDITROM itself!)

           JMP CHROUT_WITH_DIACRITICS
           JMP IS_DIACRITIC_CHAR
           JMP Jeb3a
           JMP Jeb44
           JMP IS_SPECIAL_KEY
           JMP IS_VOCAL
           JMP PET_TO_ASCII			;not called? not in EDITROM.ASM
           JMP SCAN_KEYBOARD

           !fill $e924-*,$aa			; 6 bytes

;--------- EXTENDED Keyboard Scanner		(called from EDITROM.ASM)
;
; This routine requires two keyboard matrix tables (NORMAL and SHIFTED)
;
; CAUTION! Uses unused 80 column SCREEN RAM to store results of each row scan!!!!!
;          This code WILL NOT WORK on 40 column machines!!!!

SCAN_KEYBOARD
           LDA PIA1_Port_A 			; Keyboard row select
           AND #%11110000  			; Select row 0
           STA PIA1_Port_A 			; Keyboard row select
           LDA KEYFLAGS
           ORA #%11000000  			; no <shift> and no <ctrl>
           STA KEYFLAGS
           LDA RPTFLG
           PHA
           LDX #$4f 					; 80 keys to check
           LDY #$ff
           STY KEYPRESSED
           INY 						; Y = Keyboard row = 0
Be93c      LDA KBD_MATRIX,Y			; KBD_MATRIX located in SCREEN_RAM!!!!!
           ORA ModifierKeys,Y			; (table located in EDITROM.ASM)
           EOR #$ff
           STA RPTFLG 				; 1: pressed & not modifier
Be946      LDA PIA1_Port_B 			; Keyboard row
           STA KBD_MATRIX,Y			; KBD_MATRIX located in SCREEN_RAM!!!!!
           CMP PIA1_Port_B 			; Keyboard row
           BNE Be946
           ORA RPTFLG 				; Remove bouncing
           STY RPTFLG 				; Save Y
           LDY #8 					; Test the 8 keys of the row
SCLOOP_Y   LSR  					; check next key
           BCS Be979 					; 1 -> not pressed
           PHA 						; Save row
           LDA #%01111111 				; <shift> pressed
           CPX #$19 					; Right Shift
           BEQ Be974
           CPX #$1f 					; Left Shift
           BEQ Be974
           LDA #%10111111 				; <ctrl> pressed
           CPX #15 					; <RVS = CTRL>
           BEQ Be974
           LDA #$ff
           CMP KEYPRESSED
           BEQ Be972
           TAX
Be972      STX KEYPRESSED
Be974      AND KEYFLAGS
           STA KEYFLAGS
           PLA 						; Restore row
Be979      DEX 						; Next key
           BMI Be987
           DEY 						; Next column
           BNE SCLOOP_Y
           INC PIA1_Port_A 			; Keyboard row select
           LDY RPTFLG 				; Restore Y = row
           INY
           BNE Be93c 					; Branch always
Be987      PLA 						; Finished scan of keyboard matrix
           STA RPTFLG 				; Restore repeat flag
           LDX KEYPRESSED
           BMI SC_Nokey
           LDA #$15
           STA DELAY
           JSR GETPETSCII
           BVS Be9f2 					; Branch if <STOP>
           LDX CharsInBuffer
           CPX XMAX
           BCC Be9df
           BCS Be9e4
SC_Nokey   LDY #10
           JSR ModifyerActive
           BNE Be9ba
           DEY
           TYA
           BIT KEYFLAGS
           BVS Be9b1 					; Branch if not <ctrl>
           BPL Be9af 					; Branch if <shift>
           LSR
Be9af      AND #%10010010
Be9b1      JSR StoreKey
           LDY #$16
Be9b6      DEY
           STY DELAY
           RTS

Be9ba      LDX TABSTOPS-1,Y
Be9bd      DEX
           LSR
           BCC Be9bd
           JSR Je9ff
           BNE Be9f6
           LDY DELAY
           BNE Be9b6
           DEC KOUNT
           BNE Be9f6
           LDA #4
           STA KOUNT
           JSR GETPETSCII
           BVS Be9f2 					; Branch if <STOP>
           CMP Key_Image
           BNE Be9b1
           LDX CharsInBuffer
           BNE Be9e4
Be9df      STA KEYD,X
           INC CharsInBuffer
Be9e4      CMP #3 ; <STOP>
           BNE Be9ea
           LDY #%11101111 				; Set STOP flag
Be9ea      CMP #$e0
           BCC StoreKey
           LDY #%11111110

;--------- Store Key

StoreKey
           STY STKEY
Be9f2      STA Key_Image
           STA KEYPRESSED
Be9f6      RTS


;--------- Modifier Active

ModifyerActive
           LDA KBD_MATRIX-1,Y			;KBD_MATRIX is located in SCREEN_RAM!!!!!!!!!!!!!!!
           ORA ModifierKeys-1,Y			;(table located in EDITROM.ASM)
           EOR #$ff

;--------- ?

Je9ff
           BNE Bea04
           DEY
           BNE ModifyerActive
Bea04      RTS

;--------- Get PETSCII   (Local to EDITROMEXT)

GETPETSCII
           LDA KEYBOARD_NORMAL,X		; Get key code from NORMAL table
           BIT KEYFLAGS
           BMI Bea0f
           LDA KEYBOARD_SHIFTED,X		; Get key code from SHIFTED table
Bea0f      TAY
           BVS Bea20
           AND #$7f
           CMP #$41 					; 'A'
           BCC Bea25
           CMP #$5b 					; '['
           BCS Bea25
           TYA
           AND #$bf
           TAY
Bea20      CPX #$11					; WAS '#15' ????? ; <STOP>
           BEQ Bea25
           CLV
Bea25      TYA
           RTS

;--------- Conditional Left/Right Cursor	(called from EDITROM.ASM)

CONDITIONAL_LR_CURSOR
           CLV
           LDA DATAX
           TAX
           AND #$7f
           PHA
           CMP #$20 					; <SPACE>
           BCS Bea83 					; -> RTS
           LDA KEYFLAGS
           TAY
           AND #%11111001
           STA KEYFLAGS
           TYA
           LSR  					; Bit 0 -> carry
           BCC Bea83 					; -> RTS
           LSR  					; Bit 1 -> carry
           BCS Bea6d 					; -> Cursor right
           LSR  					; Bit 2 -> carry
           BCC Bea83 					; -> RTS
           CPX #$9d 					; <Cursor left>
           BNE Bea83
           JSR CURSOR_LEFT
           JMP Mea80

;--------- Cursor LEFT   				(local)

CURSOR_LEFT
           LDY LefMargin
           CPY CursorCol
           BCC Bea69
           LDY RigMargin
           LDX TopMargin
           CPX CursorRow
           BCS Bea64
           DEC CursorRow
           STY CursorCol
           LDX CursorRow
           JMP Update_ScrPtr			;New screen pointer calculation routine (in EDITROM.ASM)
Bea64      LDY LefMargin
           STY CursorCol
           RTS
Bea69      DEC CursorCol
           RTS

;--------- Cursor RIGHT  				(local)

CURSOR_RIGHT
           PHA
Bea6d      CPX #$1d
           BNE Bea83
           LDY CursorCol
           INC CursorCol
           CPY RigMargin
           BCC Mea80
           JSR Cursor_Down
           LDY LefMargin
           STY CursorCol
Mea80      BIT SET_V_FLAG 				; SOV Set overflow flag
Bea83      PLA
           LDY CursorCol
           RTS

;--------- Character Out with Diacritics	(called from EDITROM.ASM)

CHROUT_WITH_DIACRITICS
           CLV
           TAX
           LDA KEYFLAGS
           LSR 
           TXA
           BCC Beaa2 					; branch if bit 0 = 0
           LDY CursorCol
           LDA (ScrPtr),Y				;---------------(!!!!!!!!!!!!!!!! fix for colour)
           JSR IS_DIACRITIC_CHAR
           BVC Bea9b
           JMP Restore_Char_at_Cursor
Bea9b      BCC Beaa2
           LDX #$1d
           JSR CURSOR_RIGHT
Beaa2      LDX INSRT
           BEQ Beaa8
           DEC INSRT
Beaa8      RTS

;--------- Is Diacritic Character   (local)

IS_DIACRITIC_CHAR
           TAY
           TXA
           PHA
           AND #$7f
           TAX
           TYA
           AND #$7f
           PHA
           TXA
           CLV
           CMP #$20 					; <SPACE>
           BEQ Beb1a
           JSR CLEAR_KEYFLAGS_21
           JSR IS_SPECIAL_KEY
           BEQ Beaee
           JSR IS_VOCAL
           BNE Beb0d
           PLA
           JSR IS_SPECIAL_KEY
           BNE Beb0e
Beacc      LDA Vee9d,X
           PHA
           AND BITMASK,Y
           BEQ Beb0d
           LDA Veeb7,X
           TAX
           PLA
Beada      LSR 
           BCC Beade
           INX
Beade      DEY
           BPL Beada
           PLA
           ASL 
           LDA DIACRITIC_CODES-1,X
           AND #$7f
           BCC Beaec
           ORA #$80
Beaec      CLC
           RTS

Beaee      LDA Veead
           AND BITMASK,Y
           BEQ Beb06
           LDX #4
           AND Veeae
           BEQ Beb01
           DEX
           BIT SET_V_FLAG
Beb01      TXA
           ORA KEYFLAGS
           STA KEYFLAGS
Beb06      PLA
           JSR IS_VOCAL
           BEQ Beacc
           PHA
Beb0d      PLA
Beb0e      PLA
           CLC
           RTS
           LDA DATAX
           AND #$7f
           CMP #$20 					; <SPACE>
           BCC Beb28
           RTS
Beb1a      PLA
           JSR IS_SPECIAL_KEY
           BNE Beb26
           LDA KEYFLAGS
           AND #2
           BNE Beb27
Beb26      CLC
Beb27      PLA
Beb28      TAX

;--------- Clear Key Flags

CLEAR_KEYFLAGS_21
           LDA #%11111001
           AND KEYFLAGS
           STA KEYFLAGS
           TXA
           RTS

;--------- Increase COL

INCREASE_COL
           LDX RPTFLG
           BNE Beb43
           INC CursorCol
           JMP CheckQuote

;--------- ?

Jeb3a
           LDY CursorCol
           LDA (ScrPtr),Y				;----------------(!!!!!!!!!!!!!!!! fix for colour)?
           JSR Jeb44
           STA DATAX
Beb43      RTS

;--------- ?

Jeb44
           CLV
           TAX
           LDA KEYFLAGS
           LSR 						; Bit 0 -> carry
           TXA
           BCC Beb7b 					; -> RTS
           PHA
           LDX RPTFLG
           BNE Beb66
           AND #$7f
           LDX #12
Beb55      CMP DIACRITIC_CODES,X
           BEQ Beb60
           DEX
           BPL Beb55
           PLA
           CLC
           RTS
Beb60      LDA DIACRITIC_INDEX,X
           STA RPTFLG					; Repeat flag now used for Diacritic storage??????
           TAX
Beb66      LDA DIACRITIC_ACTION,X
           DEC RPTFLG
           LSR
           BCC Beb71
           BIT SET_V_FLAG
Beb71      LSR
           TAX
           PLA
           AND #$80
           ORA VOCALS,X
           BCS Beb7f
Beb7b      LDX #0
           STX RPTFLG
Beb7f      RTS

;--------- Is Special Key

IS_SPECIAL_KEY
           LDY #4
Beb82      CMP KEYFLAG_TRIGGER,Y
           BEQ Beb8a
           DEY
           BPL Beb82
Beb8a      RTS

;--------- Is Vocal

IS_VOCAL
           LDX #9
Beb8d      CMP VOCALS,X
           BEQ Beb95
           DEX
           BPL Beb8d
Beb95      RTS

;--------- PET to ASCII				(local)

PET_TO_ASCII
           LDX #13
Beb98      CMP PET_REP,X
           BEQ Bebbe
           DEX
           BPL Beb98
           TAX
           AND #$7f
           CMP #$20 					; <SPACE>
           BCC Bebbc
           CMP #$41 					; 'A'
           BCC Bebb7
           CMP #$5b 					; '['
           BCS Bebb7
           TXA
           BMI Bebb4
           ORA #$20 					; <SPACE>
Bebb4      AND #$7f
           RTS
Bebb7      TXA
           BPL Bebbd
           LDX #$20 					; <SPACE>
Bebbc      TXA
Bebbd      RTS
Bebbe      LDA ASC_REP,X
           RTS

;--------- Program CRTC				(called from EDITROM.ASM)

CRT_PROGRAM
           PHA
           JSR CLEAR_KEYFLAGS_210
           PLA
           JMP CRT_PROGRAM_OLD

;--------- Set Screen to TEXT mode		(called from EDITROM.ASM)

CRT_SET_TEXT
           LDA KEYFLAGS
           AND #%00001000 				; Bit 4 set: new char set (low ROM)
           BEQ CRT_SET_TEXT_OLD_1

;--------- Set Screen to TEXT mode NEW

CRT_SET_TEXT_NEW
           LDA KEYFLAGS
           ORA #%00001001
           STA KEYFLAGS
           LDA #<CRT_CONFIG_TEXT
           LDX #>CRT_CONFIG_TEXT
           LDY #14
           JMP CRT_PROGRAM_OLD

;--------- Set Screen to GRAPHICS mode

CRT_SET_GRAPHICS
           JSR CLEAR_KEYFLAGS_210
           AND #%00001000 				; Bit 4 set: new char set (low ROM)
           BEQ Bebef
           LDA #<CRT_CONFIG_GRAPHICS
           LDX #>CRT_CONFIG_GRAPHICS
           LDY #12
           JMP CRT_PROGRAM_OLD

Bebef      LDA #<CRT_CONFIG_GRAPHICS_OLD
           LDX #>CRT_CONFIG_GRAPHICS_OLD
           LDY #12
           JMP CRT_PROGRAM_OLD

;--------- Clear Key Flags

CLEAR_KEYFLAGS_210
           LDA KEYFLAGS
           AND #%11111000
           STA KEYFLAGS
           RTS

;--------- Set Screen to TEXT mode OLD

CRT_SET_TEXT_OLD
           LDA KEYFLAGS
           AND #%11110000
           STA KEYFLAGS

;--------- Set Screen to TEXT mode

CRT_SET_TEXT_OLD_1
           LDA #<CRT_CONFIG_TEXT_OLD
           LDX #>CRT_CONFIG_TEXT_OLD
           LDY #14
           JMP CRT_PROGRAM_OLD

;--------- Advance JIFFY Clock
; This routine was relocated to EXTROM

ADVANCE_JIFFY_CLOCK
           INC JIFFY_CORR
           LDA JIFFY_CORR
           BNE Bec16
           INC JIFFY_CORR+1
Bec16      CMP #$6f
           BNE Bec20
           LDA JIFFY_CORR+1
           CMP #2
           BEQ Bec41
Bec20      INC JIFFY_CLOCK+2
           BNE Bec2a
           INC JIFFY_CLOCK+1
           BNE Bec2a
           INC JIFFY_CLOCK
Bec2a      LDX #0
Bec2c      LDA JIFFY_CLOCK,X
           CMP JIFFY_MAX,X
           BCC Bec47
           INX
           CPX #3
           BNE Bec2c
           LDA #0
Bec3a      STA JIFFY_CLOCK-1,X
           DEX
           BNE Bec3a
           BEQ Bec47
Bec41      LDA #0
           STA JIFFY_CORR
           STA JIFFY_CORR+1
Bec47      RTS

;--------- JIFFY Max

JIFFY_MAX
           !byte $4f,$1a,$01

;--------- TABSTOP Table

TABSTOPS
           !byte $50,$48,$40,$38,$30,$28,$20,$18
           !byte $10,$08
           !fill $ee85-*,$ff			; 560 bytes

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

BITMASK    !byte $01,$02,$04,$08,$10,$20

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

           !fill $eedf-*,$aa			; 11 bytes

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

           !fill $eef6-*,$aa			; 10 bytes

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

;--------- Keyboard Tables

!if KEYBOARD = 0 {!source "kbdx-n.asm" }
!if KEYBOARD = 1 {!source "kbdx-b.asm" }
!if KEYBOARD = 2 {!source "kbdx-din.asm" }
!if KEYBOARD = 3 {!source "kbdx-c64.asm" }
