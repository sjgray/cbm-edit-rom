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

* = $b000   ; *** b000 ***  Commodore 8296


; *********************
  Basic_Statement_Table
; *********************

           .WORD Basic_END       - 1
           .WORD Basic_FOR       - 1
           .WORD Basic_NEXT      - 1
           .WORD Basic_DATA      - 1
           .WORD Basic_INPUTN    - 1
           .WORD Basic_INPUT     - 1
           .WORD Basic_DIM       - 1
           .WORD Basic_READ      - 1
           .WORD Basic_LET       - 1
           .WORD Basic_GOTO      - 1
           .WORD Basic_RUN       - 1
           .WORD Basic_IF        - 1
           .WORD Basic_RESTORE   - 1
           .WORD Basic_GOSUB     - 1
           .WORD Basic_RETURN    - 1
           .WORD Basic_REM       - 1
           .WORD Basic_STOP      - 1
           .WORD Basic_ON        - 1
           .WORD Basic_WAIT      - 1
           .WORD Basic_LOAD      - 1
           .WORD Basic_SAVE      - 1
           .WORD Basic_SETTIM    - 1
           .WORD Basic_DEF       - 1
           .WORD Basic_POKE      - 1
           .WORD Basic_PRINTN    - 1
           .WORD Basic_PRINT     - 1
           .WORD Basic_CONT      - 1
           .WORD Basic_LIST      - 1
           .WORD Basic_CLR       - 1
           .WORD Basic_CMD       - 1
           .WORD Basic_SYS       - 1
           .WORD OPEN            - 1
           .WORD CLOSE           - 1
           .WORD Basic_GET       - 1
           .WORD Basic_NEW       - 1
           .WORD Basic_GO        - 1
           .WORD Basic_CONCAT    - 1
           .WORD Basic_DOPEN     - 1
           .WORD Basic_DCLOSE    - 1
           .WORD Basic_RECORD    - 1
           .WORD Basic_HEADER    - 1
           .WORD Basic_COLLECT   - 1
           .WORD Basic_BACKUP    - 1
           .WORD Basic_COPY      - 1
           .WORD Basic_APPEND    - 1
           .WORD Basic_DSAVE     - 1
           .WORD Basic_DLOAD     - 1
           .WORD Basic_DIRECTORY - 1
           .WORD Basic_RENAME    - 1
           .WORD Basic_SCRATCH   - 1
           .WORD Basic_DIRECTORY - 1

; ********************
  Basic_Function_Table
; ********************

           .WORD Basic_SGN
           .WORD Basic_INT
           .WORD Basic_ABS
           .WORD Basic_USR
           .WORD Basic_FRE
           .WORD Basic_POS
           .WORD Basic_SQR
           .WORD Basic_RND
           .WORD Basic_LOG
           .WORD Basic_EXP
           .WORD Basic_COS
           .WORD Basic_SIN
           .WORD Basic_TAN
           .WORD Basic_ATN
           .WORD Basic_PEEK
           .WORD Basic_LEN
           .WORD Basic_STR
           .WORD Basic_VAL
           .WORD Basic_ASC
           .WORD Basic_CHR
           .WORD Basic_LEFT
           .WORD Basic_RIGHT
           .WORD Basic_MID

; ********************
  Basic_Operator_Table
; ********************

           .BYTE $79, Basic_PLUS     - 1
           .BYTE $79, Basic_MINUS    - 1
           .BYTE $7b, Basic_MULTIPLY - 1
           .BYTE $7b, Basic_DIVIDE   - 1
           .BYTE $7f, Basic_POWER    - 1
           .BYTE $50, Basic_AND      - 1
           .BYTE $46, Basic_OR       - 1
           .BYTE $7d, Basic_GREATER  - 1
           .BYTE $5a, Basic_EQUAL    - 1
           .BYTE $64, Basic_LESS     - 1

; *******************
  Basic_Keyword_Table
; *******************

           .BYTE "END"^
           .BYTE "FOR"^
           .BYTE "NEXT"^
           .BYTE "DATA"^
           .BYTE "INPUT#"^
           .BYTE "INPUT"^
           .BYTE "DIM"^
           .BYTE "READ"^
           .BYTE "LET"^
           .BYTE "GOTO"^
           .BYTE "RUN"^
           .BYTE "IF"^
           .BYTE "RESTORE"^
           .BYTE "GOSUB"^
           .BYTE "RETURN"^
           .BYTE "REM"^
           .BYTE "STOP"^
           .BYTE "ON"^
           .BYTE "WAIT"^
           .BYTE "LOAD"^
           .BYTE "SAVE"^
           .BYTE "VERIFY"^
           .BYTE "DEF"^
           .BYTE "POKE"^
           .BYTE "PRINT#"^
           .BYTE "PRINT"^
           .BYTE "CONT"^
           .BYTE "LIST"^
           .BYTE "CLR"^
           .BYTE "CMD"^
           .BYTE "SYS"^
           .BYTE "OPEN"^
           .BYTE "CLOSE"^
           .BYTE "GET"^
           .BYTE "NEW"^
           .BYTE "TAB("^
           .BYTE "TO"^
           .BYTE "FN"^
           .BYTE "SPC("^
           .BYTE "THEN"^
           .BYTE "NOT"^
           .BYTE "STEP"^
           .BYTE "+"^
           .BYTE "-"^
           .BYTE "*"^
           .BYTE "/"^
           .BYTE "^"^
           .BYTE "AND"^
           .BYTE "OR"^
           .BYTE ">"^
           .BYTE "="^
           .BYTE "<"^
           .BYTE "SGN"^
           .BYTE "INT"^
           .BYTE "ABS"^
           .BYTE "USR"^
           .BYTE "FRE"^
           .BYTE "POS"^
           .BYTE "SQR"^
           .BYTE "RND"^
           .BYTE "LOG"^
           .BYTE "EXP"^
           .BYTE "COS"^
           .BYTE "SIN"^
           .BYTE "TAN"^
           .BYTE "ATN"^
           .BYTE "PEEK"^
           .BYTE "LEN"^
           .BYTE "STR$"^
           .BYTE "VAL"^
           .BYTE "ASC"^
           .BYTE "CHR$"^
           .BYTE "LEFT$"^
           .BYTE "RIGHT$"^
           .BYTE "MID$"^
           .BYTE "GO"^
           .BYTE "CONCAT"^
           .BYTE "DOPEN"^
           .BYTE "DCLOSE"^
           .BYTE "RECORD"^
           .BYTE "HEADER"^
           .BYTE "COLLECT"^
           .BYTE "BACKUP"^
           .BYTE "COPY"^
           .BYTE "APPEND"^
           .BYTE "DSAVE"^
           .BYTE "DLOAD"^
           .BYTE "CATALOG"^
           .BYTE "RENAME"^
           .BYTE "SCRATCH"^
           .BYTE "DIRECTORY"^
           .BYTE $00

; ********************
  Basic_Error_Messages
; ********************

           .BYTE "NEXT WITHOUT FOR"^
           .BYTE "SYNTAX"^
           .BYTE "RETURN WITHOUT GOSUB"^
           .BYTE "OUT OF DATA"^
           .BYTE "ILLEGAL QUANTITY"^
           .BYTE "OVERFLOW"^
           .BYTE "OUT OF MEMORY"^
           .BYTE "UNDEF'D STATEMENT"^
           .BYTE "BAD SUBSCRIPT"^
           .BYTE "REDIM'D ARRAY"^
           .BYTE "DIVISION BY ZERO"^
           .BYTE "ILLEGAL DIRECT"^
           .BYTE "TYPE MISMATCH"^
           .BYTE "STRING TOO LONG"^
           .BYTE "FILE DATA"^
           .BYTE "FORMULA TOO COMPLEX"^
           .BYTE "CAN'T CONTINUE"^
           .BYTE "UNDEF'D FUNCTION"^
 Msg_ERR   .BYTE " ERROR",0
 Msg_IN    .BYTE " IN ",0

; *********
  Msg_READY
; *********

           .BYTE "\rREADY.\r",0

; *********
  Msg_BREAK
; *********

           .BYTE "\rBREAK",0

; ***************
  Find_Active_FOR
; ***************

           TSX
           INX
           INX
           INX
           INX
 Bb327     LDA STACK+1,X
           CMP #$81
           BNE Bb34f
           LDA FORPNT+1
           BNE Bb33c
           LDA STACK+2,X
           STA FORPNT
           LDA STACK+3,X
           STA FORPNT+1
 Bb33c     CMP STACK+3,X
           BNE Bb348
           LDA FORPNT
           CMP STACK+2,X
           BEQ Bb34f
 Bb348     TXA
           CLC
           ADC #$12
           TAX
           BNE Bb327
 Bb34f     RTS

; *************
  Open_Up_Space
; *************

           JSR Check_Mem_Avail
           STA STREND
           STY STREND+1
           SEC
           LDA TMPPTB
           SBC TMPPTC
           STA INDEXA
           TAY
           LDA TMPPTB+1
           SBC TMPPTC+1
           TAX
           INX
           TYA
           BEQ Bb38b
           LDA TMPPTB
           SEC
           SBC INDEXA
           STA TMPPTB
           BCS Bb374
           DEC TMPPTB+1
           SEC
 Bb374     LDA TMPPTA
           SBC INDEXA
           STA TMPPTA
           BCS Bb384
           DEC TMPPTA+1
           BCC Bb384
 Bb380     LDA (TMPPTB),Y
           STA (TMPPTA),Y
 Bb384     DEY
           BNE Bb380
           LDA (TMPPTB),Y
           STA (TMPPTA),Y
 Bb38b     DEC TMPPTB+1
           DEC TMPPTA+1
           DEX
           BNE Bb384
           RTS

; *****************
  Check_Stack_Avail
; *****************

           ASL A
           ADC #$3e ; '>'
           BCS Mb3cd
           STA INDEXA
           TSX
           CPX INDEXA
           BCC Mb3cd
           RTS

; ***************
  Check_Mem_Avail
; ***************

           CPY FRETOP+1
           BCC Bb3cc
           BNE Bb3aa
           CMP FRETOP
           BCC Bb3cc
 Bb3aa     PHA
           LDX #9
           TYA
 Bb3ae     PHA
           LDA FACTPA,X
           DEX
           BPL Bb3ae
           JSR Garbage_Collection
           LDX #$f7
 Bb3b9     PLA
           STA FAC1EX,X
           INX
           BMI Bb3b9
           PLA
           TAY
           PLA
           CPY FRETOP+1
           BCC Bb3cc
           BNE Mb3cd
           CMP FRETOP
           BCS Mb3cd
 Bb3cc     RTS

; *****
  Mb3cd
; *****

           LDX #$4d ; 'M'

; ***********
  Basic_Error
; ***********

           LDA IOPMPT
           BEQ Bb3da
           JSR CLRCHN
           LDA #0
           STA IOPMPT
 Bb3da     JSR Print_CR
           JSR Print_Question_Mark
 Bb3e0     LDA Basic_Error_Messages,X
           PHA
           AND #$7f
           JSR Print_Char
           INX
           PLA
           BPL Bb3e0
 Mb3ed     JSR Flush_BASIC_Stack
           LDA #<Msg_ERR
           LDY #>Msg_ERR
 Mb3f4     JSR Print_String
           LDY CURLIN+1
           INY
           BEQ Basic_Ready
           JSR Print_IN

; ***********
  Basic_Ready
; ***********

           LDA #<Msg_READY
           LDY #>Msg_READY
           JSR Print_String
 Mb406     JSR Read_String
           STX TXTPTR
           STY TXTPTR+1
           JSR CHRGET
           TAX
           BEQ Mb406
           LDX #$ff
           STX CURLIN+1
           BCC New_Basic_Line
           JSR Tokenize_Line
           JMP Start_Program

; **************
  New_Basic_Line
; **************

           JSR Scan_Linenumber
           JSR Tokenize_Line
           STY COUNT
           JSR Find_BASIC_Line
           BCC Bb470
           LDY #1
           LDA (TMPPTC),Y
           STA INDEXA+1
           LDA VARTAB
           STA INDEXA
           LDA TMPPTC+1
           STA INDEXB+1
           LDA TMPPTC
           DEY
           SBC (TMPPTC),Y
           CLC
           ADC VARTAB
           STA VARTAB
           STA INDEXB
           LDA VARTAB+1
           ADC #$ff
           STA VARTAB+1
           SBC TMPPTC+1
           TAX
           SEC
           LDA TMPPTC
           SBC VARTAB
           TAY
           BCS Bb45a
           INX
           DEC INDEXB+1
 Bb45a     CLC
           ADC INDEXA
           BCC Bb462
           DEC INDEXA+1
           CLC
 Bb462     LDA (INDEXA),Y
           STA (INDEXB),Y
           INY
           BNE Bb462
           INC INDEXA+1
           INC INDEXB+1
           DEX
           BNE Bb462
 Bb470     JSR Reset_BASIC_Execution
           JSR Rechain
           LDA BUF
           BEQ Mb406
           CLC
           LDA VARTAB
           STA TMPPTB
           ADC COUNT
           STA TMPPTA
           LDY VARTAB+1
           STY TMPPTB+1
           BCC Bb48b
           INY
 Bb48b     STY TMPPTA+1
           JSR Open_Up_Space
           LDA LINNUM
           LDY LINNUM+1
           STA BUF-2
           STY BUF-1
           LDA STREND
           LDY STREND+1
           STA VARTAB
           STY VARTAB+1
           LDY COUNT
           DEY
 Bb4a5     LDA BUF-4,Y
           STA (TMPPTC),Y
           DEY
           BPL Bb4a5

; *****************
  Reset_And_Rechain
; *****************

           JSR Reset_BASIC_Execution
           JSR Rechain
           JMP Mb406

; *******
  Rechain
; *******

           LDA TXTTAB
           LDY TXTTAB+1
           STA INDEXA
           STY INDEXA+1
           CLC
 Bb4bf     LDY #1
           LDA (INDEXA),Y
           BEQ Bb4e1
           LDY #4
 Bb4c7     INY
           LDA (INDEXA),Y
           BNE Bb4c7
           INY
           TYA
           ADC INDEXA
           TAX
           LDY #0
           STA (INDEXA),Y
           TYA
           ADC INDEXA+1
           INY
           STA (INDEXA),Y
           STX INDEXA
           STA INDEXA+1
           BCC Bb4bf
 Bb4e1     RTS

; ***********
  Read_String
; ***********

           LDX #0
 Bb4e4     JSR CHRIN
           CMP #13
           BEQ Bb4f8
           STA BUF,X
           INX
           CPX #$51 ; 'Q'
           BNE Bb4e4
           LDX #$b0
           JMP Basic_Error
 Bb4f8     JMP Terminate_BUF

; *************
  Tokenize_Line
; *************

           LDX TXTPTR
           LDY #4
           STY GARBFL
 Bb501     LDA BUF,X
           BPL Bb50d
           CMP #$ff
           BEQ Bb554
           INX
           BNE Bb501
 Bb50d     CMP #$20 ; ' '
           BEQ Bb554
           STA ENDCHR
           CMP #$22 ; '"'
           BEQ Bb579
           BIT GARBFL
           BVS Bb554
           CMP #$3f ; '?'
           BNE Bb523
           LDA #$99
           BNE Bb554
 Bb523     CMP #$30 ; '0'
           BCC Bb52b
           CMP #$3c ; '<'
           BCC Bb554
 Bb52b     STY TMPPTD
           LDY #0
           STY COUNT
           STX TXTPTR
           LDA #>Basic_Keyword_Table
           STA INDEXA+1
           LDA #<Basic_Keyword_Table
           STA INDEXA
           BNE Bb544
 Bb53d     INX
           INC INDEXA
           BNE Bb544
           INC INDEXA+1
 Bb544     LDA BUF,X
           SEC
           SBC (INDEXA),Y
           BEQ Bb53d
           CMP #$80
           BNE Bb580
           ORA COUNT
 Bb552     LDY TMPPTD
 Bb554     INX
           INY
           STA BUF-5,Y
           LDA BUF-5,Y
           BEQ Bb599
           SEC
           SBC #$3a ; ':'
           BEQ Bb567
           CMP #$49 ; 'I'
           BNE Bb569
 Bb567     STA GARBFL
 Bb569     SEC
           SBC #$55 ; 'U'
           BNE Bb501
           STA ENDCHR
 Bb570     LDA BUF,X
           BEQ Bb554
           CMP ENDCHR
           BEQ Bb554
 Bb579     INY
           STA BUF-5,Y
           INX
           BNE Bb570
 Bb580     LDX TXTPTR
           INC COUNT
 Bb584     LDA (INDEXA),Y
           PHP
           INC INDEXA
           BNE Bb58d
           INC INDEXA+1
 Bb58d     PLP
           BPL Bb584
           LDA (INDEXA),Y
           BNE Bb544
           LDA BUF,X
           BPL Bb552
 Bb599     STA BUF-3,Y
           DEC TXTPTR+1
           LDA #$ff
           STA TXTPTR
           RTS

; ***************
  Find_BASIC_Line
; ***************

           LDA TXTTAB
           LDX TXTTAB+1

; ******************
  Find_BASIC_Line_AX
; ******************

           LDY #1
           STA TMPPTC
           STX TMPPTC+1
           LDA (TMPPTC),Y
           BEQ Bb5d0
           INY
           INY
           LDA LINNUM+1
           CMP (TMPPTC),Y
           BCC Bb5d1
           BEQ Bb5be
           DEY
           BNE Bb5c7
 Bb5be     LDA LINNUM
           DEY
           CMP (TMPPTC),Y
           BCC Bb5d1
           BEQ Bb5d1
 Bb5c7     DEY
           LDA (TMPPTC),Y
           TAX
           DEY
           LDA (TMPPTC),Y
           BCS Find_BASIC_Line_AX
 Bb5d0     CLC
 Bb5d1     RTS

; *********
  Basic_NEW
; *********

           BNE Bb5d1

; ***********
  Perform_NEW
; ***********

           LDA #0
           TAY
           STA (TXTTAB),Y
           INY
           STA (TXTTAB),Y
           LDA TXTTAB
           CLC
           ADC #2
           STA VARTAB
           LDA TXTTAB+1
           ADC #0
           STA VARTAB+1

; *********************
  Reset_BASIC_Execution
; *********************

           JSR Reset_BASIC_Exec_Pointer
           LDA #0

; *********
  Basic_CLR
; *********

           BNE Bb621

; **********************
  Reset_Variable_Pointer
; **********************

           LDA MEMSIZ
           LDY MEMSIZ+1
           STA FRETOP
           STY FRETOP+1
           LDA #0
           STA DS_1
           JSR CLALL
           LDA VARTAB
           LDY VARTAB+1
           STA ARYTAB
           STY ARYTAB+1
           STA STREND
           STY STREND+1
 Mb60b     JSR Basic_RESTORE

; *****************
  Flush_BASIC_Stack
; *****************

           LDX #$16
           STX TEMPPT
           PLA
           TAY
           PLA
           LDX #$fa
           TXS
           PHA
           TYA
           PHA
           LDA #0
           STA OLDTXT+1
           STA SUBFLG
 Bb621     RTS

; ************************
  Reset_BASIC_Exec_Pointer
; ************************

           CLC
           LDA TXTTAB
           ADC #$ff
           STA TXTPTR
           LDA TXTTAB+1
           ADC #$ff
           STA TXTPTR+1
           RTS

; **********
  Basic_LIST
; **********

           BCC Bb638
           BEQ Bb638
           CMP #$ab
           BNE Bb621
 Bb638     JSR Scan_Linenumber
           JSR Find_BASIC_Line
           JSR CHRGOT
           BEQ Bb64f
           CMP #$ab
           BNE Bb5d1
           JSR CHRGET
           JSR Scan_Linenumber
           BNE Bb5d1
 Bb64f     PLA
           PLA
           LDA LINNUM
           ORA LINNUM+1
           BNE Bb65d
           LDA #$ff
           STA LINNUM
           STA LINNUM+1
 Bb65d     LDY #1
           STY GARBFL
           LDA (TMPPTC),Y
           BEQ Bb6a8
           JSR STOP
           JSR Print_CR
           INY
           LDA (TMPPTC),Y
           TAX
           INY
           LDA (TMPPTC),Y
           CMP LINNUM+1
           BNE Bb67a
           CPX LINNUM
           BEQ Bb67c
 Bb67a     BCS Bb6a8
 Bb67c     STY FORPNT
           JSR Print_Integer_XA
           LDA #$20 ; ' '
 Bb683     LDY FORPNT
           AND #$7f
 Bb687     JSR Print_Char
           CMP #$22 ; '"'
           BNE Bb694
           LDA GARBFL
           EOR #$ff
           STA GARBFL
 Bb694     INY
           BEQ Bb6a8
           LDA (TMPPTC),Y
           BNE Bb6ab
           TAY
           LDA (TMPPTC),Y
           TAX
           INY
           LDA (TMPPTC),Y
           STX TMPPTC
           STA TMPPTC+1
           BNE Bb65d
 Bb6a8     JMP Basic_Ready
 Bb6ab     BPL Bb687
           CMP #$ff
           BEQ Bb687
           BIT GARBFL
           BMI Bb687
           TAX
           STY FORPNT
           LDY #$b0
           STY INDEXA+1
           LDY #$b2
           STY INDEXA
           LDY #0
           ASL A
           BEQ Bb6d5
 Bb6c5     DEX
           BPL Bb6d4
 Bb6c8     INC INDEXA
           BNE Bb6ce
           INC INDEXA+1
 Bb6ce     LDA (INDEXA),Y
           BPL Bb6c8
           BMI Bb6c5
 Bb6d4     INY
 Bb6d5     LDA (INDEXA),Y
           BMI Bb683
           JSR Print_Char
           BNE Bb6d4

; *********
  Basic_FOR
; *********

           LDA #$80
           STA SUBFLG
           JSR Basic_LET
           JSR Find_Active_FOR
           BNE Bb6ef
           TXA
           ADC #15
           TAX
           TXS
 Bb6ef     PLA
           PLA
           LDA #9
           JSR Check_Stack_Avail
           JSR Next_Statement
           CLC
           TYA
           ADC TXTPTR
           PHA
           LDA TXTPTR+1
           ADC #0
           PHA
           LDA CURLIN+1
           PHA
           LDA CURLIN
           PHA
           LDA #$a4
           JSR Need_A
           JSR Is_Numeric
           JSR Eval_Numeric
           LDA FAC1SI
           ORA #$7f
           AND FAC1M1
           STA FAC1M1
           LDA #$27 ; '''
           LDY #$b7
           STA INDEXA
           STY INDEXA+1
           JMP Round_And_Push_FAC1
           LDA #<REAL_1
           LDY #>REAL_1
           JSR Load_FAC1_AY
           JSR CHRGOT
           CMP #$a9
           BNE Bb73b
           JSR CHRGET
           JSR Eval_Numeric
 Bb73b     JSR Get_FAC1_Sign
           JSR Push_FAC1
           LDA FORPNT+1
           PHA
           LDA FORPNT
           PHA
           LDA #$81
           PHA
 Mb74a     JSR STOP
           LDA TXTPTR
           LDY TXTPTR+1
           CPY #2
           BEQ Bb759
           STA OLDTXT
           STY OLDTXT+1
 Bb759     LDY #0
           LDA (TXTPTR),Y
           BNE Bb7a5
           LDY #2
           LDA (TXTPTR),Y
           CLC
           BNE Bb769
           JMP Mb7e2
 Bb769     INY
           LDA (TXTPTR),Y
           STA CURLIN
           INY
           LDA (TXTPTR),Y
           STA CURLIN+1
           TYA
           ADC TXTPTR
           STA TXTPTR
           BCC Start_Program
           INC TXTPTR+1

; *************
  Start_Program
; *************

           JSR Jbf21
           JSR Interpret
           JMP Mb74a

; *********
  Interpret
; *********

           BEQ Bb7c5
 Mb787     SBC #$80
           BCC Bb7a2
           CMP #$23 ; '#'
           BCC Bb795
           CMP #$4b ; 'K'
           BCC Bb7a9
           SBC #$28 ; '('
 Bb795     ASL A
           TAY
           LDA Basic_Statement_Table+1,Y
           PHA
           LDA Basic_Statement_Table,Y
           PHA
           JMP CHRGET
 Bb7a2     JMP Basic_LET
 Bb7a5     CMP #$3a ; ':'
           BEQ Start_Program
 Bb7a9     JMP Syntax_Error

; ********
  Basic_GO
; ********

           JSR CHRGOT
           LDA #$a4
           JSR Need_A
           JMP Basic_GOTO

; *************
  Basic_RESTORE
; *************

           SEC
           LDA TXTTAB
           SBC #1
           LDY TXTTAB+1
           BCS Mb7c1
           DEY
 Mb7c1     STA DATPTR
           STY DATPTR+1
 Bb7c5     RTS

; **********
  Basic_STOP
; **********

           BCS Bb7c9

; *********
  Basic_END
; *********

           CLC
 Bb7c9     BNE Bb807
           LDA TXTPTR
           LDY TXTPTR+1
           LDX CURLIN+1
           INX
           BEQ Bb7e0
           STA OLDTXT
           STY OLDTXT+1
 Mb7d8     LDA CURLIN
           LDY CURLIN+1
           STA OLDLIN
           STY OLDLIN+1
 Bb7e0     PLA
           PLA
 Mb7e2     LDA #$1b
           LDY #$b3
           BCC Bb7eb
           JMP Mb3f4
 Bb7eb     JMP Basic_Ready

; **********
  Basic_CONT
; **********

           BNE Bb807
           LDX #$db
           LDY OLDTXT+1
           BNE Bb7f9
           JMP Basic_Error
 Bb7f9     LDA OLDTXT
           STA TXTPTR
           STY TXTPTR+1
           LDA OLDLIN
           LDY OLDLIN+1
           STA CURLIN
           STY CURLIN+1
 Bb807     RTS

; *********
  Basic_RUN
; *********

           BNE Bb80d
           JMP Reset_BASIC_Execution
 Bb80d     JSR Reset_Variable_Pointer
           JMP Mb827

; ***********
  Basic_GOSUB
; ***********

           LDA #3
           JSR Check_Stack_Avail
           LDA TXTPTR+1
           PHA
           LDA TXTPTR
           PHA
           LDA CURLIN+1
           PHA
           LDA CURLIN
           PHA
           LDA #$8d
           PHA
 Mb827     JSR CHRGOT
           JSR Basic_GOTO
           JMP Mb74a

; **********
  Basic_GOTO
; **********

           JSR Scan_Linenumber
           JSR Next_Line
           LDA CURLIN+1
           CMP LINNUM+1
           BCS Bb847
           TYA
           SEC
           ADC TXTPTR
           LDX TXTPTR+1
           BCC Bb84b
           INX
           BCS Bb84b
 Bb847     LDA TXTTAB
           LDX TXTTAB+1
 Bb84b     JSR Find_BASIC_Line_AX
           BCC Bb86e
           LDA TMPPTC
           SBC #1
           STA TXTPTR
           LDA TMPPTC+1
           SBC #0
           STA TXTPTR+1
 Bb85c     RTS

; ************
  Basic_RETURN
; ************

           BNE Bb85c
           LDA #$ff
           STA FORPNT+1
           JSR Find_Active_FOR
           TXS
           CMP #$8d
           BEQ Bb876
           LDX #$16
           .BYTE $2c
 Bb86e     LDX #$5a ; 'Z'
           JMP Basic_Error
 Bb873     JMP Syntax_Error
 Bb876     PLA
           PLA
           STA CURLIN
           PLA
           STA CURLIN+1
           PLA
           STA TXTPTR
           PLA
           STA TXTPTR+1

; **********
  Basic_DATA
; **********

           JSR Next_Statement

; **************************
  Add_Y_To_Execution_Pointer
; **************************

           TYA
           CLC
           ADC TXTPTR
           STA TXTPTR
           BCC Bb890
           INC TXTPTR+1
 Bb890     RTS

; **************
  Next_Statement
; **************

           LDX #$3a ; ':'
           .BYTE $2c

; *********
  Next_Line
; *********

           LDX #0
           STX CHARAC
           LDY #0
           STY ENDCHR
 Bb89c     LDA ENDCHR
           LDX CHARAC
           STA CHARAC
           STX ENDCHR
 Bb8a4     LDA (TXTPTR),Y
           BEQ Bb890
           CMP ENDCHR
           BEQ Bb890
           INY
           CMP #$22 ; '"'
           BNE Bb8a4
           BEQ Bb89c

; ********
  Basic_IF
; ********

           JSR Eval_Expression
           JSR CHRGOT
           CMP #$89
           BEQ Bb8c2
           LDA #$a7
           JSR Need_A
 Bb8c2     LDA FAC1EX
           BNE Bb8cb

; *********
  Basic_REM
; *********

           JSR Next_Line
           BEQ Add_Y_To_Execution_Pointer
 Bb8cb     JSR CHRGOT
           BCS Bb8d3
           JMP Basic_GOTO
 Bb8d3     JMP Interpret

; ********
  Basic_ON
; ********

           JSR Get_Byte_Value
           PHA
           CMP #$8d
           BEQ Bb8e2
 Bb8de     CMP #$89
           BNE Bb873
 Bb8e2     DEC FAC1M4
           BNE Bb8ea
           PLA
           JMP Mb787
 Bb8ea     JSR CHRGET
           JSR Scan_Linenumber
           CMP #$2c ; ','
           BEQ Bb8e2
           PLA
 Bb8f5     RTS

; ***************
  Scan_Linenumber
; ***************

           LDX #0
           STX LINNUM
           STX LINNUM+1
 Mb8fc     BCS Bb8f5
           SBC #$2f ; '/'
           STA CHARAC
           LDA LINNUM+1
           STA INDEXA
           CMP #$19
           BCS Bb8de
           LDA LINNUM
           ASL A
           ROL INDEXA
           ASL A
           ROL INDEXA
           ADC LINNUM
           STA LINNUM
           LDA INDEXA
           ADC LINNUM+1
           STA LINNUM+1
           ASL LINNUM
           ROL LINNUM+1
           LDA LINNUM
           ADC CHARAC
           STA LINNUM
           BCC Bb92a
           INC LINNUM+1
 Bb92a     JSR CHRGET
           JMP Mb8fc

; *********
  Basic_LET
; *********

           JSR Get_Scalar_Address
           STA FORPNT
           STY FORPNT+1
           LDA #$b2
           JSR Need_A
           LDA INTFLG
           PHA
           LDA VALTYP
           PHA
           JSR Eval_Expression
           PLA
           ROL A
           JSR Check_Var_Type
           BNE Bb964
           PLA

; ***********************
  Assign_Numeric_variable
; ***********************

           BPL Bb961
           JSR Round_FAC1_Checked
           JSR Eval_Integer
           LDY #0
           LDA FAC1M3
           STA (FORPNT),Y
           INY
           LDA FAC1M4
           STA (FORPNT),Y
           RTS
 Bb961     JMP Assign_FAC1_To_FOR_Index
 Bb964     PLA

; **********************
  Assign_String_Variable
; **********************

           LDY FORPNT+1
           CPY #$d0
           BNE Bb9ba
           JSR Get_String_Descriptor
           CMP #6
           BNE Bb9b2
           LDY #0
           STY FAC1EX
           STY FAC1SI
 Bb978     STY TMPPTD
           JSR Eval_Digit
           JSR Multiply_FAC1_BY_10
           INC TMPPTD
           LDY TMPPTD
           JSR Eval_Digit
           JSR FAC1_Round_And_Copy_To_FAC2
           TAX
           BEQ Bb992
           INX
           TXA
           JSR Multiply_FAC1_By_4
 Bb992     LDY TMPPTD
           INY
           CPY #6
           BNE Bb978
           JSR Multiply_FAC1_BY_10
           JSR FAC1_To_Integer
           LDX #2
           SEI
 Bb9a2     LDA FAC1M2,X
           STA JIFFY_CLOCK,X
           DEX
           BPL Bb9a2
           CLI
           RTS

; **********
  Eval_Digit
; **********

           LDA (INDEXA),Y
           JSR ISNUM
           BCC Bb9b5
 Bb9b2     JMP Jump_To_Illegal_Quantity
 Bb9b5     SBC #$2f ; '/'
           JMP Add_A_To_FAC1
 Bb9ba     LDY #2
           LDA (FAC1M3),Y
           CMP DS_3
           BNE Bb9d4
           PHA
           DEY
           LDA DS_1
           BEQ Bb9d2
           LDA (FAC1M3),Y
           CMP DS_2
           BNE Bb9d2
           PLA
           JMP Mb9f6
 Bb9d2     PLA
           INY
 Bb9d4     CMP FRETOP+1
           BCC Bb9ef
           BNE Bb9e1
           DEY
           LDA (FAC1M3),Y
           CMP FRETOP
           BCC Bb9ef
 Bb9e1     LDY FAC1M4
           CPY VARTAB+1
           BCC Bb9ef
           BNE Mb9f6
           LDA FAC1M3
           CMP VARTAB
           BCS Mb9f6
 Bb9ef     LDA FAC1M3
           LDY FAC1M4
           JMP Mba13
 Mb9f6     LDY #0
           LDA (FAC1M3),Y
           JSR Allocate_String_FAC1
           LDA DESCPT
           LDY DESCPT+1
           STA STRPTR
           STY FAC1M5
           JSR Store_String_STRPTR
           LDA STRPTR
           LDY FAC1M5
           JSR Pop_Descriptor_Stack
           LDA #$5e ; '^'
           LDY #0
 Mba13     STA DESCPT
           STY DESCPT+1
           STA INDEXA
           STY INDEXA+1
           JSR Pop_Descriptor_Stack
           JSR Load_String_Descriptor
           BCC Bba2e
           LDY #0
           LDA FORPNT
           STA (INDEXA),Y
           INY
           LDA FORPNT+1
           STA (INDEXA),Y
 Bba2e     LDA FORPNT
           STA INDEXA
           LDA FORPNT+1
           STA INDEXA+1
           JSR Load_String_Descriptor
           BCC Bba44
           DEY
           LDA #$ff
           STA (INDEXA),Y
           DEY
           TXA
           STA (INDEXA),Y
 Bba44     LDY #2
 Bba46     LDA (DESCPT),Y
           STA (FORPNT),Y
           DEY
           BPL Bba46
           RTS

; **********************
  Load_String_Descriptor
; **********************

           LDY #0
           LDA (INDEXA),Y
           PHA
           BEQ Bba85
           INY
           LDA (INDEXA),Y
           TAX
           INY
           LDA (INDEXA),Y
           BMI Bba85
           CMP #$b0
           BCS Bba85
           CMP FRETOP+1
           BCC Bba85
           BNE Bba6c
           CPX FRETOP
           BCC Bba85
 Bba6c     JMP Mbf10
           NOP
 Mba70     CPX DS_2
           BEQ Bba85
 Mba74     STX INDEXA
           STA INDEXA+1
           PLA
           TAX
           CLC
           ADC INDEXA
           STA INDEXA
           BCC Bba83
           INC INDEXA+1
 Bba83     SEC
           RTS
 Bba85     PLA
           CLC
           RTS

; ************
  Basic_PRINTN
; ************

           JSR Basic_CMD
           JMP Set_Default_Channels

; *********
  Basic_CMD
; *********

           JSR Get_Byte_Value
           BEQ Bba98
           LDA #$2c ; ','
           JSR Need_A
 Bba98     PHP
           JSR CHKOUT
           STX IOPMPT
           PLP
           JMP Basic_PRINT
 Bbaa2     JSR Print_String_From_Descriptor
 Bbaa5     JSR CHRGOT

; ***********
  Basic_PRINT
; ***********

           BEQ Print_CR
 Mbaaa     BEQ Bbaef
           CMP #$a3
           BEQ Bbafd
           CMP #$a6
           CLC
           BEQ Bbafd
           CMP #$2c ; ','
           BEQ TAB_Jump
           CMP #$3b ; ';'
           BEQ Bbb12
           JSR Eval_Expression
           BIT VALTYP
           BMI Bbaa2
           JSR Format_FAC1
           JSR Create_String_Descriptor
           JSR Print_String_From_Descriptor
           JSR Cursor_Right_Or_Space
           BNE Bbaa5

; *************
  Terminate_BUF
; *************

           LDA #0
           STA BUF,X
           LDX #$ff
           LDY #1
           LDA IOPMPT
           BNE Bbaef

; ********
  Print_CR
; ********

           LDA #13
           JSR Print_Char
           LDA IOPMPT
           BPL Invert_A
           LDA #10
           JSR Print_Char

; ********
  Invert_A
; ********

           EOR #$ff
 Bbaef     RTS

; ********
  TAB_Jump
; ********

           LDA CursorCol
           SEC
 Bbaf3     SBC #10
           BCS Bbaf3
           EOR #$ff
           ADC #1
           BNE Bbb0d
 Bbafd     PHP
           JSR Get_Next_Byte_Value
           CMP #$29 ; ')'
           BNE Bbb5e
           PLP
           BCC Bbb0e
           TXA
           SBC CursorCol
           BCC Bbb12
 Bbb0d     TAX
 Bbb0e     INX
 Bbb0f     DEX
           BNE Bbb18
 Bbb12     JSR CHRGET
           JMP Mbaaa
 Bbb18     JSR Cursor_Right_Or_Space
           BNE Bbb0f

; ************
  Print_String
; ************

           JSR Create_String_Descriptor

; ****************************
  Print_String_From_Descriptor
; ****************************

           JSR Get_String_Descriptor
           TAX
           LDY #0
           INX
 Mbb27     DEX
           BEQ Bbaef
           LDA (INDEXA),Y
           JSR Print_Char
           INY
           CMP #13
           BNE Mbb27
           JSR Invert_A
           JMP Mbb27

; *********************
  Cursor_Right_Or_Space
; *********************

           LDA IOPMPT
           BEQ Bbb41
           LDA #$20 ; ' '
           .BYTE $2c
 Bbb41     LDA #$1d
           .BYTE $2c

; *******************
  Print_Question_Mark
; *******************

           LDA #$3f ; '?'

; **********
  Print_Char
; **********

           JSR CHROUT
           AND #$ff
           RTS

; *********
  Bad_Input
; *********

           LDA INPFLG
           BEQ Bbb61
           BMI Bbb56
           LDY #$ff
           BNE Bbb5a
 Bbb56     LDA DATLIN
           LDY DATLIN+1
 Bbb5a     STA CURLIN
           STY CURLIN+1
 Bbb5e     JMP Syntax_Error
 Bbb61     LDA IOPMPT
           BEQ Bbb6a
           LDX #$bf
           JMP Basic_Error
 Bbb6a     LDA #<Msg_Redo_From_Start
           LDY #>Msg_Redo_From_Start
           JSR Print_String
           LDA OLDTXT
           LDY OLDTXT+1
           STA TXTPTR
           STY TXTPTR+1
           RTS

; *********
  Basic_GET
; *********

           JSR Assert_Non_Direct
           CMP #$23 ; '#'
           BNE Bbb91
           JSR CHRGET
           JSR Get_Byte_Value
           LDA #$2c ; ','
           JSR Need_A
           JSR CHKIN
           STX IOPMPT
 Bbb91     LDX #1
           LDY #2
           LDA #0
           STA BUF+1
           LDA #$40 ; '@'
           JSR Read_Get
           LDX IOPMPT
           BNE Bbbb6
           RTS

; ************
  Basic_INPUTN
; ************

           JSR Get_Byte_Value
           LDA #$2c ; ','
           JSR Need_A
           JSR CHKIN
           STX IOPMPT
           JSR Input_String

; ********************
  Set_Default_Channels
; ********************

           LDA IOPMPT
 Bbbb6     JSR CLRCHN
           LDX #0
           STX IOPMPT
           RTS

; ***********
  Basic_INPUT
; ***********

           CMP #$22 ; '"'
           BNE Input_String
           JSR Make_String_Descriptor_From_Code
           LDA #$3b ; ';'
           JSR Need_A
           JSR Print_String_From_Descriptor

; ************
  Input_String
; ************

           JSR Assert_Non_Direct
           LDA #$2c ; ','
           STA BUF-1
 Mbbd5     JSR Prompt_And_Input
           LDA IOPMPT
           BEQ Bbbe8
           LDA STATUS
           AND #3
           BEQ Bbbe8
           JSR Set_Default_Channels
           JMP Basic_DATA
 Bbbe8     LDA BUF
           BNE Mbc09
           JMP Mbf2e
           NOP
 Mbbf1     CLC
           JMP Mb7d8

; ****************
  Prompt_And_Input
; ****************

           LDA IOPMPT
           BNE Bbbff
           JSR Print_Question_Mark
           JSR Cursor_Right_Or_Space
 Bbbff     JMP Read_String

; **********
  Basic_READ
; **********

           LDX DATPTR
           LDY DATPTR+1
           LDA #$98
           .BYTE $2c
 Mbc09     LDA #0

; ********
  Read_Get
; ********

           STA INPFLG
           STX INPPTR
           STY INPPTR+1
 Mbc11     JSR Get_Scalar_Address
           STA FORPNT
           STY FORPNT+1
           LDA TXTPTR
           LDY TXTPTR+1
           STA YSAVE
           STY YSAVE+1
           LDX INPPTR
           LDY INPPTR+1
           STX TXTPTR
           STY TXTPTR+1
           JSR CHRGOT
           BNE Mbc4d
           BIT INPFLG
           BVC Bbc3d
           JSR GETIN
           STA BUF
           LDX #$ff
           LDY #1
           BNE Bbc49
 Bbc3d     BMI Bbcb4
           LDA IOPMPT
           BNE Bbc46
           JSR Print_Question_Mark
 Bbc46     JSR Prompt_And_Input
 Bbc49     STX TXTPTR
           STY TXTPTR+1
 Mbc4d     JSR CHRGET
           BIT VALTYP
           BPL Bbc85
           BIT INPFLG
           BVC Bbc61
           INX
           STX TXTPTR
           LDA #0
           STA CHARAC
           BEQ Bbc6d
 Bbc61     STA CHARAC
           CMP #$22 ; '"'
           BEQ Bbc6e
           LDA #$3a ; ':'
           STA CHARAC
           LDA #$2c ; ','
 Bbc6d     CLC
 Bbc6e     STA ENDCHR
           LDA TXTPTR
           LDY TXTPTR+1
           ADC #0
           BCC Bbc79
           INY
 Bbc79     JSR Create_String_Descriptor_AY
           JSR Restore_Execution_Pointer
           JSR Assign_String_Variable
           JMP Mbc8d
 Bbc85     JSR Load_FAC1_From_String
           LDA INTFLG
           JSR Assign_Numeric_variable
 Mbc8d     JSR CHRGOT
           BEQ Bbc99
           CMP #$2c ; ','
           BEQ Bbc99
           JMP Bad_Input
 Bbc99     LDA TXTPTR
           LDY TXTPTR+1
           STA INPPTR
           STY INPPTR+1
           LDA YSAVE
           LDY YSAVE+1
           STA TXTPTR
           STY TXTPTR+1
           JSR CHRGOT
           BEQ Bbcda
           JSR Need_Comma
           JMP Mbc11
 Bbcb4     JSR Next_Statement
           INY
           TAX
           BNE Bbccd
           LDX #$2a ; '*'
           INY
           LDA (TXTPTR),Y
           BEQ Bbd2d
           INY
           LDA (TXTPTR),Y
           STA DATLIN
           INY
           LDA (TXTPTR),Y
           INY
           STA DATLIN+1
 Bbccd     LDA (TXTPTR),Y
           TAX
           JSR Add_Y_To_Execution_Pointer
           CPX #$83
           BNE Bbcb4
           JMP Mbc4d
 Bbcda     LDA INPPTR
           LDY INPPTR+1
           LDX INPFLG
           BPL Bbce5
           JMP Mb7c1
 Bbce5     LDY #0
           LDA (INPPTR),Y
           BEQ Bbcf6
           LDA IOPMPT
           BNE Bbcf6
           LDA #$f7
           LDY #$bc
           JMP Print_String
 Bbcf6     RTS

; *****************
  Msg_Extra_Ignored
; *****************

           .BYTE "?EXTRA IGNORED\r",0

; *******************
  Msg_Redo_From_Start
; *******************

           .BYTE "?REDO FROM START\r",0

; **********
  Basic_NEXT
; **********

           BNE Find_NEXT_Variable
           LDY #0
           BEQ Bbd22

; ******************
  Find_NEXT_Variable
; ******************

           JSR Get_Scalar_Address
 Bbd22     STA FORPNT
           STY FORPNT+1
           JSR Find_Active_FOR
           BEQ Bbd2f
           LDX #0
 Bbd2d     BEQ Bbd95
 Bbd2f     TXS
           TXA
           CLC
           ADC #4
           PHA
           ADC #6
           STA INDEXB
           PLA
           LDY #1
           JSR Load_FAC1_AY
           TSX
           LDA STACK+9,X
           STA FAC1SI
           LDA FORPNT
           LDY FORPNT+1
           JSR Add_Var_AY_To_FAC1
           JSR Assign_FAC1_To_FOR_Index
           LDY #1
           JSR Compare_FAC1_INDEXB_Y
           TSX
           SEC
           SBC STACK+9,X
           BEQ Bbd72
           LDA STACK+15,X
           STA CURLIN
           LDA STACK+16,X
           STA CURLIN+1
           LDA STACK+18,X
           STA TXTPTR
           LDA STACK+17,X
           STA TXTPTR+1
 Bbd6f     JMP Mb74a
 Bbd72     TXA
           ADC #$11
           TAX
           TXS
           JSR CHRGOT
           CMP #$2c ; ','
           BNE Bbd6f
           JSR CHRGET
           JSR Find_NEXT_Variable

; ************
  Eval_Numeric
; ************

           JSR Eval_Expression

; **********
  Is_Numeric
; **********

           CLC
           .BYTE $24

; ******************
  Assert_String_Type
; ******************

           SEC

; **************
  Check_Var_Type
; **************

           BIT VALTYP
           BMI Bbd91
           BCS Bbd93
 Bbd90     RTS
 Bbd91     BCS Bbd90
 Bbd93     LDX #$a3
 Bbd95     JMP Basic_Error

; ***************
  Eval_Expression
; ***************

           LDX TXTPTR
           BNE Bbd9e
           DEC TXTPTR+1
 Bbd9e     DEC TXTPTR
           LDX #0
           .BYTE $24
 Mbda3     PHA
           TXA
           PHA
           LDA #1
           JSR Check_Stack_Avail
           JSR Evaluate
           LDA #0
           STA ACCSYM
 Mbdb2     JSR CHRGOT
 Mbdb5     SEC
           SBC #$b1
           BCC Bbdd1
           CMP #3
           BCS Bbdd1
           CMP #1
           ROL A
           EOR #1
           EOR ACCSYM
           CMP ACCSYM
           BCC Bbe2a
           STA ACCSYM
           JSR CHRGET
           JMP Mbdb5
 Bbdd1     LDX ACCSYM
           BNE Bbe01
           BCS Right_Operand
           ADC #7
           BCC Right_Operand
           ADC VALTYP
           BNE Bbde2
           JMP Concatenate
 Bbde2     ADC #$ff
           STA INDEXA
           ASL A
           ADC INDEXA
           TAY
 Bbdea     PLA
           CMP Basic_Operator_Table,Y
           BCS Bbe5b
           JSR Is_Numeric
 Bbdf3     PHA
 Mbdf4     JSR Call_Operator_Function
           PLA
           LDY YSAVE
           BPL Bbe13
           TAX
           BEQ Bbe59
           BNE Bbe64
 Bbe01     LSR VALTYP
           TXA
           ROL A
           LDX TXTPTR
           BNE Bbe0b
           DEC TXTPTR+1
 Bbe0b     DEC TXTPTR
           LDY #$1b
           STA ACCSYM
           BNE Bbdea
 Bbe13     CMP Basic_Operator_Table,Y
           BCS Bbe64
           BCC Bbdf3

; **********************
  Call_Operator_Function
; **********************

           LDA Basic_Operator_Table+2,Y
           PHA
           LDA Basic_Operator_Table+1,Y
           PHA
           JSR Apply_Operator
           LDA ACCSYM
           JMP Mbda3
 Bbe2a     JMP Syntax_Error

; **************
  Apply_Operator
; **************

           LDA FAC1SI
           LDX Basic_Operator_Table,Y

; *********
  Push_FAC1
; *********

           TAY
           PLA
           STA INDEXA
           PLA
           STA INDEXA+1
           TYA
           PHA
           INC INDEXA
           BNE Round_And_Push_FAC1
           INC INDEXA+1

; *******************
  Round_And_Push_FAC1
; *******************

           JSR Round_FAC1_Checked
           LDA FAC1M4
           PHA
           LDA FAC1M3
           PHA
           LDA FAC1M2
           PHA
           LDA FAC1M1
           PHA
           LDA FAC1EX
           PHA
           JMP (INDEXA)

; *************
  Right_Operand
; *************

           LDY #$ff
           PLA
 Bbe59     BEQ Bbe7e
 Bbe5b     CMP #$64
           BEQ Bbe62
           JSR Is_Numeric
 Bbe62     STY YSAVE
 Bbe64     PLA
           LSR A
           STA TANSGN
           PLA
           STA FAC2EX
           PLA
           STA FAC2M1
           PLA
           STA FAC2M2
           PLA
           STA FAC2M3
           PLA
           STA FAC2M4
           PLA
           STA FAC2SI
           EOR FAC1SI
           STA STRPTR
 Bbe7e     LDA FAC1EX
           RTS

; ********
  Evaluate
; ********

           LDA #0
           STA VALTYP
 Bbe85     JSR CHRGET
           BCS Bbe8d
 Bbe8a     JMP Load_FAC1_From_String
 Bbe8d     JSR Is_Alpha
           BCS Bbf0d
           CMP #$ff
           BNE Bbea5
           LDA #<Float_PI
           LDY #>Float_PI
           JSR Load_FAC1_AY
           JMP CHRGET
 Float_PI  .REAL $82490fdaa1;    3.14159265254
 Bbea5     CMP #$2e ; '.'
           BEQ Bbe8a
           CMP #$ab
           BEQ Prep_Minus_Operation
           CMP #$aa
           BEQ Bbe85
           CMP #$22 ; '"'
           BNE Bbec4

; ********************************
  Make_String_Descriptor_From_Code
; ********************************

           LDA TXTPTR
           LDY TXTPTR+1
           ADC #0
           BCC Bbebe
           INY
 Bbebe     JSR Create_String_Descriptor
           JMP Restore_Execution_Pointer
 Bbec4     CMP #$a8
           BNE Bbedb
           LDY #$18
           BNE Bbf07

; ***********
  Basic_EQUAL
; ***********

           JSR Eval_Integer
           LDA FAC1M4
           EOR #$ff
           TAY
           LDA FAC1M3
           EOR #$ff
           JMP Integer_To_Float
 Bbedb     CMP #$a5
           BNE Bbee2
           JMP Eval_FNX
 Bbee2     CMP #$b4
           BCC Eval_In_Parenthesis
           JMP Function_Call

; *******************
  Eval_In_Parenthesis
; *******************

           JSR Need_Left_Parenthesis
           JSR Eval_Expression

; **********************
  Need_Right_Parenthesis
; **********************

           LDA #$29 ; ')'
           .BYTE $2c

; *********************
  Need_Left_Parenthesis
; *********************

           LDA #$28 ; '('
           .BYTE $2c

; **********
  Need_Comma
; **********

           LDA #$2c ; ','

; ******
  Need_A
; ******

           LDY #0
           CMP (TXTPTR),Y
           BNE Syntax_Error
           JMP CHRGET

; ************
  Syntax_Error
; ************

           LDX #16
           JMP Basic_Error

; ********************
  Prep_Minus_Operation
; ********************

           LDY #$15
 Bbf07     PLA
           PLA
           JMP Mbdf4
           CLV
 Bbf0d     JMP Get_Var
 Mbf10     PHA
           LDA DS_1
           BEQ Bbf1d
           PLA
           CMP DS_3
           BNE Bbf1e
           JMP Mba70
 Bbf1d     PLA
 Bbf1e     JMP Mba74

; *****
  Jbf21
; *****

           JSR CHRGET
           CMP #$ff
           BNE Bbf2b
           JMP Syntax_Error
 Bbf2b     JMP CHRGOT
 Mbf2e     LDA IOPMPT
           BNE Bbf35
           JMP Mbbf1
 Bbf35     LDA STATUS
           AND #$40 ; '@'
           BNE Bbf3e
           JMP Mbbd5
 Bbf3e     JMP Mbc09
           .FILL $bf8c-* ($aa) ;   75 bytes

; *******
  Get_Var
; *******

           JSR Get_Scalar_Address
           STA FAC1M3
           STY FAC1M4
           LDA VARNAM
           LDY VARNAM+1
           LDX VALTYP
           BEQ Load_Value
           LDX #0
           STX FAC1M5
           LDX FAC1M4
           CPX #$8b
           BCC Bbfd3
           CMP #$54 ; 'T'
           BNE Bbfc1
           CPY #$c9 ; TI$
           BNE Bbfc1
           JSR Load_Jiffyclock
           STY TMPVA2+1
           DEY
           STY TMPPTD
           LDY #6
           STY TMPVA2
           LDY #$24 ; '$'
           JSR Format_Jiffyclock
           JMP Mc598
 Bbfc1     CMP #$44 ; 'D'
           BNE Bbfd3
           CPY #$d3 ; DS$
           BNE Bbfd3
           JSR Get_Disk_Status
           LDA DS_2
           LDY DS_3
           JMP Create_String_Descriptor
 Bbfd3     RTS

; **********
  Load_Value
; **********

           LDX INTFLG
           BPL Load_Float
           LDY #0
           LDA (FAC1M3),Y
           TAX
           INY
           LDA (FAC1M3),Y
           TAY
           TXA
           JMP Integer_To_Float

; **********
  Load_Float
; **********

           LDX FAC1M4
           CPX #$8b
           BCC Load_Float_Var
           CMP #$54 ; 'T'
           BNE Check_ST_Var
           CPY #$49 ; 'I'
           BNE Load_Float_Var
           JSR Load_Jiffyclock
           TYA
           LDX #$a0
           JMP Mcd85

; ***************
  Get_Disk_Status
; ***************

           LDA DS_1
           BNE Bbfd3
           JMP Mffbd

; ***************
  Load_Jiffyclock
; ***************

           LDA #$8b
           LDY #0
           SEI
           JSR Load_FAC1_AY
           CLI
           STY FAC1M1
           RTS

; ************
  Check_ST_Var
; ************

           CMP #$53 ; 'S'
           BNE Check_DS_Var
           CPY #$54 ; 'T'
           BNE Check_DS_Var
           LDA STATUS
           JMP A_To_FAC1

; ************
  Check_DS_Var
; ************

           CMP #$44 ; 'D'
           BNE Load_Float_Var
           CPY #$53 ; 'S'
           BNE Load_Float_Var
           JSR Get_Disk_Status
           LDY #0
           LDA (DS_2),Y
           AND #15
           ASL A
           STA GARBFL
           ASL A
           ASL A
           ADC GARBFL
           STA GARBFL
           INY
           LDA (DS_2),Y
           AND #15
           ADC GARBFL
           JMP A_To_FAC1

; **************
  Load_Float_Var
; **************

           LDA FAC1M3
           LDY FAC1M4
           JMP Load_FAC1_AY

; *************
  Function_Call
; *************

           ASL A
           PHA
           TAX
           JSR CHRGET
           CPX #$8f
           BCC Bc071
           JSR Need_Left_Parenthesis
           JSR Eval_Expression
           JSR Need_Comma
           JSR Assert_String_Type
           PLA
           TAX
           LDA FAC1M4
           PHA
           LDA FAC1M3
           PHA
           TXA
           PHA
           JSR Get_Byte_Value
           PLA
           TAY
           TXA
           PHA
           JMP Mc076
 Bc071     JSR Eval_In_Parenthesis
           PLA
           TAY
 Mc076     LDA Basic_Statement_Table-2,Y
           STA FUNJMP
           LDA Basic_Statement_Table-1,Y
           STA FUNJMP+1
           JSR JUMPER
           JMP Is_Numeric

; ********
  Basic_OR
; ********

           LDY #$ff
           .BYTE $2c

; *********
  Basic_AND
; *********

           LDY #0
           STY COUNT
           JSR Eval_Integer
           LDA FAC1M3
           EOR COUNT
           STA CHARAC
           LDA FAC1M4
           EOR COUNT
           STA ENDCHR
           JSR FAC2_To_FAC1
           JSR Eval_Integer
           LDA FAC1M4
           EOR COUNT
           AND ENDCHR
           EOR COUNT
           TAY
           LDA FAC1M3
           EOR COUNT
           AND CHARAC
           EOR COUNT
           JMP Integer_To_Float

; **********
  Basic_LESS
; **********

           JSR Check_Var_Type
           BCS Bc0ce
           LDA FAC2SI
           ORA #$7f
           AND FAC2M1
           STA FAC2M1
           LDA #<FAC2EX
           LDY #>FAC2EX
           JSR Compare_FAC1_AY
           TAX
           JMP Mc101
 Bc0ce     LDA #0
           STA VALTYP
           DEC ACCSYM
           JSR Get_String_Descriptor
           STA FAC1EX
           STX FAC1M1
           STY FAC1M2
           LDA FAC2M3
           LDY FAC2M4
           JSR Get_String_Descriptor_AY
           STX FAC2M3
           STY FAC2M4
           TAX
           SEC
           SBC FAC1EX
           BEQ Bc0f6
           LDA #1
           BCC Bc0f6
           LDX FAC1EX
           LDA #$ff
 Bc0f6     STA FAC1SI
           LDY #$ff
           INX
 Bc0fb     INY
           DEX
           BNE Bc106
           LDX FAC1SI
 Mc101     BMI Bc112
           CLC
           BCC Bc112
 Bc106     LDA (FAC2M3),Y
           CMP (FAC1M1),Y
           BEQ Bc0fb
           LDX #$ff
           BCS Bc112
           LDX #1
 Bc112     INX
           TXA
           ROL A
           AND TANSGN
           BEQ Bc11b
           LDA #$ff
 Bc11b     JMP A_To_FAC1
 Bc11e     JSR Need_Comma

; *********
  Basic_DIM
; *********

           TAX
           JSR Get_Array_Address
           JSR CHRGOT
           BNE Bc11e
           RTS

; ******************
  Get_Scalar_Address
; ******************

           LDX #0
           JSR CHRGOT

; *****************
  Get_Array_Address
; *****************

           STX DIMFLG

; **************
  Get_FN_Address
; **************

           STA VARNAM
           JSR CHRGOT
           JSR Is_Alpha
           BCS Get_Address
 Bc13c     JMP Syntax_Error

; ***********
  Get_Address
; ***********

           LDX #0
           STX VALTYP
           STX INTFLG
           JSR CHRGET
           BCC Bc14f
           JSR Is_Alpha
           BCC Bc15a
 Bc14f     TAX
 Bc150     JSR CHRGET
           BCC Bc150
           JSR Is_Alpha
           BCS Bc150
 Bc15a     CMP #$24 ; '$'
           BNE Bc164
           LDA #$ff
           STA VALTYP
           BNE Bc174
 Bc164     CMP #$25 ; '%'
           BNE Bc17b
           LDA SUBFLG
           BNE Bc13c
           LDA #$80
           STA INTFLG
           ORA VARNAM
           STA VARNAM
 Bc174     TXA
           ORA #$80
           TAX
           JSR CHRGET
 Bc17b     STX VARNAM+1
           SEC
           ORA SUBFLG
           SBC #$28 ; '('
           BNE Bc187
           JMP Find_Array
 Bc187     LDY #0
           STY SUBFLG
           LDA VARTAB
           LDX VARTAB+1
 Bc18f     STX TMPPTC+1
 Bc191     STA TMPPTC
           CPX ARYTAB+1
           BNE Bc19b
           CMP ARYTAB
           BEQ Create_Var
 Bc19b     LDA VARNAM
           CMP (TMPPTC),Y
           BNE Bc1ac
           LDA VARNAM+1
           INY
           CMP (TMPPTC),Y
           BNE Bc1ab
           JMP Mc2b9
 Bc1ab     DEY
 Bc1ac     CLC
           LDA TMPPTC
           ADC #7
           BCC Bc191
           INX
           BNE Bc18f

; ********
  Is_Alpha
; ********

           CMP #$41 ; 'A'
           BCC Bc1bf
           SBC #$5b ; '['
           SEC
           SBC #$a5
 Bc1bf     RTS

; **********
  Create_Var
; **********

           PLA
           PHA
           CMP #$8e
           BNE Bc1cb
 Bc1c6     LDA #$c9
           LDY #$d0
           RTS
 Bc1cb     LDA VARNAM
           LDY VARNAM+1
           CMP #$54 ; 'T'
           BNE Bc1de
           CPY #$c9 ; TI$
           BEQ Bc1c6
           CPY #$49 ; TI
           BNE Bc1de
 Bc1db     JMP Syntax_Error
 Bc1de     CMP #$53 ; 'S'
           BNE Bc1e6
           CPY #$54 ; 'T'
           BEQ Bc1db
 Bc1e6     CMP #$44 ; 'D'
           BNE Bc1f2
           CPY #$53 ; 'S'
           BEQ Bc1db
           CPY #$d3
           BEQ Bc1db
 Bc1f2     LDA ARYTAB
           LDY ARYTAB+1
           STA TMPPTC
           STY TMPPTC+1
           LDA STREND
           LDY STREND+1
           STA TMPPTB
           STY TMPPTB+1
           CLC
           ADC #7
           BCC Bc208
           INY
 Bc208     STA TMPPTA
           STY TMPPTA+1
           JSR Open_Up_Space
           LDA TMPPTA
           LDY TMPPTA+1
           INY
           STA ARYTAB
           STY ARYTAB+1
           STA TMPPTA
           STY TMPPTA+1
 Bc21c     LDA TMPPTA
           LDX TMPPTA+1
 Bc220     CPX STREND+1
           BNE Bc228
           CMP STREND
           BEQ Bc29d
 Bc228     STA INDEXA
           STX INDEXA+1
           LDY #0
           LDA (INDEXA),Y
           TAX
           INY
           LDA (INDEXA),Y
           PHP
           INY
           LDA (INDEXA),Y
           ADC TMPPTA
           STA TMPPTA
           INY
           LDA (INDEXA),Y
           ADC TMPPTA+1
           STA TMPPTA+1
           PLP
           BPL Bc21c
           TXA
           BMI Bc21c
           INY
           LDA (INDEXA),Y
           LDY #0
           ASL A
           ADC #5
           ADC INDEXA
           STA INDEXA
           BCC Bc259
           INC INDEXA+1
 Bc259     LDX INDEXA+1
           CPX TMPPTA+1
           BNE Bc263
           CMP TMPPTA
           BEQ Bc220
 Bc263     LDY #0
           LDA (INDEXA),Y
           BEQ Bc290
           INY
           CLC
           ADC (INDEXA),Y
           STA TMPPTB
           TAX
           INY
           LDA (INDEXA),Y
           ADC #0
           STA TMPPTB+1
           CMP FRETOP+1
           BCC Bc290
           BNE Bc281
           CPX FRETOP
           BCC Bc290
 Bc281     LDY #0
           LDA (TMPPTB),Y
           ADC #6
           STA (TMPPTB),Y
           INY
           LDA (TMPPTB),Y
           ADC #0
           STA (TMPPTB),Y
 Bc290     LDA #3
           CLC
           ADC INDEXA
           STA INDEXA
           BCC Bc259
           INC INDEXA+1
           BNE Bc259
 Bc29d     LDY #0
           LDA VARNAM
           STA (TMPPTC),Y
           INY
           LDA VARNAM+1
           STA (TMPPTC),Y
           LDA #0
           INY
           STA (TMPPTC),Y
           INY
           STA (TMPPTC),Y
           INY
           STA (TMPPTC),Y
           INY
           STA (TMPPTC),Y
           INY
           STA (TMPPTC),Y
 Mc2b9     LDA TMPPTC
           CLC
           ADC #2
           LDY TMPPTC+1
           BCC Bc2c3
           INY
 Bc2c3     STA VARPTR
           STY VARPTR+1
           RTS

; **********************
  Array_Pointer_To_First
; **********************

           LDA COUNT
           ASL A
           ADC #5
           ADC TMPPTC
           LDY TMPPTC+1
           BCC Bc2d4
           INY
 Bc2d4     STA TMPPTA
           STY TMPPTA+1
           RTS

; ************
  Float_M32768
; ************

           .QUAD $90800000  -1870659584

; *********************
  Eval_Positive_Integer
; *********************

           JSR CHRGET
           JSR Eval_Expression

; ***************************
  Eval_Positive_Integer_Check
; ***************************

           JSR Is_Numeric
           LDA FAC1SI
           BMI Bc2f7

; ************
  Eval_Integer
; ************

           LDA FAC1EX
           CMP #$90
           BCC Bc2f9
           LDA #<Float_M32768
           LDY #>Float_M32768
           JSR Compare_FAC1_AY
 Bc2f7     BNE Jump_To_Illegal_Quantity
 Bc2f9     JMP FAC1_To_Integer

; **********
  Find_Array
; **********

           LDA DIMFLG
           ORA INTFLG
           PHA
           LDA VALTYP
           PHA
           LDY #0
 Bc306     TYA
           PHA
           LDA VARNAM+1
           PHA
           LDA VARNAM
           PHA
           JSR Eval_Positive_Integer
           PLA
           STA VARNAM
           PLA
           STA VARNAM+1
           PLA
           TAY
           TSX
           LDA STACK+2,X
           PHA
           LDA STACK+1,X
           PHA
           LDA FAC1M3
           STA STACK+2,X
           LDA FAC1M4
           STA STACK+1,X
           INY
           JSR CHRGOT
           CMP #$2c ; ','
           BEQ Bc306
           STY COUNT
           JSR Need_Right_Parenthesis
           PLA
           STA VALTYP
           PLA
           STA INTFLG
           AND #$7f
           STA DIMFLG
           LDX ARYTAB
           LDA ARYTAB+1
 Bc347     STX TMPPTC
           STA TMPPTC+1
           CMP STREND+1
           BNE Bc353
           CPX STREND
           BEQ Bc38c
 Bc353     LDY #0
           LDA (TMPPTC),Y
           INY
           CMP VARNAM
           BNE Bc362
           LDA VARNAM+1
           CMP (TMPPTC),Y
           BEQ Bc378
 Bc362     INY
           LDA (TMPPTC),Y
           CLC
           ADC TMPPTC
           TAX
           INY
           LDA (TMPPTC),Y
           ADC TMPPTC+1
           BCC Bc347

; *************
  Bad_Subscript
; *************

           LDX #$6b
           .BYTE $2c

; ************************
  Jump_To_Illegal_Quantity
; ************************

           LDX #$35 ; '5'
 Bc375     JMP Basic_Error
 Bc378     LDX #$78
           LDA DIMFLG
           BNE Bc375
           JSR Array_Pointer_To_First
           LDA COUNT
           LDY #4
           CMP (TMPPTC),Y
           BNE Bad_Subscript
           JMP Find_Array_Element
 Bc38c     JSR Array_Pointer_To_First
           JSR Check_Mem_Avail
           LDY #0
           STY TMPPTD+1
           LDX #5
           LDA VARNAM
           STA (TMPPTC),Y
           BPL Bc39f
           DEX
 Bc39f     INY
           LDA VARNAM+1
           STA (TMPPTC),Y
           BPL Bc3a8
           DEX
           DEX
 Bc3a8     STX TMPPTD
           LDA COUNT
           INY
           INY
           INY
           STA (TMPPTC),Y
 Bc3b1     LDX #11
           LDA #0
           BIT DIMFLG
           BVC Bc3c1
           PLA
           CLC
           ADC #1
           TAX
           PLA
           ADC #0
 Bc3c1     INY
           STA (TMPPTC),Y
           INY
           TXA
           STA (TMPPTC),Y
           JSR Compute_Array_Size
           STX TMPPTD
           STA TMPPTD+1
           LDY INDEXA
           DEC COUNT
           BNE Bc3b1
           ADC TMPPTA+1
           BCS Bc436
           STA TMPPTA+1
           TAY
           TXA
           ADC TMPPTA
           BCC Bc3e4
           INY
           BEQ Bc436
 Bc3e4     JSR Check_Mem_Avail
           STA STREND
           STY STREND+1
           LDA #0
           INC TMPPTD+1
           LDY TMPPTD
           BEQ Bc3f8
 Bc3f3     DEY
           STA (TMPPTA),Y
           BNE Bc3f3
 Bc3f8     DEC TMPPTA+1
           DEC TMPPTD+1
           BNE Bc3f3
           INC TMPPTA+1
           SEC
           LDA STREND
           SBC TMPPTC
           LDY #2
           STA (TMPPTC),Y
           LDA STREND+1
           INY
           SBC TMPPTC+1
           STA (TMPPTC),Y
           LDA DIMFLG
           BNE Bc476
           INY

; ******************
  Find_Array_Element
; ******************

           LDA (TMPPTC),Y
           STA COUNT
           LDA #0
           STA TMPPTD
 Bc41d     STA TMPPTD+1
           INY
           PLA
           TAX
           STA FAC1M3
           PLA
           STA FAC1M4
           CMP (TMPPTC),Y
           BCC Bc439
           BNE Bc433
           INY
           TXA
           CMP (TMPPTC),Y
           BCC Bc43a
 Bc433     JMP Bad_Subscript
 Bc436     JMP Mb3cd
 Bc439     INY
 Bc43a     LDA TMPPTD+1
           ORA TMPPTD
           CLC
           BEQ Bc44b
           JSR Compute_Array_Size
           TXA
           ADC FAC1M3
           TAX
           TYA
           LDY INDEXA
 Bc44b     ADC FAC1M4
           STX TMPPTD
           DEC COUNT
           BNE Bc41d
           STA TMPPTD+1
           LDX #5
           LDA VARNAM
           BPL Bc45c
           DEX
 Bc45c     LDA VARNAM+1
           BPL Bc462
           DEX
           DEX
 Bc462     STX FAC3M2
           LDA #0
           JSR Compute_Array_Size_A
           TXA
           ADC TMPPTA
           STA VARPTR
           TYA
           ADC TMPPTA+1
           STA VARPTR+1
           TAY
           LDA VARPTR
 Bc476     RTS

; ******************
  Compute_Array_Size
; ******************

           STY INDEXA
           LDA (TMPPTC),Y
           STA FAC3M2
           DEY
           LDA (TMPPTC),Y

; ********************
  Compute_Array_Size_A
; ********************

           STA FAC3M3
           LDA #16
           STA TMPVA2
           LDX #0
           LDY #0
 Bc48a     TXA
           ASL A
           TAX
           TYA
           ROL A
           TAY
           BCS Bc436
           ASL TMPPTD
           ROL TMPPTD+1
           BCC Bc4a3
           CLC
           TXA
           ADC FAC3M2
           TAX
           TYA
           ADC FAC3M3
           TAY
           BCS Bc436
 Bc4a3     DEC TMPVA2
           BNE Bc48a
           RTS

; *********
  Basic_FRE
; *********

           LDA VALTYP
           BEQ Bc4af
           JSR Get_String_Descriptor
 Bc4af     JSR Garbage_Collection
           SEC
           LDA FRETOP
           SBC STREND
           TAY
           LDA FRETOP+1
           SBC STREND+1

; ****************
  Integer_To_Float
; ****************

           LDX #0
           STX VALTYP
           STA FAC1M1
           STY FAC1M2
           LDX #$90
           JMP Mcd7a

; *********
  Basic_POS
; *********

           LDY CursorCol

; **********
  Y_To_Float
; **********

           LDA #0
           BEQ Integer_To_Float

; *****************
  Assert_Non_Direct
; *****************

           LDX CURLIN+1
           INX
           BNE Bc476
           LDX #$95
           .BYTE $2c

; ******************
  Undefined_Function
; ******************

           LDX #$e9
           JMP Basic_Error

; *********
  Basic_DEF
; *********

           JSR Get_FN
           JSR Assert_Non_Direct
           JSR Need_Left_Parenthesis
           LDA #$80
           STA SUBFLG
           JSR Get_Scalar_Address
           JSR Is_Numeric
           JSR Need_Right_Parenthesis
           LDA #$b2
           JSR Need_A
           PHA
           LDA VARPTR+1
           PHA
           LDA VARPTR
           PHA
           LDA TXTPTR+1
           PHA
           LDA TXTPTR
           PHA
           JSR Basic_DATA
           JMP Mc578

; ******
  Get_FN
; ******

           LDA #$a5
           JSR Need_A
           ORA #$80
           STA SUBFLG
           JSR Get_FN_Address
           STA FUNCPT
           STY FUNCPT+1
           JMP Is_Numeric

; ********
  Eval_FNX
; ********

           JSR Get_FN
           LDA FUNCPT+1
           PHA
           LDA FUNCPT
           PHA
           JSR Eval_In_Parenthesis
           JSR Is_Numeric
           PLA
           STA FUNCPT
           PLA
           STA FUNCPT+1
           LDY #2
           LDA (FUNCPT),Y
           STA VARPTR
           TAX
           INY
           LDA (FUNCPT),Y
           BEQ Undefined_Function
           STA VARPTR+1
           INY
 Bc541     LDA (VARPTR),Y
           PHA
           DEY
           BPL Bc541
           LDY VARPTR+1
           JSR Assign_FAC1_To_Var
           LDA TXTPTR+1
           PHA
           LDA TXTPTR
           PHA
           LDA (FUNCPT),Y
           STA TXTPTR
           INY
           LDA (FUNCPT),Y
           STA TXTPTR+1
           LDA VARPTR+1
           PHA
           LDA VARPTR
           PHA
           JSR Eval_Numeric
           PLA
           STA FUNCPT
           PLA
           STA FUNCPT+1
           JSR CHRGOT
           BEQ Bc572
           JMP Syntax_Error
 Bc572     PLA
           STA TXTPTR
           PLA
           STA TXTPTR+1
 Mc578     LDY #0
           PLA
           STA (FUNCPT),Y
           PLA
           INY
           STA (FUNCPT),Y
           PLA
           INY
           STA (FUNCPT),Y
           PLA
           INY
           STA (FUNCPT),Y
           PLA
           INY
           STA (FUNCPT),Y
           RTS

; *********
  Basic_STR
; *********

           JSR Is_Numeric
           LDY #0
           JSR Format_FAC1_Y
           PLA
           PLA
 Mc598     LDA #$ff
           LDY #0
           BEQ Create_String_Descriptor

; ********************
  Allocate_String_FAC1
; ********************

           LDX FAC1M3
           LDY FAC1M4
           STX DESCPT
           STY DESCPT+1

; *****************
  Allocate_String_A
; *****************

           JSR Allocate_String_Space
           STX FAC1M1
           STY FAC1M2
           STA FAC1EX
           RTS

; ************************
  Create_String_Descriptor
; ************************

           LDX #$22 ; '"'
           STX CHARAC
           STX ENDCHR

; ***************************
  Create_String_Descriptor_AY
; ***************************

           STA STRPTR
           STY FAC1M5
           STA FAC1M1
           STY FAC1M2
           LDY #$ff
 Bc5c0     INY
           LDA (STRPTR),Y
           BEQ Bc5d1
           CMP CHARAC
           BEQ Bc5cd
           CMP ENDCHR
           BNE Bc5c0
 Bc5cd     CMP #$22 ; '"'
           BEQ Bc5d2
 Bc5d1     CLC
 Bc5d2     STY FAC1EX
           TYA
           ADC STRPTR
           STA TMPPTD
           LDX FAC1M5
           BCC Bc5de
           INX
 Bc5de     STX TMPPTD+1
           LDA FAC1M5
           BEQ Bc5e8
           CMP #2
           BNE Push_String_Descriptor
 Bc5e8     TYA
           JSR Allocate_String_FAC1
           LDX STRPTR
           LDY FAC1M5
           JSR Store_String_XY

; **********************
  Push_String_Descriptor
; **********************

           LDX TEMPPT
           CPX #$1f
           BNE Bc5fe
           LDX #$c8
 Bc5fb     JMP Basic_Error
 Bc5fe     LDA FAC1EX
           STA Basic_USR,X
           LDA FAC1M1
           STA USRADD,X
           LDA FAC1M2
           STA USRADD+1,X
           LDY #0
           STX FAC1M3
           STY FAC1M4
           STY FAC1M5
           DEY
           STY VALTYP
           STX LASTPT
           INX
           INX
           INX
           STX TEMPPT
           RTS

; *********************
  Allocate_String_Space
; *********************

           LSR GARBFL
 Bc61f     TAX
           BEQ Bc65a
           PHA
           LDA FRETOP
           SEC
           SBC #2
           LDY FRETOP+1
           BCS Bc62d
           DEY
 Bc62d     STA INDEXA
           STY INDEXA+1
           TXA
           EOR #$ff
           SEC
           ADC INDEXA
           BCS Bc63a
           DEY
 Bc63a     CPY STREND+1
           BCC Bc65b
           BNE Bc644
           CMP STREND
           BCC Bc65b
 Bc644     STA FRESPC
           STY FRESPC+1
           LDY #1
           LDA #$ff
           STA (INDEXA),Y
           DEY
           PLA
           STA (INDEXA),Y
           LDX FRESPC
           LDY FRESPC+1
           STX FRETOP
           STY FRETOP+1
 Bc65a     RTS
 Bc65b     LDX #$4d ; 'M'
           LDA GARBFL
           BMI Bc5fb
           JSR Garbage_Collection
           SEC
           ROR GARBFL
           PLA
           BNE Bc61f

; ******************
  Garbage_Collection
; ******************

           LDY #0
           STY TMPPTA
           LDA MEMSIZ
           LDY MEMSIZ+1
           STA TMPPTC
           STA FUNCPT
           STA FRESPC
           STY TMPPTC+1
           STY FUNCPT+1
           STY FRESPC+1
 Mc67e     CPY FRETOP+1
           BCC Bc700
           BNE Bc68a
           CMP FRETOP
           BEQ Bc700
           BCC Bc700
 Bc68a     LDX TMPPTA
           BMI Bc693
           LDA #2
           JSR Jc735
 Bc693     JSR Jc724
           LDY #1
           LDA (FUNCPT),Y
           CMP #$ff
           BNE Bc6a9
 Bc69e     DEY
           LDA (FUNCPT),Y
           JSR Jc726
           SEC
           ROR TMPPTA
           BNE Mc67e
 Bc6a9     JSR Jc744
           LDX TMPPTA
           BPL Bc703
           LSR TMPPTA
 Bc6b2     LDY #0
           LDA (FUNCPT),Y
           STA (TMPPTC),Y
           INY
           LDA (FUNCPT),Y
           STA (TMPPTC),Y
           DEY
           LDA (INDEXA),Y
           TAX
           JSR Jc735
           STA FRESPC
           STY FRESPC+1
           TXA
           JSR Jc726
           TXA
           TAY
 Bc6ce     DEY
           LDA (FUNCPT),Y
           STA (TMPPTC),Y
           DEX
           BNE Bc6ce
           LDY #2
 Bc6d8     LDA TMPVA2+1,Y
           STA (INDEXA),Y
           DEY
           BNE Bc6d8
           LDA FUNCPT
           LDY FUNCPT+1
           CPY FRETOP+1
           BCC Bc700
           BNE Bc6f0
           CMP FRETOP
           BEQ Bc700
           BCC Bc700
 Bc6f0     JSR Jc71f
           LDY #1
           LDA (FUNCPT),Y
           CMP #$ff
           BEQ Bc69e
           JSR Jc744
           BMI Bc6b2
 Bc700     JMP Mc716
 Bc703     LDY #0
           LDA (INDEXA),Y
           TAX
           JSR Jc735
           STA FRESPC
           STY FRESPC+1
           TXA
           JSR Jc726
           JMP Mc67e
 Mc716     LDA FRESPC
           LDY FRESPC+1
           STA FRETOP
           STY FRETOP+1
           RTS

; *****
  Jc71f
; *****

           LDA #2
           JSR Jc735

; *****
  Jc724
; *****

           LDA #2

; *****
  Jc726
; *****

           EOR #$ff
           SEC
           ADC FUNCPT
           LDY FUNCPT+1
           BCS Bc730
           DEY
 Bc730     STA FUNCPT
           STY FUNCPT+1
           RTS

; *****
  Jc735
; *****

           EOR #$ff
           SEC
           ADC TMPPTC
           LDY TMPPTC+1
           BCS Bc73f
           DEY
 Bc73f     STA TMPPTC
           STY TMPPTC+1
           RTS

; *****
  Jc744
; *****

           LDY #1
 Bc746     LDA (FUNCPT),Y
           STA INDEXA,Y
           DEY
           BPL Bc746
           RTS

; ***********
  Concatenate
; ***********

           LDA FAC1M4
           PHA
           LDA FAC1M3
           PHA
           JSR Evaluate
           JSR Assert_String_Type
           PLA
           STA STRPTR
           PLA
           STA FAC1M5
           LDY #0
           LDA (STRPTR),Y
           CLC
           ADC (FAC1M3),Y
           BCC Bc76f
           LDX #$b0
           JMP Basic_Error
 Bc76f     JSR Allocate_String_FAC1
           JSR Store_String_STRPTR
           LDA DESCPT
           LDY DESCPT+1
           JSR Get_String_Descriptor_AY
           JSR Store_String_INDEXA
           LDA STRPTR
           LDY FAC1M5
           JSR Get_String_Descriptor_AY
           JSR Push_String_Descriptor
           JMP Mbdb2

; *******************
  Store_String_STRPTR
; *******************

           LDY #0
           LDA (STRPTR),Y
           PHA
           INY
           LDA (STRPTR),Y
           TAX
           INY
           LDA (STRPTR),Y
           TAY
           PLA

; ***************
  Store_String_XY
; ***************

           STX INDEXA
           STY INDEXA+1

; *******************
  Store_String_INDEXA
; *******************

           TAY
           BEQ Bc7ab
           PHA
 Bc7a2     DEY
           LDA (INDEXA),Y
           STA (FRESPC),Y
           TYA
           BNE Bc7a2
           PLA
 Bc7ab     CLC
           ADC FRESPC
           STA FRESPC
           BCC Bc7b4
           INC FRESPC+1
 Bc7b4     RTS

; ***********
  Eval_String
; ***********

           JSR Assert_String_Type

; *********************
  Get_String_Descriptor
; *********************

           LDA FAC1M3
           LDY FAC1M4

; ************************
  Get_String_Descriptor_AY
; ************************

           STA INDEXA
           STY INDEXA+1
           JSR Pop_Descriptor_Stack
           BNE Bc7fe
           JSR Load_String_Descriptor
           BCC Bc7fe
           DEY
           LDA #$ff
           STA (INDEXA),Y
           DEY
           TXA
           STA (INDEXA),Y
           PHA
           EOR #$ff
           SEC
           ADC INDEXA
           LDY INDEXA+1
           BCS Bc7de
           DEY
 Bc7de     STA INDEXA
           STY INDEXA+1
           TAX
           PLA
           CPY FRETOP+1
           BNE Bc821
           CPX FRETOP
           BNE Bc821
           PHA
           SEC
           ADC FRETOP
           STA FRETOP
           BCC Bc7f6
           INC FRETOP+1
 Bc7f6     INC FRETOP
           BNE Bc7fc
           INC FRETOP+1
 Bc7fc     PLA
           RTS
 Bc7fe     LDY #0
           LDA (INDEXA),Y
           PHA
           INY
           LDA (INDEXA),Y
           TAX
           INY
           LDA (INDEXA),Y
           TAY
           STX INDEXA
           STY INDEXA+1
           PLA
           RTS

; ********************
  Pop_Descriptor_Stack
; ********************

           CPY LASTPT+1
           BNE Bc821
           CMP LASTPT
           BNE Bc821
           STA TEMPPT
           SBC #3
           STA LASTPT
           LDY #0
 Bc821     RTS

; *********
  Basic_CHR
; *********

           JSR Eval_Byte
           TXA
           PHA
           LDA #1
           JSR Allocate_String_A
           PLA
           LDY #0
           STA (FAC1M1),Y
           PLA
           PLA
           JMP Push_String_Descriptor

; **********
  Basic_LEFT
; **********

           JSR Pop_String_Descriptor_And_Byte
           CMP (DESCPT),Y
           TYA
 Mc83c     BCC Bc842
           LDA (DESCPT),Y
           TAX
           TYA
 Bc842     PHA
 Bc843     TXA
 Bc844     PHA
           JSR Allocate_String_A
           LDA DESCPT
           LDY DESCPT+1
           JSR Get_String_Descriptor_AY
           PLA
           TAY
           PLA
           CLC
           ADC INDEXA
           STA INDEXA
           BCC Bc85b
           INC INDEXA+1
 Bc85b     TYA
           JSR Store_String_INDEXA
           JMP Push_String_Descriptor

; ***********
  Basic_RIGHT
; ***********

           JSR Pop_String_Descriptor_And_Byte
           CLC
           SBC (DESCPT),Y
           EOR #$ff
           JMP Mc83c

; *********
  Basic_MID
; *********

           LDA #$ff
           STA FAC1M4
           JSR CHRGOT
           CMP #$29 ; ')'
           BEQ Bc87e
           JSR Need_Comma
           JSR Get_Byte_Value
 Bc87e     JSR Pop_String_Descriptor_And_Byte
           BEQ Bc8ce
           DEX
           TXA
           PHA
           CLC
           LDX #0
           SBC (DESCPT),Y
           BCS Bc843
           EOR #$ff
           CMP FAC1M4
           BCC Bc844
           LDA FAC1M4
           BCS Bc844

; ******************************
  Pop_String_Descriptor_And_Byte
; ******************************

           JSR Need_Right_Parenthesis
           PLA
           TAY
           PLA
           STA FUNJMP
           PLA
           PLA
           PLA
           TAX
           PLA
           STA DESCPT
           PLA
           STA DESCPT+1
           LDA FUNJMP
           PHA
           TYA
           PHA
           LDY #0
           TXA
           RTS

; *********
  Basic_LEN
; *********

           JSR Eval_String_And_Len
           JMP Y_To_Float

; *******************
  Eval_String_And_Len
; *******************

           JSR Eval_String
           LDX #0
           STX VALTYP
           TAY
           RTS

; *********
  Basic_ASC
; *********

           JSR Eval_String_And_Len
           BEQ Bc8ce
           LDY #0
           LDA (INDEXA),Y
           TAY
           JMP Y_To_Float
 Bc8ce     JMP Jump_To_Illegal_Quantity

; *******************
  Get_Next_Byte_Value
; *******************

           JSR CHRGET

; **************
  Get_Byte_Value
; **************

           JSR Eval_Numeric

; *********
  Eval_Byte
; *********

           JSR Eval_Positive_Integer_Check
           LDX FAC1M3
           BNE Bc8ce
           LDX FAC1M4
           JMP CHRGOT

; *********
  Basic_VAL
; *********

           JSR Eval_String_And_Len
           BNE Bc8eb
           JMP Clear_FAC1_Exp_And_Sign
 Bc8eb     LDX TXTPTR
           LDY TXTPTR+1
           STX TMPPTD
           STY TMPPTD+1
           LDX INDEXA
           STX TXTPTR
           CLC
           ADC INDEXA
           STA INDEXB
           LDX INDEXA+1
           STX TXTPTR+1
           BCC Bc903
           INX
 Bc903     STX INDEXB+1
           LDY #0
           LDA (INDEXB),Y
           PHA
           TYA
           STA (INDEXB),Y
           JSR CHRGOT
           JSR Load_FAC1_From_String
           PLA
           LDY #0
           STA (INDEXB),Y

; *************************
  Restore_Execution_Pointer
; *************************

           LDX TMPPTD
           LDY TMPPTD+1
           STX TXTPTR
           STY TXTPTR+1
           RTS

; *****************
  Get_Word_And_Byte
; *****************

           JSR Eval_Numeric
           JSR FAC1_To_LINNUM

; *******************
  Need_Comma_Get_Byte
; *******************

           JSR Need_Comma
           JMP Get_Byte_Value

; **************
  FAC1_To_LINNUM
; **************

           LDA FAC1SI
           BMI Bc8ce
           LDA FAC1EX
           CMP #$91
           BCS Bc8ce
           JSR FAC1_To_Integer
           LDA FAC1M3
           LDY FAC1M4
           STY LINNUM
           STA LINNUM+1
           RTS

; **********
  Basic_PEEK
; **********

           LDA LINNUM+1
           PHA
           LDA LINNUM
           PHA
           JSR FAC1_To_LINNUM
           LDY #0
           LDA (LINNUM),Y
           TAY
           PLA
           STA LINNUM
           PLA
           STA LINNUM+1
           JMP Y_To_Float

; **********
  Basic_POKE
; **********

           JSR Get_Word_And_Byte
           TXA
           LDY #0
           STA (LINNUM),Y
           RTS

; **********
  Basic_WAIT
; **********

           JSR Get_Word_And_Byte
           STX FORPNT
           LDX #0
           JSR CHRGOT
           BEQ Bc972
           JSR Need_Comma_Get_Byte
 Bc972     STX FORPNT+1
           LDY #0
 Bc976     LDA (LINNUM),Y
           EOR FORPNT+1
           AND FORPNT
           BEQ Bc976
 Bc97e     RTS

; ***************
  Add_0_5_To_FAC1
; ***************

           LDA #<Float_0_5
           LDY #>Float_0_5
           JMP Add_Var_AY_To_FAC1

; *************
  AY_Minus_FAC1
; *************

           JSR Load_FAC2_From_AY

; ***********
  Basic_MINUS
; ***********

           LDA FAC1SI
           EOR #$ff
           STA FAC1SI
           EOR FAC2SI
           STA STRPTR
           LDA FAC1EX
           JMP Basic_PLUS
 Bc998     JSR Shift_FACX_A
           BCC Bc9d9

; ******************
  Add_Var_AY_To_FAC1
; ******************

           JSR Load_FAC2_From_AY

; **********
  Basic_PLUS
; **********

           BNE Bc9a5
           JMP FAC2_To_FAC1
 Bc9a5     LDX FAC1M5
           STX FUNJMP+1
           LDX #$66
           LDA FAC2EX

; ****************
  Add_FAC2_To_FAC1
; ****************

           TAY
           BEQ Bc97e
           SEC
           SBC FAC1EX
           BEQ Bc9d9
           BCC Bc9c9
           STY FAC1EX
           LDY FAC2SI
           STY FAC1SI
           EOR #$ff
           ADC #0
           LDY #0
           STY FUNJMP+1
           LDX #$5e ; '^'
           BNE Bc9cd
 Bc9c9     LDY #0
           STY FAC1M5
 Bc9cd     CMP #$f9
           BMI Bc998
           TAY
           LDA FAC1M5
           LSR USRADD,X
           JSR Shift_FACX_Right_Y
 Bc9d9     BIT STRPTR
           BPL Bca34
           LDY #$5e ; '^'
           CPX #$66
           BEQ Bc9e5
           LDY #$66
 Bc9e5     SEC
           EOR #$ff
           ADC FUNJMP+1
           STA FAC1M5
           LDA ENDCHR,Y
           SBC ENDCHR,X
           STA FAC1M4
           LDA CHARAC,Y
           SBC CHARAC,X
           STA FAC1M3
           LDA USRADD+1,Y
           SBC USRADD+1,X
           STA FAC1M2
           LDA USRADD,Y
           SBC USRADD,X
           STA FAC1M1
 Mca08     BCS Normalise_FAC1
           JSR Negate_FAC1

; **************
  Normalise_FAC1
; **************

           LDY #0
           TYA
           CLC
 Bca11     LDX FAC1M1
           BNE Bca5f
           LDX FAC1M2
           STX FAC1M1
           LDX FAC1M3
           STX FAC1M2
           LDX FAC1M4
           STX FAC1M3
           LDX FAC1M5
           STX FAC1M4
           STY FAC1M5
           ADC #8
           CMP #$20 ; ' '
           BNE Bca11

; ***********************
  Clear_FAC1_Exp_And_Sign
; ***********************

           LDA #0
 Mca2f     STA FAC1EX
 Mca31     STA FAC1SI
           RTS
 Bca34     ADC FUNJMP+1
           STA FAC1M5
           LDA FAC1M4
           ADC FAC2M4
           STA FAC1M4
           LDA FAC1M3
           ADC FAC2M3
           STA FAC1M3
           LDA FAC1M2
           ADC FAC2M2
           STA FAC1M2
           LDA FAC1M1
           ADC FAC2M1
           STA FAC1M1
           JMP Test_And_Normalize_FAC1
 Bca53     ADC #1
           ASL FAC1M5
           ROL FAC1M4
           ROL FAC1M3
           ROL FAC1M2
           ROL FAC1M1
 Bca5f     BPL Bca53
           SEC
           SBC FAC1EX
           BCS Clear_FAC1_Exp_And_Sign
           EOR #$ff
           ADC #1
           STA FAC1EX

; ***********************
  Test_And_Normalize_FAC1
; ***********************

           BCC Bca7c
 Mca6e     INC FAC1EX
           BEQ Overflow_Error
           ROR FAC1M1
           ROR FAC1M2
           ROR FAC1M3
           ROR FAC1M4
           ROR FAC1M5
 Bca7c     RTS

; ***********
  Negate_FAC1
; ***********

           LDA FAC1SI
           EOR #$ff
           STA FAC1SI

; ********************
  Negate_FAC1_Mantissa
; ********************

           LDA FAC1M1
           EOR #$ff
           STA FAC1M1
           LDA FAC1M2
           EOR #$ff
           STA FAC1M2
           LDA FAC1M3
           EOR #$ff
           STA FAC1M3
           LDA FAC1M4
           EOR #$ff
           STA FAC1M4
           LDA FAC1M5
           EOR #$ff
           STA FAC1M5
           INC FAC1M5
           BNE Bcab3

; *****************
  Inc_FAC1_Mantissa
; *****************

           INC FAC1M4
           BNE Bcab3
           INC FAC1M3
           BNE Bcab3
           INC FAC1M2
           BNE Bcab3
           INC FAC1M1
 Bcab3     RTS

; **************
  Overflow_Error
; **************

           LDX #$45 ; 'E'
           JMP Basic_Error

; **********
  Shift_FAC3
; **********

           LDX #$22 ; '"'
 Bcabb     LDY ENDCHR,X
           STY FAC1M5
           LDY CHARAC,X
           STY ENDCHR,X
           LDY USRADD+1,X
           STY CHARAC,X
           LDY USRADD,X
           STY USRADD+1,X
           LDY BITS
           STY USRADD,X

; ************
  Shift_FACX_A
; ************

           ADC #8
           BMI Bcabb
           BEQ Bcabb
           SBC #8
           TAY
           LDA FAC1M5
           BCS Bcaf0
 Bcadc     ASL USRADD,X
           BCC Bcae2
           INC USRADD,X
 Bcae2     ROR USRADD,X
           ROR USRADD,X

; ******************
  Shift_FACX_Right_Y
; ******************

           ROR USRADD+1,X
           ROR CHARAC,X
           ROR ENDCHR,X
           ROR A
           INY
           BNE Bcadc
 Bcaf0     CLC
           RTS

; ******
  REAL_1
; ******

           .REAL $8100000000;    1.00000000000
 VLOG_A    .BYTE $03
           .REAL $7f5e56cb79;    0.43425594189
           .REAL $80139b0b64;    0.57658454124
           .REAL $8076389316;    0.96180075919
           .REAL $8238aa3b20;    2.88539007306

; ***********
  HALF_SQRT_2
; ***********

           .REAL $803504f334;    0.70710678119
 SQRT_2    .REAL $813504f334;    1.41421356238

; *********
  MINUS_0_5
; *********

           .REAL $8080000000;   -0.50000000000
 LN_2      .REAL $80317217f8;    0.69314718060

; *********
  Basic_LOG
; *********

           JSR Get_FAC1_Sign
           BEQ Bcb27
           BPL Bcb2a
 Bcb27     JMP Jump_To_Illegal_Quantity
 Bcb2a     LDA FAC1EX
           SBC #$7f
           PHA
           LDA #$80
           STA FAC1EX
           LDA #<HALF_SQRT_2
           LDY #>HALF_SQRT_2
           JSR Add_Var_AY_To_FAC1
           LDA #<SQRT_2
           LDY #>SQRT_2
           JSR AY_Divided_By_FAC1
           LDA #<REAL_1
           LDY #>REAL_1
           JSR AY_Minus_FAC1
           LDA #<VLOG_A
           LDY #>VLOG_A
           JSR Square_And_Series_Eval
           LDA #<MINUS_0_5
           LDY #>MINUS_0_5
           JSR Add_Var_AY_To_FAC1
           PLA
           JSR Add_A_To_FAC1
           LDA #<LN_2
           LDY #>LN_2

; *********************
  Multiply_FAC1_With_AY
; *********************

           JSR Load_FAC2_From_AY

; **************
  Basic_MULTIPLY
; **************

           BNE Bcb66
           JMP Mcbc1
 Bcb66     JSR Check_FACs
           LDA #0
           STA FAC3EX
           STA FAC3M1
           STA FAC3M2
           STA FAC3M3
           LDA FAC1M5
           JSR Mult_SubA
           LDA FAC1M4
           JSR Mult_SubA
           LDA FAC1M3
           JSR Mult_SubA
           LDA FAC1M2
           JSR Mult_SubA
           LDA FAC1M1
           JSR Mult_SubB
           JMP FAC3_To_FAC1

; *********
  Mult_SubA
; *********

           BNE Mult_SubB
           JMP Shift_FAC3

; *********
  Mult_SubB
; *********

           LSR A
           ORA #$80
 Bcb97     TAY
           BCC Bcbb3
           CLC
           LDA FAC3M3
           ADC FAC2M4
           STA FAC3M3
           LDA FAC3M2
           ADC FAC2M3
           STA FAC3M2
           LDA FAC3M1
           ADC FAC2M2
           STA FAC3M1
           LDA FAC3EX
           ADC FAC2M1
           STA FAC3EX
 Bcbb3     ROR FAC3EX
           ROR FAC3M1
           ROR FAC3M2
           ROR FAC3M3
           ROR FAC1M5
           TYA
           LSR A
           BNE Bcb97
 Mcbc1     RTS

; *****************
  Load_FAC2_From_AY
; *****************

           STA INDEXA
           STY INDEXA+1
           LDY #4
           LDA (INDEXA),Y
           STA FAC2M4
           DEY
           LDA (INDEXA),Y
           STA FAC2M3
           DEY
           LDA (INDEXA),Y
           STA FAC2M2
           DEY
           LDA (INDEXA),Y
           STA FAC2SI
           EOR FAC1SI
           STA STRPTR
           LDA FAC2SI
           ORA #$80
           STA FAC2M1
           DEY
           LDA (INDEXA),Y
           STA FAC2EX
           LDA FAC1EX
           RTS

; **********
  Check_FACs
; **********

           LDA FAC2EX

; ************
  Check_FACs_A
; ************

           BEQ Bcc10
           CLC
           ADC FAC1EX
           BCC Bcbfa
           BMI Bcc15
           CLC
           .BYTE $2c
 Bcbfa     BPL Bcc10
           ADC #$80
           STA FAC1EX
           BNE Bcc05
           JMP Mca31
 Bcc05     LDA STRPTR
           STA FAC1SI
           RTS

; **************
  Check_Overflow
; **************

           LDA FAC1SI
           EOR #$ff
           BMI Bcc15
 Bcc10     PLA
           PLA
           JMP Clear_FAC1_Exp_And_Sign
 Bcc15     JMP Overflow_Error

; *******************
  Multiply_FAC1_BY_10
; *******************

           JSR FAC1_Round_And_Copy_To_FAC2
           TAX
           BEQ Bcc2e
           CLC
           ADC #2
           BCS Bcc15

; ******************
  Multiply_FAC1_By_4
; ******************

           LDX #0
           STX STRPTR
           JSR Add_FAC2_To_FAC1
           INC FAC1EX
           BEQ Bcc15
 Bcc2e     RTS

; ********
  Float_10
; ********

           .REAL $8420000000;   10.00000000000

; *****************
  Divide_FAC1_By_10
; *****************

           JSR FAC1_Round_And_Copy_To_FAC2
           LDA #$2f ; '/'
           LDY #$cc
           LDX #0

; *****************
  Divide_FAC2_By_AY
; *****************

           STX STRPTR
           JSR Load_FAC1_AY
           JMP Basic_DIVIDE

; ******************
  AY_Divided_By_FAC1
; ******************

           JSR Load_FAC2_From_AY

; ************
  Basic_DIVIDE
; ************

           BEQ Divide_By_Zero
           JSR Round_FAC1_Checked
           LDA #0
           SEC
           SBC FAC1EX
           STA FAC1EX
           JSR Check_FACs
           INC FAC1EX
           BEQ Bcc15
           LDX #$fc
           LDA #1
 Bcc5f     LDY FAC2M1
           CPY FAC1M1
           BNE Bcc75
           LDY FAC2M2
           CPY FAC1M2
           BNE Bcc75
           LDY FAC2M3
           CPY FAC1M3
           BNE Bcc75
           LDY FAC2M4
           CPY FAC1M4
 Bcc75     PHP
           ROL A
           BCC Bcc82
           INX
           STA FAC3M3,X
           BEQ Bccb0
           BPL Bccb4
           LDA #1
 Bcc82     PLP
           BCS Bcc93
 Mcc85     ASL FAC2M4
           ROL FAC2M3
           ROL FAC2M2
           ROL FAC2M1
           BCS Bcc75
           BMI Bcc5f
           BPL Bcc75
 Bcc93     TAY
           LDA FAC2M4
           SBC FAC1M4
           STA FAC2M4
           LDA FAC2M3
           SBC FAC1M3
           STA FAC2M3
           LDA FAC2M2
           SBC FAC1M2
           STA FAC2M2
           LDA FAC2M1
           SBC FAC1M1
           STA FAC2M1
           TYA
           JMP Mcc85
 Bccb0     LDA #$40 ; '@'
           BNE Bcc82
 Bccb4     ASL A
           ASL A
           ASL A
           ASL A
           ASL A
           ASL A
           STA FAC1M5
           PLP
           JMP FAC3_To_FAC1

; **************
  Divide_By_Zero
; **************

           LDX #$85
           JMP Basic_Error

; ************
  FAC3_To_FAC1
; ************

           LDA FAC3EX
           STA FAC1M1
           LDA FAC3M1
           STA FAC1M2
           LDA FAC3M2
           STA FAC1M3
           LDA FAC3M3
           STA FAC1M4
           JMP Normalise_FAC1

; ************
  Load_FAC1_AY
; ************

           STA INDEXA
           STY INDEXA+1
           LDY #4
           LDA (INDEXA),Y
           STA FAC1M4
           DEY
           LDA (INDEXA),Y
           STA FAC1M3
           DEY
           LDA (INDEXA),Y
           STA FAC1M2
           DEY
           LDA (INDEXA),Y
           STA FAC1SI
           ORA #$80
           STA FAC1M1
           DEY
           LDA (INDEXA),Y
           STA FAC1EX
           STY FAC1M5
           RTS

; **************
  FAC1_To_FACTPB
; **************

           LDX #$59 ; 'Y'
           .BYTE $2c

; **************
  FAC1_To_FACTPA
; **************

           LDX #<FACTPA
           LDY #>FACTPA
           BEQ Assign_FAC1_To_Var

; ************************
  Assign_FAC1_To_FOR_Index
; ************************

           LDX FORPNT
           LDY FORPNT+1

; ******************
  Assign_FAC1_To_Var
; ******************

           JSR Round_FAC1_Checked
           STX INDEXA
           STY INDEXA+1
           LDY #4
           LDA FAC1M4
           STA (INDEXA),Y
           DEY
           LDA FAC1M3
           STA (INDEXA),Y
           DEY
           LDA FAC1M2
           STA (INDEXA),Y
           DEY
           LDA FAC1SI
           ORA #$7f
           AND FAC1M1
           STA (INDEXA),Y
           DEY
           LDA FAC1EX
           STA (INDEXA),Y
           STY FAC1M5
           RTS

; ************
  FAC2_To_FAC1
; ************

           LDA FAC2SI

; *********************
  Copy_ABS_FAC2_To_FAC1
; *********************

           STA FAC1SI
           LDX #5
 Bcd38     LDA BITS,X
           STA TMPPTC+1,X
           DEX
           BNE Bcd38
           STX FAC1M5
           RTS

; ***************************
  FAC1_Round_And_Copy_To_FAC2
; ***************************

           JSR Round_FAC1_Checked

; ************
  FAC1_To_FAC2
; ************

           LDX #6
 Bcd47     LDA TMPPTC+1,X
           STA BITS,X
           DEX
           BNE Bcd47
           STX FAC1M5
 Bcd50     RTS

; ******************
  Round_FAC1_Checked
; ******************

           LDA FAC1EX
           BEQ Bcd50
           ASL FAC1M5
           BCC Bcd50

; **********
  Round_FAC1
; **********

           JSR Inc_FAC1_Mantissa
           BNE Bcd50
           JMP Mca6e

; *************
  Get_FAC1_Sign
; *************

           LDA FAC1EX
           BEQ Bcd6e
 Bcd65     LDA FAC1SI
 Mcd67     ROL A
           LDA #$ff
           BCS Bcd6e
           LDA #1
 Bcd6e     RTS

; *********
  Basic_SGN
; *********

           JSR Get_FAC1_Sign

; *********
  A_To_FAC1
; *********

           STA FAC1M1
           LDA #0
           STA FAC1M2
           LDX #$88
 Mcd7a     LDA FAC1M1
           EOR #$ff
           ROL A

; ************************
  Convert_Integer_To_Float
; ************************

           LDA #0
           STA FAC1M4
           STA FAC1M3
 Mcd85     STX FAC1EX
           STA FAC1M5
           STA FAC1SI
           JMP Mca08

; *********
  Basic_ABS
; *********

           LSR FAC1SI
           RTS

; ***************
  Compare_FAC1_AY
; ***************

           STA INDEXB

; *********************
  Compare_FAC1_INDEXB_Y
; *********************

           STY INDEXB+1
           LDY #0
           LDA (INDEXB),Y
           INY
           TAX
           BEQ Get_FAC1_Sign
           LDA (INDEXB),Y
           EOR FAC1SI
           BMI Bcd65
           CPX FAC1EX
           BNE Bcdc8
           LDA (INDEXB),Y
           ORA #$80
           CMP FAC1M1
           BNE Bcdc8
           INY
           LDA (INDEXB),Y
           CMP FAC1M2
           BNE Bcdc8
           INY
           LDA (INDEXB),Y
           CMP FAC1M3
           BNE Bcdc8
           INY
           LDA #$7f
           CMP FAC1M5
           LDA (INDEXB),Y
           SBC FAC1M4
           BEQ Bcdf0
 Bcdc8     LDA FAC1SI
           BCC Bcdce
           EOR #$ff
 Bcdce     JMP Mcd67

; ***************
  FAC1_To_Integer
; ***************

           LDA FAC1EX
           BEQ Bce1f
           SEC
           SBC #$a0
           BIT FAC1SI
           BPL Bcde5
           TAX
           LDA #$ff
           STA BITS
           JSR Negate_FAC1_Mantissa
           TXA
 Bcde5     LDX #$5e ; '^'
           CMP #$f9
           BPL Bcdf1
           JSR Shift_FACX_A
           STY BITS
 Bcdf0     RTS
 Bcdf1     TAY
           LDA FAC1SI
           AND #$80
           LSR FAC1M1
           ORA FAC1M1
           STA FAC1M1
           JSR Shift_FACX_Right_Y
           STY BITS
           RTS

; *********
  Basic_INT
; *********

           LDA FAC1EX
           CMP #$a0
           BCS Bce28
           JSR FAC1_To_Integer
           STY FAC1M5
           LDA FAC1SI
           STY FAC1SI
           EOR #$80
           ROL A
           LDA #$a0
           STA FAC1EX
           LDA FAC1M4
           STA CHARAC
           JMP Mca08
 Bce1f     STA FAC1M1
           STA FAC1M2
           STA FAC1M3
           STA FAC1M4
           TAY
 Bce28     RTS

; *********************
  Load_FAC1_From_String
; *********************

           LDY #0
           LDX #10
 Bce2d     STY TMPVA2,X
           DEX
           BPL Bce2d
           BCC Bce43
           CMP #$2d ; '-'
           BNE Bce3c
           STX SGNFLG
           BEQ Mce40
 Bce3c     CMP #$2b ; '+'
           BNE Bce45
 Mce40     JSR CHRGET
 Bce43     BCC Bcea0
 Bce45     CMP #$2e ; '.'
           BEQ Bce77
           CMP #$45 ; 'E'
           BNE Bce7d
           JSR CHRGET
           BCC Bce69
           CMP #$ab
           BEQ Bce64
           CMP #$2d ; '-'
           BEQ Bce64
           CMP #$aa
           BEQ Mce66
           CMP #$2b ; '+'
           BEQ Mce66
           BNE Bce6b
 Bce64     ROR TMPPTC+1
 Mce66     JSR CHRGET
 Bce69     BCC Bcec7
 Bce6b     BIT TMPPTC+1
           BPL Bce7d
           LDA #0
           SEC
           SBC TMPVA2+1
           JMP Mce7f
 Bce77     ROR TMPPTC
           BIT TMPPTC
           BVC Mce40
 Bce7d     LDA TMPVA2+1
 Mce7f     SEC
           SBC TMPVA2
           STA TMPVA2+1
           BEQ Bce98
           BPL Bce91
 Bce88     JSR Divide_FAC1_By_10
           INC TMPVA2+1
           BNE Bce88
           BEQ Bce98
 Bce91     JSR Multiply_FAC1_BY_10
           DEC TMPVA2+1
           BNE Bce91
 Bce98     LDA SGNFLG
           BMI Bce9d
           RTS
 Bce9d     JMP Basic_GREATER
 Bcea0     PHA
           BIT TMPPTC
           BPL Bcea7
           INC TMPVA2
 Bcea7     JSR Multiply_FAC1_BY_10
           PLA
           SEC
           SBC #$30 ; '0'
           JSR Add_A_To_FAC1
           JMP Mce40

; *************
  Add_A_To_FAC1
; *************

           PHA
           JSR FAC1_Round_And_Copy_To_FAC2
           PLA
           JSR A_To_FAC1
           LDA FAC2SI
           EOR FAC1SI
           STA STRPTR
           LDX FAC1EX
           JMP Basic_PLUS
 Bcec7     LDA TMPVA2+1
           CMP #10
           BCC Bced6
           LDA #$64
           BIT TMPPTC+1
           BMI Bcee4
           JMP Overflow_Error
 Bced6     ASL A
           ASL A
           CLC
           ADC TMPVA2+1
           ASL A
           CLC
           LDY #0
           ADC (TXTPTR),Y
           SEC
           SBC #$30 ; '0'
 Bcee4     STA TMPVA2+1
           JMP Mce66

; *********
  MAXREAL_A
; *********

           .REAL $9b3ebc1ffd; 99999999.90625000000

; *********
  MAXREAL_B
; *********

           .REAL $9e6e6b27fd; 999999999.25000000000

; *********
  MAXREAL_C
; *********

           .REAL $9e6e6b2800; 1000000000.00000000000
           .BYTE $f9
           .FILL $cf78-* ($aa) ;  127 bytes

; ********
  Print_IN
; ********

           LDA #<Msg_IN
           LDY #>Msg_IN
           JSR To_Print_String
           LDA CURLIN+1
           LDX CURLIN

; ****************
  Print_Integer_XA
; ****************

           STA FAC1M1
           STX FAC1M2
           LDX #$90
           SEC
           JSR Convert_Integer_To_Float
           JSR Format_FAC1

; ***************
  To_Print_String
; ***************

           JMP Print_String

; ***********
  Format_FAC1
; ***********

           LDY #1

; *************
  Format_FAC1_Y
; *************

           LDA #$20 ; ' '
           BIT FAC1SI
           BPL Bcf9d
           LDA #$2d ; '-'
 Bcf9d     STA STACK-1,Y
           STA FAC1SI
           STY TMPPTD
           INY
           LDA #$30 ; '0'
           LDX FAC1EX
           BNE Bcfae
           JMP Md0ba
 Bcfae     LDA #0
           CPX #$80
           BEQ Bcfb6
           BCS Bcfbf
 Bcfb6     LDA #<MAXREAL_C
           LDY #>MAXREAL_C
           JSR Multiply_FAC1_With_AY
           LDA #$f7
 Bcfbf     STA TMPVA2
 Bcfc1     LDA #<MAXREAL_B
           LDY #>MAXREAL_B
           JSR Compare_FAC1_AY
           BEQ Bcfe8
           BPL Bcfde
 Bcfcc     LDA #<MAXREAL_A
           LDY #>MAXREAL_A
           JSR Compare_FAC1_AY
           BEQ Bcfd7
           BPL Bcfe5
 Bcfd7     JSR Multiply_FAC1_BY_10
           DEC TMPVA2
           BNE Bcfcc
 Bcfde     JSR Divide_FAC1_By_10
           INC TMPVA2
           BNE Bcfc1
 Bcfe5     JSR Add_0_5_To_FAC1
 Bcfe8     JSR FAC1_To_Integer
           LDX #1
           LDA TMPVA2
           CLC
           ADC #10
           BMI Bcffd
           CMP #11
           BCS Bcffe
           ADC #$ff
           TAX
           LDA #2
 Bcffd     SEC
 Bcffe     SBC #2
           STA TMPVA2+1
           STX TMPVA2
           TXA
           BEQ Bd009
           BPL Bd01c
 Bd009     LDY TMPPTD
           LDA #$2e ; '.'
           INY
           STA STACK-1,Y
           TXA
           BEQ Bd01a
           LDA #$30 ; '0'
           INY
           STA STACK-1,Y
 Bd01a     STY TMPPTD
 Bd01c     LDY #0

; *****************
  Format_Jiffyclock
; *****************

           LDX #$80
 Bd020     LDA FAC1M4
           CLC
           ADC Decimal_Conversion_Table+3,Y
           STA FAC1M4
           LDA FAC1M3
           ADC Decimal_Conversion_Table+2,Y
           STA FAC1M3
           LDA FAC1M2
           ADC Decimal_Conversion_Table+1,Y
           STA FAC1M2
           LDA FAC1M1
           ADC Decimal_Conversion_Table,Y
           STA FAC1M1
           INX
           BCS Bd044
           BPL Bd020
           BMI Bd046
 Bd044     BMI Bd020
 Bd046     TXA
           BCC Bd04d
           EOR #$ff
           ADC #10
 Bd04d     ADC #$2f ; '/'
           INY
           INY
           INY
           INY
           STY VARPTR
           LDY TMPPTD
           INY
           TAX
           AND #$7f
           STA STACK-1,Y
           DEC TMPVA2
           BNE Bd068
           LDA #$2e ; '.'
           INY
           STA STACK-1,Y
 Bd068     STY TMPPTD
           LDY VARPTR
           TXA
           EOR #$ff
           AND #$80
           TAX
           CPY #$24 ; '$'
           BEQ Bd07a
           CPY #$3c ; '<'
           BNE Bd020
 Bd07a     LDY TMPPTD
 Bd07c     LDA STACK-1,Y
           DEY
           CMP #$30 ; '0'
           BEQ Bd07c
           CMP #$2e ; '.'
           BEQ Bd089
           INY
 Bd089     LDA #$2b ; '+'
           LDX TMPVA2+1
           BEQ Bd0bd
           BPL Bd099
           LDA #0
           SEC
           SBC TMPVA2+1
           TAX
           LDA #$2d ; '-'
 Bd099     STA STACK+1,Y
           LDA #$45 ; 'E'
           STA STACK,Y
           TXA
           LDX #$2f ; '/'
           SEC
 Bd0a5     INX
           SBC #10
           BCS Bd0a5
           ADC #$3a ; ':'
           STA STACK+3,Y
           TXA
           STA STACK+2,Y
           LDA #0
           STA STACK+4,Y
           BEQ Bd0c2
 Md0ba     STA STACK-1,Y
 Bd0bd     LDA #0
           STA STACK,Y
 Bd0c2     LDA #0
           LDY #1
           RTS

; *********
  Float_0_5
; *********

           .REAL $8000000000;    0.50000000000

; ************************
  Decimal_Conversion_Table
; ************************

           .QUAD $fa0a1f00  -100000000
           .QUAD $00989680    10000000
           .QUAD $fff0bdc0    -1000000
           .QUAD $000186a0      100000
           .QUAD $ffffd8f0      -10000
           .QUAD $000003e8        1000
           .QUAD $ffffff9c        -100
           .QUAD $0000000a          10
           .QUAD $ffffffff          -1

; **********************
  Jiffy_Conversion_Table
; **********************

           .QUAD $ffdf0a80    -2160000
           .QUAD $00034bc0      216000
           .QUAD $ffff7360      -36000
           .QUAD $00000e10        3600
           .QUAD $fffffda8        -600
           .QUAD $0000003c          60

; *********
  Basic_SQR
; *********

           JSR FAC1_Round_And_Copy_To_FAC2
           LDA #<Float_0_5
           LDY #>Float_0_5
           JSR Load_FAC1_AY

; ***********
  Basic_POWER
; ***********

           BEQ Basic_EXP
           LDA FAC2EX
           BNE Bd11b
           JMP Mca2f
 Bd11b     LDX #$4b ; 'K'
           LDY #0
           JSR Assign_FAC1_To_Var
           LDA FAC2SI
           BPL Bd135
           JSR Basic_INT
           LDA #$4b ; 'K'
           LDY #0
           JSR Compare_FAC1_AY
           BNE Bd135
           TYA
           LDY CHARAC
 Bd135     JSR Copy_ABS_FAC2_To_FAC1
           TYA
           PHA
           JSR Basic_LOG
           LDA #$4b ; 'K'
           LDY #0
           JSR Multiply_FAC1_With_AY
           JSR Basic_EXP
           PLA
           LSR A
           BCC Bd155

; *************
  Basic_GREATER
; *************

           LDA FAC1EX
           BEQ Bd155
           LDA FAC1SI
           EOR #$ff
           STA FAC1SI
 Bd155     RTS

; *********
  REV_LOG_2
; *********

           .REAL $8138aa3b29;    1.44269504072
 VAR_EXP   .BYTE $07
           .REAL $7134583e56;    0.00002149876
           .REAL $74167eb31b;    0.00014352314
           .REAL $772feee385;    0.00134226348
           .REAL $7a1d841c2a;    0.00961401701
           .REAL $7c6359580a;    0.05550512686
           .REAL $7e75fde7c6;    0.24022638460
           .REAL $8031721810;    0.69314718619
           .REAL $8100000000;    1.00000000000

; *********
  Basic_EXP
; *********

           LDA #<REV_LOG_2
           LDY #>REV_LOG_2
           JSR Multiply_FAC1_With_AY
           LDA FAC1M5
           ADC #$50 ; 'P'
           BCC Bd194
           JSR Round_FAC1
 Bd194     STA FUNJMP+1
           JSR FAC1_To_FAC2
           LDA FAC1EX
           CMP #$88
           BCC Bd1a2
 Bd19f     JSR Check_Overflow
 Bd1a2     JSR Basic_INT
           LDA CHARAC
           CLC
           ADC #$81
           BEQ Bd19f
           SEC
           SBC #1
           PHA
           LDX #5
 Bd1b2     LDA FAC2EX,X
           LDY FAC1EX,X
           STA FAC1EX,X
           STY FAC2EX,X
           DEX
           BPL Bd1b2
           LDA FUNJMP+1
           STA FAC1M5
           JSR Basic_MINUS
           JSR Basic_GREATER
           LDA #<VAR_EXP
           LDY #>VAR_EXP
           JSR Eval_Series_AY
           LDA #0
           STA STRPTR
           PLA
           JSR Check_FACs_A
           RTS

; **********************
  Square_And_Series_Eval
; **********************

           STA TMPPTD
           STY TMPPTD+1
           JSR FAC1_To_FACTPA
           LDA #$54 ; 'T'
           JSR Multiply_FAC1_With_AY
           JSR Eval_Series
           LDA #$54 ; 'T'
           LDY #0
           JMP Multiply_FAC1_With_AY

; **************
  Eval_Series_AY
; **************

           STA TMPPTD
           STY TMPPTD+1

; ***********
  Eval_Series
; ***********

           JSR FAC1_To_FACTPB
           LDA (TMPPTD),Y
           STA SGNFLG
           LDY TMPPTD
           INY
           TYA
           BNE Bd200
           INC TMPPTD+1
 Bd200     STA TMPPTD
           LDY TMPPTD+1
 Bd204     JSR Multiply_FAC1_With_AY
           LDA TMPPTD
           LDY TMPPTD+1
           CLC
           ADC #5
           BCC Bd211
           INY
 Bd211     STA TMPPTD
           STY TMPPTD+1
           JSR Add_Var_AY_To_FAC1
           LDA #$59 ; 'Y'
           LDY #0
           DEC SGNFLG
           BNE Bd204
           RTS

; ******
  RND_VA
; ******

           .QUAD $9835447a  -1741339526
 RND_VB    .QUAD $6828b146  1747497286

; *********
  Basic_RND
; *********

           JSR Get_FAC1_Sign
           BMI Bd25c
           BNE Bd247
           LDA VIA_Timer_1_Lo
           STA FAC1M1
           LDA VIA_Timer_2_Lo
           STA FAC1M2
           LDA VIA_Timer_1_Hi
           STA FAC1M3
           LDA VIA_Timer_2_Hi
           STA FAC1M4
           JMP Md26c
 Bd247     LDA #<RNDX
           LDY #>RNDX
           JSR Load_FAC1_AY
           LDA #<RND_VA
           LDY #>RND_VA
           JSR Multiply_FAC1_With_AY
           LDA #<RND_VB
           LDY #>RND_VB
           JSR Add_Var_AY_To_FAC1
 Bd25c     LDX FAC1M4
           LDA FAC1M1
           STA FAC1M4
           STX FAC1M1
           LDX FAC1M2
           LDA FAC1M3
           STA FAC1M2
           STX FAC1M3
 Md26c     LDA #0
           STA FAC1SI
           LDA FAC1EX
           STA FAC1M5
           LDA #$80
           STA FAC1EX
           JSR Normalise_FAC1
           LDX #<RNDX
           LDY #>RNDX

; *********************
  Go_Assign_FAC1_To_Var
; *********************

           JMP Assign_FAC1_To_Var

; *********
  Basic_COS
; *********

           LDA #<PI_Half
           LDY #>PI_Half
           JSR Add_Var_AY_To_FAC1

; *********
  Basic_SIN
; *********

           JSR FAC1_Round_And_Copy_To_FAC2
           LDA #3
           LDY #$d3
           LDX FAC2SI
           JSR Divide_FAC2_By_AY
           JSR FAC1_Round_And_Copy_To_FAC2
           JSR Basic_INT
           LDA #0
           STA STRPTR
           JSR Basic_MINUS
           LDA #<Float_0_25
           LDY #>Float_0_25
           JSR AY_Minus_FAC1
           LDA FAC1SI
           PHA
           BPL Md2bb
           JSR Add_0_5_To_FAC1
           LDA FAC1SI
           BMI Bd2be
           LDA TANSGN
           EOR #$ff
           STA TANSGN
 Md2bb     JSR Basic_GREATER
 Bd2be     LDA #<Float_0_25
           LDY #>Float_0_25
           JSR Add_Var_AY_To_FAC1
           PLA
           BPL Bd2cb
           JSR Basic_GREATER
 Bd2cb     LDA #13
           LDY #$d3
           JMP Square_And_Series_Eval

; *********
  Basic_TAN
; *********

           JSR FAC1_To_FACTPA
           LDA #0
           STA TANSGN
           JSR Basic_SIN
           LDX #$4b ; 'K'
           LDY #0
           JSR Go_Assign_FAC1_To_Var
           LDA #$54 ; 'T'
           LDY #0
           JSR Load_FAC1_AY
           LDA #0
           STA FAC1SI
           LDA TANSGN
           JSR TAN_10
           LDA #$4b ; 'K'
           LDY #0
           JMP AY_Divided_By_FAC1

; ******
  TAN_10
; ******

           PHA
           JMP Md2bb
 PI_Half   .REAL $81490fdaa2;    1.57079632673
 Two_PI    .REAL $83490fdaa2;    6.28318530694

; **********
  Float_0_25
; **********

           .REAL $7f00000000;    0.25000000000
 VAR_SIN   .BYTE $05
           .REAL $84e61a2d1b;  -14.38139067218
           .REAL $862807fbf8;   42.00779712200
           .REAL $8799688901;  -76.70417025685
           .REAL $872335dfe1;   81.60522368550
           .REAL $86a55de728;  -41.34170210361
           .REAL $83490fdaa2;    6.28318530694

; *********
  Basic_ATN
; *********

           LDA FAC1SI
           PHA
           BPL Bd334
           JSR Basic_GREATER
 Bd334     LDA FAC1EX
           PHA
           CMP #$81
           BCC Bd342
           LDA #<REAL_1
           LDY #>REAL_1
           JSR AY_Divided_By_FAC1
 Bd342     LDA #<VAR_ATN
           LDY #>VAR_ATN
           JSR Square_And_Series_Eval
           PLA
           CMP #$81
           BCC Bd355
           LDA #<PI_Half
           LDY #>PI_Half
           JSR AY_Minus_FAC1
 Bd355     PLA
           BPL Bd35b
           JMP Basic_GREATER
 Bd35b     RTS

; *******
  VAR_ATN
; *******

           .BYTE $0b
           .REAL $76b383bdd3;   -0.00068479391
           .REAL $791ef4a6f5;    0.00485094216
           .REAL $7b83fcb010;   -0.01611170184
           .REAL $7c0c1f67ca;    0.03420963805
           .REAL $7cde53cbc1;   -0.05427913276
           .REAL $7d1464704c;    0.07245719654
           .REAL $7db7ea517a;   -0.08980239538
           .REAL $7d6330887e;    0.11093241343
           .REAL $7e9244993a;   -0.14283980767
           .REAL $7e4ccc91c7;    0.19999912049
           .REAL $7faaaaaa13;   -0.33333331568
           .REAL $8100000000;    1.00000000000

; **********
  CHRGET_ROM
; **********

           INC TXTPTR
           BNE Bd39f
           INC TXTPTR+1
 Bd39f     LDA $ea60
           CMP #$3a ; ':'
           BCS Bd3b0
           CMP #$20 ; ' '
           BEQ CHRGET_ROM
           SEC
           SBC #$30 ; '0'
           SEC
           SBC #$d0
 Bd3b0     RTS
           .REAL $804fc75258;    0.81163515709

; **********************
  Init_BASIC_RAM_Vectors
; **********************

           LDX #$fb
           TXS
           LDA #$4c ; 'L'
           STA JUMPER
           STA Basic_USR
           LDA #$73
           LDY #$c3
           STA USRADD
           STY USRADD+1
           LDX #$1c
 Bd3c9     LDA CHRGET_ROM-1,X
           STA TMPPTD+1,X
           DEX
           BNE Bd3c9
           LDA #3
           STA GARBSS
           TXA
           STA BITS
           STA IOPMPT
           STA LASTPT+1
           STA DS_1
           PHA
           INX
           STX BUF-3
           STX BUF-4
           LDX #$16
           STX TEMPPT
           LDY #4
           STA TXTTAB
           STY TXTTAB+1
           STA LINNUM
           STY LINNUM+1
           TAY
           LDA #$80
           BNE Bd400
           LDA #0
           LDY #$b0
           JMP Md41b
 Bd400     INC LINNUM
           BNE Bd408
           INC LINNUM+1
           BMI Bd417
 Bd408     LDA #$55 ; 'U'
           STA (LINNUM),Y
           CMP (LINNUM),Y
           BNE Bd417
           ASL A
           STA (LINNUM),Y
           CMP (LINNUM),Y
           BEQ Bd400
 Bd417     LDA LINNUM
           LDY LINNUM+1
 Md41b     STA MEMSIZ
           STY MEMSIZ+1
           STA FRETOP
           STY FRETOP+1
           LDY #0
           TYA
           STA (TXTTAB),Y
           INC TXTTAB
           LDA #<Start_Message
           LDY #>Start_Message
           JSR Print_String
           LDA MEMSIZ
           SEC
           SBC TXTTAB
           TAX
           LDA MEMSIZ+1
           SBC TXTTAB+1
           JSR Print_Integer_XA
           LDA #<Bytes_Free_Message
           LDY #>Bytes_Free_Message
           JSR Print_String
           JSR Perform_NEW
           JMP Basic_Ready

; ******************
  Bytes_Free_Message
; ******************

           .BYTE " BYTES FREE\r",0

; **********************
  Obsolete_Start_Message
; **********************

           .BYTE "### COMMODORE BASIC ###\r\r",0

; ************
  MONITOR_CALL
; ************

           LDA #$43 ; 'C'
           STA MONCNT
           BNE Bd491

; *************
  MONITOR_BREAK
; *************

           JSR Kernal_CLRCHN
           LDA #$42 ; 'B'
           STA MONCNT
           CLD
           LSR A
           PLA
           STA BUF+5
           PLA
           STA BUF+4
           PLA
           STA BUF+3
           PLA
           STA BUF+2
 Bd491     PLA
           ADC #$ff
           STA BUF+1
           PLA
           ADC #$ff
           STA BUF
           LDA CINV
           STA BUF+8
           LDA CINV+1
           STA BUF+7
           TSX
           STX BUF+6
           CLI
           JSR Mon_Print_CR
           LDX MONCNT
           LDA #$2a ; '*'
           JSR Mon_Print_XA
           LDA #$52 ; 'R'
           BNE Bd4d4
 Md4ba     LDA #2
           STA TXTPTR
           LDA #0
           STA FSBLK
           LDX #13
           LDA #$2e ; '.'
           JSR Mon_Print_XA
 Bd4c9     JSR Mon_CHRIN
           CMP #$2e ; '.'
           BEQ Bd4c9
           CMP #$20 ; ' '
           BEQ Bd4c9
 Bd4d4     LDX #7
 Bd4d6     CMP Mon_Commands,X
           BNE Bd4e6
           STX TIMCMD
           LDA Mon_Sub_Hi,X
           PHA
           LDA Mon_Sub_Lo,X
           PHA
           RTS
 Bd4e6     DEX
           BPL Bd4d6
           JMP (Reset_Vector)

; **********
  Mon_Set_PC
; **********

           LDA STAL
           STA BUF+1
           LDA STAL+1
           STA BUF
           RTS

; **********************
  Mon_Print_A_Hex_Values
; **********************

           STA MONCNT
           LDY #0
 Bd4fb     JSR Mon_Print_Blank
           LDA (STAL),Y
           JSR Print_Hex_Byte
           JSR Mon_Inc_STAL
           DEC MONCNT
           BNE Bd4fb
           RTS

; ***************
  Mon_Modify_Byte
; ***************

           JSR Mon_Read_Hex
           BCC Bd51d
           LDX #0
           STA (STAL,X)
           CMP (STAL,X)
           BEQ Bd51d
           PLA
           PLA
           JMP Md7a4
 Bd51d     JSR Mon_Inc_STAL
           DEC MONCNT
           RTS

; *****************
  Mon_STAL_Register
; *****************

           LDA #2
           STA STAL
           LDA #2
           STA STAL+1
           LDA #5
           RTS

; ******************
  Mon_Print_2_Blanks
; ******************

           JSR Mon_Print_Blank

; ***************
  Mon_Print_Blank
; ***************

           LDA #$20 ; ' '
           .BYTE $2c

; ************
  Mon_Print_CR
; ************

           LDA #13
           JMP Kernal_CHROUT

; ************
  Mon_Inc_STAL
; ************

           INC STAL
           BNE Bd543
           INC STAL+1
           BNE Bd543
           INC FSBLK
 Bd543     RTS

; ************
  Mon_Commands
; ************

           .BYTE ":;RMGXLS"

; **********
  Mon_Sub_Hi
; **********

           .BYTE >[Modify_Memory-1]
           .BYTE >[Modify_Register-1]
           .BYTE >[Display_Register-1]
           .BYTE >[Display_Memory-1]
           .BYTE >[Mon_Go-1]
           .BYTE >[Mon_Exit-1]
           .BYTE >[Mon_Load_Save-1]
           .BYTE >[Mon_Load_Save-1]

; **********
  Mon_Sub_Lo
; **********

           .BYTE <[Modify_Memory-1]
           .BYTE <[Modify_Register-1]
           .BYTE <[Display_Register-1]
           .BYTE <[Display_Memory-1]
           .BYTE <[Mon_Go-1]
           .BYTE <[Mon_Exit-1]
           .BYTE <[Mon_Load_Save-1]
           .BYTE <[Mon_Load_Save-1]

; ***********
  Mon_Message
; ***********

           .BYTE "\r     PC  IRQ  SR AC XR YR SP"

; **********
  Mon_Prompt
; **********

           TYA
           PHA
           JSR Mon_Print_CR
           PLA
           LDX #$2e ; '.'
           JSR Mon_Print_XA
           JMP Mon_Print_2_Blanks

; ****************
  Display_Register
; ****************

           LDX #0
 Bd589     LDA Mon_Message,X
           JSR Kernal_CHROUT
           INX
           CPX #$1d
           BNE Bd589
           LDY #$3b ; ';'
           JSR Mon_Prompt
           LDA BUF
           JSR Print_Hex_Byte
           LDA BUF+1
           JSR Print_Hex_Byte
           JSR Mon_Print_Blank
           LDA BUF+7
           JSR Print_Hex_Byte
           LDA BUF+8
           JSR Print_Hex_Byte
           JSR Mon_STAL_Register
           JSR Mon_Print_A_Hex_Values
           BEQ Bd5f5

; **************
  Display_Memory
; **************

           JSR Mon_CHRIN
           JSR Mon_Read_To_STAL
           BCC Bd5f8
           JSR Mon_Swap_STAL_MEMUSS
           JSR Mon_CHRIN
           JSR Mon_Read_To_STAL
           BCC Bd5f8
           JSR Mon_Swap_STAL_MEMUSS
 Bd5d2     JSR Jf335
           BEQ Bd5f5
           LDX FSBLK
           BNE Bd5f5
           SEC
           LDA MEMUSS
           SBC STAL
           LDA MEMUSS+1
           SBC STAL+1
           BCC Bd5f5
           LDY #$3a ; ':'
           JSR Mon_Prompt
           JSR Mon_Print_STAL
           LDA #8
           JSR Mon_Print_A_Hex_Values
           BEQ Bd5d2
 Bd5f5     JMP Md4ba
 Bd5f8     JMP Md7a4

; ***************
  Modify_Register
; ***************

           JSR Mon_Read_Hex
           JSR Mon_Read_To_STAL
           BCC Bd606
           JSR Mon_Set_PC
 Bd606     JSR Kernal_CHRIN
           JSR Mon_Read_To_STAL
           BCC Bd618
           LDA STAL
           STA BUF+8
           LDA STAL+1
           STA BUF+7
 Bd618     JSR Mon_STAL_Register
           BNE Bd627

; *************
  Modify_Memory
; *************

           JSR Mon_Read_Hex
           JSR Mon_Read_To_STAL
           BCC Bd5f8
           LDA #8
 Bd627     STA MONCNT
 Bd629     JSR Mon_CHRIN
           JSR Mon_Modify_Byte
           BNE Bd629
           BEQ Bd5f5

; ******
  Mon_Go
; ******

           JSR Kernal_CHRIN
           CMP #13
           BEQ Bd646
           CMP #$20 ; ' '
           BNE Bd5f8
           JSR Mon_Read_To_STAL
           BCC Bd646
           JSR Mon_Set_PC
 Bd646     LDX BUF+6
           TXS
           SEI
           LDA BUF+7
           STA CINV+1
           LDA BUF+8
           STA CINV
           LDA BUF
           PHA
           LDA BUF+1
           PHA
           LDA BUF+2
           PHA
           LDA BUF+3
           LDX BUF+4
           LDY BUF+5
           RTI

; ********
  Mon_Exit
; ********

           LDX BUF+6
           TXS
           JMP Basic_Ready
 Bd672     JMP Md7a4

; *************
  Mon_Load_Save
; *************

           LDY #1
           STY FA
           DEY
           STY FNLEN
           STY STATUS
           STY VERCK
           LDA #2
           STA FNADR+1
           LDA #9
           STA FNADR
 Bd688     JSR Kernal_CHRIN
           CMP #$20 ; ' '
           BEQ Bd688
           CMP #13
           BEQ Bd6ad
           CMP #$22 ; '"'
 Bd695     BNE Bd672
 Bd697     JSR Kernal_CHRIN
           CMP #$22 ; '"'
           BEQ Bd6c2
           CMP #13
           BEQ Bd6ad
           STA (FNADR),Y
           INC FNLEN
           INY
           CPY #16
 Bd6a9     BEQ Bd672
           BNE Bd697
 Bd6ad     LDA TIMCMD
           CMP #6
 Bd6b1     BNE Bd695
           JSR Jf356
           JSR Jf92b
           LDA STATUS
           AND #16
 Bd6bd     BNE Bd6b1
           JMP Md4ba
 Bd6c2     JSR Kernal_CHRIN
           CMP #13
           BEQ Bd6ad
           CMP #$2c ; ','
 Bd6cb     BNE Bd6bd
           JSR Mon_Read_Hex
           AND #15
 Bd6d2     BEQ Bd6a9
           CMP #3
           BEQ Bd6d2
           STA FA
           JSR Kernal_CHRIN
           CMP #13
           BEQ Bd6ad
           CMP #$2c ; ','
 Bd6e3     BNE Bd6cb
           JSR Mon_Read_To_STAL
           JSR Mon_Swap_STAL_MEMUSS
           JSR Kernal_CHRIN
           CMP #$2c ; ','
 Bd6f0     BNE Bd6e3
           JSR Mon_Read_To_STAL
           LDA STAL
           STA EAL
           LDA STAL+1
           STA EAL+1
           JSR Mon_Swap_STAL_MEMUSS
 Bd700     JSR Kernal_CHRIN
           CMP #$20 ; ' '
           BEQ Bd700
           CMP #13
 Bd709     BNE Bd6f0
           LDA TIMCMD
           CMP #7
           BNE Bd709
           JSR Jf6e3
           JMP Md4ba

; **************
  Mon_Print_STAL
; **************

           LDX #1
           LDA STAL-1,X
           PHA
           LDA STAL,X
           JSR Print_Hex_Byte
           PLA

; **************
  Print_Hex_Byte
; **************

           PHA
           LSR A
           LSR A
           LSR A
           LSR A
           JSR Nibble_To_Hex
           TAX
           PLA
           AND #15
           JSR Nibble_To_Hex

; ************
  Mon_Print_XA
; ************

           PHA
           TXA
           JSR Kernal_CHROUT
           PLA
           JMP Kernal_CHROUT

; *************
  Nibble_To_Hex
; *************

           CLC
           ADC #$f6
           BCC Bd741
           ADC #6
 Bd741     ADC #$3a ; ':'
           RTS

; ********************
  Mon_Swap_STAL_MEMUSS
; ********************

           LDX #2
 Bd746     LDA CAS2,X
           PHA
           LDA STAL+1,X
           STA CAS2,X
           PLA
           STA STAL+1,X
           DEX
           BNE Bd746
           RTS

; ****************
  Mon_Read_To_STAL
; ****************

           JSR Mon_Read_Hex
           BCC Bd75b
           STA STAL+1
 Bd75b     JSR Mon_Read_Hex
           BCC Bd762
           STA STAL
 Bd762     RTS

; ************
  Mon_Read_Hex
; ************

           LDA #0
           STA STACK
           JSR Mon_CHRIN
           CMP #$20 ; ' '
           BNE Bd778
           JSR Mon_CHRIN
           CMP #$20 ; ' '
           BNE Bd785
           CLC
           RTS
 Bd778     JSR Mon_Hex_To_Bin
           ASL A
           ASL A
           ASL A
           ASL A
           STA STACK
           JSR Mon_CHRIN
 Bd785     JSR Mon_Hex_To_Bin
           ORA STACK
           SEC
           RTS

; **************
  Mon_Hex_To_Bin
; **************

           CMP #$3a ; ':'
           PHP
           AND #15
           PLP
           BCC Bd797
           ADC #8
 Bd797     RTS

; *********
  Mon_CHRIN
; *********

           JSR Kernal_CHRIN
           CMP #13
           BNE Bd797
           PLA
           PLA
           JMP Md4ba
 Md7a4     LDA #$3f ; '?'
           JSR Kernal_CHROUT
           JMP Md4ba
 Bd7ac     JMP Syntax_Error

; *************
  Kernal_RECORD
; *************

           LDA #1
           STA NextTab
           JSR CHRGOT
           LDA #$23 ; '#'
           JSR Need_A
           JSR Jde8a
           CPX #0
           BEQ Bd801
           STX LA
           JSR Need_Comma
           BEQ Bd7ac
           BCC Bd7db
           JSR Need_Left_Parenthesis
           JSR Eval_Expression
           JSR FAC1_To_LINNUM
           JSR Need_Right_Parenthesis
           JMP Md7e1
 Bd7db     JSR Eval_Expression
           JSR FAC1_To_LINNUM
 Md7e1     JSR CHRGOT
           BEQ Bd7fe
           JSR Need_Comma
           BEQ Bd7ac
           JSR Jde8a
           CPX #0
           BEQ Bd801
           CPX #$ff
           BEQ Bd801
           STX NextTab
           JSR CHRGOT
           BNE Bd7ac
 Bd7fe     JMP Mda31
 Bd801     JMP DOS_JMP_Illegal_Quantity

; *************************
  Allow_Drive_Unit_Filename
; *************************

           AND #$e6
           BEQ Check_Filename_Given

; ********************
  DOS_JMP_Syntax_Error
; ********************

           JMP Syntax_Error

; ********************
  Check_Filename_Given
; ********************

           LDA DOS_Syntax
           AND #1
           CMP #1
           BNE DOS_JMP_Syntax_Error
           LDA DOS_Syntax
           RTS

; ********************
  Allow_Drive_And_Unit
; ********************

           AND #$e7
           BNE DOS_JMP_Syntax_Error
           RTS

; ************
  No_WL_Record
; ************

           AND #$c4
           BNE DOS_JMP_Syntax_Error
           LDA DOS_Syntax

; *********************
  Check_Filename_Syntax
; *********************

           AND #3
           CMP #3
           BNE DOS_JMP_Syntax_Error
           LDA DOS_Syntax
           RTS

; *******************
  Check_Record_Syntax
; *******************

           AND #5
           CMP #5
           BNE DOS_JMP_Syntax_Error
           LDA DOS_Syntax
           RTS

; *****
  Vd838
; *****

           .BYTE $ff,$24,$d1
           .BYTE $d1,$3a,$f1,$2c,$e1,$2c,$e0,$d1
           .BYTE $3a,$f1,$2c,$41,$4e,$d1,$3a,$f1
           .BYTE $2c,$d0,$56,$d1,$44,$d2,$3d,$d1
           .BYTE $43,$d2,$3a,$f2,$3d,$d1,$3a,$f1
           .BYTE $43,$d2,$3a,$f2,$3d,$d2,$3a,$f2
           .BYTE $2c,$d1,$3a,$f1,$52,$d1,$3a,$f2
           .BYTE $3d,$d1,$3a,$f1,$53,$d1,$3a,$f1

; ****************
  Kernal_DIRECTORY
; ****************

           LDA LA
           STA SAVELA
           JSR Parse_DOS_Parameter
           JSR Allow_Drive_And_Unit
           LDY #0
           LDX #1
           LDA DOS_Syntax
           AND #16
           BEQ Bd889
           INX ; drive given
 Bd889     TXA
           JSR Build_DOS_Command
           LDA DFLTO
           STA TMPZBA
           LDA #$60
           STA SA
           LDA #14
           STA LA
           JSR Jf1b9
           JSR Jf565
           LDA #0
           STA STATUS
           LDY #3
 Bd8a5     STY FNLEN
           LDX #14
           JSR Kernal_CHKIN
           JSR Kernal_CHRIN
           STA MEMUSS
           LDY STATUS
           BNE Bd912
           JSR Kernal_CHRIN
           STA MEMUSS+1
           LDY STATUS
           BNE Bd912
           LDY FNLEN
           DEY
           BNE Bd8a5
           JSR Kernal_CLRCHN
           JSR Jd923
           LDX MEMUSS
           LDA MEMUSS+1
           JSR Print_Integer_XA
           LDA #$20 ; ' '
           JSR Kernal_CHROUT
           JSR Kernal_CLRCHN
 Bd8d8     LDX #14
           JSR Kernal_CHKIN
           JSR Kernal_CHRIN
           PHA
           JSR Kernal_CLRCHN
           PLA
           LDX STATUS
           BNE Bd912
           CMP #0
           BEQ Bd905
           JSR Jd91a
           JSR Jf335
           BEQ Bd912
           JSR Kernal_GETIN
           BEQ Bd8d8
           CMP #$20 ; ' '
           BNE Bd8d8
 Bd8fe     JSR Kernal_GETIN
           BEQ Bd8fe
           BNE Bd8d8
 Bd905     LDA #13
           JSR Jd91a
           JSR Jf1b9
           LDY #2
           BNE Bd8a5
           PLA
 Bd912     JSR Kernal_CLRCHN
           LDA #14
           JMP Mf2e2

; *****
  Jd91a
; *****

           JSR Jd923
           JSR Kernal_CHROUT
           JMP Kernal_CLRCHN

; *****
  Jd923
; *****

           LDX TMPZBA
           CPX #3
           BEQ Bd92e
           LDX SAVELA
           JSR Kernal_CHKOUT
 Bd92e     RTS

; *****
  Jd92f
; *****

           LDY #$61
 Bd931     INY
           TYA
           LDX LDTND
 Bd935     DEX
           BMI Bd93f
           CMP SAT,X
           BEQ Bd931
           BNE Bd935
 Bd93f     STY SA
           RTS

; ************
  Kernal_DOPEN
; ************

           JSR Parse_DOS_Parameter
           JSR Check_Record_Syntax
           AND #$22 ; '"'
           BEQ Bd94f
           JMP Syntax_Error
 Bd94f     JSR Jd92f
           LDY #2
           LDX #3
           BIT DOS_Syntax
           BVC Bd95d
           LDX #7
 Bd95d     BIT DOS_Syntax
           BPL Bd970
           LDA #$40 ; '@'
           STA DOS_Command_Buffer
           TXA
           LDX #1
           JSR Build_DOS_Command_X
           JMP Mf563
 Bd970     TXA
           JSR Build_DOS_Command
           JMP Mf563

; *************
  Kernal_APPEND
; *************

           JSR Parse_DOS_Parameter
           JSR Check_Record_Syntax
           AND #$e2
           BEQ Bd984
           JMP Syntax_Error
 Bd984     JSR Jd92f
           LDY #9
           LDA #5
           JSR Build_DOS_Command
           JMP Mf563

; *****
  Jd991
; *****

           LDA DS_1
           BNE Bd9ab
 Md995     LDA #$28 ; '('
           STA DS_1
           JSR Allocate_String_Space
           STX DS_2
           STY DS_3
           LDA #0
           LDY #$29 ; ')'
           JSR Jde9e
           LDA #13
           STA (DS_2),Y
 Bd9ab     LDA FA
           BNE Bd9b3
           LDA #8
           STA FA
 Bd9b3     JSR Jf0d2
           LDA #$6f
           STA SA
           JSR Jf193
           LDY #$ff
 Bd9bf     INY
           JSR Jf1c0
           CMP #13
           BEQ Bd9cb
           STA (DS_2),Y
           BNE Bd9bf
 Bd9cb     LDA #0
           STA (DS_2),Y
           JMP Jf1ae

; *************
  Kernal_HEADER
; *************

           JSR Parse_DOS_Parameter
           JSR Allow_Drive_Unit_Filename
           AND #$11
           CMP #$11
           BEQ Bd9e1
           JMP Syntax_Error
 Bd9e1     JSR Jda1b
           JSR Jdb9e
           BCC Bd9ea
           RTS
 Bd9ea     LDY #14
           LDA #4
           LDX DOS_Id
           BEQ Bd9f5
           LDA #6
 Bd9f5     JSR Jda98
           JSR Jd991
           LDY #0
           LDA (DS_2),Y
           CMP #$32 ; '2'
           BCS Bda04
           RTS
 Bda04     JMP Mdbd7

; *************
  Kernal_DCLOSE
; *************

           JSR Parse_DOS_Parameter
           AND #$f3
           BEQ Bda11
           JMP Syntax_Error
 Bda11     JSR Jdbe1
           LDA LA
           BEQ Jda1b
           JMP Mf2e2

; *****
  Jda1b
; *****

           LDA FA
           LDX LDTND
 Bda1f     DEX
           BMI Bda30
           CMP FAT,X
           BNE Bda1f
           LDA LAT,X
           JSR Jf2e7
           CLV
           BVC Jda1b
 Bda30     RTS

; *****
  Mda31
; *****

           LDA LA
           JSR LOOKUP_LA
           BEQ Bda3d
           LDY #$17
           JMP Mf5af
 Bda3d     JSR Jf2cd
           JSR Jdbe1
           LDA #$50 ; 'P'
           STA DOS_Command_Buffer
           LDA SA
           STA DOS_Command_Buffer+1
           LDA LINNUM
           STA DOS_Command_Buffer+2
           LDA LINNUM+1
           STA DOS_Command_Buffer+3
           LDA NextTab
           STA DOS_Command_Buffer+4
           LDX #5
           JSR DOS_SETNAM
           JMP Mda9b

; **************
  Kernal_COLLECT
; **************

           JSR Parse_DOS_Parameter
           JSR Allow_Drive_And_Unit
           JSR Jda1b
           LDY #$14
           LDX #1
           LDA DOS_Syntax
           AND #16
           BEQ Bda7a
           INX
 Bda7a     TXA
           JMP Jda98

; *************
  Kernal_BACKUP
; *************

           JSR Parse_DOS_Parameter
           AND #$30 ; '0'
           CMP #$30 ; '0'
           BEQ Bda8a
 Bda87     JMP Syntax_Error
 Bda8a     LDA DOS_Syntax
           AND #$c7
           BNE Bda87
           JSR Jda1b
           LDY #$16
           LDA #4

; *****
  Jda98
; *****

           JSR Build_DOS_Command
 Mda9b     LDA #$6f
           STA SA
           JSR Jf0d5
           LDA SA
           JMP Mf4b4

; ***********
  Kernal_COPY
; ***********

           JSR Parse_DOS_Parameter
           AND #$30 ; '0'
           CMP #$30 ; '0'
           BNE Bdab7
           LDA DOS_Syntax
           AND #$c7
           BEQ Bdac0
 Bdab7     LDA DOS_Syntax
           JSR No_WL_Record
           LDA DOS_Syntax
 Bdac0     LDY #$1a
           LDA #8
           JMP Jda98

; *************
  Kernal_CONCAT
; *************

           JSR Parse_DOS_Parameter
           JSR No_WL_Record
           LDY #$22 ; '"'
           LDA #12
           JMP Jda98

; ***************************
  Copy_Filename_To_DOS_Buffer
; ***************************

           LDA FNLEN
           STA NextTab
           LDA FNADR
           STA MEMUSS
           LDA FNADR+1
           STA MEMUSS+1

; *****
  Jdae1
; *****

           TYA
           PHA
           LDY NextTab
           BEQ Bdaf8
           LDY #0
 Bdaea     LDA (MEMUSS),Y
           STA DOS_Command_Buffer,X
           INX
           INY
           CPY NextTab
           BNE Bdaea
           BEQ Bdaf9
 Bdaf8     DEX
 Bdaf9     PLA
           TAY
           SEC
           RTS

; *****
  Jdafd
; *****

           LDA DOS_Id
           STA DOS_Command_Buffer,X
           INX
           LDA DOS_Id+1
           STA DOS_Command_Buffer,X
           INX
           TXA
           RTS

; ************
  Kernal_DSAVE
; ************

           JSR Parse_DOS_Parameter
           JSR Check_Filename_Given
           AND #$66
           BEQ Bdb1a
           JMP Syntax_Error
 Bdb1a     LDY #2
           LDA DOS_Syntax
           AND #$80
           BEQ Bdb32
           LDA #$40 ; '@'
           STA DOS_Command_Buffer
           LDX #1
           LDA #3
           JSR Build_DOS_Command_X
           JMP Mf6e0
 Bdb32     LDA #3
           JSR Build_DOS_Command
           JMP Mf6e0

; ************
  Kernal_DLOAD
; ************

           JSR Parse_DOS_Parameter
           JSR Check_Filename_Given
           AND #$e6
           BEQ Bdb47
 Bdb44     JMP Syntax_Error
 Bdb47     LDY #2
           LDA #3
           JSR Build_DOS_Command
           LDA #0
           STA VERCK
           JMP Mf408

; *************
  Kernal_RENAME
; *************

           JSR Parse_DOS_Parameter
           JSR Check_Filename_Syntax
           AND #$e4
           BNE Bdb44
           LDY #$2e ; '.'
           LDA #8
           JMP Jda98

; **************
  Kernal_SCRATCH
; **************

           JSR Parse_DOS_Parameter
           JSR Allow_Drive_Unit_Filename
           JSR Jdb9e
           BCS Bdb98
           LDY #$36 ; '6'
           LDA #4
           JSR Jda98
           JSR Jdb99
           BNE Bdb98
           JSR Jd991
           LDA #13
           JSR ChrOutScreen
           LDY #0
 Bdb87     LDA (DS_2),Y
           CMP #0
           BEQ Bdb93
           JSR ChrOutScreen
           INY
           BNE Bdb87
 Bdb93     LDA #13
           JSR ChrOutScreen
 Bdb98     RTS

; *****
  Jdb99
; *****

           LDA TXTPTR+1
           CMP #2
           RTS

; *****
  Jdb9e
; *****

           JSR Jdb99
           BNE Bdbd5
           LDY #$b6
           JSR Jf185
           JSR Kernal_CLRCHN
           JSR Kernal_CHRIN
           CMP #$59 ; 'Y'
           BNE Bdbcb
           JSR Kernal_CHRIN
           CMP #13
           BEQ Bdbd5
           CMP #$45 ; 'E'
           BNE Bdbcb
           JSR Kernal_CHRIN
           CMP #$53 ; 'S'
           BNE Bdbcb
           JSR Kernal_CHRIN
           CMP #13
           BEQ Bdbd5
 Bdbcb     CMP #13
           SEC
           BEQ Bdbd6
           JSR Kernal_CHRIN
           BNE Bdbcb
 Bdbd5     CLC
 Bdbd6     RTS

; *****
  Mdbd7
; *****

           JSR Jdb99
           BNE Bdbd6
           LDY #$c5
           JMP Jf185

; *****
  Jdbe1
; *****

           TYA
           PHA
           LDA DS_1
           BEQ Bdbf1
           LDY #$28 ; '('
           TYA
           STA (DS_2),Y
           INY
           LDA #$ff
           STA (DS_2),Y
 Bdbf1     LDA #0
           STA STATUS
           STA DS_1
           PLA
           TAY
           RTS

; *****************
  Build_DOS_Command
; *****************

           LDX #0

; *******************
  Build_DOS_Command_X
; *******************

           STA DOS_Command_Length
           JSR Jdbe1
 Bdc02     DEC DOS_Command_Length
           BMI DOS_SETNAM
           INY
           LDA Vd838,Y
           BPL Bdc46
           CMP #$f1
           BNE Bdc14
           JSR Copy_Filename_To_DOS_Buffer
 Bdc14     CMP #$f2
           BNE Bdc1b
           JSR Jdae1
 Bdc1b     CMP #$e0
           BNE Bdc24
           LDA DOS_Length
           BNE Bdc46
 Bdc24     CMP #$d0
           BNE Bdc2b
           JSR Jdafd
 Bdc2b     CMP #$e1
           BNE Bdc34
           JSR Jdc57
           BNE Bdc46
 Bdc34     CMP #$d1
           BNE Bdc3d
           LDA DOS_Drive_1
           BPL Bdc44
 Bdc3d     CMP #$d2
           BNE Bdc02
           LDA DOS_Drive_2
 Bdc44     ORA #$30 ; '0'
 Bdc46     STA DOS_Command_Buffer,X
           INX
           BNE Bdc02

; **********
  DOS_SETNAM
; **********

           STX FNLEN
           LDA #<DOS_Command_Buffer
           STA FNADR
           LDA #>DOS_Command_Buffer
           STA FNADR+1
           RTS

; *****
  Jdc57
; *****

           LDA DOS_Length
           BEQ Bdc60
           LDA #$4c ; 'L'
           BNE Bdc67
 Bdc60     LDA #$53 ; 'S'
           STA DOS_Length
           LDA #$57 ; 'W'
 Bdc67     RTS

; *******************
  Parse_DOS_Parameter
; *******************

           LDX #0
           STX DOS_Syntax
           STX LA
           STX DOS_Length
           STX DOS_Drive_1
           STX DOS_Drive_2
           STX FNLEN
           STX NextTab
           STX DOS_Id
           LDX #8
           STX FA
           JSR CHRGOT
           BEQ Mdd03
 Mdc89     CMP #$23 ; '#'
           BEQ Bdcbd
           CMP #$57 ; 'W'
           BEQ Bdcd8
           CMP #$4c ; 'L'
           BEQ Bdcd8
           CMP #$52 ; 'R'
           BNE Bdc9f
           JSR CHRGET
           JMP Mdd96
 Bdc9f     CMP #$44 ; 'D'
           BEQ Bdd15
           CMP #$91
           BEQ Mdd09
           CMP #$55 ; 'U'
           BEQ Bdd0f
           CMP #$49 ; 'I'
           BNE Bdcb2
           JMP Mdd37
 Bdcb2     CMP #$22 ; '"'
           BEQ Bdd06
           CMP #$28 ; '('
           BEQ Bdd06
 Bdcba     JMP Syntax_Error
 Bdcbd     LDA DOS_Syntax
           AND #4
           BNE Bdcba
           JSR DOS_Parse_Value
           CPX #0
           BEQ Bdd34
           STX LA
           LDA DOS_Syntax
           ORA #4
           STA DOS_Syntax
           JMP Mdd96
 Bdcd8     TAX
           LDA DOS_Syntax
           AND #$40 ; '@'
           BNE Bdcba
           CPX #$57 ; 'W'
           BNE Bdcea
           JSR CHRGET
           JMP Mdcf8
 Bdcea     JSR DOS_Parse_Value
           CPX #0
           BEQ Bdd34
           CPX #$ff
           BEQ Bdd34
           STX DOS_Length
 Mdcf8     LDA DOS_Syntax
           ORA #$40 ; '@'
           STA DOS_Syntax
           JMP Mdd96
 Mdd03     JMP Mde23
 Bdd06     JMP Mdd60
 Mdd09     JSR DOS_Parse_Unit
           JMP Mdd96
 Bdd0f     JSR Jde33
           JMP Mdd96
 Bdd15     LDA DOS_Syntax
           AND #16
           BNE Bdcba
           JSR DOS_Parse_Value
           CPX #2
           BCS Bdd34
           STX DOS_Drive_1
           STX DOS_Drive_2
           LDA DOS_Syntax
           ORA #16
           STA DOS_Syntax
           JMP Mdd96
 Bdd34     JMP DOS_JMP_Illegal_Quantity
 Mdd37     LDA DOS_Length
           AND #$ff
           BEQ Bdd41
           JMP Syntax_Error
 Bdd41     LDY #0
           LDX #0
 Bdd45     INC TXTPTR
           BNE Bdd4b
           INC TXTPTR+1
 Bdd4b     LDA (TXTPTR),Y
           STA DOS_Id,X
           INX
           CPX #2
           BCC Bdd45
           LDA #$ff
           STA DOS_Length
           JSR CHRGET
           JMP Mdd96
 Mdd60     LDA DOS_Syntax
           AND #1
           JSR Jde49
           STA FNLEN
           STA DOS_Command_Length
           LDA #$42 ; 'B'
           STA FNADR
           LDA #3
           STA FNADR+1
           LDY #0
 Bdd77     LDA (INDEXA),Y
           CPY #0
           BNE Bdd85
           CMP #$40 ; '@'
           BNE Bdd85
           INC FNADR
           DEC FNLEN
 Bdd85     STA DOS_Filename,Y
           INY
           CPY DOS_Command_Length
           BCC Bdd77
           LDA DOS_Syntax
           ORA #1
           STA DOS_Syntax
 Mdd96     JSR CHRGOT
           BNE Bdd9e
           JMP Mdd03
 Bdd9e     CMP #$2c ; ','
           BNE Bdda8
           JSR CHRGET
           JMP Mdc89
 Bdda8     CMP #$91
           BNE Bddaf
           JMP Mdd09
 Bddaf     CMP #$a4
           BEQ Bddb6
           JMP Syntax_Error
 Bddb6     JSR CHRGET
           CMP #$44 ; 'D'
           BEQ Bddd0
           CMP #$91
           BEQ Bddec
           CMP #$55 ; 'U'
           BEQ Bddf2
           CMP #$22 ; '"'
           BEQ Bddf8
           CMP #$28 ; '('
           BEQ Bddf8
 Bddcd     JMP Syntax_Error
 Bddd0     LDA DOS_Syntax
           AND #$20 ; ' '
           BNE Bddcd
           JSR DOS_Parse_Value
           CPX #2
           BCS DOS_JMP_Illegal_Quantity
           STX DOS_Drive_2
           LDA DOS_Syntax
           ORA #$20 ; ' '
           STA DOS_Syntax
           JMP Mde0f
 Bddec     JSR DOS_Parse_Unit
           JMP Mde0f
 Bddf2     JSR Jde33
           JMP Mde0f
 Bddf8     LDA DOS_Syntax
           AND #2
           JSR Jde49
           STA NextTab
           STX MEMUSS
           STY MEMUSS+1
           LDA DOS_Syntax
           ORA #2
           STA DOS_Syntax
 Mde0f     JSR CHRGOT
           BEQ Mde23
           CMP #$2c ; ','
           BEQ Bddb6
           CMP #$91
           BEQ Bddec
           CMP #$55 ; 'U'
           BEQ Bddf2
 Bde20     JMP Syntax_Error
 Mde23     LDA DOS_Syntax
           RTS

; ************************
  DOS_JMP_Illegal_Quantity
; ************************

           LDX #$35 ; '5'
           JMP Basic_Error

; **************
  DOS_Parse_Unit
; **************

           JSR CHRGET
           CMP #$55 ; 'U'
           BNE Bde20

; *****
  Jde33
; *****

           JSR DOS_Parse_Value
           CPX #$20 ; ' '
           BCS DOS_JMP_Illegal_Quantity
           CPX #3
           BCC DOS_JMP_Illegal_Quantity
           STX FA
           LDA DOS_Syntax
           ORA #8
           STA DOS_Syntax
           RTS

; *****
  Jde49
; *****

           BNE Bde20
           JSR Eval_Expression
           JSR Eval_String
           TAX
           CMP #0
           BEQ DOS_JMP_Illegal_Quantity
           CMP #$12
           BCS Bde74
           LDY #0
           LDA (INDEXA),Y
           CMP #$40 ; '@'
           BNE Bde6c
           LDA DOS_Syntax
           AND #$80
           BEQ Bde79
           JMP Syntax_Error
 Bde6c     TXA
           CMP #$11
           BCS Bde74
           JMP Mde82
 Bde74     LDX #$b0
           JMP Basic_Error
 Bde79     LDA DOS_Syntax
           ORA #$80
           STA DOS_Syntax
           TXA
 Mde82     LDX INDEXA
           LDY INDEXA+1
           RTS

; ***************
  DOS_Parse_Value
; ***************

           JSR CHRGET

; *****
  Jde8a
; *****

           BNE Bde8f
           JMP Syntax_Error
 Bde8f     BCC Bde9a
           JSR Need_Left_Parenthesis
           JSR Get_Byte_Value
           JMP Need_Right_Parenthesis
 Bde9a     JMP Get_Byte_Value
           .BYTE $f4

; *****
  Jde9e
; *****

           STA STATUS
           STA (DS_2),Y
           DEY
           RTS

; *************
  Start_Message
; *************

           .BYTE "*** COMMODORE BASIC 4.0 ***\r\r",0
           .FILL $e000-* ($aa) ;  318 bytes
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

           .BYTE "CBM 8296D EUROSCREEN EDITOR 4V4E "

; ***********
  PIA2_Cont_A
; ***********

           .BYTE "(E-324243-04) (C) 1982 COMMODORE "

; *********
  VIA_DDR_B
; *********

           .BYTE "ELECTRONICS LTD D  "
           .BYTE $07,$01
           .FILL $e900-* ($ff) ;  169 bytes
           .BYTE $16,$44,$20,$20,$07,$01
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
* = $f000   ; *** f000 ***  Commodore 8296


; **************
  ERROR_MESSAGES
; **************

           .BYTE "TOO MANY FILES"^
           .BYTE "FILE OPEN"^
           .BYTE "FILE NOT OPEN"^
           .BYTE "FILE NOT FOUND"^
           .BYTE "\rSEARCHING "^
           .BYTE "FOR "^
           .BYTE "\rPRESS PLAY "^
           .BYTE "& RECORD "^
           .BYTE "ON TAPE #"^
           .BYTE "\rLOAD"^
           .BYTE "\rWRITING "^
           .BYTE "\rVERIFY"^
           .BYTE "DEVICE NOT PRESENT"^
           .BYTE "NOT INPUT FILE"^
           .BYTE "NOT OUTPUT FILE"^
           .BYTE "\rFOUND "^
           .BYTE "\rOK\r"^
           .BYTE "\rREADY.\r"^
           .BYTE "\rARE YOU SURE ?"^
           .BYTE "\r? BAD DISK \r"^

; *****
  Jf0d2
; *****

           LDA #$40 ; '@'
           .BYTE $2c

; *****
  Jf0d5
; *****

           LDA #$20 ; ' '

; *****
  Jf0d7
; *****

           PHA
           LDA VIA_Port_B
           ORA #2
           STA VIA_Port_B
           LDA #$3c ; '<'
           STA PIA2_Cont_A
           BIT C3PO
           BEQ Bf0fa
           LDA #$34 ; '4'
           STA PIA1_Cont_A
           JSR Jf109
           LDA #0
           STA C3PO
           LDA #$3c ; '<'
           STA PIA1_Cont_A
 Bf0fa     PLA
           ORA FA
           STA BSOUR
 Bf0ff     LDA VIA_Port_B
           BPL Bf0ff
           AND #$fb
           STA VIA_Port_B

; *****
  Jf109
; *****

           LDA #$3c ; '<'
           STA PIA2_Cont_B
           LDA VIA_Port_B
           AND #$41 ; 'A'
           CMP #$41 ; 'A'
           BEQ Bf16c
           LDA BSOUR
           EOR #$ff
           STA PIA2_Port_B
 Bf11e     BIT VIA_Port_B
           BVC Bf11e
           LDA #$34 ; '4'
           STA PIA2_Cont_B
 Bf128     LDA #$ff
           STA VIA_Timer_1_Hi
 Bf12d     LDA VIA_Port_B
           BIT VIA_IFR
           BVS Bf151
           LSR A
           BCC Bf12d
 Bf138     LDA #$3c ; '<'
           STA PIA2_Cont_B
           LDA #$ff
           STA PIA2_Port_B
           RTS

; *****
  Jf143
; *****

           STA BSOUR
           JSR Jf109

; *****
  Jf148
; *****

           LDA VIA_Port_B
           ORA #4
           STA VIA_Port_B
           RTS
 Bf151     LDA Reset_Param
           BPL Bf165
           JSR Kernal_STOP
           BNE Bf128
 Bf15b     LDA Reset_Param
           BPL Bf170
           JSR Kernal_STOP
           BNE Bf1cd
 Bf165     LDA #1
 Bf167     JSR Jfbc4
           BNE Bf138
 Bf16c     LDA #$80
           BMI Bf167
 Bf170     LDA #2
           JSR Jfbc4

; *****
  Jf175
; *****

           LDA VIA_Port_B
           AND #$fd
           STA VIA_Port_B
           LDA #$34 ; '4'
           STA PIA2_Cont_A
           LDA #13
           RTS

; *****
  Jf185
; *****

           LDA ERROR_MESSAGES,Y
           PHP
           AND #$7f
           JSR ChrOutScreen
           INY
           PLP
           BPL Jf185
           RTS

; *****
  Jf193
; *****

           STA BSOUR
           JSR Jf109

; *****
  Jf198
; *****

           JSR Jf175
           JMP Jf148

; *****
  Jf19e
; *****

           BIT C3PO
           BMI Bf1a6
           DEC C3PO
           BNE Bf1ab
 Bf1a6     PHA
           JSR Jf109
           PLA
 Bf1ab     STA BSOUR
           RTS

; *****
  Jf1ae
; *****

           LDA VIA_Port_B
           AND #$fb
           STA VIA_Port_B
           LDA #$5f ; '_'
           .BYTE $2c

; *****
  Jf1b9
; *****

           LDA #$3f ; '?'
           JSR Jf0d7
           BNE Jf148

; *****
  Jf1c0
; *****

           LDA #$34 ; '4'
           STA PIA2_Cont_A
           LDA VIA_Port_B
           ORA #2
           STA VIA_Port_B
 Bf1cd     LDA #$ff
           STA VIA_Timer_1_Hi
 Bf1d2     BIT VIA_IFR
           BVS Bf15b
           BIT VIA_Port_B
           BMI Bf1d2
           LDA VIA_Port_B
           AND #$fd
           STA VIA_Port_B
           BIT PIA1_Port_A ; Keyboard row select
           BVS Bf1ee
           LDA #$40 ; '@'
           JSR Jfbc4
 Bf1ee     LDA PIA2_Port_A
           EOR #$ff
           PHA
           LDA #$3c ; '<'
           STA PIA2_Cont_A
 Bf1f9     BIT VIA_Port_B
           BPL Bf1f9
           LDA #$34 ; '4'
           STA PIA2_Cont_A
           PLA
           RTS

; ************
  Kernal_GETIN
; ************

           LDA #0
           STA STATUS
           LDA DFLTN
           BNE Bf224
           LDA CharsInBuffer
           BEQ Bf262
           SEI
           JMP GETKEY

; ************
  Kernal_CHRIN
; ************

           LDA DFLTN
           BNE Bf224
           LDA CursorCol
           STA InputCol
           LDA CursorRow
           STA InputRow
           JMP INPUT_CHARACTER
 Bf224     CMP #3
           BNE Bf231
           STA CRSW
           LDA RigMargin
           STA LastInputCol
           JMP INPUT_CHARACTER
 Bf231     BCS Bf25c
           STX TEMPX
           JSR Jf249
           PHA
           JSR Jf249
           BNE Bf243
           LDA #$40 ; '@'
           JSR Jfbc4
 Bf243     DEC TMPZBA,X
           LDX TEMPX
           PLA
           RTS

; *****
  Jf249
; *****

           JSR Jf84b
           BNE Bf259
           JSR Jf89a
           LDX FA
           LDA #0
           STA TMPZBA,X
           BEQ Jf249
 Bf259     LDA (TAPE1),Y
           RTS
 Bf25c     LDA STATUS
           BEQ Bf263
           LDA #13
 Bf262     RTS
 Bf263     JMP Jf1c0

; *************
  Kernal_CHROUT
; *************

           PHA
           LDA DFLTO
           CMP #3
           BNE Bf271
           PLA
           JMP ChrOutScreen
 Bf271     BMI Bf277
           PLA
           JMP Jf19e
 Bf277     PLA

; *****
  Jf278
; *****

           STA TIMCMD
           CMP #10
           BEQ Bf262
           PHA
           TXA
           PHA
           TYA
           PHA
           JSR Jf84b
           BNE Bf298
           JSR Jf8cb
           LDX FA
           LDA #1
           STA TMPZBA,X
           LDY #0
           LDA #2
           STA (TAPE1),Y
           INY
 Bf298     LDA TIMCMD
           STA (TAPE1),Y
 Mf29c     PLA
           TAY
           PLA
           TAX
           PLA
           RTS

; ************
  Kernal_CLALL
; ************

           LDA #0
           STA LDTND

; *************
  Kernal_CLRCHN
; *************

           LDA DFLTO
           CMP #4
           BCC Bf2af
           JSR Jf1b9
 Bf2af     LDA DFLTN
           CMP #4
           BCC Jf2b8
           JSR Jf1ae

; *****
  Jf2b8
; *****

           LDA #3
           STA DFLTO
           LDA #0
           STA DFLTN
           RTS

; *********
  LOOKUP_LA
; *********

           LDX LDTND
 Bf2c3     DEX
           BMI Bf2dc
           CMP LAT,X
           BEQ Bf2dc
           BNE Bf2c3

; *****
  Jf2cd
; *****

           LDA LAT,X
           STA LA
           LDA FAT,X
           STA FA
           LDA SAT,X
           STA SA
 Bf2dc     RTS

; ************
  Kernal_CLOSE
; ************

           JSR Jf50d
           LDA LA
 Mf2e2     JSR LOOKUP_LA
           BNE Bf334

; *****
  Jf2e7
; *****

           JSR Jf2cd
           TXA
           PHA
           LDA FA
           BEQ Mf318
           CMP #3
           BEQ Mf318
           BCS Bf315
           LDA SA
           AND #15
           BEQ Mf318
           JSR Jf695
           LDA #0
           JSR Jf278
           JSR Jf8cb
           LDA SA
           CMP #$62
           BNE Mf318
           LDA #5
           JSR Jf619
           JMP Mf318
 Bf315     JSR Jf72f
 Mf318     PLA
           TAX
           DEC LDTND
           CPX LDTND
           BEQ Bf334
           LDY LDTND
           LDA LAT,Y
           STA LAT,X
           LDA FAT,Y
           STA FAT,X
           LDA SAT,Y
           STA SAT,X
 Bf334     RTS

; *****
  Jf335
; *****

           LDA STKEY
           CMP #$ef
           BNE Bf342
           PHP
           JSR Kernal_CLRCHN
           STA CharsInBuffer
           PLP
 Bf342     RTS

; ***********
  Kernal_STOP
; ***********

           JSR Jf335
           JMP Basic_STOP

; *****
  Jf349
; *****

           JSR Jf351
           BNE Bf342
           JMP Jf185

; *****
  Jf351
; *****

           LDA TXTPTR+1
           CMP #2
           RTS

; *****
  Jf356
; *****

           LDA FA
           BNE Bf35d
 Bf35a     JMP Syntax_Error
 Bf35d     CMP #3
           BEQ Bf35a
           BCC Bf3d4
           LDA #$60
           STA SA
           LDY FNLEN
           BNE Bf36e
           JMP Syntax_Error
 Bf36e     JSR Jf449
           JSR Jf4a5
           JSR Jf0d2
           LDA SA
           JSR Jf193
           JSR Jf1c0
           STA STAL
           LDA STATUS
           LSR A
           LSR A
           BCS Bf3c1
           JSR Jf1c0
           STA STAL+1
           JSR Jf46d
 Bf38f     LDA #$fd
           AND STATUS
           STA STATUS
           JSR Kernal_STOP
           JSR Jf1c0
           TAX
           LDA STATUS
           LSR A
           LSR A
           BCS Bf38f
           TXA
           LDY VERCK
           BEQ Bf3b3
           DEY
           CMP (STAL),Y
           BEQ Bf3b5
           LDA #16
           ORA STATUS
           STA STATUS
           .BYTE $2c
 Bf3b3     STA (STAL),Y
 Bf3b5     INC STAL
           BNE Bf3bb
           INC STAL+1
 Bf3bb     BIT STATUS
           BVS Bf3c6
           BVC Bf38f
 Bf3c1     LDY #$24 ; '$'
           JMP Mf5af
 Bf3c6     LDA STAL
           STA EAL
           LDA STAL+1
           STA EAL+1
           JSR Jf1ae
           JMP Jf72f
 Bf3d4     JSR Jf695
           JSR Jf857
           JSR Jf449
 Bf3dd     LDA FNLEN
           BEQ Bf3e9
           JSR Jf4d3
           BNE Bf3ee
 Bf3e6     JMP Mf5ad
 Bf3e9     JSR Jf5e5
           BEQ Bf3e6
 Bf3ee     CPX #1
           BNE Bf3dd
           LDA STATUS
           AND #16
           BNE Bf46c
           JSR Jf67b
           JSR Jf46d
           JMP Mf8a3

; ***********
  Kernal_LOAD
; ***********

           LDA #0
           STA VERCK

; *****
  Jf405
; *****

           JSR Jf47d
 Mf408     JSR Jf6cc
           LDA #$ff
 Bf40d     CMP STKEY
           BNE Bf40d
           CMP STKEY
           BNE Bf40d
           JSR Jf356
           LDA VERCK
           BNE Bf46c
           JSR Jf92b
           LDA STATUS
           AND #16
           BEQ Bf42e
           LDY #0
           STY CharsInBuffer
           LDY #$60
           JMP Mf5af
 Bf42e     LDY #$ae
           JSR Jf349
           JSR Jf351
           BNE Bf443
           LDA EAL+1
           STA VARTAB+1
           LDA EAL
           STA VARTAB
           JMP Reset_And_Rechain
 Bf443     JSR Reset_BASIC_Exec_Pointer
           JMP Mb60b

; *****
  Jf449
; *****

           JSR Jf351
           BNE Bf46c
           LDY #$32 ; '2'
           JSR Jf185
           LDA FNLEN
           BEQ Bf46c
           LDY #$3d ; '='
           JSR Jf185

; *****
  Jf45c
; *****

           LDY FNLEN
           BEQ Bf46c
           LDY #0
 Bf462     LDA (FNADR),Y
           JSR Kernal_CHROUT
           INY
           CPY FNLEN
           BNE Bf462
 Bf46c     RTS

; *****
  Jf46d
; *****

           LDY #$5f ; '_'
           LDA VERCK
           BEQ Bf475
           LDY #$6d
 Bf475     JSR Jf349
           LDY #$39 ; '9'
           JMP Jf349

; *****
  Jf47d
; *****

           LDX #0
           STX STATUS
           STX FNLEN
           STX SA
           INX
           STX FA
           JSR Jf54d
           JSR Jf53c
           JSR Jf54d
           JSR Jf49f
           STX FA
           JSR Jf54d
           JSR Jf49f
           STX SA
 Bf49e     RTS

; *****
  Jf49f
; *****

           JSR Jf555
           JMP Get_Byte_Value

; *****
  Jf4a5
; *****

           LDA SA
           BMI Bf49e
           LDY FNLEN
           BEQ Bf49e
           JSR Jf0d5
           LDA SA
           ORA #$f0
 Mf4b4     JSR Jf143
           LDA STATUS
           BPL Bf4c0
 Mf4bb     LDY #$74
           JMP Mf5af
 Bf4c0     LDA FNLEN
           BEQ Bf4d0
           LDY #0
 Bf4c6     LDA (FNADR),Y
           JSR Jf19e
           INY
           CPY FNLEN
           BNE Bf4c6
 Bf4d0     JMP Jf1b9

; *****
  Jf4d3
; *****

           JSR Jf5e5
           BEQ Bf4f5
           LDY #5
           STY MONCNT
           LDY #0
           STY TIMCMD
 Bf4e0     CPY FNLEN
           BEQ Bf4f4
           LDA (FNADR),Y
           LDY MONCNT
           CMP (TAPE1),Y
           BNE Jf4d3
           INC TIMCMD
           INC MONCNT
           LDY TIMCMD
           BNE Bf4e0
 Bf4f4     TYA
 Bf4f5     RTS

; *************
  Kernal_SETTIM
; *************

           LDA #1
           STA VERCK
           JSR Jf405
           LDA STATUS
           AND #16
           BEQ Bf508
           LDY #$6e
           JMP Mf5af
 Bf508     LDY #$aa
           JMP Jf185

; *****
  Jf50d
; *****

           LDX #0
           STX SA
           STX STATUS
           STX FNLEN
           INX
           STX FA
           JSR Jf558
           JSR Get_Byte_Value
           STX LA
           JSR Jf54d
           JSR Jf49f
           STX FA
           CPX #3
           BCC Bf52e
           DEC SA
 Bf52e     JSR Jf54d
           JSR Jf49f
           STX SA
           JSR Jf54d
           JSR Jf555

; *****
  Jf53c
; *****

           JSR Eval_Expression
           JSR Eval_String
           STA FNLEN
           LDA INDEXA
           STA FNADR
           LDA INDEXA+1
           STA FNADR+1
           RTS

; *****
  Jf54d
; *****

           JSR CHRGOT
           BNE Bf554
           PLA
           PLA
 Bf554     RTS

; *****
  Jf555
; *****

           JSR Need_Comma

; *****
  Jf558
; *****

           JSR CHRGOT
           BNE Bf554
 Bf55d     JMP Syntax_Error

; ***********
  Kernal_OPEN
; ***********

           JSR Jf50d
 Mf563     LDA LA

; *****
  Jf565
; *****

           BEQ Bf55d
           LDY #14
           JSR LOOKUP_LA
           BEQ Mf5af
           LDX LDTND
           LDY #0
           STY STATUS
           CPX #10
           BEQ Mf5af
           INC LDTND
           LDA LA
           STA LAT,X
           LDA SA
           ORA #$60
           STA SA
           STA SAT,X
           LDA FA
           STA FAT,X
           BEQ Bf5e4
           CMP #3
           BEQ Bf5e4
           BCC Bf598
           JMP Jf4a5
 Bf598     LDA SA
           AND #15
           BNE Bf5c9
           JSR Jf857
           JSR Jf449
           LDA FNLEN
           BEQ Bf5c2
           JSR Jf4d3
           BNE Bf5d1
 Mf5ad     LDY #$24 ; '$'
 Mf5af     JSR Kernal_CLALL
           LDA #13
           JSR Kernal_CHROUT
           LDA #$3f ; '?'
           JSR Kernal_CHROUT
           JSR Jf185
           JMP Mb3ed
 Bf5c2     JSR Jf5e5
           BEQ Mf5ad
           BNE Bf5d1
 Bf5c9     JSR Jf88c
           LDA #4
           JSR Jf619
 Bf5d1     LDX FA
           LDA #$bf
           LDY SA
           CPY #$60
           BEQ Bf5e2
           LDY #0
           LDA #2
           STA (TAPE1),Y
           TYA
 Bf5e2     STA TMPZBA,X
 Bf5e4     RTS

; *****
  Jf5e5
; *****

           LDA VERCK
           PHA
 Bf5e8     JSR Jf89a
           LDY #0
           LDA (TAPE1),Y
           CMP #5
           BEQ Bf614
           CMP #1
           BEQ Bf5fb
           CMP #4
           BNE Bf5e8
 Bf5fb     TAX
           JSR Jf351
           BNE Bf612
           LDY #$a3
           JSR Jf185
           LDY #5
 Bf608     LDA (TAPE1),Y
           JSR CHROUT
           INY
           CPY #$15
           BNE Bf608
 Bf612     LDY #1
 Bf614     PLA
           STA VERCK
           TYA
           RTS

; *****
  Jf619
; *****

           STA TIMCMD
           JSR Jf695
           LDA STAL+1
           PHA
           LDA STAL
           PHA
           LDA EAL+1
           PHA
           LDA EAL
           PHA
           LDY #$bf
           LDA #$20 ; ' '
 Bf62e     STA (TAPE1),Y
           DEY
           BNE Bf62e
           LDA TIMCMD
           STA (TAPE1),Y
           INY
           LDA STAL
           STA (TAPE1),Y
           INY
           LDA STAL+1
           STA (TAPE1),Y
           INY
           LDA EAL
           STA (TAPE1),Y
           INY
           LDA EAL+1
           STA (TAPE1),Y
           INY
           STY MONCNT
           LDY #0
           STY TIMCMD
 Bf652     LDY TIMCMD
           CPY FNLEN
           BEQ Bf664
           LDA (FNADR),Y
           LDY MONCNT
           STA (TAPE1),Y
           INC TIMCMD
           INC MONCNT
           BNE Bf652
 Bf664     JSR Jf6ab
           LDA #$69
           STA RIPRTY
           JSR Jf8d5
           PLA
           STA EAL
           PLA
           STA EAL+1
           PLA
           STA STAL
           PLA
           STA STAL+1
           RTS

; *****
  Jf67b
; *****

           JSR Jf92b
           LDX #0
           LDY #1
 Bf682     LDA (TAPE1),Y
           STA SAL,X
           INX
           INY
           CPX #4
           BNE Bf682
           LDA SAL
           STA STAL
           LDA SAL+1
           STA STAL+1
           RTS

; *****
  Jf695
; *****

           LDA #$7a
           STA TAPE1
           LDA #2
           STA TAPE1+1
           LDA FA
           LSR A
           BCS Bf6aa
           LDA #$3a ; ':'
           STA TAPE1
           LDA #3
           STA TAPE1+1
 Bf6aa     RTS

; *****
  Jf6ab
; *****

           JSR Jf92b
           JSR Jf695
           LDA TAPE1
           STA STAL
           CLC
           ADC #$c0
           STA EAL
           LDA TAPE1+1
           STA STAL+1
           ADC #0
           STA EAL+1
           RTS

; **********
  Kernal_SYS
; **********

           JSR Eval_Numeric
           JSR FAC1_To_LINNUM
           JMP (LINNUM)

; *****
  Jf6cc
; *****

           LDA VARTAB
           STA EAL
           LDA VARTAB+1
           STA EAL+1
           LDA TXTTAB+1
           STA STAL+1
           LDA TXTTAB
           STA STAL
           RTS

; ***********
  Kernal_SAVE
; ***********

           JSR Jf47d
 Mf6e0     JSR Jf6cc

; *****
  Jf6e3
; *****

           LDA FA
           BNE Bf6ec
 Bf6e7     LDY #$74
           JMP Mf5af
 Bf6ec     CMP #3
           BEQ Bf6e7
           BCC Bf742
           LDA #$61
           STA SA
           LDY FNLEN
           BNE Bf6fd
           JMP Syntax_Error
 Bf6fd     JSR Jf4a5
           JSR Jf0d5
           LDA SA
           JSR Jf143
           LDY #0
           JSR Jfbbb
           LDA SAL
           JSR Jf19e
           LDA SAL+1
           JSR Jf19e
 Bf717     JSR Jfd0b
           BEQ Bf72c
           LDA (SAL),Y
           JSR Jf19e
           JSR Kernal_STOP
           INC SAL
           BNE Bf717
           INC SAL+1
           BNE Bf717
 Bf72c     JSR Jf1b9

; *****
  Jf72f
; *****

           BIT SA
           BMI Bf7ab
           JSR Jf0d5
           LDA SA
           AND #$ef
           ORA #$e0
           JSR Jf143
           JMP Jf1b9
 Bf742     JSR Jf695
           JSR Jf88c
           JSR Jf351
           BNE Bf755
           LDY #$64
           JSR Jf185
           JSR Jf45c
 Bf755     LDA #1
           JSR Jf619
           JSR Jf8ce
           LDA SA
           AND #2
           BEQ Bf7ab
           LDA #5
           JMP Jf619

; ************
  Kernal_UDTIM
; ************

           INC JIFFY_CORR
           LDA JIFFY_CORR
           BNE Bf770
           INC JIFFY_CORR+1
 Bf770     CMP #$6f
           BNE Bf77a
           LDA JIFFY_CORR+1
           CMP #2
           BEQ Bf79b
 Bf77a     INC JIFFY_CLOCK+2
           BNE Bf784
           INC JIFFY_CLOCK+1
           BNE Bf784
           INC JIFFY_CLOCK
 Bf784     LDX #0
 Bf786     LDA JIFFY_CLOCK,X
           CMP Vf7ac,X
           BCC Bf7a1
           INX
           CPX #3
           BNE Bf786
           LDA #0
 Bf794     STA JIFFY_CLOCK-1,X
           DEX
           BNE Bf794
           BEQ Bf7a1
 Bf79b     LDA #0
           STA JIFFY_CORR
           STA JIFFY_CORR+1
 Bf7a1     LDA PIA1_Port_B ; Keyboard row
           CMP PIA1_Port_B ; Keyboard row
           BNE Bf7a1
           STA STKEY
 Bf7ab     RTS

; *****
  Vf7ac
; *****

           .BYTE $4f,$1a,$01

; ************
  Kernal_CHKIN
; ************

           PHA
           TXA
           PHA
           TYA
           PHA
           LDA #0
           STA STATUS
           TXA
           JSR LOOKUP_LA
           BEQ Bf7c3
 Bf7be     LDY #$17
 Bf7c0     JMP Mf5af
 Bf7c3     JSR Jf2cd
           LDA FA
           BEQ Mf7da
           CMP #3
           BEQ Mf7da
           BCS Bf7df
           LDX SA
           CPX #$60
           BEQ Mf7da
           LDY #$86
           BNE Bf7c0
 Mf7da     STA DFLTN
           JMP Mf29c
 Bf7df     PHA
           JSR Jdbe1
           JSR Jf0d2
           LDA SA
           BPL Bf7f0
           JSR Jf198
           JMP Mf7f3
 Bf7f0     JSR Jf193
 Mf7f3     LDA STATUS
           BPL Bf7fa
           JMP Mf4bb
 Bf7fa     PLA
           JMP Mf7da

; *************
  Kernal_CHKOUT
; *************

           PHA
           TXA
           PHA
           TYA
           PHA
           LDA #0
           STA STATUS
           TXA
           JSR LOOKUP_LA
           BNE Bf7be
           JSR Jf2cd
           LDA FA
           BNE Bf818
           LDY #$94
           BNE Bf7c0
 Bf818     CMP #3
           BEQ Mf828
           BCS Bf82d
           LDX SA
           CPX #$60
           BNE Mf828
           LDY #$94
           BNE Bf7c0
 Mf828     STA DFLTO
           JMP Mf29c
 Bf82d     PHA
           JSR Jdbe1
           JSR Jf0d5
           LDA SA
           BPL Bf83d
           JSR Jf148
           BNE Bf840
 Bf83d     JSR Jf143
 Bf840     LDA STATUS
           BPL Bf847
           JMP Mf4bb
 Bf847     PLA
           JMP Mf828

; *****
  Jf84b
; *****

           JSR Jf695
           LDX FA
           INC TMPZBA,X
           LDY TMPZBA,X
           CPY #$c0
           RTS

; *****
  Jf857
; *****

           JSR Jf87a
           BEQ Bf88b
           LDY #$41 ; 'A'
 Bf85e     JSR Jf185
           LDY #$56 ; 'V'
           JSR Jf185
           LDA FA
           ORA #$30 ; '0'
           JSR ChrOutScreen
 Bf86d     JSR Jf935
           JSR Jf87a
           BNE Bf86d
           LDY #$aa
           JMP Jf185

; *****
  Jf87a
; *****

           LDA #16
           LDX FA
           DEX
           BEQ Bf883
           LDA #$20 ; ' '
 Bf883     BIT PIA1_Port_A ; Keyboard row select
           BNE Bf88b
           BIT PIA1_Port_A ; Keyboard row select
 Bf88b     RTS

; *****
  Jf88c
; *****

           JSR Jf87a
           BEQ Bf88b
           LDY #$41 ; 'A'
           JSR Jf185
           LDY #$4d ; 'M'
           BNE Bf85e

; *****
  Jf89a
; *****

           LDA #0
           STA STATUS
           STA VERCK
           JSR Jf6ab
 Mf8a3     JSR Jf92b
           JSR Jf857
           SEI
           LDA #0
           STA RIDATA
           STA BITTS
           STA CMP0
           STA PTR1
           STA PTR2
           STA DPSW
           LDX FA
           DEX
           BEQ Bf8c4
           LDA #$90
           STA VIA_IER
           BNE Bf8c7
 Bf8c4     INC PIA1_Cont_A
 Bf8c7     LDX #14
           BNE Bf8e0

; *****
  Jf8cb
; *****

           JSR Jf6ab

; *****
  Jf8ce
; *****

           JSR Jf92b
           LDA #$14
           STA RIPRTY

; *****
  Jf8d5
; *****

           JSR Jf88c
           SEI
           LDA #$a0
           STA VIA_IER
           LDX #8
 Bf8e0     JSR Jfce0
           LDA #2
           STA FSBLK
           JSR Jfbc9
           DEC PIA1_Cont_B
           LDX FA
           DEX
           BNE Bf8fb
           LDA #$34 ; '4'
           STA PIA1_Cont_B
           STA CAS1
           BNE Bf905
 Bf8fb     LDA VIA_Port_B
           STX CAS2
           AND #$ef
           STA VIA_Port_B
 Bf905     LDX #$ff
 Bf907     LDY #$ff
 Bf909     DEY
           BNE Bf909
           DEX
           BNE Bf907
           STA VIA_Timer_2_Hi
           CLI
 Mf913     LDA #$e4
           CMP CINV+1
           BEQ Bf92a
           JSR Jf935
           BIT PIA1_Cont_B
           BPL Mf913
           BIT PIA1_Port_B ; Keyboard row
           JSR Kernal_UDTIM
           JMP Mf913
 Bf92a     RTS

; *****
  Jf92b
; *****

           JSR Jf935
           LDA #$e4
           CMP CINV+1
           BNE Jf92b
           RTS

; *****
  Jf935
; *****

           JSR Jf335
           BNE Bf942
           JSR Jfcc0
           JSR Jf2b8
           STA IOPMPT
 Bf942     JMP Basic_STOP

; *****
  Jf945
; *****

           STX BLNSW
           LDA CMP0
           ASL A
           ASL A
           CLC
           ADC CMP0
           CLC
           ADC BLNSW
           STA BLNSW
           LDA #0
           BIT CMP0
           BMI Bf95a
           ROL A
 Bf95a     ASL BLNSW
           ROL A
           ASL BLNSW
           ROL A
           TAX
 Bf961     LDA VIA_Timer_2_Lo
           CMP #$15
           BCC Bf961
           ADC BLNSW
           STA VIA_Timer_1_Lo
           TXA
           ADC VIA_Timer_2_Hi
           STA VIA_Timer_1_Hi
           CLI
           RTS
 Bf976     LDX VIA_Timer_2_Hi
           LDY #$ff
           TYA
           SBC VIA_Timer_2_Lo
           CPX VIA_Timer_2_Hi
           BNE Bf976
           STX BLNSW
           TAX
           STY VIA_Timer_2_Lo
           STY VIA_Timer_2_Hi
           TYA
           SBC BLNSW
           STX BLNSW
           LSR A
           ROR BLNSW
           LSR A
           ROR BLNSW
           LDA CMP0
           CLC
           ADC #$3c ; '<'
           BIT VIA_Port_B
           BIT PIA1_Port_A ; Keyboard row select
           CMP BLNSW
           BCS Bf9f1
           LDX DPSW
           BEQ Bf9ae
           JMP Mfa9c
 Bf9ae     LDX TMPZB7
           BMI Bf9cd
           LDX #0
           ADC #$30 ; '0'
           ADC CMP0
           CMP BLNSW
           BCS Bf9d8
           INX
           ADC #$26 ; '&'
           ADC CMP0
           CMP BLNSW
           BCS Mf9dc
           ADC #$2c ; ','
           ADC CMP0
           CMP BLNSW
           BCC Bf9d0
 Bf9cd     JMP Mfa4c
 Bf9d0     LDA BITTS
           BEQ Bf9f1
           STA BITCI
           BNE Bf9f1
 Bf9d8     INC RINONE
           BCS Bf9de
 Mf9dc     DEC RINONE
 Bf9de     SEC
           SBC #$13
           SBC BLNSW
           ADC SVXT
           STA SVXT
           LDA TMPZB9
           EOR #1
           STA TMPZB9
           BEQ Bfa10
           STX DATAX
 Bf9f1     LDA BITTS
           BEQ Bfa0d
           BIT VIA_IFR
           BVC Bfa0d
           LDA #0
           STA TMPZB9
           LDA TMPZB7
           BPL Bfa33
           BMI Bf9cd
 Bfa04     LDX #$a6
           JSR Jf945
           LDA PRTY
           BNE Bf9d0
 Bfa0d     JMP END_OF_IRQ
 Bfa10     LDA SVXT
           BEQ Bfa1c
           BMI Bfa1a
           DEC CMP0
           DEC CMP0
 Bfa1a     INC CMP0
 Bfa1c     LDA #0
           STA SVXT
           CPX DATAX
           BNE Bfa33
           TXA
           BNE Bf9d0
           LDA RINONE
           BMI Bf9f1
           CMP #16
           BCC Bf9f1
           STA SYNO
           BCS Bf9f1
 Bfa33     TXA
           EOR PRTY
           STA PRTY
           LDA BITTS
           BEQ Bfa0d
           DEC TMPZB7
           BMI Bfa04
           LSR DATAX
           ROR MYCH
           LDX #$da
           JSR Jf945
           JMP END_OF_IRQ
 Mfa4c     LDA SYNO
           BEQ Bfa54
           LDA BITTS
           BEQ Bfa5b
 Bfa54     LDA TMPZB7
           BMI Bfa5b
           JMP Mf9dc
 Bfa5b     LSR BLNSW
           LDA #$93
           SEC
           SBC BLNSW
           ADC CMP0
           ASL A
           TAX
           JSR Jf945
           INC DPSW
           LDA BITTS
           BNE Bfa80
           LDA SYNO
           BEQ Bfa99
           STA BITCI
           LDA #0
           STA SYNO
           LDA #$c0
           STA VIA_IER
           STA BITTS
 Bfa80     LDA SYNO
           STA EOT
           BEQ Bfa8f
           LDA #0
           STA BITTS
           LDA #$40 ; '@'
           STA VIA_IER
 Bfa8f     LDA MYCH
           STA ROPRTY
           LDA BITCI
           ORA RINONE
           STA READERR
 Bfa99     JMP END_OF_IRQ
 Mfa9c     JSR Jfbc9
           STA DPSW
           LDX #$da
           JSR Jf945
           LDA FSBLK
           BEQ Bfaac
           STA INBIT
 Bfaac     LDA #15
           BIT RIDATA
           BPL Bfac9
           LDA EOT
           BNE Bfac2
           LDX FSBLK
           DEX
           BNE Bfac6
           LDA #8
           JSR Jfbc4
           BNE Bfac6
 Bfac2     LDA #0
           STA RIDATA
 Bfac6     JMP END_OF_IRQ
 Bfac9     BVS Bfafc
           BNE Bfae5
           LDA EOT
           BNE Bfac6
           LDA READERR
           BNE Bfac6
           LDA INBIT
           LSR A
           LDA ROPRTY
           BMI Bfadf
           BCC Bfaf6
           CLC
 Bfadf     BCS Bfaf6
           AND #15
           STA RIDATA
 Bfae5     DEC RIDATA
           BNE Bfac6
           LDA #$40 ; '@'
           STA RIDATA
           JSR Jfbbb
           LDA #0
           STA RIPRTY
           BEQ Bfac6
 Bfaf6     LDA #$80
           STA RIDATA
           BNE Bfac6
 Bfafc     LDA EOT
           BEQ Bfb0a
           LDA #4
           JSR Jfbc4
           LDA #0
           JMP Mfb8b
 Bfb0a     JSR Jfd0b
           BNE Bfb12
           JMP Mfb89
 Bfb12     LDX INBIT
           DEX
           BEQ Bfb44
           LDA VERCK
           BEQ Bfb27
           LDY #0
           LDA ROPRTY
           CMP (SAL),Y
           BEQ Bfb27
           LDA #1
           STA READERR
 Bfb27     LDA READERR
           BEQ Mfb77
           LDX #$3d ; '='
           CPX PTR1
           BCC Bfb70
           LDX PTR1
           LDA SAL+1
           STA STACK+1,X
           LDA SAL
           STA STACK,X
           INX
           INX
           STX PTR1
           JMP Mfb77
 Bfb44     LDX PTR2
           CPX PTR1
           BEQ Bfb81
           LDA SAL
           CMP STACK,X
           BNE Bfb81
           LDA SAL+1
           CMP STACK+1,X
           BNE Bfb81
           INC PTR2
           INC PTR2
           LDA VERCK
           BEQ Bfb6c
           LDA ROPRTY
           LDY #0
           CMP (SAL),Y
           BEQ Bfb81
           LDA #1
           STA READERR
 Bfb6c     LDA READERR
           BEQ Mfb77
 Bfb70     LDA #16
           JSR Jfbc4
           BNE Bfb81
 Mfb77     LDA VERCK
           BNE Bfb81
           LDA ROPRTY
           LDY #0
           STA (SAL),Y
 Bfb81     INC SAL
           BNE Bfbb8
           INC SAL+1
           BNE Bfbb8
 Mfb89     LDA #$80
 Mfb8b     STA RIDATA
           LDX FSBLK
           DEX
           BMI Bfb94
           STX FSBLK
 Bfb94     DEC INBIT
           BEQ Bfba0
           LDA PTR1
           BNE Bfbb8
           STA FSBLK
           BEQ Bfbb8
 Bfba0     JSR Jfcc0
           JSR Jfbbb
           LDY #0
           STY RIPRTY
           JSR Jfcf9
           LDA RIPRTY
           EOR ROPRTY
           BEQ Bfbb8
           LDA #$20 ; ' '
           JSR Jfbc4
 Bfbb8     JMP END_OF_IRQ

; *****
  Jfbbb
; *****

           LDA STAL+1
           STA SAL+1
           LDA STAL
           STA SAL
           RTS

; *****
  Jfbc4
; *****

           ORA STATUS
           STA STATUS
           RTS

; *****
  Jfbc9
; *****

           LDA #8
           STA TMPZB7
           LDA #0
           STA TMPZB9
           STA BITCI
           STA PRTY
           STA RINONE
           RTS

; *****
  Jfbd8
; *****

           LDA ROPRTY
           LSR A
           LDA #$60
           BCC Jfbe1

; *****
  Jfbdf
; *****

           LDA #$b0

; *****
  Jfbe1
; *****

           LDX #0

; *****
  Jfbe3
; *****

           STA VIA_Timer_2_Lo
           STX VIA_Timer_2_Hi
           LDA VIA_Port_B
           EOR #8
           STA VIA_Port_B
           AND #8
           RTS
 Bfbf4     SEC
           ROR SAL+1
           BMI Bfc35
           LDA BITCI
           BNE Bfc0f
           LDA #16
           LDX #1
           JSR Jfbe3
           BNE Bfc35
           INC BITCI
           LDA SAL+1
           BPL Bfc35
           JMP Mfc86
 Bfc0f     LDA RINONE
           BNE Bfc1c
           JSR Jfbdf
           BNE Bfc35
           INC RINONE
           BNE Bfc35
 Bfc1c     JSR Jfbd8
           BNE Bfc35
           LDA TMPZB9
           EOR #1
           STA TMPZB9
           BEQ Bfc38
           LDA ROPRTY
           EOR #1
           STA ROPRTY
           AND #1
           EOR PRTY
           STA PRTY
 Bfc35     JMP END_OF_IRQ
 Bfc38     LSR ROPRTY
           DEC TMPZB7
           LDA TMPZB7
           BEQ Bfc7d
           BPL Bfc35
 Bfc42     JSR Jfbc9
           CLI
           LDA TMPZBA
           BEQ Bfc5c
           LDX #0
           STX DATAX
           DEC TMPZBA
           LDX FSBLK
           CPX #2
           BNE Bfc58
           ORA #$80
 Bfc58     STA ROPRTY
           BNE Bfc35
 Bfc5c     JSR Jfd0b
           BCC Bfc6b
           BNE Bfbf4
           INC SAL+1
           LDA DATAX
           STA ROPRTY
           BCS Bfc35
 Bfc6b     LDY #0
           LDA (SAL),Y
           STA ROPRTY
           EOR DATAX
           STA DATAX
           INC SAL
           BNE Bfc35
           INC SAL+1
           BNE Bfc35
 Bfc7d     LDA PRTY
           EOR #1
           STA ROPRTY
 Bfc83     JMP END_OF_IRQ
 Mfc86     DEC FSBLK
           BNE Bfc8d
           JSR Jfceb
 Bfc8d     LDA #$50 ; 'P'
           STA INBIT
           LDX #8
           SEI
           JSR Jfce0
           BNE Bfc83
           LDA #$78
           JSR Jfbe1
           BNE Bfc83
           DEC INBIT
           BNE Bfc83
           JSR Jfbc9
           DEC RIPRTY
           BPL Bfc83
           LDX #10
           JSR Jfce0
           CLI
           INC RIPRTY
           LDA FSBLK
           BEQ Bfcdb
           JSR Jfbbb
           LDX #9
           STX TMPZBA
           BNE Bfc42

; *****
  Jfcc0
; *****

           PHP
           SEI
           JSR Jfceb
           LDA #$7f
           STA VIA_IER
           LDA #$3c ; '<'
           STA PIA1_Cont_A
           LDA #$3d ; '='
           STA PIA1_Cont_B
           LDX #12
           JSR Jfce0
           PLP
           RTS
 Bfcdb     JSR Jfcc0
           BEQ Bfc83

; *****
  Jfce0
; *****

           LDA Vfd4c,X
           STA CINV
           LDA Vfd4c+1,X
           STA CINV+1
           RTS

; *****
  Jfceb
; *****

           LDA #$3c ; '<'
           STA PIA1_Cont_B
           LDA VIA_Port_B
           ORA #16
           STA VIA_Port_B
           RTS

; *****
  Jfcf9
; *****

           LDA (SAL),Y
           EOR RIPRTY
           STA RIPRTY
           INC SAL
           BNE Bfd05
           INC SAL+1
 Bfd05     JSR Jfd0b
           BNE Jfcf9
           RTS

; *****
  Jfd0b
; *****

           LDA SAL+1
           CMP EAL+1
           BNE Bfd15
           LDA SAL
           CMP EAL
 Bfd15     RTS

; ***********
  Entry_RESET
; ***********

           LDX #$ff
           SEI
           TXS
           CLD
           JSR EDITOR
           LDA #<Basic_Ready
           STA NMINV
           LDA #>Basic_Ready
           STA NMINV+1
           LDA #<MONITOR_BREAK
           STA CBINV
           LDA #>MONITOR_BREAK
           STA CBINV+1
           LDA #<Md7a4
           STA Reset_Vector
           LDA #>Md7a4
           STA Reset_Vector+1
           LDA #0
           STA Reset_Param
           CLI
           LDA PIA1_Port_A ; Keyboard row select
           BMI Bfd46
           JMP MONITOR_CALL
 Bfd46     JMP Init_BASIC_RAM_Vectors

; *********
  Entry_NMI
; *********

           JMP (NMINV)
 Vfd4c     .FILL $fd54-* ($00) ;    8 bytes
           .BYTE $99,$fc,$f9,$fb,$55,$e4,$76,$f9
           .BYTE $f5
           .FILL $ff93-* ($aa) ;  566 bytes

; ************
  Basic_CONCAT
; ************

           JMP Kernal_CONCAT

; ***********
  Basic_DOPEN
; ***********

           JMP Kernal_DOPEN

; ************
  Basic_DCLOSE
; ************

           JMP Kernal_DCLOSE

; ************
  Basic_RECORD
; ************

           JMP Kernal_RECORD

; ************
  Basic_HEADER
; ************

           JMP Kernal_HEADER

; *************
  Basic_COLLECT
; *************

           JMP Kernal_COLLECT

; ************
  Basic_BACKUP
; ************

           JMP Kernal_BACKUP

; **********
  Basic_COPY
; **********

           JMP Kernal_COPY

; ************
  Basic_APPEND
; ************

           JMP Kernal_APPEND

; ***********
  Basic_DSAVE
; ***********

           JMP Kernal_DSAVE

; ***********
  Basic_DLOAD
; ***********

           JMP Kernal_DLOAD

; ***************
  Basic_DIRECTORY
; ***************

           JMP Kernal_DIRECTORY

; ************
  Basic_RENAME
; ************

           JMP Kernal_RENAME

; *************
  Basic_SCRATCH
; *************

           JMP Kernal_SCRATCH
 Mffbd     JMP Md995

; ****
  OPEN
; ****

           JMP Kernal_OPEN

; *****
  CLOSE
; *****

           JMP Kernal_CLOSE

; *****
  CHKIN
; *****

           JMP Kernal_CHKIN

; ******
  CHKOUT
; ******

           JMP Kernal_CHKOUT

; ******
  CLRCHN
; ******

           JMP Kernal_CLRCHN

; *****
  CHRIN
; *****

           JMP Kernal_CHRIN

; ******
  CHROUT
; ******

           JMP Kernal_CHROUT

; **********
  Basic_LOAD
; **********

           JMP Kernal_LOAD

; **********
  Basic_SAVE
; **********

           JMP Kernal_SAVE

; ************
  Basic_SETTIM
; ************

           JMP Kernal_SETTIM

; *********
  Basic_SYS
; *********

           JMP Kernal_SYS

; ****
  STOP
; ****

           JMP Kernal_STOP

; *****
  GETIN
; *****

           JMP Kernal_GETIN

; *****
  CLALL
; *****

           JMP Kernal_CLALL

; *****
  UDTIM
; *****

           JMP Kernal_UDTIM
           .FILL $fffa-* ($aa) ;   13 bytes

; ***************
  HardwareVectors
; ***************

           .WORD Entry_NMI
           .WORD Entry_RESET
           .WORD IRQ_MAIN
