; PET/CBM EDIT ROM - 8296 EXECUDESK 
; ================
; The following is a simple disassembly of the EXECUDESK EDIT ROM
; from an 8296.
; TODO: convert to proper source code with correct symbols

;---- patch - set IRQ vector to EXECUDESK IRQ HANDLER at $E900

$E621: A9 00     LDA #<EDESK_IRQ
$E623: 85 90     STA $<INTVEC 			;hardware interrupt vector LO
$E625: A9 E9     LDA #>EDESK_IRQ
$E627: 85 91     STA $<INTVEC + 1 		;hardware interupt vector HI

;----- new code in upper edit rom area

EDESK_IRQ
$E900: 4C 9E EC  JMP EDESK_IRQ_HANDLER		; L_EC9E

;--------------- Execudesk Menu Strings
; NULL-terminated strings

EDSTRING1
$E903:          !BYTE 93,12			; <CLS><RVS>
		!TEXT "                                "
		!BYTE C5,D8,C5,C3,D5,20		; <SHIFT>"EXECU 
		!BYTE 2D,20,C4,C5,D3,CB		; - DESK"
		!TEXT "                                   "
		!BYTE 0D,0D,0D			; <CR>
		!BYTE "           "
		!BYTE 12,20,31,20,92		; <RVS> 1 <RVSOFF>
		!BYTE "      "
$E96B:          !BYTE D7			; SHIFT-W
		!TEXT "ORD "
		!BYTE D0			; SHIFT-P
$E973:          !BYTE "ROCESSOR"
$E97B:          !BYTE 0D,0D
		!TEXT "           "
		!BYTE 12,20,32,20,92		; <RVS> 2 <RVSOFF>
		!TEXT "      "
$E993:          !BYTE D3			; SHIFT-S
		!TEXT "PREAD "
		!BYTE D3			; SHIFT-S
$E99B:          !TEXT "HEET"
		!BYTE 0D,0D
		!TEXT "           "
		!BYTE 12,20,33,20,92		; <RVS> 3 <RVSOFF>
		!TEXT "      "
		!BYTE C4			; SHIFT-D
		!TEXT "ATA "
		!BYTE C2			; SHIFT-B
		!TEXT "ASE "
		!BYTE CD
		!TEXT "ANAGER
		!BYTE 0D,0D
		!BYTE 0

;--------------- STRING

EDSTRING2
$E9CB:          !TEXT "           "
$E9D3:          !BYTE 12,20,34,20,92		; <RVS> 4 <RVSOFF>
$E9DB:          !BYTE "      "
		!BYTE C6			; SHIFT-F
		!TEXT "INANCIAL "
$E9EB:          !BYTE C3			; SHIFT-C
		!TEXT "ALCULATIONS"
		!BYTE 0D,0D
		!TEXT "           "
$EA03:          !BYTE 12,20,35,20,92		; <RVS> 5 <RVSOFF>
		!BYTE "      "
		!BYTE D4			; SHIFT-T
		!TEXT "ERMINAL "
		!BYTE C3			; SHIFT-C
		!TEXT "OMMUNICATIONS"
		!BYTE 0D,0D
		!TEXT "           "
$EA33:          !BYTE 12,20,36,20,92		; <RVS> 6 <RVSOFF>
		!TEXT "      "
$EA3B:          !BYTE D3			; SHIFT-S
		!TEXT "YSTEM "
		!BYTE D5
		!TEXT "TILITIES"
		!BYTE 0D,0D
		!BYTE 0

;--------------- STRING

EDSTRING3
$EA51:		!TEXT "           "
$EA5B:          !BYTE 12,20,37,20,92		; <RVS> 7 <RVSOFF>
		!TEXT "      "
		!BYTE D3			; SHIFT-S
		!TEXT "YSTEM "
		!BYTE D3			; SHIFT-S
		!TEXT "HUT "
$EA73:          !BYTE C4
		!TEXT "DOWN"
		!BYTE 0D,0D
		!TEXT "           "
		!BYTE 12,20,38,20,92		; <RVS> 8 <RVSOFF>
		!TEXT "      "
           	!BYTE D5			; SHIFT-U
		!TEXT "SER "
		!BYTE D3			; SHIFT-S
		!TEXT "OFTWARE"
		!BYTE 0D,0D
		!TEXT "           "	
		!BYTE 12,20,39,20,92		; <RVS> 9 <RVSOFF>
		!TEXT "      "
		!BYTE C5			; SHIFT-E
		!TEXT "XIT TO "
		!BYTE C2
		!TEXT "ASIC"
		!BYTE 0D,0D
$EAC3:          !BYTE 0

;--------------- STRING

EDSTRING4
$EAC4:		!BYTE 0D,12
		!TEXT "                          "
		!BYTE D0			; SHIFT-P
		!TEXT "RESS "
		!BYTE D3			; SHIFT-S
		!TEXT "ELECTION "
		!BYTE C1			; SHIFT-A
		!TEXT "BOVE                               "
		!BYTE 92			; <RVSOFF>
		!BYTE 0

;--------------- STRING

EDSTRING5
$EB16:		!BYTE 93,11,11,11,11
$EB1B:          !BYTE 11,11,11,11,11,11
		!TEXT "                      "
		!BYTE 12,20,D0			; <RVS> SHIFT-P
		!TEXT "ROGRAM NOT FOUND ON DISK "
$EB53:          !BYTE 0D
		!BYTE 0

;--------------- STRING

EDSTRING6
$EB55:		!BYTE 11
		!TEXT "                      "
		!BYTE 12,20,D3			; <RVS> SHIFT-S
		!TEXT "TRIKE ANY KEY TO TRY AGAIN "
		!BYTE 0D
$EB8B:          !BYTE 0

;--------------- STRING

EDSTRING7
$EB8C:		!BYTE 93				; <CLS>
		!BYTE 11,11,11,11,11,11,11,11,11,11	; <DOWN>
		!TEXT "                      "		; SPACES
	        !BYTE 12,20,C4				; <RVS> SHIFT-D
		!TEXT "ISK DRIVE NOT CONNECTED "
		!BYTE 0D,00


;--------------- Filename Strings

EDTAB1		!TEXT "0:WORDPROCESSOR,P"
		!BYTE 0

EDTAB2  	!TEXT "0:SPREADSHEET,P"
		!BYTE 0

EDTAB3		!TEXT "0:DATABASE,P"
		!BYTE 0

EDTAB4		!TEXT "0:FINANCE,P"
        	!BYTE 0

EDTAB5		!TEXT "0:TERMINAL,P"
		!BYTE 0

EDTAB6		!TEXT "0:UTILITIES,P"
		!BYTE 0

EDTAB7		!TEXT "0:SHUTDOWN,P"
		!BYTE 0

EDTAB8		!TEXT "0:USER,P"
		!BYTE 0

;--------------- String

$EC36:		 !BYTE 11,0F,0C,0B,0C,0D,0C,08

;--------------- String Pointer Table

EDMTABLE
$EC3E:
		!WORD EDTAB1		; String 1 at $EBCA
		!WORD EDTAB2		; String 2 at $EBDC
		!WORD EDTAB3		; String 3 at $EBEC
		!WORD EDTAB4		; String 4 at $EBF9
		!WORD EDTAB5		; String 5 at $EC05
		!WORD EDTAB6		; String 6 at $EC12
		!WORD EDTAB7		; String 7 at $EC20
		!WORD EDTAB8		; String 8 at $EC2D

;--------------- ?????

$EC4E:		!TEXT "RUN"
		!BYTE 0D,00
$EC53:          !BYTE 93,0D,0D,0D,0D,0D,0D,0D
$EC5B:          !BYTE 0D,0D,0D,0D
		!TEXT "                               "
		!BYTE CF,CE,C5,20,CD
$EC83:          !BYTE CF,CD,C5,CE,D4,20,D0,CC
$EC8B:          !BYTE C5,C1,D3,C5,20,2E,2E,2E
$EC93:          !BYTE 0D,0D,0D,0D,0D,0D,0D,0D
$EC9B:          !BYTE 0D,0D
		!BYTE 0

;--------------- New IRQ Handler entry point. 
;
; This IRQ handler checks for an "*" at the top of the screen, indicating that the computer has booted.
; (ie: the "*** COMMODORE BASIC..." message is starting to print.)

EDESK_IRQ_HANDLER
L_EC9E:
$EC9E: 48        PHA					; Save A
$EC9F: AD 00 80  LDA SCREEN 				; start of screen ram
$ECA2: C9 2A     CMP #$2A				; Is it "*"?
$ECA4: F0 04     BEQ L_ECAA				; Yes, restore IRQ
$ECA6: 68        PLA					; Restore A
$ECA7: 4C 55 E4  JMP L_E455				; normal IRQ

;--------------- Prep for Execudesk
;
; Manipulates stack so that Execudesk will run

L_ECAA:
$ECAA: 78        SEI					; Disable interrupts
$ECAB: A9 55     LDA #$55				; $E455 is normal IRQ entry point
$ECAD: 85 90     STA $<INTVEC 				; hardware interrupt vector LO
$ECAF: A9 E4     LDA #$E4
$ECB1: 85 91     STA $<INTVEC+1 			; hardware interupt vector HI
$ECB3: 68        PLA					; pull some JSR's from the stack.
$ECB4: 68        PLA					; what does it remove????
$ECB5: 68        PLA
$ECB6: 68        PLA
$ECB7: 68        PLA
$ECB8: 68        PLA
$ECB9: 68        PLA
$ECBA: A9 EC     LDA #>EDESKMENU			; $ECC9 Address of Execudesk menu
$ECBC: 48        PHA					; push new address to stack
$ECBD: A9 C9     LDA #<EDESKMENU
$ECBF: 48        PHA
$ECC0: A9 00     LDA #$00				; ?
$ECC2: 48        PHA
$ECC3: 48        PHA
$ECC4: 48        PHA
$ECC5: 48        PHA
$ECC6: 4C 55 E4  JMP L_E455				; Do regular IRQ

;--------------- Execudesk Menu System

EDESKMENU

L_ECC9:
$ECC9: A9 03     LDA #<EDSTRING1			; $E903
$ECCB: A0 E9     LDY #>EDSTRING1
$ECCD: 20 1D BB  JSR $BB1D				; Print a string

$ECD0: A9 CB     LDA #<EDSTRING2			; $E9CB
$ECD2: A0 E9     LDY #>EDSTRING2
$ECD4: 20 1D BB  JSR $BB1D				; Print a string

$ECD7: A9 51     LDA #<EDSTRING3			; $EA51
$ECD9: A0 EA     LDY #>EDSTRING3
$ECDB: 20 1D BB  JSR $BB1D				; Print a string

$ECDE: A9 C4     LDA #<EDSTRING4			; $EAC4
$ECE0: A0 EA     LDY #>EDSTRING4
$ECE2: 20 1D BB  JSR $BB1D				; Print a string

;--------------- Get keys and wait for valid selection

EDESKKEY
L_ECE5:
$ECE5: 20 E4 FF  JSR $FFE4				; Get a key
$ECE8: F0 FB     BEQ EDESKKEY				; loop until one is found

$ECEA: C9 31     CMP #$31				; is it "1"?
$ECEC: 90 F7     BCC L_ECE5				; loop back for valid range

$ECEE: C9 3A     CMP #$3A				; is it ":"?
$ECF0: B0 F3     BCS L_ECE5				; loop back for valid range

$ECF2: 48        PHA
$ECF3: A9 93     LDA #$93				; <CLS> - Clear Screen
$ECF5: 20 D2 FF  JSR $FFD2 				; Kernal Print a byte
$ECF8: 68        PLA
$ECF9: C9 39     CMP #$39				; Is it "9"?
$ECFB: D0 03     BNE L_ED00				; no, keep checking
$ECFD: 4C 2A D4  JMP $D42A				; Yes, ????????????????

L_ED00:
$ED00: 48        PHA
$ED01: 29 0F     AND #$0F
$ED03: 0A        ASL
$ED04: AA        TAX
$ED05: E8        INX
$ED06: BD 3E EC  LDA EDMTABLE,X				; Address of Menu String
$ED09: A8        TAY
$ED0A: CA        DEX
$ED0B: BD 3E EC  LDA EDMTABLE,X				; Address of Menu String
$ED0E: AA        TAX
$ED0F: 68        PLA
$ED10: 86 01     STX $01				; USR function
$ED12: 84 02     STY $02				; USR function
$ED14: 29 0F     AND #$0F
$ED16: AA        TAX
$ED17: CA        DEX
$ED18: 86 3A     STX $3A
$ED1A: 20 7C EE  JSR L_EE7C

$ED1D: A9 08     LDA #$08				; ?Device 8?
$ED1F: 20 D2 F0  JSR $F0D2
$ED22: A5 96     LDA STATUS 				; IO status
$ED24: 10 03     BPL L_ED29
$ED26: 4C 3E ED  JMP L_ED3E

L_ED29:
$ED29: 20 63 F5  JSR $F563
$ED2C: 20 0D EE  JSR L_EE0D
$ED2F: C9 00     CMP #$00
$ED31: F0 4A     BEQ L_ED7D
$ED33: 48        PHA
$ED34: A9 01     LDA #$01
$ED36: 20 E2 F2  JSR $F2E2
$ED39: 68        PLA
$ED3A: C9 74     CMP #$74
$ED3C: D0 0A     BNE L_ED48

L_ED3E:
$ED3E: A9 8C     LDA #<EDSTRING7				; $EB8C
$ED40: A0 EB     LDY #>EDSTRING7
$ED42: 20 1D BB  JSR $BB1D					; Print a string
$ED45: 4C 4F ED  JMP L_ED4F

L_ED48:
$ED48: A9 16     LDA #<EDSTRING5				; $EB16
$ED4A: A0 EB     LDY #>EDSTRING5
$ED4C: 20 1D BB  JSR $BB1D					; Print a string

L_ED4F:
$ED4F: A9 55     LDA #<EDSTRING6				; $EB55
$ED51: A0 EB     LDY #>EDSTRING6
$ED53: 20 1D BB  JSR $BB1D					; Print a string

L_ED56:
$ED56: 20 E4 FF  JSR $FFE4
$ED59: F0 FB     BEQ L_ED56
$ED5B: 68        PLA
$ED5C: 68        PLA
$ED5D: A9 08     LDA #$08
$ED5F: 85 D4     STA $D4
$ED61: A9 6F     LDA #$6F
$ED63: 85 D3     STA $D3
$ED65: 20 D5 F0  JSR $F0D5
$ED68: A5 D3     LDA $D3
$ED6A: 20 43 F1  JSR $F143
$ED6D: A9 55     LDA #$55
$ED6F: 20 9E F1  JSR $F19E
$ED72: A9 4A     LDA #$4A
$ED74: 20 9E F1  JSR $F19E
$ED77: 20 B9 F1  JSR $F1B9
$ED7A: 4C C9 EC  JMP L_ECC9

L_ED7D:
$ED7D: A9 53     LDA #$53					; $EC53
$ED7F: A0 EC     LDY #$EC
$ED81: 20 1D BB  JSR $BB1D					; Print a string

$ED84: 78        SEI
$ED85: A2 00     LDX #$00

L_ED87:
$ED87: BD 4E EC  LDA $EC4E,X
$ED8A: F0 06     BEQ L_ED92
$ED8C: 9D 6F 02  STA KEYBUF,X ;Keyboard Input Buffer
$ED8F: E8        INX
$ED90: D0 F5     BNE L_ED87

L_ED92:
$ED92: 86 9E     STX $9E
$ED94: 58        CLI
$ED95: 20 CC FF  JSR $FFCC 					; Kernal Restore IO devices
$ED98: A9 01     LDA #$01
$ED9A: 20 E2 F2  JSR $F2E2
$ED9D: A6 3A     LDX $3A
$ED9F: BD 36 EC  LDA $EC36,X
$EDA2: 85 D1     STA $D1
$EDA4: 8A        TXA
$EDA5: 0A        ASL
$EDA6: AA        TAX
$EDA7: BD 3E EC  LDA $EC3E,X
$EDAA: 85 DA     STA $DA
$EDAC: E8        INX
$EDAD: BD 3E EC  LDA $EC3E,X
$EDB0: 85 DB     STA $DB
$EDB2: A9 08     LDA #$08
$EDB4: 85 D2     STA $D2
$EDB6: 85 D3     STA $D3
$EDB8: 85 D4     STA $D4
$EDBA: 20 63 F5  JSR $F563
$EDBD: A2 08     LDX #$08
$EDBF: 20 C6 FF  JSR $FFC6
$EDC2: 20 E4 FF  JSR $FFE4
$EDC5: 85 01     STA $01
$EDC7: 20 E4 FF  JSR $FFE4
$EDCA: 85 02     STA $02
$EDCC: A0 00     LDY #$00
$EDCE: 84 96     STY STATUS 					;IO status

L_EDD0:
$EDD0: 20 E4 FF  JSR $FFE4
$EDD3: 91 01     STA ($01),Y
$EDD5: E6 01     INC $01
$EDD7: D0 02     BNE L_EDDB
$EDD9: E6 02     INC $02

L_EDDB:
$EDDB: A5 96     LDA STATUS 					;IO status
$EDDD: 29 40     AND #$40
$EDDF: F0 EF     BEQ L_EDD0
$EDE1: E6 01     INC $01
$EDE3: D0 02     BNE L_EDE7
$EDE5: E6 02     INC $02

L_EDE7:
$EDE7: A5 01     LDA $01
$EDE9: 85 2A     STA $2A
$EDEB: 85 2C     STA $2C
$EDED: 85 2E     STA $2E
$EDEF: A5 02     LDA $02
$EDF1: 85 2B     STA $2B
$EDF3: 85 2D     STA $2D
$EDF5: 85 2F     STA $2F
$EDF7: A9 04     LDA #$04
$EDF9: 85 29     STA $29
$EDFB: A9 01     LDA #$01
$EDFD: 85 28     STA $28
$EDFF: 20 CC FF  JSR $FFCC 					; Kernal Restore IO devices
$EE02: A9 08     LDA #$08
$EE04: 20 E2 F2  JSR $F2E2
$EE07: A2 FF     LDX #$FF
$EE09: 9A        TXS
$EE0A: 4C 06 B4  JMP $B406

L_EE0D:
$EE0D: A0 00     LDY #$00
$EE0F: 84 96     STY STATUS 					;IO status
$EE11: A9 08     LDA #$08
$EE13: 20 D2 F0  JSR $F0D2
$EE16: A5 96     LDA STATUS 					;IO status
$EE18: F0 01     BEQ L_EE1B
$EE1A: 60        RTS

L_EE1B:
$EE1B: A9 6F     LDA #$6F
$EE1D: 20 93 F1  JSR $F193
$EE20: A5 96     LDA STATUS 					;IO status
$EE22: F0 01     BEQ L_EE25
$EE24: 60        RTS

L_EE25:
$EE25: A0 00     LDY #$00
$EE27: 84 96     STY STATUS 					;IO status
$EE29: 20 C1 F1  JSR $F1C1
$EE2C: 8D 3B 03  STA $033B
$EE2F: 29 0F     AND #$0F
$EE31: 0A        ASL
$EE32: 0A        ASL
$EE33: 0A        ASL
$EE34: 0A        ASL
$EE35: 8D 7E 02  STA $027E
$EE38: A5 96     LDA STATUS 					;IO status
$EE3A: F0 01     BEQ L_EE3D
$EE3C: 60        RTS

L_EE3D:
$EE3D: A0 00     LDY #$00
$EE3F: 84 96     STY STATUS 					;IO status
$EE41: 20 C1 F1  JSR $F1C1
$EE44: 8D 3C 03  STA $033C
$EE47: 29 0F     AND #$0F
$EE49: 0D 7E 02  ORA $027E
$EE4C: 48        PHA
$EE4D: A2 02     LDX #$02
$EE4F: 8E 7D 02  STX $027D

L_EE52:
$EE52: A0 00     LDY #$00
$EE54: 84 96     STY STATUS 					;IO status
$EE56: 20 C1 F1  JSR $F1C1
$EE59: C9 0D     CMP #$0D
$EE5B: D0 02     BNE L_EE5F
$EE5D: A9 20     LDA #$20

L_EE5F:
$EE5F: AE 7D 02  LDX $027D
$EE62: 9D 3B 03  STA $033B,X
$EE65: E0 27     CPX #$27
$EE67: F0 09     BEQ L_EE72
$EE69: EE 7D 02  INC $027D
$EE6C: A5 96     LDA STATUS 					;IO status
$EE6E: C9 40     CMP #$40
$EE70: D0 E0     BNE L_EE52

L_EE72:
$EE72: A9 00     LDA #$00
$EE74: 9D 3B 03  STA $033B,X
$EE77: 20 AE F1  JSR $F1AE
$EE7A: 68        PLA
$EE7B: 60        RTS

L_EE7C:
$EE7C: BD 36 EC  LDA $EC36,X
$EE7F: 85 D1     STA $D1
$EE81: 8A        TXA
$EE82: 0A        ASL
$EE83: AA        TAX
$EE84: BD 3E EC  LDA $EC3E,X
$EE87: 85 DA     STA $DA
$EE89: E8        INX
$EE8A: BD 3E EC  LDA $EC3E,X
$EE8D: 85 DB     STA $DB
$EE8F: A2 01     LDX #$01
$EE91: 86 D2     STX $D2
$EE93: E8        INX
$EE94: 86 D3     STX $D3
$EE96: A2 08     LDX #$08
$EE98: 86 D4     STX $D4
$EE9A: 60        RTS
