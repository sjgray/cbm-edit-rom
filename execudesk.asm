; PET/CBM EDIT ROM - 8296 EXECUDESK 
; ================
; The following is a simple disassembly of the EXECUDESK EDIT ROM
; from an 8296.
; TODO: convert to proper source code with correct symbols


;---- patch - appears to set IRQ vector to new code at $E900

$E621: A9 00     LDA #$00
$E623: 85 90     STA $<INTVEC ;hardware interrupt vector LO
$E625: A9 E9     LDA #$E9
$E627: 85 91     STA $<INTVEC+1 ;hardware interupt vector HI

;----- new code in upper edit rom area

$E900: 4C 9E EC  JMP  L_EC9E
$E903:           .BYT 93,12,20,20,20,20,20,20 ;exudesk menu
$E90B:           .BYT 20,20,20,20,20,20,20,20 ;exudesk menu
$E913:           .BYT 20,20,20,20,20,20,20,20 ;exudesk menu
$E91B:           .BYT 20,20,20,20,20,20,20,20 ;exudesk menu
$E923:           .BYT 20,20,C5,D8,C5,C3,D5,20 ;exudesk menu
$E92B:           .BYT 2D,20,C4,C5,D3,CB,20,20 ;exudesk menu
$E933:           .BYT 20,20,20,20,20,20,20,20 ;exudesk menu
$E93B:           .BYT 20,20,20,20,20,20,20,20 ;exudesk menu
$E943:           .BYT 20,20,20,20,20,20,20,20 ;exudesk menu
$E94B:           .BYT 20,20,20,20,20,20,20,20 ;exudesk menu
$E953:           .BYT 20,0D,0D,0D,20,20,20,20 ;exudesk menu
$E95B:           .BYT 20,20,20,20,20,20,20,12 ;exudesk menu
$E963:           .BYT 20,31,20,92,20,20,20,20 ;exudesk menu
$E96B:           .BYT 20,20,D7,4F,52,44,20,D0 ;exudesk menu
$E973:           .BYT 52,4F,43,45,53,53,4F,52 ;exudesk menu
$E97B:           .BYT 0D,0D,20,20,20,20,20,20 ;exudesk menu
$E983:           .BYT 20,20,20,20,20,12,20,32 ;exudesk menu
$E98B:           .BYT 20,92,20,20,20,20,20,20 ;exudesk menu
$E993:           .BYT D3,50,52,45,41,44,20,D3 ;exudesk menu
$E99B:           .BYT 48,45,45,54,0D,0D,20,20 ;exudesk menu
$E9A3:           .BYT 20,20,20,20,20,20,20,20 ;exudesk menu
$E9AB:           .BYT 20,12,20,33,20,92,20,20 ;exudesk menu
$E9B3:           .BYT 20,20,20,20,C4,41,54,41 ;exudesk menu
$E9BB:           .BYT 20,C2,41,53,45,20,CD,41 ;exudesk menu
$E9C3:           .BYT 4E,41,47,45,52,0D,0D,00 ;exudesk menu
$E9CB:           .BYT 20,20,20,20,20,20,20,20 ;exudesk menu
$E9D3:           .BYT 20,20,20,12,20,34,20,92 ;exudesk menu
$E9DB:           .BYT 20,20,20,20,20,20,C6,49 ;exudesk menu
$E9E3:           .BYT 4E,41,4E,43,49,41,4C,20 ;exudesk menu
$E9EB:           .BYT C3,41,4C,43,55,4C,41,54 ;exudesk menu
$E9F3:           .BYT 49,4F,4E,53,0D,0D,20,20 ;exudesk menu
$E9FB:           .BYT 20,20,20,20,20,20,20,20 ;exudesk menu
$EA03:           .BYT 20,12,20,35,20,92,20,20 ;exudesk menu
$EA0B:           .BYT 20,20,20,20,D4,45,52,4D ;exudesk menu
$EA13:           .BYT 49,4E,41,4C,20,C3,4F,4D ;exudesk menu
$EA1B:           .BYT 4D,55,4E,49,43,41,54,49 ;exudesk menu
$EA23:           .BYT 4F,4E,53,0D,0D,20,20,20 ;exudesk menu
$EA2B:           .BYT 20,20,20,20,20,20,20,20 ;exudesk menu
$EA33:           .BYT 12,20,36,20,92,20,20,20 ;exudesk menu
$EA3B:           .BYT 20,20,20,D3,59,53,54,45 ;exudesk menu
$EA43:           .BYT 4D,20,D5,54,49,4C,49,54 ;exudesk menu
$EA4B:           .BYT 49,45,53,0D,0D,00,20,20 ;exudesk menu
$EA53:           .BYT 20,20,20,20,20,20,20,20 ;exudesk menu
$EA5B:           .BYT 20,12,20,37,20,92,20,20 ;exudesk menu
$EA63:           .BYT 20,20,20,20,D3,59,53,54 ;exudesk menu
$EA6B:           .BYT 45,4D,20,D3,48,55,54,20 ;exudesk menu
$EA73:           .BYT C4,4F,57,4E,0D,0D,20,20 ;exudesk menu
$EA7B:           .BYT 20,20,20,20,20,20,20,20 ;exudesk menu
$EA83:           .BYT 20,12,20,38,20,92,20,20 ;exudesk menu
$EA8B:           .BYT 20,20,20,20,D5,53,45,52 ;exudesk menu
$EA93:           .BYT 20,D3,4F,46,54,57,41,52 ;exudesk menu
$EA9B:           .BYT 45,0D,0D,20,20,20,20,20 ;exudesk menu
$EAA3:           .BYT 20,20,20,20,20,20,12,20 ;exudesk menu
$EAAB:           .BYT 39,20,92,20,20,20,20,20 ;exudesk menu
$EAB3:           .BYT 20,C5,58,49,54,20,54,4F ;exudesk menu
$EABB:           .BYT 20,C2,41,53,49,43,0D,0D ;exudesk menu
$EAC3:           .BYT 00,0D,12,20,20,20,20,20 ;exudesk menu
$EACB:           .BYT 20,20,20,20,20,20,20,20 ;exudesk menu
$EAD3:           .BYT 20,20,20,20,20,20,20,20 ;exudesk menu
$EADB:           .BYT 20,20,20,20,20,D0,52,45 ;exudesk menu
$EAE3:           .BYT 53,53,20,D3,45,4C,45,43 ;exudesk menu
$EAEB:           .BYT 54,49,4F,4E,20,C1,42,4F ;exudesk menu
$EAF3:           .BYT 56,45,20,20,20,20,20,20 ;exudesk menu
$EAFB:           .BYT 20,20,20,20,20,20,20,20 ;exudesk menu
$EB03:           .BYT 20,20,20,20,20,20,20,20 ;exudesk menu
$EB0B:           .BYT 20,20,20,20,20,20,20,20 ;exudesk menu
$EB13:           .BYT 20,92,00,93,11,11,11,11 ;exudesk menu
$EB1B:           .BYT 11,11,11,11,11,11,20,20 ;exudesk menu
$EB23:           .BYT 20,20,20,20,20,20,20,20 ;exudesk menu
$EB2B:           .BYT 20,20,20,20,20,20,20,20 ;exudesk menu
$EB33:           .BYT 20,20,20,20,12,20,D0,52 ;exudesk menu
$EB3B:           .BYT 4F,47,52,41,4D,20,4E,4F ;exudesk menu
$EB43:           .BYT 54,20,46,4F,55,4E,44,20 ;exudesk menu
$EB4B:           .BYT 4F,4E,20,44,49,53,4B,20 ;exudesk menu
$EB53:           .BYT 0D,00,11,20,20,20,20,20 ;exudesk menu
$EB5B:           .BYT 20,20,20,20,20,20,20,20 ;exudesk menu
$EB63:           .BYT 20,20,20,20,20,20,20,20 ;exudesk menu
$EB6B:           .BYT 20,12,20,D3,54,52,49,4B ;exudesk menu
$EB73:           .BYT 45,20,41,4E,59,20,4B,45 ;exudesk menu
$EB7B:           .BYT 59,20,54,4F,20,54,52,59 ;exudesk menu
$EB83:           .BYT 20,41,47,41,49,4E,20,0D ;exudesk menu
$EB8B:           .BYT 00,93,11,11,11,11,11,11 ;exudesk menu
$EB93:           .BYT 11,11,11,11,20,20,20,20 ;exudesk menu
$EB9B:           .BYT 20,20,20,20,20,20,20,20 ;exudesk menu
$EBA3:           .BYT 20,20,20,20,20,20,20,20 ;exudesk menu
$EBAB:           .BYT 20,20,12,20,C4,49,53,4B ;exudesk menu
$EBB3:           .BYT 20,44,52,49,56,45,20,4E ;exudesk menu
$EBBB:           .BYT 4F,54,20,43,4F,4E,4E,45 ;exudesk menu
$EBC3:           .BYT 43,54,45,44,20,0D,00,30 ;exudesk menu
$EBCB:           .BYT 3A,57,4F,52,44,50,52,4F ;exudesk menu
$EBD3:           .BYT 43,45,53,53,4F,52,2C,50 ;exudesk menu
$EBDB:           .BYT 00,30,3A,53,50,52,45,41 ;exudesk menu
$EBE3:           .BYT 44,53,48,45,45,54,2C,50 ;exudesk menu
$EBEB:           .BYT 00,30,3A,44,41,54,41,42 ;exudesk menu
$EBF3:           .BYT 41,53,45,2C,50,00,30,3A ;exudesk menu
$EBFB:           .BYT 46,49,4E,41,4E,43,45,2C ;exudesk menu
$EC03:           .BYT 50,00,30,3A,54,45,52,4D ;exudesk menu
$EC0B:           .BYT 49,4E,41,4C,2C,50,00,30 ;exudesk menu
$EC13:           .BYT 3A,55,54,49,4C,49,54,49 ;exudesk menu
$EC1B:           .BYT 45,53,2C,50,00,30,3A,53 ;exudesk menu
$EC23:           .BYT 48,55,54,44,4F,57,4E,2C ;exudesk menu
$EC2B:           .BYT 50,00,30,3A,55,53,45,52 ;exudesk menu
$EC33:           .BYT 2C,50,00,11,0F,0C,0B,0C ;exudesk menu
$EC3B:           .BYT 0D,0C,08,CA,EB,DC,EB,EC ;exudesk menu
$EC43:           .BYT EB,F9,EB,05,EC,12,EC,20 ;exudesk menu
$EC4B:           .BYT EC,2D,EC,52,55,4E,0D,00 ;exudesk menu
$EC53:           .BYT 93,0D,0D,0D,0D,0D,0D,0D ;exudesk menu
$EC5B:           .BYT 0D,0D,0D,0D,20,20,20,20 ;exudesk menu
$EC63:           .BYT 20,20,20,20,20,20,20,20 ;exudesk menu
$EC6B:           .BYT 20,20,20,20,20,20,20,20 ;exudesk menu
$EC73:           .BYT 20,20,20,20,20,20,20,20 ;exudesk menu
$EC7B:           .BYT 20,20,20,CF,CE,C5,20,CD ;exudesk menu
$EC83:           .BYT CF,CD,C5,CE,D4,20,D0,CC ;exudesk menu
$EC8B:           .BYT C5,C1,D3,C5,20,2E,2E,2E ;exudesk menu
$EC93:           .BYT 0D,0D,0D,0D,0D,0D,0D,0D ;exudesk menu
$EC9B:           .BYT 0D,0D,00 ;exudesk menu
L_EC9E:
$EC9E: 48        PHA
$EC9F: AD 00 80  LDA SCREEN ;start of screen ram
$ECA2: C9 2A     CMP #$2A
$ECA4: F0 04     BEQ L_ECAA
$ECA6: 68        PLA
$ECA7: 4C 55 E4  JMP  L_E455
L_ECAA:
$ECAA: 78        SEI
$ECAB: A9 55     LDA #$55
$ECAD: 85 90     STA $<INTVEC ;hardware interrupt vector LO
$ECAF: A9 E4     LDA #$E4
$ECB1: 85 91     STA $<INTVEC+1 ;hardware interupt vector HI
$ECB3: 68        PLA
$ECB4: 68        PLA
$ECB5: 68        PLA
$ECB6: 68        PLA
$ECB7: 68        PLA
$ECB8: 68        PLA
$ECB9: 68        PLA
$ECBA: A9 EC     LDA #$EC
$ECBC: 48        PHA
$ECBD: A9 C9     LDA #$C9
$ECBF: 48        PHA
$ECC0: A9 00     LDA #$00
$ECC2: 48        PHA
$ECC3: 48        PHA
$ECC4: 48        PHA
$ECC5: 48        PHA
$ECC6: 4C 55 E4  JMP  L_E455
L_ECC9:
$ECC9: A9 03     LDA #$03
$ECCB: A0 E9     LDY #$E9
$ECCD: 20 1D BB  JSR  $BB1D
$ECD0: A9 CB     LDA #$CB
$ECD2: A0 E9     LDY #$E9
$ECD4: 20 1D BB  JSR  $BB1D
$ECD7: A9 51     LDA #$51
$ECD9: A0 EA     LDY #$EA
$ECDB: 20 1D BB  JSR  $BB1D
$ECDE: A9 C4     LDA #$C4
$ECE0: A0 EA     LDY #$EA
$ECE2: 20 1D BB  JSR  $BB1D
L_ECE5:
$ECE5: 20 E4 FF  JSR  $FFE4
$ECE8: F0 FB     BEQ L_ECE5
$ECEA: C9 31     CMP #$31
$ECEC: 90 F7     BCC L_ECE5
$ECEE: C9 3A     CMP #$3A
$ECF0: B0 F3     BCS L_ECE5
$ECF2: 48        PHA
$ECF3: A9 93     LDA #$93
$ECF5: 20 D2 FF  JSR  $FFD2 ;Kernal Print a byte
$ECF8: 68        PLA
$ECF9: C9 39     CMP #$39
$ECFB: D0 03     BNE L_ED00
$ECFD: 4C 2A D4  JMP  $D42A
L_ED00:
$ED00: 48        PHA
$ED01: 29 0F     AND #$0F
$ED03: 0A        ASL A
$ED04: AA        TAX
$ED05: E8        INX
$ED06: BD 3E EC  LDA $EC3E,X
$ED09: A8        TAY
$ED0A: CA        DEX
$ED0B: BD 3E EC  LDA $EC3E,X
$ED0E: AA        TAX
$ED0F: 68        PLA
$ED10: 86 01     STX $01
$ED12: 84 02     STY $02
$ED14: 29 0F     AND #$0F
$ED16: AA        TAX
$ED17: CA        DEX
$ED18: 86 3A     STX $3A
$ED1A: 20 7C EE  JSR  L_EE7C
$ED1D: A9 08     LDA #$08
$ED1F: 20 D2 F0  JSR  $F0D2
$ED22: A5 96     LDA $<STATUS ;IO status
$ED24: 10 03     BPL L_ED29
$ED26: 4C 3E ED  JMP  L_ED3E
L_ED29:
$ED29: 20 63 F5  JSR  $F563
$ED2C: 20 0D EE  JSR  L_EE0D
$ED2F: C9 00     CMP #$00
$ED31: F0 4A     BEQ L_ED7D
$ED33: 48        PHA
$ED34: A9 01     LDA #$01
$ED36: 20 E2 F2  JSR  $F2E2
$ED39: 68        PLA
$ED3A: C9 74     CMP #$74
$ED3C: D0 0A     BNE L_ED48
L_ED3E:
$ED3E: A9 8C     LDA #$8C
$ED40: A0 EB     LDY #$EB
$ED42: 20 1D BB  JSR  $BB1D
$ED45: 4C 4F ED  JMP  L_ED4F
L_ED48:
$ED48: A9 16     LDA #$16
$ED4A: A0 EB     LDY #$EB
$ED4C: 20 1D BB  JSR  $BB1D
L_ED4F:
$ED4F: A9 55     LDA #$55
$ED51: A0 EB     LDY #$EB
$ED53: 20 1D BB  JSR  $BB1D
L_ED56:
$ED56: 20 E4 FF  JSR  $FFE4
$ED59: F0 FB     BEQ L_ED56
$ED5B: 68        PLA
$ED5C: 68        PLA
$ED5D: A9 08     LDA #$08
$ED5F: 85 D4     STA $D4
$ED61: A9 6F     LDA #$6F
$ED63: 85 D3     STA $D3
$ED65: 20 D5 F0  JSR  $F0D5
$ED68: A5 D3     LDA $D3
$ED6A: 20 43 F1  JSR  $F143
$ED6D: A9 55     LDA #$55
$ED6F: 20 9E F1  JSR  $F19E
$ED72: A9 4A     LDA #$4A
$ED74: 20 9E F1  JSR  $F19E
$ED77: 20 B9 F1  JSR  $F1B9
$ED7A: 4C C9 EC  JMP  L_ECC9
L_ED7D:
$ED7D: A9 53     LDA #$53
$ED7F: A0 EC     LDY #$EC
$ED81: 20 1D BB  JSR  $BB1D
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
$ED95: 20 CC FF  JSR  $FFCC ;Kernal Restore IO devices
$ED98: A9 01     LDA #$01
$ED9A: 20 E2 F2  JSR  $F2E2
$ED9D: A6 3A     LDX $3A
$ED9F: BD 36 EC  LDA $EC36,X
$EDA2: 85 D1     STA $D1
$EDA4: 8A        TXA
$EDA5: 0A        ASL A
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
$EDBA: 20 63 F5  JSR  $F563
$EDBD: A2 08     LDX #$08
$EDBF: 20 C6 FF  JSR  $FFC6
$EDC2: 20 E4 FF  JSR  $FFE4
$EDC5: 85 01     STA $01
$EDC7: 20 E4 FF  JSR  $FFE4
$EDCA: 85 02     STA $02
$EDCC: A0 00     LDY #$00
$EDCE: 84 96     STY $<STATUS ;IO status
L_EDD0:
$EDD0: 20 E4 FF  JSR  $FFE4
$EDD3: 91 01     STA ($01),Y
$EDD5: E6 01     INC $01
$EDD7: D0 02     BNE L_EDDB
$EDD9: E6 02     INC $02
L_EDDB:
$EDDB: A5 96     LDA $<STATUS ;IO status
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
$EDFF: 20 CC FF  JSR  $FFCC ;Kernal Restore IO devices
$EE02: A9 08     LDA #$08
$EE04: 20 E2 F2  JSR  $F2E2
$EE07: A2 FF     LDX #$FF
$EE09: 9A        TXS
$EE0A: 4C 06 B4  JMP  $B406
L_EE0D:
$EE0D: A0 00     LDY #$00
$EE0F: 84 96     STY $<STATUS ;IO status
$EE11: A9 08     LDA #$08
$EE13: 20 D2 F0  JSR  $F0D2
$EE16: A5 96     LDA $<STATUS ;IO status
$EE18: F0 01     BEQ L_EE1B
$EE1A: 60        RTS
L_EE1B:
$EE1B: A9 6F     LDA #$6F
$EE1D: 20 93 F1  JSR  $F193
$EE20: A5 96     LDA $<STATUS ;IO status
$EE22: F0 01     BEQ L_EE25
$EE24: 60        RTS
L_EE25:
$EE25: A0 00     LDY #$00
$EE27: 84 96     STY $<STATUS ;IO status
$EE29: 20 C1 F1  JSR  $F1C1
$EE2C: 8D 3B 03  STA $033B
$EE2F: 29 0F     AND #$0F
$EE31: 0A        ASL A
$EE32: 0A        ASL A
$EE33: 0A        ASL A
$EE34: 0A        ASL A
$EE35: 8D 7E 02  STA $027E
$EE38: A5 96     LDA $<STATUS ;IO status
$EE3A: F0 01     BEQ L_EE3D
$EE3C: 60        RTS
L_EE3D:
$EE3D: A0 00     LDY #$00
$EE3F: 84 96     STY $<STATUS ;IO status
$EE41: 20 C1 F1  JSR  $F1C1
$EE44: 8D 3C 03  STA $033C
$EE47: 29 0F     AND #$0F
$EE49: 0D 7E 02  ORA $027E
$EE4C: 48        PHA
$EE4D: A2 02     LDX #$02
$EE4F: 8E 7D 02  STX $027D
L_EE52:
$EE52: A0 00     LDY #$00
$EE54: 84 96     STY $<STATUS ;IO status
$EE56: 20 C1 F1  JSR  $F1C1
$EE59: C9 0D     CMP #$0D
$EE5B: D0 02     BNE L_EE5F
$EE5D: A9 20     LDA #$20
L_EE5F:
$EE5F: AE 7D 02  LDX $027D
$EE62: 9D 3B 03  STA $033B,X
$EE65: E0 27     CPX #$27
$EE67: F0 09     BEQ L_EE72
$EE69: EE 7D 02  INC $027D
$EE6C: A5 96     LDA $<STATUS ;IO status
$EE6E: C9 40     CMP #$40
$EE70: D0 E0     BNE L_EE52
L_EE72:
$EE72: A9 00     LDA #$00
$EE74: 9D 3B 03  STA $033B,X
$EE77: 20 AE F1  JSR  $F1AE
$EE7A: 68        PLA
$EE7B: 60        RTS
L_EE7C:
$EE7C: BD 36 EC  LDA $EC36,X
$EE7F: 85 D1     STA $D1
$EE81: 8A        TXA
$EE82: 0A        ASL A
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
