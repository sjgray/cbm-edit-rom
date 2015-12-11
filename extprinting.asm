; PET/CBM EDIT ROM - Extended screen printing routines
; ================   Handles conditional cursor and combination keys

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
           JSR CURSOR_DOWN
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

Screen_Input_Ext
           LDY CursorCol
           LDA (ScrPtr),Y				;----------------(!!!!!!!!!!!!!!!! fix for colour)?
           JSR Check_Diacritic
           STA DATAX
Beb43      RTS

;--------- ?

Check_Diacritic
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