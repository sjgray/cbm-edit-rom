; File 0: b000          $B000 - $E000
; File 1: e000          $E000 - $F000
; File 2: f000          $F000 - $10000
Basic_USR = $0000
USRADD = $0001
CHARAC = $0003
ENDCHR = $0004
COUNT = $0005
DIMFLG = $0006
VALTYP = $0007
INTFLG = $0008
GARBFL = $0009
SUBFLG = $000a
INPFLG = $000b
TANSGN = $000c
DS_1 = $000d
DS_2 = $000e
DS_3 = $000f
IOPMPT = $0010
LINNUM = $0011
TEMPPT = $0013
LASTPT = $0014
TEMPST = $0016
INDEXA = $001f
INDEXB = $0021
FAC3EX = $0023
FAC3M1 = $0024
FAC3M2 = $0025
FAC3M3 = $0026
FAC3M4 = $0027
TXTTAB = $0028
VARTAB = $002a
ARYTAB = $002c
STREND = $002e
FRETOP = $0030
FRESPC = $0032
MEMSIZ = $0034
CURLIN = $0036
OLDLIN = $0038
OLDTXT = $003a
DATLIN = $003c
DATPTR = $003e
INPPTR = $0040
VARNAM = $0042
VARPTR = $0044
FORPNT = $0046
YSAVE = $0048
ACCSYM = $004a
FUNCPT = $004b
DESCPT = $004d
GARBSS = $0050
JUMPER = $0051
FUNJMP = $0052
FACTPA = $0054
TMPPTA = $0055
TMPPTB = $0057
FACTPB = $0059
TMPVA2 = $005a
TMPPTC = $005c
FAC1EX = $005e
FAC1M1 = $005f
FAC1M2 = $0060
FAC1M3 = $0061
FAC1M4 = $0062
FAC1SI = $0063
SGNFLG = $0064
BITS = $0065
FAC2EX = $0066
FAC2M1 = $0067
FAC2M2 = $0068
FAC2M3 = $0069
FAC2M4 = $006a
FAC2SI = $006b
STRPTR = $006c
FAC1M5 = $006d
TMPPTD = $006e
CHRGET = $0070
CHRGOT = $0076
TXTPTR = $0077
ISNUM = $007d
RNDX = $0088
JIFFY_CLOCK = $008d
CINV = $0090
CBINV = $0092
NMINV = $0094
STATUS = $0096
KEYPRESSED = $0097
KEYFLAGS = $0098
JIFFY_CORR = $0099
STKEY = $009b
SVXT = $009c
VERCK = $009d
CharsInBuffer = $009e
ReverseFlag = $009f
C3PO = $00a0
LastInputCol = $00a1
InputRow = $00a3
InputCol = $00a4
BSOUR = $00a5
Key_Image = $00a6
Blink = $00a7
BLNCT = $00a8
CursorChar = $00a9
BlinkPhase = $00aa
SYNO = $00ab
CRSW = $00ac
TEMPX = $00ad
LDTND = $00ae
DFLTN = $00af
DFLTO = $00b0
PRTY = $00b1
DPSW = $00b2
SAVELA = $00b3
TIMCMD = $00b4
MONCNT = $00b5
TMPZB7 = $00b7
TMPZB9 = $00b9
TMPZBA = $00ba
BUFPNT = $00bb
INBIT = $00bd
BITCI = $00be
RINONE = $00bf
PTR1 = $00c0
PTR2 = $00c1
RIDATA = $00c2
RIPRTY = $00c3
ScrPtr = $00c4
CursorCol = $00c6
SAL = $00c7
EAL = $00c9
CMP0 = $00cb
BLNSW = $00cc
QuoteMode = $00cd
BITTS = $00ce
EOT = $00cf
READERR = $00d0
FNLEN = $00d1
LA = $00d2
SA = $00d3
FA = $00d4
RigMargin = $00d5
TAPE1 = $00d6
CursorRow = $00d8
DATAX = $00d9
FNADR = $00da
INSRT = $00dc
ROPRTY = $00dd
FSBLK = $00de
MYCH = $00df
TopMargin = $00e0
BotMargin = $00e1
LefMargin = $00e2
XMAX = $00e3
RPTFLG = $00e4
KOUNT = $00e5
DELAY = $00e6
CHIME = $00e7
HOMECT = $00e8
SCRIV = $00e9
SCROV = $00eb
JIFFY6DIV5 = $00f8
CAS1 = $00f9
CAS2 = $00fa
STAL = $00fb
MEMUSS = $00fd
STACK = $0100
BUF = $0200
LAT = $0251
FAT = $025b
SAT = $0265
KEYD = $026f
TAPEB1 = $027a
NextTab = $033a
DOS_Drive_1 = $033b
DOS_Drive_2 = $033c
DOS_Length = $033d
DOS_Syntax = $033e
DOS_Id = $033f
DOS_Command_Length = $0341
DOS_Filename = $0342
DOS_Command_Buffer = $0353
TABS_SET = $03ee
Reset_Vector = $03fa
Reset_Param = $03fc
SCREEN_RAM = $8000
KBD_MATRIX = $87d0
PIA1_Port_A = $e810
PIA1_Cont_A = $e811
PIA1_Port_B = $e812
PIA1_Cont_B = $e813
PIA2_Port_A = $e820
PIA2_Cont_A = $e821
PIA2_Port_B = $e822
PIA2_Cont_B = $e823
VIA_Port_B = $e840
VIA_Port_A = $e841
VIA_DDR_B = $e842
VIA_DDR_A = $e843
VIA_Timer_1_Lo = $e844
VIA_Timer_1_Hi = $e845
VIA_Timer_1_Latch_Lo = $e846
VIA_Timer_1_Latch_Hi = $e847
VIA_Timer_2_Lo = $e848
VIA_Timer_2_Hi = $e849
VIA_Shift = $e84a
VIA_ACR = $e84b
VIA_PCR = $e84c
VIA_IFR = $e84d
VIA_IER = $e84e
VIA_Port_A_no_HS = $e84f
CRT_Address = $e880
CRT_Status = $e881

* = $e000   ; *** e000 ***  Commodore 8296


; ******
  EDITOR
; ******

           JMP RESET_EDITOR
           JMP GETKEY
           JMP INPUT_CHARACTER
           JMP ChrOutScreen
           JMP IRQ_MAIN
           JMP IRQ_NORMAL
           JMP END_OF_IRQ
           JMP CLEAR_WINDOW
           JMP CRT_TEXT_MODE
           JMP SET_CRT_GRAPHICS
           JMP PROGRAM_CRT
           JMP SCROLL_WINDOW_DOWN
           JMP SCROLL_WINDOW_UP
           JMP OLD_SCAN_KEYBOARD
           JMP BEEP
           JMP BEEP
           JMP SET_TOP_LEFT_CORNER
           JMP SET_BOTTOM_RIGHT_CORNER

; ***************
  SET_REPEAT_MODE
; ***************

           NOP
           NOP
           RTS
           .FILL $e04b-* ($aa) ;   18 bytes

; ************
  RESET_EDITOR
; ************

           JSR INIT_EDITOR
           JSR SET_CRT_TXT_NEW

; ************
  CLEAR_WINDOW
; ************

           LDX TopMargin
           DEX
 Be054     INX
           JSR Cursor_BOL
           JSR Erase_To_EOL
           CPX BotMargin
           BCC Be054

; ***********
  CURSOR_HOME
; ***********

           LDX TopMargin
           STX CursorRow

; ******************
  CURSOR_LEFT_MARGIN
; ******************

           LDY LefMargin
           STY CursorCol

; *****************
  UPDATE_CURSOR_ROW
; *****************

           LDX CursorRow
           JMP Update_ScrPtr
           JMP Cursor_BOL

; **********
  UPDATE_PNT
; **********

           JMP Update_ScrPtr
 Me072     INY
           STY CursorCol
           JMP IRQ_EPILOG
           TAX
           TAX

; *****************
  OLD_CRT_TEXT_MODE
; *****************

           JMP CRT_TEXT_MODE
           NOP
           NOP
           NOP
           NOP
           NOP

; *********************
  OLD_CRT_GRAPHICS_MODE
; *********************

           JMP SET_CRT_GRAPHICS
           NOP
           NOP
           NOP

; ***************
  OLD_PROGRAM_CRT
; ***************

           STA SAL
           STX SAL+1
           LDA VIA_PCR
           AND #$f0
           STA FNLEN
           TYA
           ORA FNLEN
           STA VIA_PCR
           LDY #$11
 Be09b     LDA (SAL),Y
           STY CRT_Address
           STA CRT_Status
           DEY
           BPL Be09b
           RTS

; ******
  GETKEY
; ******

           LDY KEYD
           LDX #0 ; scroll keyboard buffer
 Getkey_1  LDA KEYD+1,X
           STA KEYD,X
           INX
           CPX CharsInBuffer
           BNE Getkey_1
           DEC CharsInBuffer
           TYA
           CLI
           RTS

; *******
  GetLine
; *******

           JSR ChrOutMarginBeep

; ********
  GetLin10
; ********

           LDA CharsInBuffer
           STA Blink ; 0 chars -> blink cursor
           BEQ GetLin10 ; loop until char in buffer
           SEI
           LDA BlinkPhase
           BEQ Be0d3
           LDA CursorChar
           LDY #0
           STY BlinkPhase
           JSR Restore_Char_at_Cursor
 Be0d3     JSR GETKEY
           CMP #$83 ; RUN key ?
           BNE Be0ea
           SEI
           LDX #9
           STX CharsInBuffer
 Be0df     LDA RUN_String-1,X
           STA KEYD-1,X
           DEX
           BNE Be0df
           BEQ GetLin10
 Be0ea     CMP #13 ; RETURN ?
           BNE GetLine
           LDY RigMargin
           STY CRSW ; # 0 -> Screen Input
 Be0f2     LDA (ScrPtr),Y
           CMP #$20 ; Ignore trailing blanks
           BNE Be0fb
           DEY
           BNE Be0f2
 Be0fb     INY
           STY LastInputCol
           JSR CURSOR_TO_LEFT_MARGIN
           NOP
           STY QuoteMode ; = 0 (off)
           LDA InputRow
           BMI Screen_Input
           CMP CursorRow
           BNE Screen_Input
           LDA InputCol
           STA CursorCol
           CMP LastInputCol
           BCC Screen_Input
           BCS Be144

; ***************
  INPUT_CHARACTER
; ***************

           TYA
           PHA
           TXA
           PHA
           JMP (SCRIV)

; *********************
  DEFAULT_SCREEN_VECTOR
; *********************

           LDA CRSW
           BEQ GetLin10

; ************
  Screen_Input
; ************

           JSR Jeb3a
           BVS Be13b
           NOP
           AND #$3f ; '?'
           ASL DATAX
           BIT DATAX
           BPL Be131
           ORA #$80
 Be131     BCC Be137
           LDX QuoteMode
           BNE Be13b
 Be137     BVS Be13b
           ORA #$40 ; '@'
 Be13b     NOP
           NOP
           JSR INCREASE_COL
           CPY LastInputCol
           BNE Be15b
 Be144     LDA #0
           STA CRSW
           LDA #13
           LDX DFLTN
           CPX #3
           BEQ Be156
           LDX DFLTO
           CPX #3
           BEQ Be159
 Be156     JSR ChrOutScreen
 Be159     LDA #13
 Be15b     STA DATAX
           PLA
           TAX
           PLA
           TAY
           LDA DATAX
           CMP #$de
           BNE Be169
           LDA #$ff
 Be169     RTS

; **********
  CheckQuote
; **********

           CMP #$22 ; '"'
           BNE Be176
           LDA QuoteMode
           EOR #1
           STA QuoteMode
           LDA #$22 ; '"'
 Be176     RTS

; *******************
  CHARACTER_TO_SCREEN
; *******************

           ORA #$40 ; '@'
 Me179     LDX ReverseFlag
           BEQ Be17f
 Me17d     ORA #$80
 Be17f     JSR CHROUT_WITH_DIACRITICS
           BVS IRQ_EPILOG
           NOP
           JSR Restore_Char_at_Cursor
           INC CursorCol
           LDY RigMargin
           CPY CursorCol
           BCS IRQ_EPILOG
           LDX CursorRow
 Me192     JSR Cursor_Down
           LDY LefMargin
           STY CursorCol

; **********
  IRQ_EPILOG
; **********

           LDA #0
           STA HOMECT
 Me19d     PLA
           TAY
           LDA INSRT
           BEQ Be1a5
           LSR QuoteMode
 Be1a5     PLA
           TAX
           PLA
           CLI
           RTS

; ******************************
  CURSOR_TO_END_OF_PREVIOUS_LINE
; ******************************

           LDY RigMargin
           LDX TopMargin
           CPX CursorRow
           BCC Be1ba
           LDY LefMargin
           STY CursorCol
           PLA
           PLA
           BNE IRQ_EPILOG
 Be1ba     DEC CursorRow
           STY CursorCol
           JMP UPDATE_CURSOR_ROW

; ************
  Erase_To_EOL
; ************

           LDA #$20 ; ' '
 Be1c3     INY
           STA (ScrPtr),Y
           CPY RigMargin
           BCC Be1c3
           RTS

; *********************
  CURSOR_TO_LEFT_MARGIN
; *********************

           LDY LefMargin
           STY CursorCol
           LDY #0
           RTS

; ******************
  FULL_SCREEN_WINDOW
; ******************

           LDA #0
           TAX
           JSR SET_TOP_LEFT_CORNER
           LDA #$18
           LDX #$4f ; 'O'

; ***********************
  SET_BOTTOM_RIGHT_CORNER
; ***********************

           STA BotMargin
           STX RigMargin
           RTS

; *******************
  SET_TOP_LEFT_CORNER
; *******************

           STA TopMargin
           STX LefMargin
           RTS
           .FILL $e202-* ($aa) ;   28 bytes

; ************
  ChrOutScreen
; ************

           PHA
           STA DATAX
           TXA
           PHA
           TYA
           PHA
           JMP (SCROV) ; -> ChrOutNormal

; ************
  ChrOutNormal
; ************

           LDA #0
           STA CRSW
           JSR CONDITIONAL_LR_CURSOR
           BVS IRQ_EPILOG
           NOP
           CMP #$1b ; <ESC>
           BNE Be21d
           JMP Escape
 Be21d     LDA DATAX
           BPL Be224
           JMP ChrOutHighBitSet
 Be224     CMP #13 ; <RETURN>
           BNE Be22b
           JMP ScreenReturn
 Be22b     CMP #$20 ; <SPACE>
           BCC Be237 ; -> Control code
           AND #$3f ; '?'
           JSR CheckQuote
           JMP Me179 ; -> Print to screen
 Be237     LDX INSRT
           BEQ Be23e
           JMP Me17d ; -> Print reverse to screen
 Be23e     CMP #$14 ; <DEL>
           BNE Be262
           LDY LefMargin
           CPY CursorCol
           BCC Be24d
           JSR CURSOR_TO_END_OF_PREVIOUS_LINE
           BPL Be25c
 Be24d     DEC CursorCol
           LDY CursorCol
 Be251     INY
           LDA (ScrPtr),Y
           DEY
           STA (ScrPtr),Y
           INY
           CPY RigMargin
           BNE Be251
 Be25c     LDA #$20 ; ' '
           STA (ScrPtr),Y
           BNE Be299
 Be262     LDX QuoteMode
           BEQ Be269
           JMP Me17d
 Be269     CMP #$12 ; <RVS>
           BNE Be26f
           STA ReverseFlag
 Be26f     CMP #$13 ; <HOME>
           BNE Be283
           LDA HOMECT ; 2 x <HOME> sets window to full screen
           BPL Be27b
           JSR FULL_SCREEN_WINDOW
           CLC
 Be27b     ROR HOMECT
           JSR CURSOR_HOME
           JMP Me19d
 Be283     CMP #$1d ; <CURSOR RIGHT>
           BNE Be292
           INY
           STY CursorCol
           DEY
           CPY RigMargin
           BCC Be299
           JMP Me192
 Be292     CMP #$11 ; <CURSOR DOWN>
           BNE Be29c
           JSR Cursor_Down
 Be299     JMP IRQ_EPILOG
 Be29c     CMP #9 ; <TAB>
           BNE Be2d0
           JSR JUMP_TO_TAB
 Be2a3     LDY NextTab
           INC NextTab
           CPY RigMargin
           BCC Be2b6
           LDA RigMargin
           STA CursorCol
           DEC NextTab
           BNE Be299
 Be2b6     ASL DOS_Syntax
           BNE Be2c5
           INX
           CPX #10
           BEQ Be299
           LDA #1
           STA DOS_Syntax
 Be2c5     LDA TABS_SET,X
           AND DOS_Syntax
           BEQ Be2a3
           JMP Me072
 Be2d0     CMP #$16 ; <Ctrl V> : Erase to EOL
           BNE Be2e0
           LDA #$20 ; ' '
           DEY
 Be2d7     INY
           STA (ScrPtr),Y
           CPY RigMargin
           BCC Be2d7
           BCS Be299
 Be2e0     CMP #$15 ; <Ctrl U>
           BEQ Be2e7
           JMP Scroll_Or_Select_Charset
 Be2e7     LDA TopMargin
           PHA
           LDA CursorRow
           STA TopMargin
           JSR SCROLL_WINDOW_UP
           JMP Me5ca

; ****************
  ChrOutHighBitSet
; ****************

           AND #$7f
           CMP #$7f
           BNE Be2fc
           LDA #$5e ; '^'
 Be2fc     CMP #$20 ; ' '
           BCC Be303
           JMP CHARACTER_TO_SCREEN
 Be303     CMP #13 ; <Shift RETURN>
           BNE Be30a
           JMP ScreenReturn
 Be30a     LDX QuoteMode
           BNE Be342
           CMP #$14 ; <INS>
           BNE Be33e
           LDY RigMargin
           LDA (ScrPtr),Y
           CMP #$20 ; ' '
           BNE Be38c
           CPY CursorCol
           BCC Be38c
           BEQ Be38c
           LDY RigMargin
 Be322     DEY
           LDA (ScrPtr),Y
           INY
           STA (ScrPtr),Y
           DEY
           CPY CursorCol
           BNE Be322
           LDA #$20 ; ' '
           STA (ScrPtr),Y
           LDA RigMargin
           SEC
           SBC CursorCol
           SBC INSRT
           BMI Be38c
           INC INSRT
           BNE Be38c
 Be33e     LDX INSRT
           BEQ Be347
 Be342     ORA #$40 ; '@'
           JMP Me17d
 Be347     CMP #$11 ; <CURSOR UP>
           BNE Be358
           LDX TopMargin
           CPX CursorRow
           BCS Be38c
           DEC CursorRow
           JSR UPDATE_CURSOR_ROW
           BNE Be38c
 Be358     CMP #$12 ; <RVS OFF>
           BNE Be360
           LDA #0
           STA ReverseFlag
 Be360     CMP #$1d ; <CURSOR LEFT>
           BNE Be373
           LDY LefMargin
           CPY CursorCol
           BCC Be36f
           JSR CURSOR_TO_END_OF_PREVIOUS_LINE
           BPL Be38c
 Be36f     DEC CursorCol
           BPL Be38c
 Be373     CMP #$13 ; <CLR>
           BNE Be37c
           JSR CLEAR_WINDOW
           BNE Be38c
 Be37c     CMP #9 ; <Shift TAB>
           BNE Be38f
           JSR JUMP_TO_TAB
           LDA TABS_SET,X
           EOR DOS_Syntax
           STA TABS_SET,X
 Be38c     JMP IRQ_EPILOG
 Be38f     CMP #$16 ; <Shift Ctrl V>
           BEQ Be396
           JMP ProcControl_A
 Be396     LDA #$20 ; ' '
           LDY LefMargin
 Be39a     CPY CursorCol
           BCS Be38c
           STA (ScrPtr),Y
           INY
           BNE Be39a

; ***********
  Cursor_Down
; ***********

           LSR InputRow
           LDX CursorRow
           CPX BotMargin
           BCC Be3b1
           JSR SCROLL_WINDOW_UP
           JMP UPDATE_CURSOR_ROW
 Be3b1     INC CursorRow
           JMP UPDATE_CURSOR_ROW

; ************
  ScreenReturn
; ************

           LDY LefMargin
           STY CursorCol
           JSR Cursor_Down

; ******
  Escape
; ******

           LDA #0
           STA INSRT
           STA ReverseFlag
           STA QuoteMode
           JMP IRQ_EPILOG

; ******************
  SCROLL_WINDOW_DOWN
; ******************

           LDX BotMargin
           INX
 Be3cb     DEX
           JSR Cursor_BOL
           CPX TopMargin
           BEQ Be3fe
           DEX
           JSR Set_Screen_SAL
           INX
 Be3d8     INY
           LDA (SAL),Y
           STA (ScrPtr),Y
           CPY RigMargin
           BCC Be3d8
           BCS Be3cb

; ****************
  SCROLL_WINDOW_UP
; ****************

           LDX TopMargin
           DEX
 Be3e6     INX
           JSR Cursor_BOL
           CPX BotMargin
           BCS Be3fe
           INX
           JSR Set_Screen_SAL
           DEX
 Be3f3     INY
           LDA (SAL),Y
           STA (ScrPtr),Y
           CPY RigMargin
           BCC Be3f3
           BCS Be3e6
 Be3fe     JSR Erase_To_EOL
           LDA STKEY
           LDX #$ff
           LDY #0
           CMP #$a0
           BNE Be41b
 Be40b     CPX STKEY
           BNE Be40b
 Be40f     LDA STKEY
           ASL A
           CMP #$40 ; '@'
           BEQ Be41f
           JSR Jf335
           BNE Be40f
 Be41b     CMP #$20 ; ' '
           BNE Be427
 Be41f     DEX
           BNE Be41f
           DEY
           BNE Be41f
           STY CharsInBuffer
 Be427     RTS

; ******************
  ADVANCE_TIMER_CORR
; ******************

           LDA #6
           STA JIFFY6DIV5

; *************
  ADVANCE_TIMER
; *************

           JSR ADVANCE_JIFFY_CLOCK
           DEC JIFFY6DIV5
           BEQ ADVANCE_TIMER_CORR
           RTS
           .FILL $e442-* ($aa) ;   14 bytes

; ********
  IRQ_MAIN
; ********

           PHA
           TXA
           PHA
           TYA
           PHA
           TSX
           LDA STACK+4,X
           AND #16
           BEQ Be452
           JMP (CBINV)
 Be452     JMP (CINV)

; **********
  IRQ_NORMAL
; **********

           JSR ADVANCE_TIMER
           LDA Blink
           BNE Be474
           DEC BLNCT
           BNE Be474
           LDA #$14
           STA BLNCT
           LDY CursorCol
           LSR BlinkPhase
           LDA (ScrPtr),Y
           BCS Be470
           INC BlinkPhase
           STA CursorChar
 Be470     EOR #$80
           STA (ScrPtr),Y
 Be474     LDY #0
           LDA PIA1_Port_A ; Keyboard row select
           ASL A
           ASL A
           ASL A
           BPL Be487
           STY CAS1
           LDA PIA1_Cont_B
           ORA #8
           BNE Be490
 Be487     LDA CAS1
           BNE Be493
           LDA PIA1_Cont_B
           AND #$f7
 Be490     STA PIA1_Cont_B
 Be493     BCC Be49e
           STY CAS2
           LDA VIA_Port_B
           ORA #16
           BNE Be4a7
 Be49e     LDA CAS2
           BNE Be4aa
           LDA VIA_Port_B
           AND #$ef
 Be4a7     STA VIA_Port_B
 Be4aa     JSR SCAN_KEYBOARD
           JMP END_OF_IRQ
           .FILL $e4be-* ($aa) ;   14 bytes

; *****************
  OLD_SCAN_KEYBOARD
; *****************

           LDA #$ff
           STA Key_Image
           LDA CharsInBuffer
           PHA
           JSR SCAN_KEYBOARD
           PLA
           CMP CharsInBuffer
           BCC Be4e5
           TAX
           LDA Key_Image
           CMP #$ff
           BEQ Be4e5
           CPX XMAX
           BCS Be4dd
           STA KEYD,X
           INC ReverseFlag-1
 Be4dd     CMP #3 ; STOP
           BNE Be4e5
           LDA #$ef
           STA STKEY
 Be4e5     RTS
           .FILL $e54e-* ($aa) ;  104 bytes

; ***************
  SELECT_CHAR_SET
; ***************

           CMP #1
           BNE Be557
 Be552     JSR SET_CRT_TXT_NEW
           BMI Be5a7
 Be557     CMP #2
           BEQ Be552
           BNE Be59b

; *************
  ProcControl_B
; *************

           CMP #1
           BNE Be567
           JSR CLEAR_KEYFLAGS_210
           JMP IRQ_EPILOG
 Be567     CMP #2 ; $82: Switch to old (PET) char set
           BNE ProcControl_C
           JSR SET_CRT_TXT_OLD
           BMI Be5a7

; ***********
  JUMP_TO_TAB
; ***********

           LDA CursorCol
           AND #$f8
           STA NextTab
           LSR A
           LSR A
           LSR A
           TAX
           LDA #1
           STA DOS_Syntax
           LDY CursorCol
 Me582     CPY NextTab
           BEQ Be590
           ASL DOS_Syntax
           INC NextTab
           JMP Me582
 Be590     RTS

; ************************
  Scroll_Or_Select_Charset
; ************************

           CMP #$19 ; Ctrl Y -> Scroll window up
           BNE SELECT_CHAR_SET
           JSR SCROLL_WINDOW_UP
           JMP Me5d9
 Be59b     CMP #15 ; Ctrl O -> Set top left window corner
           BNE Be5aa
           LDA CursorRow
           STA TopMargin
           LDA CursorCol
           STA LefMargin
 Be5a7     JMP IRQ_EPILOG
 Be5aa     CMP #14 ; Ctrl N -> Text mode
           BNE Be5b3
           JSR CRT_TEXT_MODE
           BMI Be5a7
 Be5b3     CMP #7 ; Ctrl G -> Bell
           BNE Be5a7
           JSR BEEP
           BEQ Be5a7

; *************
  ProcControl_A
; *************

           CMP #$15 ; Ctrl U -> Delete line
           BNE ProcControl_B
           LDA TopMargin
           PHA
           LDA CursorRow
           STA TopMargin
           JSR SCROLL_WINDOW_DOWN
 Me5ca     PLA
           STA TopMargin
           JSR CURSOR_LEFT_MARGIN
           BNE Be5ea

; *************
  ProcControl_C
; *************

           CMP #$19 ; 155  -> Scroll window down
           BNE Be5de
           JSR SCROLL_WINDOW_DOWN
 Me5d9     JSR UPDATE_CURSOR_ROW
           BNE Be5ea
 Be5de     CMP #15 ; 143: -> Set lower right window corner
           BNE Be5ed
           LDA CursorRow
           STA BotMargin
           LDA CursorCol
           STA RigMargin
 Be5ea     JMP IRQ_EPILOG
 Be5ed     CMP #14 ; 142: -> Graphics mode
           BNE Be5b3
           JSR SET_CRT_GRAPHICS
           BMI Be5ea
           .FILL $e600-* ($aa) ;   10 bytes

; **********
  END_OF_IRQ
; **********

           PLA
           TAY
           PLA
           TAX
           PLA
           RTI

; **********************
  Restore_Char_at_Cursor
; **********************

           LDY CursorCol
           STA (ScrPtr),Y
           LDA #2
           STA BLNCT
           RTS

; ***********
  INIT_EDITOR
; ***********

           LDA #$7f
           STA VIA_IER
           LDX #$6d
           LDA #0
           STA HOMECT
 Be61a     STA JIFFY_CLOCK,X
           DEX
           BPL Be61a
           STX KEYFLAGS ; $FF = Clear all flags
           LDA #<IRQ_NORMAL
           STA CINV
           LDA #>IRQ_NORMAL
           STA CINV+1
           LDA #9
           STA XMAX
           LDA #3
           STA DFLTO
           LDA #15
           STA PIA1_Port_A ; Keyboard row select
           ASL A
           STA VIA_Port_B
           STA VIA_DDR_B
           STX PIA2_Port_B
           STX VIA_Timer_1_Hi
           LDA #$3d ; '='
           STA PIA1_Cont_B
           BIT PIA1_Port_B ; Keyboard row
           LDA #$3c ; '<'
           STA PIA2_Cont_A
           STA PIA2_Cont_B
           STA PIA1_Cont_A
           STX PIA2_Port_B
           LDA #14
           STA BLNCT
           STA Blink
           STA DELAY
           STA KOUNT
           STA VIA_IER
           JSR FULL_SCREEN_WINDOW
           LDX #12
           LDA #0
 Be66d     STA TABS_SET,X
           DEX
           BPL Be66d
           LDA #<DEFAULT_SCREEN_VECTOR
           LDX #>DEFAULT_SCREEN_VECTOR
           STA SCRIV
           STX SCRIV+1
           LDA #<ChrOutNormal
           LDX #>ChrOutNormal
           STA SCROV
           STX SCROV+1
           LDA #16
           STA CHIME
           JSR Double_Beep
           BEQ Double_Beep

; ****************
  ChrOutMarginBeep
; ****************

           JSR ChrOutScreen
           TAX
           LDA RigMargin
           SEC
           SBC CursorCol
           CMP #5
           BNE Be6d0
           TXA
           CMP #$1d ; Cursor Right ?
           BEQ Double_Beep
           AND #$7f
           CMP #$20 ; ' '
           BCC Be6d0

; ***********
  Double_Beep
; ***********

           JSR BEEP

; ****
  BEEP
; ****

           LDY CHIME
           BEQ Be6d0
           LDA #16
           STA VIA_ACR
           LDA #15
           STA VIA_Shift
           LDX #7
 Be6b7     LDA SOUND_TAB-1,X
           STA VIA_Timer_2_Lo
           LDA CHIME
 Be6bf     DEY
           BNE Be6bf
           SEC
           SBC #1
           BNE Be6bf
           DEX
           BNE Be6b7
           STX VIA_Shift
           STX VIA_ACR
 Be6d0     RTS

; **************
  Set_Screen_SAL
; **************

           TXA
           LDX #$c7 ; #<SAL
           BNE Be6dc

; **********
  Cursor_BOL
; **********

           LDY LefMargin
           DEY

; *************
  Update_ScrPtr
; *************

           TXA
           LDX #<ScrPtr
 Be6dc     PHA
           STA Basic_USR,X
           LDA #>ScrPtr
           STA USRADD,X
           TYA
           PHA
           LDA Basic_USR,X
           LDY #2
           JSR Shift_ZPX_Left_Y ; Row * 4
           JSR Add_ZPX_AY ; Row * 5
           LDY #4
           JSR Shift_ZPX_Left_Y ; Row * 80
           LDY #$80
           JSR Add_ZPX_AY ; $8000 + Row * 80 + Col
           PLA
           TAY
           PLA
           TAX
           RTS

; ****************
  Shift_ZPX_Left_Y
; ****************

           ASL Basic_USR,X
           ROL USRADD,X
           DEY
           BNE Shift_ZPX_Left_Y
           RTS

; **********
  Add_ZPX_AY
; **********

           ADC Basic_USR,X
           STA Basic_USR,X
           TYA
           ADC USRADD,X
           STA USRADD,X
           RTS

; ************
  ModifierKeys
; ************

           .BYTE $00,$00,$00,$00,$00,$00,$41,$00
           .BYTE $01,$00
           .FILL $e721-* ($aa) ;    7 bytes

; **********
  RUN_String
; **********

           .BYTE $44,$cc,$22,$2a,$0d,$52,$55,$4e
           .BYTE $0d

; ******************
  CRT_CONFIG_TXT_NEW
; ******************

           .BYTE $3a,$28,$2c,$08,$20,$09,$19,$1d
           .BYTE $00,$09,$00,$00,$10,$00,$00,$00
           .BYTE $00,$00

; ******************
  CRT_CONFIG_GRA_NEW
; ******************

           .BYTE $3a,$28,$2c,$08,$29,$03,$19,$22
           .BYTE $00,$07,$00,$00,$10,$00,$00,$00
           .BYTE $00,$00

; *********
  SOUND_TAB
; *********

           .BYTE $0e,$1e,$3e,$7e,$3e,$1e,$0e

; ************
  Line_Addr_Lo
; ************

           .BYTE $00,$50,$a0,$f0,$40,$90,$e0,$30
           .BYTE $80,$d0,$20,$70,$c0,$10,$60,$b0
           .BYTE $00,$50,$a0,$f0,$40,$90,$e0,$30
           .BYTE $80

; ************
  Line_Addr_Hi
; ************

           .BYTE $80,$80,$80,$80,$81,$81,$81,$82
           .BYTE $82,$82,$83,$83,$83,$84,$84,$84
           .BYTE $85,$85,$85,$85,$86,$86,$86,$87
           .BYTE $87

; ******************
  CRT_CONFIG_TXT_OLD
; ******************

           .BYTE $3a,$28,$2c,$08,$20,$09,$19,$1d
           .BYTE $00,$09,$00,$00,$30,$00,$00,$00
           .BYTE $00,$00

; ******************
  CRT_CONFIG_GRA_OLD
; ******************

           .BYTE $3a,$28,$2c,$08,$29,$03,$19,$22
           .BYTE $00,$07,$00,$00,$30,$00,$00,$00
           .BYTE $00,$00
           .BYTE $28

           .FILL $e7ff-* ($ff) ;   83 bytes
           .BYTE $1a

; ****************************************
  THIS IS THE END OF THE "2K EDIT ROM AREA
; ****************************************

; ****************************************************
; $E800-$E8FF 
; This area of the ROM is not visible to the computer.
; It is part of the IO address space.
; Commodore used this area to add a comment to the ROM
; ****************************************************

           .BYTE "CBM 8296D EUROSCREEN EDITOR 4V4E "
           .BYTE "(E-324243-04) (C) 1982 COMMODORE "
           .BYTE "ELECTRONICS LTD D  "
           .BYTE $07,$01
           .FILL $e900-* ($ff) ;  169 bytes

; ********************************************************
  THIS IS THE START OF THE EXTENDED "4K" ROM AREA AT $E900
; ********************************************************

           .BYTE $16,$44,$20,$20,$07,$01

; *************************************
; Mini jump table for extended features
; *************************************

           JMP CHROUT_WITH_DIACRITICS
           JMP IS_DIACRITIC_CHAR
           JMP Jeb3a
           JMP Jeb44
           JMP IS_SPECIAL_KEY
           JMP IS_VOCAL
           JMP PET_TO_ASCII
           JMP SCAN_KEYBOARD

           .FILL $e924-* ($aa) ;    6 bytes

; *************
  SCAN_KEYBOARD
; *************

           LDA PIA1_Port_A ; Keyboard row select
           AND #%11110000 ; Select row 0
           STA PIA1_Port_A ; Keyboard row select
           LDA KEYFLAGS
           ORA #%11000000 ; no <shift> and no <ctrl>
           STA KEYFLAGS
           LDA RPTFLG
           PHA
           LDX #$4f ; 80 keys to check
           LDY #$ff
           STY KEYPRESSED
           INY ; Y = Keyboard row = 0
 Be93c     LDA KBD_MATRIX,Y
           ORA ModifierKeys,Y
           EOR #$ff
           STA RPTFLG ; 1: pressed & not modifier
 Be946     LDA PIA1_Port_B ; Keyboard row
           STA KBD_MATRIX,Y
           CMP PIA1_Port_B ; Keyboard row
           BNE Be946
           ORA RPTFLG ; Remove bouncing
           STY RPTFLG ; Save Y
           LDY #8 ; Test the 8 keys of the row
 SCLOOP_Y  LSR A ; check next key
           BCS Be979 ; 1 -> not pressed
           PHA ; Save row
           LDA #%01111111 ; <shift> pressed
           CPX #$19 ; Right Shift
           BEQ Be974
           CPX #$1f ; Left Shift
           BEQ Be974
           LDA #%10111111 ; <ctrl> pressed
           CPX #15 ; <RVS = CTRL>
           BEQ Be974
           LDA #$ff
           CMP KEYPRESSED
           BEQ Be972
           TAX
 Be972     STX KEYPRESSED
 Be974     AND KEYFLAGS
           STA KEYFLAGS
           PLA ; Restore row
 Be979     DEX ; Next key
           BMI Be987
           DEY ; Next column
           BNE SCLOOP_Y
           INC PIA1_Port_A ; Keyboard row select
           LDY RPTFLG ; Restore Y = row
           INY
           BNE Be93c ; Branch always
 Be987     PLA ; Finished scan of keyboard matrix
           STA RPTFLG ; Restore repeat flag
           LDX KEYPRESSED
           BMI SC_Nokey
           LDA #$15
           STA DELAY
           JSR GETPETSCII
           BVS Be9f2 ; Branch if <STOP>
           LDX CharsInBuffer
           CPX XMAX
           BCC Be9df
           BCS Be9e4
 SC_Nokey  LDY #10
           JSR ModifyerActive
           BNE Be9ba
           DEY
           TYA
           BIT KEYFLAGS
           BVS Be9b1 ; Branch if not <ctrl>
           BPL Be9af ; Branch if <shift>
           LSR A
 Be9af     AND #%10010010
 Be9b1     JSR StoreKey
           LDY #$16
 Be9b6     DEY
           STY DELAY
           RTS
 Be9ba     LDX TABSTOPS-1,Y
 Be9bd     DEX
           LSR A
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
           BVS Be9f2 ; Branch if <STOP>
           CMP Key_Image
           BNE Be9b1
           LDX CharsInBuffer
           BNE Be9e4
 Be9df     STA KEYD,X
           INC CharsInBuffer
 Be9e4     CMP #3 ; <STOP>
           BNE Be9ea
           LDY #%11101111 ; Set STOP flag
 Be9ea     CMP #$e0
           BCC StoreKey
           LDY #%11111110

; ********
  StoreKey
; ********

           STY STKEY
 Be9f2     STA Key_Image
           STA KEYPRESSED
 Be9f6     RTS

; **************
  ModifyerActive
; **************

           LDA KBD_MATRIX-1,Y
           ORA ModifierKeys-1,Y
           EOR #$ff

; *****
  Je9ff
; *****

           BNE Bea04
           DEY
           BNE ModifyerActive
 Bea04     RTS

; **********
  GETPETSCII
; **********

           LDA KEYBOARD_NORMAL,X
           BIT KEYFLAGS
           BMI Bea0f
           LDA KEYBOARD_SHIFTED,X
 Bea0f     TAY
           BVS Bea20
           AND #$7f
           CMP #$41 ; 'A'
           BCC Bea25
           CMP #$5b ; '['
           BCS Bea25
           TYA
           AND #$bf
           TAY
 Bea20     CPX #15 ; <STOP>
           BEQ Bea25
           CLV
 Bea25     TYA
           RTS

; *********************
  CONDITIONAL_LR_CURSOR
; *********************

           CLV
           LDA DATAX
           TAX
           AND #$7f
           PHA
           CMP #$20 ; ' '
           BCS Bea83 ; -> RTS
           LDA KEYFLAGS
           TAY
           AND #%11111001
           STA KEYFLAGS
           TYA
           LSR A ; Bit 0 -> carry
           BCC Bea83 ; -> RTS
           LSR A ; Bit 1 -> carry
           BCS Bea6d ; -> Cursor right
           LSR A ; Bit 2 -> carry
           BCC Bea83 ; -> RTS
           CPX #$9d ; <Cursor left>
           BNE Bea83
           JSR CURSOR_LEFT
           JMP Mea80

; ***********
  CURSOR_LEFT
; ***********

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
           JMP Update_ScrPtr
 Bea64     LDY LefMargin
           STY CursorCol
           RTS
 Bea69     DEC CursorCol
           RTS

; ************
  CURSOR_RIGHT
; ************

           PHA
 Bea6d     CPX #$1d
           BNE Bea83
           LDY CursorCol
           INC CursorCol
           CPY RigMargin
           BCC Mea80
           JSR Cursor_Down
           LDY LefMargin
           STY CursorCol
 Mea80     BIT SET_V_FLAG ; SOV Set overflow flag
 Bea83     PLA
           LDY CursorCol
           RTS

; **********************
  CHROUT_WITH_DIACRITICS
; **********************

           CLV
           TAX
           LDA KEYFLAGS
           LSR A
           TXA
           BCC Beaa2 ; branch if bit 0 = 0
           LDY CursorCol
           LDA (ScrPtr),Y
           JSR IS_DIACRITIC_CHAR
           BVC Bea9b
           JMP Restore_Char_at_Cursor
 Bea9b     BCC Beaa2
           LDX #$1d
           JSR CURSOR_RIGHT
 Beaa2     LDX INSRT
           BEQ Beaa8
           DEC INSRT
 Beaa8     RTS

; *****************
  IS_DIACRITIC_CHAR
; *****************

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
           CMP #$20 ; ' '
           BEQ Beb1a
           JSR CLEAR_KEYFLAGS_21
           JSR IS_SPECIAL_KEY
           BEQ Beaee
           JSR IS_VOCAL
           BNE Beb0d
           PLA
           JSR IS_SPECIAL_KEY
           BNE Beb0e
 Beacc     LDA Vee9d,X
           PHA
           AND BITMASK,Y
           BEQ Beb0d
           LDA Veeb7,X
           TAX
           PLA
 Beada     LSR A
           BCC Beade
           INX
 Beade     DEY
           BPL Beada
           PLA
           ASL A
           LDA DIACRITIC_CODES-1,X
           AND #$7f
           BCC Beaec
           ORA #$80
 Beaec     CLC
           RTS
 Beaee     LDA Veead
           AND BITMASK,Y
           BEQ Beb06
           LDX #4
           AND Veeae
           BEQ Beb01
           DEX
           BIT SET_V_FLAG
 Beb01     TXA
           ORA KEYFLAGS
           STA KEYFLAGS
 Beb06     PLA
           JSR IS_VOCAL
           BEQ Beacc
           PHA
 Beb0d     PLA
 Beb0e     PLA
           CLC
           RTS
           LDA DATAX
           AND #$7f
           CMP #$20 ; ' '
           BCC Beb28
           RTS
 Beb1a     PLA
           JSR IS_SPECIAL_KEY
           BNE Beb26
           LDA KEYFLAGS
           AND #2
           BNE Beb27
 Beb26     CLC
 Beb27     PLA
 Beb28     TAX

; *****************
  CLEAR_KEYFLAGS_21
; *****************

           LDA #%11111001
           AND KEYFLAGS
           STA KEYFLAGS
           TXA
           RTS

; ************
  INCREASE_COL
; ************

           LDX RPTFLG
           BNE Beb43
           INC CursorCol
           JMP CheckQuote

; *****
  Jeb3a
; *****

           LDY CursorCol
           LDA (ScrPtr),Y
           JSR Jeb44
           STA DATAX
 Beb43     RTS

; *****
  Jeb44
; *****

           CLV
           TAX
           LDA KEYFLAGS
           LSR A ; Bit 0 -> carry
           TXA
           BCC Beb7b ; -> RTS
           PHA
           LDX RPTFLG
           BNE Beb66
           AND #$7f
           LDX #12
 Beb55     CMP DIACRITIC_CODES,X
           BEQ Beb60
           DEX
           BPL Beb55
           PLA
           CLC
           RTS
 Beb60     LDA DIACRITIC_INDEX,X
           STA RPTFLG
           TAX
 Beb66     LDA DIACRITIC_ACTION,X
           DEC RPTFLG
           LSR A
           BCC Beb71
           BIT SET_V_FLAG
 Beb71     LSR A
           TAX
           PLA
           AND #$80
           ORA VOCALS,X
           BCS Beb7f
 Beb7b     LDX #0
           STX RPTFLG
 Beb7f     RTS

; **************
  IS_SPECIAL_KEY
; **************

           LDY #4
 Beb82     CMP KEYFLAG_TRIGGER,Y
           BEQ Beb8a
           DEY
           BPL Beb82
 Beb8a     RTS

; ********
  IS_VOCAL
; ********

           LDX #9
 Beb8d     CMP VOCALS,X
           BEQ Beb95
           DEX
           BPL Beb8d
 Beb95     RTS

; ************
  PET_TO_ASCII
; ************

           LDX #13
 Beb98     CMP PET_REP,X
           BEQ Bebbe
           DEX
           BPL Beb98
           TAX
           AND #$7f
           CMP #$20 ; ' '
           BCC Bebbc
           CMP #$41 ; 'A'
           BCC Bebb7
           CMP #$5b ; '['
           BCS Bebb7
           TXA
           BMI Bebb4
           ORA #$20 ; ' '
 Bebb4     AND #$7f
           RTS
 Bebb7     TXA
           BPL Bebbd
           LDX #$20 ; ' '
 Bebbc     TXA
 Bebbd     RTS
 Bebbe     LDA ASC_REP,X
           RTS

; ***********
  PROGRAM_CRT
; ***********

           PHA
           JSR CLEAR_KEYFLAGS_210
           PLA
           JMP OLD_PROGRAM_CRT

; *************
  CRT_TEXT_MODE
; *************

           LDA KEYFLAGS
           AND #%00001000 ; Bit 4 set: new char set (low ROM)
           BEQ SET_CRT_TXT_OLD_1

; ***************
  SET_CRT_TXT_NEW
; ***************

           LDA KEYFLAGS
           ORA #%00001001
           STA KEYFLAGS
           LDA #<CRT_CONFIG_TXT_NEW
           LDX #>CRT_CONFIG_TXT_NEW
           LDY #14
           JMP OLD_PROGRAM_CRT

; ****************
  SET_CRT_GRAPHICS
; ****************

           JSR CLEAR_KEYFLAGS_210
           AND #%00001000 ; Bit 4 set: new char set (low ROM)
           BEQ Bebef
           LDA #<CRT_CONFIG_GRA_NEW
           LDX #>CRT_CONFIG_GRA_NEW
           LDY #12
           JMP OLD_PROGRAM_CRT
 Bebef     LDA #<CRT_CONFIG_GRA_OLD
           LDX #>CRT_CONFIG_GRA_OLD
           LDY #12
           JMP OLD_PROGRAM_CRT

; ******************
  CLEAR_KEYFLAGS_210
; ******************

           LDA KEYFLAGS
           AND #%11111000
           STA KEYFLAGS
           RTS

; ***************
  SET_CRT_TXT_OLD
; ***************

           LDA KEYFLAGS
           AND #%11110000
           STA KEYFLAGS

; *****************
  SET_CRT_TXT_OLD_1
; *****************

           LDA #<CRT_CONFIG_TXT_OLD
           LDX #>CRT_CONFIG_TXT_OLD
           LDY #14
           JMP OLD_PROGRAM_CRT

; *******************
  ADVANCE_JIFFY_CLOCK
; *******************

           INC JIFFY_CORR
           LDA JIFFY_CORR
           BNE Bec16
           INC JIFFY_CORR+1
 Bec16     CMP #$6f
           BNE Bec20
           LDA JIFFY_CORR+1
           CMP #2
           BEQ Bec41
 Bec20     INC JIFFY_CLOCK+2
           BNE Bec2a
           INC JIFFY_CLOCK+1
           BNE Bec2a
           INC JIFFY_CLOCK
 Bec2a     LDX #0
 Bec2c     LDA JIFFY_CLOCK,X
           CMP JIFFY_MAX,X
           BCC Bec47
           INX
           CPX #3
           BNE Bec2c
           LDA #0
 Bec3a     STA JIFFY_CLOCK-1,X
           DEX
           BNE Bec3a
           BEQ Bec47
 Bec41     LDA #0
           STA JIFFY_CORR
           STA JIFFY_CORR+1
 Bec47     RTS

; *********
  JIFFY_MAX
; *********

           .BYTE $4f,$1a,$01

 TABSTOPS  .BYTE $50,$48,$40,$38,$30,$28,$20,$18
           .BYTE $10,$08
           .FILL $ee85-* ($ff) ;  560 bytes

 VOCALS    .BYTE $01,$05,$09,$0f,$15,$61,$66,$20
           .BYTE $40,$6f

; ***************
  KEYFLAG_TRIGGER
; ***************

           .BYTE $40,$6f,$7f,$61,$66
           .BYTE $9d,$aa,$aa,$aa,$aa,$aa,$aa,$aa
           .BYTE $aa
 Vee9d     .BYTE $05,$07,$04,$04,$05,$10,$08,$07
           .BYTE $02,$01
           .BYTE $aa,$aa,$aa,$aa,$aa,$aa
 Veead     .BYTE $07
 Veeae     .BYTE $07
 BITMASK   .BYTE $01,$02,$04,$08,$10,$20

; **********
  SET_V_FLAG
; **********

           .BYTE $40,$80
 Veeb7     .BYTE $00,$02,$05,$06,$07,$09,$09,$0a
           .BYTE $0c,$0c,$aa,$aa,$aa,$aa,$aa,$aa

; ***************
  DIACRITIC_CODES
; ***************

           .BYTE $72 ; a grave
           .BYTE $74 ; a circumflex
           .BYTE $6e ; e grave
           .BYTE $6c ; e acute
           .BYTE $75 ; e circumflex
           .BYTE $76 ; i circumflex
           .BYTE $77 ; o circumflex
           .BYTE $73 ; u grave
           .BYTE $78 ; u circumflex
           .BYTE $eb ; graphic cross
           .BYTE $40 ; grave
           .BYTE $6f ; acute
           .BYTE $7f ; circumflex

           .FILL $eedf-* ($aa) ;   11 bytes

; ***************
  DIACRITIC_INDEX
; ***************

           .BYTE $02 ; a grave
           .BYTE $05 ; a circumflex
           .BYTE $07 ; e grave
           .BYTE $09 ; e acute
           .BYTE $0c ; e circumflex
           .BYTE $0f ; i circumflex
           .BYTE $12 ; o circumflex
           .BYTE $14 ; u grave
           .BYTE $17 ; u circumflex
           .BYTE $00 ; graphic cross
           .BYTE $19 ; grave
           .BYTE $1b ; acute
           .BYTE $1e ; circumflex

           .FILL $eef6-* ($aa) ;   10 bytes

; ****************
  DIACRITIC_ACTION
; ****************

           .BYTE $aa ; 00 <- graphic cross
           .BYTE $00 ; 01
           .BYTE $2a ; 02 <- a grave
           .BYTE $00,$2a,$2e,$04,$2a,$04,$2e,$04
           .BYTE $2a,$2e,$08,$2a,$2e,$0c,$2a,$2e
           .BYTE $10,$2a,$10,$2a,$2e,$1c,$2a,$1c
           .BYTE $2e,$1c,$2a,$2e,$aa,$aa,$aa,$aa
           .BYTE $aa,$aa,$aa,$aa,$aa,$aa,$aa,$aa
           .BYTE $aa,$aa,$aa,$aa,$aa,$aa,$aa,$aa
           .BYTE $aa,$aa,$aa,$aa,$aa,$aa,$aa,$aa
           .BYTE $aa,$aa,$aa,$aa,$aa,$aa
 PET_REP   .BYTE $1d,$9d,$ad,$af,$b0,$bb,$bc,$bd
           .BYTE $be,$c0,$db,$dc,$dd,$df
 ASC_REP   .BYTE $20,$08,$23,$5e,$40,$7b,$7c,$7d
           .BYTE $7e,$5e,$5b,$5c,$5d,$5f
           .BYTE $aa,$aa,$aa,$aa,$aa,$aa,$aa,$aa
           .BYTE $aa,$aa,$aa,$aa

; ***************
  KEYBOARD_NORMAL
; ***************

           .BYTE $16 ; Ctrl V                           10h  --------
           .BYTE $00 ; SHIFT                            10g  SHIFT
           .BYTE $be ; SZ                               10f  SZ ?
           .BYTE $03 ; STOP                             10e  STOP RUN
           .BYTE '9' ; 9                                10d  9  )
           .BYTE '6' ; 6                                10c  6  &
           .BYTE '3' ; 3                                10b  3  Paragraph
           .BYTE '<' ; <                                10a  <  >

           .BYTE '1' ; 1                                9h  KP 1 
           .BYTE '-' ; -                                9g  - _
           .BYTE $15 ; Ctrl U                           9f  --------
           .BYTE $1d ; RIGHT                            9e  CURSOR <->
           .BYTE 'm' ; m                                9d  M
           .BYTE ' ' ;                                  9c  SPACE
           .BYTE 'x' ; x                                9b  X
           .BYTE $03 ; STOP                             9a  CTRL used by index

           .BYTE '2' ; 2                                8h  KP 2 
           .BYTE $11 ; DOWN                             8g  CURSOR V^
           .BYTE $0f ; Ctrl O                           8f  --------
           .BYTE '0' ; 0                                8e  KP 0 
           .BYTE ',' ; ,                                8d  ,
           .BYTE 'n' ; n                                8c  N
           .BYTE 'v' ; v                                8b  V
           .BYTE 'y' ; y                                8a  Y

           .BYTE '3' ; 3                                7h  KP 3 
           .BYTE $00 ; SHIFT                            7g  RIGHT SHIFT 
           .BYTE $19 ; Ctrl Y                           7f  -------
           .BYTE '.' ; .                                7e  KP . 
           .BYTE '.' ; .                                7d  . :
           .BYTE 'b' ; b                                7c  B
           .BYTE 'c' ; c                                7b  C
           .BYTE $00 ; SHIFT                            7a  LEFT SHIFT 

           .BYTE '4' ; 4                                6h  KP 4 
           .BYTE $bd ; Graph bd                         6g  UE
           .BYTE 'o' ; o                                6f  O
           .BYTE '[' ; {                                6e  HOME CLR
           .BYTE 'u' ; u                                6d  U
           .BYTE 't' ; t                                6c  T
           .BYTE 'e' ; e                                6b  E
           .BYTE 'q' ; q                                6a  Q

           .BYTE ']' ; }                                5h  DEL INS
           .BYTE 'p' ; p                                5g  P
           .BYTE 'i' ; i                                5f  I
           .BYTE '+' ; +                                5e  + *
           .BYTE 'z' ; z                                5d  Z
           .BYTE 'r' ; r                                5c  R
           .BYTE 'w' ; w                                5b  W
           .BYTE $09 ; TAB                              5a  TAB

           .BYTE '6' ; 6                                4h  KP 6
           .BYTE $bb ; Graph bb                         4g  OE
           .BYTE 'l' ; l                                4f  L
           .BYTE $0d ; RETURN                           4e  RETURN
           .BYTE 'j' ; j                                4d  J
           .BYTE 'g' ; g                                4c  G
           .BYTE 'd' ; d                                4b  D
           .BYTE 'a' ; a                                4a  A

           .BYTE '5' ; 5                                3h  KP 5
           .BYTE $bc ; Graph bc                         3g  OE
           .BYTE 'k' ; k                                3f  K
           .BYTE '#' ; #                                3e  # '
           .BYTE 'h' ; h                                3d  H
           .BYTE 'f' ; f                                3c  F
           .BYTE 's' ; s                                3b  S
           .BYTE $1b ; ESC                              3a  ESC

           .BYTE '9' ; 9                                2h  KP 9
           .BYTE $00 ; SHIFT                            2g  ------
           .BYTE $13 ; HOME                             2f  [ ^
           .BYTE '7' ; 7                                2e  KP 7
           .BYTE '0' ; 0                                2d  0
           .BYTE '7' ; 7                                2c  7
           .BYTE '4' ; 4                                2b  4
           .BYTE '1' ; 1                                2a  1

           .BYTE $00 ; SHIFT                            1h  ------
           .BYTE $0e ; Ctrl N                           1g  ------
           .BYTE $14 ; DEL                              1f  ] \ 
           .BYTE '8' ; 8                                1e  KP 8
           .BYTE $af ; ACUTE                            1d  ACUTE GRAVE
           .BYTE '8' ; 8                                1c  8
           .BYTE '5' ; 5                                1b  5
           .BYTE '2' ; 2                                1a  2

; ****************
  KEYBOARD_SHIFTED
; ****************

           .BYTE $96 ; Shift Ctrl V                     10h  -------
           .BYTE $00 ; SHIFT                            10g  LEFT SHIFT
           .BYTE '?' ; ?                                10f  SZ ?
           .BYTE $83 ; RUN                              10e  STOP RUN
           .BYTE ')' ; )                                10d  9 )
           .BYTE '&' ; &                                10c  6 &
           .BYTE '@' ; `                                10b  3 Paragraph
           .BYTE '>' ; >                                10a  < >

           .BYTE $a2 ; Graph a2                         9h  KP 1 
           .BYTE $5f ; UNDERLINE                        9g  - _
           .BYTE $95 ; Shift Ctrl U                     9f  -------
           .BYTE $9d ; LEFT                             9e  CURSOR <->
           .BYTE 'M' ; M                                9d  M
           .BYTE $a0 ; SHIFT SPC                        9c  SPACE
           .BYTE 'X' ; X                                9b  X
           .BYTE $83 ; RUN                              9a  CTRL (by index)

           .BYTE $a3 ; Graph a3                         8h  KP 2 
           .BYTE $91 ; 8g  CURSOR V^
           .BYTE $8f ; Shift Ctrl O                     8f  -------
           .BYTE $a1 ; Graph a1                         8e  KP 0 
           .BYTE ';' ; ;                                8d  ,
           .BYTE 'N' ; N                                8c  N
           .BYTE 'V' ; V                                8b  V
           .BYTE 'Y' ; Y                                8a  Y

           .BYTE $a4 ; Graph a4                         7h  KP 3 
           .BYTE $00 ; SHIFT                            7g  RIGHT SHIFT 
           .BYTE $99 ; Shift Ctrl Y                     7f  -------
           .BYTE $de ;                                  7e  KP . 
           .BYTE ':' ; :                                7d  . :
           .BYTE 'B' ; B                                7c  B
           .BYTE 'C' ; C                                7b  C
           .BYTE $00 ; SHIFT                            7a  LEFT SHIFT 

           .BYTE $a5 ; Graph a5                         6h  KP 4 
           .BYTE $dd ;                                  6g  UE
           .BYTE 'O' ; O                                6f  O
           .BYTE $5e ; ARROW UP                         6e  HOME CLR
           .BYTE 'U' ; U                                6d  U
           .BYTE 'T' ; T                                6c  T
           .BYTE 'E' ; E                                6b  E
           .BYTE 'Q' ; Q                                6a  Q

           .BYTE $5c ; 5h  Backslash
           .BYTE 'P' ; P                                5g  P
           .BYTE 'I' ; I                                5f  I
           .BYTE '*' ; *                                5e  + *
           .BYTE 'Z' ; Z                                5d  Z
           .BYTE 'R' ; R                                5c  R
           .BYTE 'W' ; W                                5b  W
           .BYTE $89 ; SET TAB                          5a  TAB

           .BYTE $a7 ; Graph a7                         4h  KP 6
           .BYTE $db ;                                  4g  OE
           .BYTE 'L' ; L                                4f  L
           .BYTE $8d ; SHIFT RET                        4e  RETURN
           .BYTE 'J' ; J                                4d  J
           .BYTE 'G' ; G                                4c  G
           .BYTE 'D' ; D                                4b  D
           .BYTE 'A' ; A                                4a  A

           .BYTE $a6 ; Graph a6                         3h  KP 5
           .BYTE $dc ;                                  3g  OE
           .BYTE 'K' ; K                                3f  K
           .BYTE $27 ; '                                3e  # '
           .BYTE 'H' ; H                                3d  H
           .BYTE 'F' ; F                                3c  F
           .BYTE 'S' ; S                                3b  S
           .BYTE $1b ; ESC                              3a  ESC

           .BYTE $aa ; Graph aa                         2h  KP 9
           .BYTE $00 ; SHIFT                            2g  -------
           .BYTE $93 ; CLR                              2f  [ ^
           .BYTE $a8 ; Graph a8                         2e  KP 7
           .BYTE '=' ; =                                2d  0 =
           .BYTE '/' ; /                                2c  7 /
           .BYTE '$' ; $                                2b  4 $
           .BYTE '!' ; !                                2a  1 !

           .BYTE $00 ; SHIFT                            1h  -------
           .BYTE $8e ; Shift Ctrl N                     1g  -------
           .BYTE $94 ; 1f  [ \ 
           .BYTE $a9 ; Graph a9                         1e  KP 8
           .BYTE $c0 ;                                  1d  ACUTE GRAVE
           .BYTE '(' ; (                                1c  8 (
           .BYTE '%' ; %                                1b  5 %
           .BYTE '"' ; "                                1a  2 "
           .BYTE $00 ; SHIFT
