; PET/CBM EDIT ROM - EXECUDESK 
; ================
; Execudesk is a power-on menu system for 8296 machines
;
;---- patch - set IRQ vector to EXECUDESK IRQ HANDLER at $E900
;
; $E621: A9 00     LDA #<IRQ_EDESK
; $E623: 85 90     STA $<INTVEC 		;hardware interrupt vector LO
; $E625: A9 E9     LDA #>IRQ_EDESK
; $E627: 85 91     STA $<INTVEC + 1 		;hardware interrupt vector HI

;----- new code in upper edit rom area

IRQ_EDESK	JMP EDESK_IRQ_HANDLER		; L_EC9E

;--------------- Execudesk Menu Strings
;
; NULL-terminated strings

EDSTRING1	!byte $93,$12			; <CLS><RVS>
		!text "                                "
		!byte $C5,$D8,$C5,$C3,$D5,$20		; <SHIFT>"EXECU 
		!byte $2D,$20,$C4,$C5,$D3,$CB		; - DESK"
		!text "                                   "
		!byte $0D,$0D,$0D			; <CR>
		!text "           "
		!byte $12,$20,$31,$20,$92		; <RVS> 1 <RVSOFF>
		!text "      "
		!byte $D7			; SHIFT-W
		!text "ORD "
		!byte $D0			; SHIFT-P
		!text "ROCESSOR"
		!byte $0D,$0D
		!text "           "
		!byte $12,$20,$32,$20,$92		; <RVS> 2 <RVSOFF>
		!text "      "
		!byte $D3			; SHIFT-S
		!text "PREAD "
		!byte $D3			; SHIFT-S
		!text "HEET"
		!byte $0D,$0D
		!text "           "
		!byte $12,$20,$33,$20,$92		; <RVS> 3 <RVSOFF>
		!text "      "
		!byte $C4			; SHIFT-D
		!text "ATA "
		!byte $C2			; SHIFT-B
		!text "ASE "
		!byte $CD
		!text "ANAGER"
		!byte $0D,$0D
		!byte 0

;--------------- STRING

EDSTRING2	!text "           "
		!byte $12,$20,$34,$20,$92	; <RVS> 4 <RVSOFF>
		!text "      "
		!byte $C6			; SHIFT-F
		!text "INANCIAL "
		!byte $C3			; SHIFT-C
		!text "ALCULATIONS"
		!byte $0D,$0D
		!text "           "
		!byte $12,$20,$35,$20,$92	; <RVS> 5 <RVSOFF>
		!text "      "
		!byte $D4			; SHIFT-T
		!text "ERMINAL "
		!byte $C3			; SHIFT-C
		!text "OMMUNICATIONS"
		!byte $0D,$0D
		!text "           "
		!byte $12,$20,$36,$20,$92	; <RVS> 6 <RVSOFF>
		!text "      "
		!byte $D3			; SHIFT-S
		!text "YSTEM "
		!byte $D5
		!text "TILITIES"
		!byte $0D,$0D
		!byte 0

;--------------- STRING

EDSTRING3	!text "           "
		!byte $12,$20,$37,$20,$92	; <RVS> 7 <RVSOFF>
		!text "      "
		!byte $D3			; SHIFT-S
		!text "YSTEM "
		!byte $D3			; SHIFT-S
		!text "HUT "
		!byte $C4
		!text "OWN"
		!byte $0D,$0D
		!text "           "
		!byte $12,$20,$38,$20,$92	; <RVS> 8 <RVSOFF>
		!text "      "
           	!byte $D5			; SHIFT-U
		!text "SER "
		!byte $D3			; SHIFT-S
		!text "OFTWARE"
		!byte $0D,$0D
		!text "           "	
		!byte $12,$20,$39,$20,$92	; <RVS> 9 <RVSOFF>
		!text "      "
		!byte $C5			; SHIFT-E
		!text "XIT TO "
		!byte $C2
		!text "ASIC"
		!byte $0D,$0D
		!byte 0

;--------------- STRING

EDSTRING4	!byte $0D,$12
		!text "                          "
		!byte $D0			; SHIFT-P
		!text "RESS "
		!byte $D3			; SHIFT-S
		!text "ELECTION "
		!byte $C1			; SHIFT-A
		!text "BOVE                               "
		!byte $92			; <RVSOFF>
		!byte 0

;--------------- STRING

EDSTRING5	!byte $93
		!byte $11,$11,$11,$11,$11,$11,$11,$11,$11,$11
		!text "                      "
		!byte $12,$20,$D0			; <RVS> SHIFT-P
		!text "ROGRAM NOT FOUND ON DISK "
		!byte $0D
		!byte 0

;--------------- STRING

EDSTRING6	!byte $11				; <DOWN>
		!text "                      "		; SPACES
		!byte $12,$20,$D3			; <RVS> SHIFT-S
		!text "TRIKE ANY KEY TO TRY AGAIN "
		!byte $0D
		!byte 0

;--------------- STRING

EDSTRING7	!byte $93					; <CLS>
		!byte $11,$11,$11,$11,$11,$11,$11,$11,$11,$11	; <DOWN>
		!text "                      "			; SPACES
	        !byte $12,$20,$C4				; <RVS> SHIFT-D
		!text "ISK DRIVE NOT CONNECTED "
		!byte $0D
		!byte 0


;--------------- Filename Strings

EDTAB1		!text "0:WORDPROCESSOR,P"
		!byte 0

EDTAB2  	!text "0:SPREADSHEET,P"
		!byte 0

EDTAB3		!text "0:DATABASE,P"
		!byte 0

EDTAB4		!text "0:FINANCE,P"
        	!byte 0

EDTAB5		!text "0:TERMINAL,P"
		!byte 0

EDTAB6		!text "0:UTILITIES,P"
		!byte 0

EDTAB7		!text "0:SHUTDOWN,P"
		!byte 0

EDTAB8		!text "0:USER,P"
		!byte 0

;--------------- String

ED_TABLE2
ED_EC36		 !byte $11,$0F,$0C,$0B,$0C,$0D,$0C,$08

;--------------- String Pointer Table

EDMTABLE	!WORD EDTAB1		; String 1 at $EBCA
		!WORD EDTAB2		; String 2 at $EBDC
		!WORD EDTAB3		; String 3 at $EBEC
		!WORD EDTAB4		; String 4 at $EBF9
		!WORD EDTAB5		; String 5 at $EC05
		!WORD EDTAB6		; String 6 at $EC12
		!WORD EDTAB7		; String 7 at $EC20
		!WORD EDTAB8		; String 8 at $EC2D

;--------------- ?????

ED_RUN		!text "RUN"
		!byte $0D
		!byte 0

ED_EC53		!byte $93					; <CLS>
		!byte $0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D
		!text "                               "
		!byte $CF,$CE,$C5,$20				; <SHIFT> ONE
		!byte $CD,$CF,$CD,$C5,$CE,$D4,$20		; <SHIFT> MOMENT
		!byte $D0,$CC,$C5,$C1,$D3,$C5,$20,$2E,$2E,$2E	; <SHIFT> PLEASE...
		!byte $0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D
		!byte 0

;--------------- New IRQ Handler entry point. 
;
; This IRQ handler checks for an "*" at the top of the screen, indicating that the computer has booted.
; (ie: the "*** COMMODORE BASIC..." message is starting to print.)

EDESK_IRQ_HANDLER
		PHA					; Save A
		LDA SCREEN_RAM 				; start of screen ram
		CMP #$2A				; Is it "*"?
		BEQ EXECU_PREP				; Yes, restore IRQ
		PLA					; Restore A
		JMP IRQ_NORMAL				; normal IRQ

;--------------- Prep for Execudesk
;
; Manipulates stack so that Execudesk will run

EXECU_PREP	SEI					; Disable interrupts
		LDA #<IRQ_NORMAL			; $E455 is normal IRQ entry point
		STA CINV 				; hardware interrupt vector LO
		LDA #>IRQ_NORMAL
		STA CINV+1 				; hardware interupt vector HI
		PLA					; pull some JSR's from the stack.
		PLA					; what does it remove????
		PLA
		PLA
		PLA
		PLA
		PLA
		LDA #>EDESKMENU				; $ECC9 Address of Execudesk menu
		PHA					; push new address to stack
		LDA #<EDESKMENU
		PHA
		LDA #0					; ???????????
		PHA
		PHA
		PHA
		PHA
		JMP IRQ_NORMAL				; Do Normal IRQ

;--------------- Execudesk Menu System

EDESKMENU
L_ECC9		LDA #<EDSTRING1				; $E903
		LDY #>EDSTRING1
		JSR $BB1D				; Print a string

		LDA #<EDSTRING2				; $E9CB
		LDY #>EDSTRING2
		JSR $BB1D				; Print a string

		LDA #<EDSTRING3				; $EA51
		LDY #>EDSTRING3
		JSR $BB1D				; Print a string

		LDA #<EDSTRING4				; $EAC4
		LDY #>EDSTRING4
		JSR $BB1D				; Print a string

;--------------- Get keys and wait for valid selection

EDESKKEY
L_ECE5		JSR $FFE4				; Get a key
		BEQ EDESKKEY				; loop until one is found

		CMP #$31				; is it "1"?
		BCC L_ECE5				; loop back for valid range

		CMP #$3A				; is it ":"?
		BCS L_ECE5				; loop back for valid range

		PHA
		LDA #$93				; <CLS> - Clear Screen
		JSR $FFD2 				; Kernal Print a byte
		PLA
		CMP #$39				; Is it "9"?
		BNE L_ED00				; no, keep checking
		JMP $D42A				; Yes, ????????????????

L_ED00:
		PHA
		AND #$0F
		ASL
		TAX
		INX
		LDA EDMTABLE,X				; Address of Menu String
		TAY
		DEX
		LDA EDMTABLE,X				; Address of Menu String
		TAX
		PLA
		STX $01					; USR function
		STY $02					; USR function
		AND #$0F
		TAX
		DEX
		STX $3A
		JSR L_EE7C

		LDA #$08				; ?Device 8?
		JSR $F0D2
		LDA STATUS 				; IO status
		BPL L_ED29
		JMP L_ED3E

L_ED29		JSR $F563
		JSR L_EE0D
		CMP #$00
		BEQ L_ED7D
		PHA
		LDA #$01				; USR function
		JSR $F2E2
		PLA
		CMP #$74
		BNE L_ED48

L_ED3E		LDA #<EDSTRING7				; $EB8C
		LDY #>EDSTRING7
		JSR $BB1D				; Print a string
		JMP L_ED4F

L_ED48		LDA #<EDSTRING5				; $EB16
		LDY #>EDSTRING5
		JSR $BB1D				; Print a string

L_ED4F		LDA #<EDSTRING6				; $EB55
		LDY #>EDSTRING6
		JSR $BB1D				; Print a string

L_ED56		JSR $FFE4
		BEQ L_ED56
		PLA
		PLA
		LDA #$08
		STA $D4
		LDA #$6F
		STA $D3
		JSR $F0D5
		LDA $D3
		JSR $F143
		LDA #$55
		JSR $F19E
		LDA #$4A
		JSR $F19E
		JSR $F1B9
		JMP L_ECC9

L_ED7D		LDA #$53					; $EC53
		LDY #$EC
		JSR $BB1D					; Print a string

		SEI
		LDX #0

L_ED87		LDA ED_RUN,X					; "RUN" string for buffer
		BEQ L_ED92					; is it NULL?
		STA KEYD,X					; No, put in Keyboard Buffer
		INX
		BNE L_ED87					; get more

L_ED92		STX $9E
		CLI
		JSR $FFCC 					; Kernal Restore IO devices
		LDA #$01
		JSR $F2E2
		LDX $3A
		LDA ED_TABLE2,X					; ?
		STA $D1
		TXA
		ASL
		TAX
		LDA EDMTABLE,X					; Address of filename
		STA $DA
		INX
		LDA EDMTABLE,X
		STA $DB
		LDA #$08
		STA $D2
		STA $D3
		STA $D4
		JSR $F563
		LDX #$08
		JSR $FFC6
		JSR $FFE4
		STA $01
		JSR $FFE4
		STA $02
		LDY #$00
		STY STATUS 					;IO status

L_EDD0		JSR $FFE4
		STA ($01),Y
		INC $01
		BNE L_EDDB
		INC $02

L_EDDB		LDA STATUS 					;IO status
		AND #$40
		BEQ L_EDD0
		INC $01
		BNE L_EDE7
		INC $02

L_EDE7		LDA $01
		STA $2A
		STA $2C
		STA $2E

		LDA $02
		STA $2B
		STA $2D
		STA $2F

		LDA #$04
		STA $29

		LDA #$01
		STA $28
		JSR $FFCC 					; Kernal Restore IO devices
		LDA #$08
		JSR $F2E2
		LDX #$FF
		TXS
		JMP $B406

L_EE0D		LDY #$00
		STY STATUS 					;IO status
		LDA #$08
		JSR $F0D2
		LDA STATUS 					;IO status
		BEQ L_EE1B
		RTS

L_EE1B		LDA #$6F
		JSR $F193
		LDA STATUS 					;IO status
		BEQ L_EE25
		RTS

L_EE25		LDY #0
		STY STATUS 					;IO status
		JSR $F1C1
		STA $033B
		AND #$0F
		ASL
		ASL
		ASL
		ASL
		STA $027E
		LDA STATUS 					;IO status
		BEQ L_EE3D
		RTS

L_EE3D		LDY #0
		STY STATUS 					;IO status
		JSR $F1C1
		STA $033C
		AND #$0F
		ORA $027E
		PHA
		LDX #$02
		STX $027D

L_EE52		LDY #$00
		STY STATUS 					;IO status
		JSR $F1C1
		CMP #$0D					; <CR>
		BNE L_EE5F
		LDA #$20					; <SPACE>

L_EE5F		LDX $027D
		STA DOS_Drive_1,X
		CPX #$27
		BEQ L_EE72
		INC $027D
		LDA STATUS 					;IO status
		CMP #$40
		BNE L_EE52

L_EE72		LDA #0
		STA $033B,X
		JSR $F1AE
		PLA
		RTS

L_EE7C		LDA ED_TABLE2,X
		STA $D1
		TXA
		ASL
		TAX
		LDA EDMTABLE,X
		STA $DA
		INX
		LDA EDMTABLE,X
		STA $DB
		LDX #$01
		STX $D2
		INX
		STX $D3
		LDX #$08
		STX $D4
		RTS
