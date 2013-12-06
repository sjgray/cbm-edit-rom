; PET/CBM EDIT ROM  - Commented and Adapted by Steve J. Gray, Nov 21, 2013
; ================    sjgray@rogers.com
; 
; This is reverse engineered source code for the EDIT ROMs of the Commodore PET/CBM computers.
; The "324243-04" ROM was used as a base as it was (AFAIK) the LAST EDIT ROM that Commodore made
; for the PET/CBM line; 8296 computer, 50HZ, 80 column, DIN keyboard, 4K size
;
; The original disassembly/commenting was done by Edilbert Kirk for his own assembler.
; I have converted it to assemble with ACME and am adapting it for all machines.
;
; The EDIT ROM is mapped from $E000 to EFFF (4K). Many Early versions used only $E000-E7FF (2K).
; Note that the area from $E800 to $E8FF (256 bytes) is not available due to the I/O chips in this range.
;
; PET/CBM machines come in several flavours:
;    * 40 or 80 column screens
;    * Normal, Business, or DIN keyboards
;    * 50 or 60 Hz power frequency
;    * Specialized options, ie: Execudesk
;
; In addition I am adapting the EDIT roms to these additional options:
;    * ColourPET - My own project to add colour capabilities
;    * Alternate Keyboards - Such as the VIC/C64 keyboard
;    * Soft40 - Simulate a 40 column screen on 80 column hardware
;	* Soft-switchable SOFT40
;    * Soft-switchable real 40/80 columns (requires hardware mod)
;    * Extended screen editor - CBM-II compatible ESC sequences
;    * Keyboard soft-reset (kinda like CTRL-ALT-DEL on PC's)
;    * Autoboot from default drive
;-----------------------------------------------------------------------------------------------
* = $e000	;normal start address. NOT defined in EDIT.ASM
;-----------------------------------------------------------------------------------------------


;************* Edit ROM Jump Table
; Note: Not all KERNAL and BASIC calls go through this table. There are two hard-coded entry points:
;       $E202 and $E442

EDITOR
           JMP RESET_EDITOR			; Main Initialization (called from Kernal power up reset 
           JMP GETKEY					; Get Character From Keyboard Buffer
           JMP INPUT_CHARACTER			; Input From Screen or Keyboard
           JMP CHROUT_SCREEN			; Output to Screen (FIXED ENTRY POINT. Must not move!)
           JMP IRQ_MAIN				; Main IRQ Handler (FIXED ENTRY POINT. Must not move!)
           JMP IRQ_NORMAL				; Actual IRQ (clock, keyboard scan)
           JMP IRQ_END				; Return From Interrupt
           JMP WINDOW_CLEAR			; Clear Window
           JMP CRT_SET_TEXT			; Set CRTC to TEXT mode
           JMP CRT_SET_GRAPHICS			; Set CRTC to GRAPHICS mode
           JMP CRT_PROGRAM				; Program CRTC (table ptr in A/X, chr set in Y)
           JMP WINDOW_SCROLL_DOWN		; Scroll DOWN
           JMP WINDOW_SCROLL_UP			; Scroll UP
           JMP OLD_SCAN_KEYBOARD		; Scan Keyboard
           JMP BEEP					; Ring BELL/CHIME
           JMP BEEP					; BEEP   Was: SET_REPEAT_MODE			; Set REPEAT MODE
           JMP WINDOW_SET_TOP			; Set Window Top
           JMP WINDOW_SET_BOTTOM		; Set Window Bottom


;************* Set REPEAT MODE (Called from Jump Table)
; Flag:    $80 = Repeat, $40 = disable
; Was:	STA $E4
;          RTS
; In later ROMs repeat is permanently enabled

SET_REPEAT_MODE
           NOP
           NOP
           RTS

;###################################################################################
           !fill $e04b-*,$aa			;########################################
;###################################################################################

;************* Reset Editor (Called from Jump Table)

RESET_EDITOR
           JSR INIT_EDITOR
           JSR CRT_SET_TEXT_NEW

;************* Clear Window

WINDOW_CLEAR
           LDX TopMargin
           DEX
Be054	   INX
           JSR Cursor_BOL
           JSR Erase_To_EOL
           CPX BotMargin
           BCC Be054

;************* Home the Cursor
CURSOR_HOME
           LDX TopMargin
           STX CursorRow

;************* Move cursor to LEFT MARGIN

CURSOR_LEFT_MARGIN
           LDY LefMargin
           STY CursorCol

; ************ Update Cursor ROW

UPDATE_CURSOR_ROW
           LDX CursorRow				; Current Cursor Physical Line Number

!if EXTENDED=0 {
		JMP UPDATE_CURSOR_R2			;$E06F
iE06C		LDY LefMargin				; First column of window
		DEY
UPDATE_CURSOR_R2
		LDA Line_Addr_Lo,X			; Screen Line Addresses LO		DATA
		STA ScrPrt					; Pointer: Current Screen Line Address LO
		LDA Line_Addr_Hi,X			; Screen Line Addresses HI		DATA
		STA ScrPtr+1         			; Pointer: Current Screen Line Address HI
		RTS
}

!if EXTENDED = 1 {
           JMP Update_ScrPtr			; New Screen pointer calculation routine
           JMP Cursor_BOL				; HOW DO WE GET TO THIS CODE?
UPDATE_PNT
           JMP Update_ScrPtr			;New Screen pointer calculation routine @@@@@@@@@@ PATCH
Me072		INY
      	STY CursorCol
           JMP IRQ_EPILOG
           TAX
           TAX
}


;************* Set Screen to TEXT or GRAPHICS MODE

!if EXTENDED = 0 {
;-------------- Initialize CRTC to TEXT Mode
CRT_SET_TEXT
		LDA #<CRT_CONFIG_TEXT			; Point to DATA TABLE at $E72A
		LDX #>CRT_CONFIG_TEXT			; Point to DATA TABLE at $E72A
		LDY #$0E					; TEXT
		BNE CRT_PROGRAM_OLD

;-------------- Initialize CRTC to GRAPHICS Mode

CRT_SET_GRAPHICS
		LDA #<CRT_CONFIG_GRAPHICS       ; Point to DATA TABLE at $E73C
		LDX #>CRT_CONFIG_GRAPHICS       ; Point to DATA TABLE at $E73C
		LDY #$0C					; GRAPHICS
}

!if EXTENDED = 1 {

;-------------- Initialize CRTC to TEXT Mode

CRT_SET_TEXT_MODE_OLD
           JMP CRT_SET_TEXT
           NOP
           NOP
           NOP
           NOP
           NOP

;-------------- Initialize CRTC to GRAPHICS Mode

CRT_SET_GRAPHICS_MODE_OLD
           JMP CRT_SET_GRAPHICS
           NOP
           NOP
           NOP
}

;************* Program CRTC chip for selected screen MODE

CRT_PROGRAM_OLD
;		--------------------- Set the character set line
           STA SAL			; Pointer LO: Tape Buffer/ Screen Scrolling
           STX SAL+1			; Pointer HI
           LDA VIA_PCR		; Get current register byte VIA Register C - CA2	CHIP 
           AND #$f0			; mask out lower nibble
           STA FNLEN			; save it to Temp Variable
           TYA				; Move character set byte to A
           ORA FNLEN			; update lower nibble in Temp Variable
           STA VIA_PCR		; write it back to VIA Register C - CA2			CHIP

;		--------------------- Write to the CRTC controller
           LDY #$11			; Number of bytes to copy = 17

Be09b		LDA (SAL),Y		; Pointer: Tape Buffer/ Screen Scrolling
           STY CRT_Address		; Select the register to update 6545/6845 CRT		CHIP
           STA CRT_Status		; Write to the register
           DEY
           BPL Be09b			; loop for more
           RTS

;************* Get a KEY from keyboard buffer

GETKEY
           LDY KEYD					; Get key at start of buffer
           LDX #0 					; scroll keyboard buffer
getkey1	LDA KEYD+1,X				; Now shift the next keys in line
           STA KEYD,X					;     to the front of the buffer
           INX
           CPX CharsInBuffer			; No. of Chars. in Keyboard Buffer
           BNE getkey1
           DEC CharsInBuffer			; No. of Chars. in Keyboard Buffer
           TYA
           CLI
           RTS

;************* Get Line

GetLine    JSR ChrOutMarginBeep
GetLin10   LDA CharsInBuffer
           STA Blink 					; 0 chars -> blink cursor
           BEQ GetLin10 				; loop until char in buffer
           SEI
           LDA BlinkPhase				; Flag: Last Cursor Blink On/Off
           BEQ Be0d3
           LDA CursorChar				; Character Under Cursor
           LDY #0
           STY BlinkPhase				; Flag: Last Cursor Blink On/Off
           JSR Restore_Char_at_Cursor			; Put character on screen
Be0d3      JSR GETKEY					; Get Character From Keyboard Buffer
           CMP #$83 					; <RUN> ?
           BNE Be0ea

;		-------------------------------- Stuff the <RUN> string to the keyboard buffer

           SEI
           LDX #9					; Length of string
           STX CharsInBuffer			; Set number of characters in buffer
Be0df		LDA RUN_String-1,X			; Normally:  dL"*<CR>run<cr>
           STA KEYD-1,X				; stuff it into the buffer
           DEX
           BNE Be0df					; loop back for more
           BEQ GetLin10

;          -------------------------------- Continue reading line

Be0ea     CMP #13 					; <RETURN> ?
           BNE GetLine
           LDY RigMargin				; Physical Screen Line Length
           STY CRSW 					; # 0 -> Screen Input
Be0f2     LDA (ScrPtr),Y				;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ColourPET!
           CMP #$20 					; <SPACE> Ignore trailing blanks
           BNE Be0fb
           DEY
           BNE Be0f2
Be0fb     INY
           STY LastInputCol
           JSR CURSOR_TO_LEFT_MARGIN
           NOP
           STY QuoteMode 				; = 0 (off)
           LDA InputRow				; Cursor Y-X Pos. at Start of INPUT
           BMI Screen_Input
           CMP CursorRow				; Current Cursor Physical Line Number
           BNE Screen_Input
           LDA InputCol
           STA CursorCol				; Cursor Column on Current Line
           CMP LastInputCol			; Pointer: End of Logical Line for INPUT
           BCC Screen_Input
           BCS Be144

;************* Input a Character

INPUT_CHARACTER
           TYA
           PHA
           TXA
           PHA
           JMP (SCRIV)				; Input from Screen Vector

;************* Default Screen Vector

DEFAULT_SCREEN_VECTOR
           LDA CRSW					; Flag: INPUT or GET from Keyboard
           BEQ GetLin10

;************* Screen Input

Screen_Input
           JSR Jeb3a					; PATCH for extended ROM
           BVS Be13b
           NOP
           AND #$3f 					; '?'
           ASL DATAX					; Current Character to Print
           BIT DATAX
           BPL Be131
           ORA #$80
Be131      BCC Be137
           LDX QuoteMode				; Flag: Editor in Quote Mode, $00 = NO
           BNE Be13b
Be137      BVS Be13b
           ORA #$40 					; '@'
Be13b
!if EXTENDED = 0 {
		INC CursorCol				; Cursor Column on Current Line
}
!if EXTENDED = 1 {
		NOP						; PATCH for conditional cursor?
		NOP
}
           JSR INCREASE_COL
           CPY LastInputCol			; Pointer: End of Logical Line for INPUT
           BNE Be15b
Be144      LDA #0
           STA CRSW					; Flag: INPUT or GET from Keyboard
           LDA #13
           LDX DFLTN					; Default Input Device (0)
           CPX #3
           BEQ Be156
           LDX DFLTO					; Default Output (CMD) Device (3)
           CPX #3
           BEQ Be159
Be156      JSR CHROUT_SCREEN			; Output to Screen
Be159      LDA #13
Be15b      STA DATAX					; Current Character to Print
           PLA
           TAX
           PLA
           TAY
           LDA DATAX					; Current Character to Print
           CMP #$de					; PI symbol
           BNE Be169
           LDA #$ff					; replace with $FF (PI in alt set)
Be169		RTS

;************* Check Quote Mode

CheckQuote
           CMP #$22 					; <QUOTE>
           BNE Be176
           LDA QuoteMode				; Flag: Editor in Quote Mode, $00 = NO
           EOR #1					; toggle the BIT
           STA QuoteMode				; Flag: Editor in Quote Mode, $00 = NO
           LDA #$22 					; reload the <QUOTE>
Be176     RTS

;************* Put Character to Screen

CHARACTER_TO_SCREEN
           ORA #$40 					; '@'
Me179      LDX ReverseFlag
           BEQ Be17f
Me17d      ORA #$80
Be17f

!if EXTENDED = 0 {
		LDX INSRT					; Flag: Insert Mode, >0 = # INSTs
		BEQ iE185
		DEC INSRT					; Flag: Insert Mode, >0 = # INSTs
}

!if EXTENDED = 1 {		
		JSR CHROUT_WITH_DIACRITICS		; PATCH (located in EDITROMEXT.ASM)
           BVS IRQ_EPILOG				; Do not print character! Character pending
           NOP
}

iE185      JSR Restore_Char_at_Cursor		; Put character on screen
           INC CursorCol				; Cursor Column on Current Line
           LDY RigMargin				; Physical Screen Line Length
           CPY CursorCol				; Cursor Column on Current Line
           BCS IRQ_EPILOG
           LDX CursorRow				; Current Cursor Physical Line Number
Me192      JSR Cursor_Down				; Go to next line
           LDY LefMargin				; First column of window
           STY CursorCol				; Cursor Column on Current Line

;************* IRQ Completion

IRQ_EPILOG
           LDA #0
           STA HOMECT					; Home Count
Me19d      PLA
           TAY
           LDA INSRT					; Flag: Insert Mode, >0 = # INSTs
           BEQ Be1a5
           LSR QuoteMode				; Flag: Editor in Quote Mode, $00 = NO
Be1a5     PLA
           TAX
           PLA
           CLI
           RTS

;************* Move Cursor to End of Previous Line

CURSOR_TO_END_OF_PREVIOUS_LINE
           LDY RigMargin				; Physical Screen Line Length
           LDX TopMargin
           CPX CursorRow				; Current Cursor Physical Line Number
           BCC Be1ba
           LDY LefMargin				; First column of window
           STY CursorCol				; Cursor Column on Current Line
           PLA
           PLA
           BNE IRQ_EPILOG
Be1ba      DEC CursorRow				; Current Cursor Physical Line Number
           STY CursorCol				; Cursor Column on Current Line
           JMP UPDATE_CURSOR_ROW		; Set Screen Pointers

;************* Erase To End of Line
; update for COLOURPET

Erase_To_EOL
           LDA #$20 					; <SPACE>
Be1c3      INY
           STA (ScrPtr),Y				; Pointer: Current Screen Line Address @@@@@@@@@@@@@@ ColourPET
           CPY RigMargin
           BCC Be1c3
           RTS

;************* Move Cursor to Left Margin

CURSOR_TO_LEFT_MARGIN
           LDY LefMargin				; First column of window
           STY CursorCol				; Cursor Column on Current Line
           LDY #0
           RTS

;************* Set Full Screen (Exit Window)
; This routine is used to set the screen size parameters for the entire system
; TODO: Update for 'Software switchable' SOFT40.
; Q?: Do we want to support VIC-20  22x23 screen as well? OSI 64x32!?

FULL_SCREEN_WINDOW
           LDA #0					; Top/Left=0
           TAX
           JSR WINDOW_SET_TOP			; Set Window Top
           LDA #$18					; 25 lines   (0-24)

!if COLUMNS = 80 {
           LDX #$4f 					; 80 columns (0-79)
}

!if COLUMNS = 40 {
           LDX #$27 					; 40 columns (0-39)
}

;************* Set Bottom Right Corner of Window

WINDOW_SET_BOTTOM
           STA BotMargin				; Last line of window
           STX RigMargin				; Physical Screen Line Length
           RTS

;************* Set Top Left Corner of Window

WINDOW_SET_TOP
           STA TopMargin				; First line of window
           STX LefMargin				; First column of window
           RTS

;###################################################################################
           !fill $e202-*,$aa			;########################################
;###################################################################################

; ************ Output Character to Screen Dispatch
; This is a fixed entry point. Some BASIC and KERNAL calls jump directly here rather
; than going through the jump table.
;*=$e202

CHROUT_SCREEN
           PHA
           STA DATAX			; Current Character to Print
           TXA
           PHA
           TYA
           PHA
           JMP (SCROV) 		; Via Screen Output Vector (normally 'ChrOutNormal')

;************* Output Character to Screen

ChrOutNormal
           LDA #0
           STA CRSW					; Flag: INPUT or GET from Keyboard

!if EXTENDED = 0 {
		LDY CursorCOl				; Cursor Column on Current Line
		LDA DATAX					; Current Character to Print
		AND #$7F					; Strip off top bit (REVERSE)
}
!if EXTENDED = 1 {
           JSR CONDITIONAL_LR_CURSOR		; PATCH for conditional
           BVS IRQ_EPILOG
           NOP
}
           CMP #$1b					; <ESC>
           BNE Be21d
           JMP Escape					; Cancel RVS/INS/QUOTE modes

Be21d		LDA DATAX					; Current Character to Print
		BPL Be224					; Handle unshifted characters
		JMP ChrOutHighBitSet			; Handle shifted characters

;************* Handle unshifted characters

Be224		CMP #13 					; <RETURN>
		BNE Be22b
		JMP ScreenReturn

Be22b     CMP #$20 					; <SPACE>
           BCC Be237 					; -> Control code
           AND #$3f 					; '?'
           JSR CheckQuote				; Check For Quotes
           JMP Me179 					; -> Print to screen

Be237     LDX INSRT					; Flag: Insert Mode, >0 = # INSTs
           BEQ Be23e
           JMP Me17d 					; -> Print reverse to screen
Be23e     CMP #$14 					; <DEL>
           BNE Be262
           LDY LefMargin				; First column of window
           CPY CursorCol				; Cursor Column on Current Line
           BCC Be24d
           JSR CURSOR_TO_END_OF_PREVIOUS_LINE
           BPL Be25c
Be24d     DEC CursorCol				; Cursor Column on Current Line
           LDY CursorCol				; Cursor Column on Current Line
Be251     INY
           LDA (ScrPtr),Y				; Pointer: Current Screen Line Address @@@@@@@@@@@@@@ ColourPET
           DEY
           STA (ScrPtr),Y				; Pointer: Current Screen Line Address @@@@@@@@@@@@@@ ColourPET
           INY
           CPY RigMargin
           BNE Be251

;          -------------------------------- Note: "80240.PRG" jumps here ($E25C)

Be25c     LDA #$20 					; <SPACE>
           STA (ScrPtr),Y				; put it on the screen!  @@@@@@@@@@@@@@@ ColourPET
           BNE Be299
Be262     LDX QuoteMode				; Flag: Editor in Quote Mode, $00 = NO
           BEQ Be269
           JMP Me17d

Be269     CMP #$12 					; <RVS>
           BNE Be26f
           STA ReverseFlag
Be26f     CMP #$13 					; <HOME>
           BNE Be283
           LDA HOMECT 				; Home Count (<HOME><HOME> sets window to full screen)
           BPL Be27b
           JSR FULL_SCREEN_WINDOW		; Set to full screen
           CLC
Be27b     ROR HOMECT					; Reset Home Count
           JSR CURSOR_HOME				; Home the cursor
           JMP Me19d

Be283     CMP #$1d 					; <CURSOR RIGHT>
           BNE Be292
           INY
           STY CursorCol				; Cursor Column on Current Line
           DEY
           CPY RigMargin				; Physical Screen Line Length
           BCC Be299
           JMP Me192

Be292     CMP #$11 					; <CURSOR DOWN>
           BNE Be29c
           JSR Cursor_Down				; Go to next line
Be299     JMP IRQ_EPILOG

Be29c     CMP #9 					; <TAB>
           BNE Be2d0
           JSR JUMP_TO_TAB				; Perform <TAB>
Be2a3     LDY NextTab
           INC NextTab
           CPY RigMargin				; Physical Screen Line Length
           BCC Be2b6
           LDA RigMargin				; Physical Screen Line Length
           STA CursorCol				; Cursor Column on Current Line
           DEC NextTab				; temp var
           BNE Be299
Be2b6     ASL DOS_Syntax				; temp var
           BNE Be2c5
           INX
           CPX #10					; Length of tab table
           BEQ Be299
           LDA #1
           STA DOS_Syntax				; temp var
Be2c5     LDA TABS_SET,X				; Get TAB from table
           AND DOS_Syntax				; temp var
           BEQ Be2a3
           JMP Me072

Be2d0     CMP #$16 					; <Ctrl V> : Erase to EOL
           BNE Be2e0

           LDA #$20 					; <SPACE>
           DEY
Be2d7     INY
           STA (ScrPtr),Y				; Write it to the screen @@@@@@@@@@@@@@ COLOURPET
           CPY RigMargin				; are we at right margin?
           BCC Be2d7
           BCS Be299

Be2e0     CMP #$15 					; <Ctrl U> - DELETE LINE
           BEQ DELETE_LINE
           JMP Scroll_Or_Select_Charset

;************* Delete Line
DELETE_LINE
		LDA TopMargin				;
		PHA
		LDA CursorRow				; Current Cursor Physical Line Number
		STA TopMargin
		JSR WINDOW_SCROLL_UP			; Scroll window up
		JMP Me5ca

;************* Character Output with High Bit SET

ChrOutHighBitSet
           AND #$7f					; strip off top bit
           CMP #$7f					; special case: code for PI (7F)
           BNE Be2fc
           LDA #$5e 					; replace with screen code 5E
Be2fc     CMP #$20 					; <Shift SPACE>
           BCC Be303
           JMP CHARACTER_TO_SCREEN

Be303     CMP #13 					; <Shift RETURN>
           BNE Be30a
           JMP ScreenReturn

Be30a     LDX QuoteMode
           BNE Be342
           CMP #$14 					; <INS>
           BNE Be33e
           LDY RigMargin
           LDA (ScrPtr),Y				; Read it from the screen
           CMP #$20 					; <SPACE>
		BNE Be38c
		CPY CursorCol
		BCC Be38c
		BEQ Be38c
		LDY RigMargin
Be322		DEY
		LDA (ScrPtr),Y				; Read it from the screen
		INY
		STA (ScrPtr),Y				; Write it to the screen @@@@@@@@@@@@@@ COLOURPET
		DEY
		CPY CursorCol
		BNE Be322
		LDA #$20 					; <SPACE>
		STA (ScrPtr),Y				; Write it to the screen @@@@@@@@@@@@@@ COLOURPET
		LDA RigMargin				; Physical Screen Line Length
		SEC
		SBC CursorCol				; Cursor Column on Current Line
		SBC INSRT					; Flag: Insert Mode, >0 = # INSTs
		BMI Be38c
		INC INSRT					; Flag: Insert Mode, >0 = # INSTs
		BNE Be38c
Be33e		LDX INSRT					; Flag: Insert Mode, >0 = # INSTs
		BEQ Be347
Be342		ORA #$40 					; '@'
		JMP Me17d

Be347		CMP #$11 					; <CURSOR UP>
		BNE Be358
		LDX TopMargin
		CPX CursorRow
		BCS Be38c
           DEC CursorRow
           JSR UPDATE_CURSOR_ROW
           BNE Be38c
Be358     CMP #$12 					; <RVS OFF>
           BNE Be360
           LDA #0
           STA ReverseFlag
Be360     CMP #$1d 					; <CURSOR LEFT>
           BNE Be373
           LDY LefMargin
           CPY CursorCol
           BCC Be36f
           JSR CURSOR_TO_END_OF_PREVIOUS_LINE
           BPL Be38c
Be36f     DEC CursorCol
           BPL Be38c
Be373     CMP #$13 					; <CLR>
           BNE Be37c
           JSR WINDOW_CLEAR
           BNE Be38c
Be37c     CMP #9 					; <Shift TAB>
           BNE Be38f
           JSR JUMP_TO_TAB
           LDA TABS_SET,X
           EOR DOS_Syntax
           STA TABS_SET,X
Be38c     JMP IRQ_EPILOG
Be38f     CMP #$16 					; <Shift Ctrl-V>
           BEQ ERASE_TO_SOL
           JMP ProcControl_A

;************* Erase to Start of Line
ERASE_TO_SOL
		LDA #$20 					; <SPACE>
		LDY LefMargin
Be39a		CPY CursorCol
		BCS Be38c
		STA (ScrPtr),Y				; Write it to the screen @@@@@@@@@@@@@@ COLOURPET
		INY
		BNE Be39a

;************* Do Cursor DOWN, Go to next line

Cursor_Down
           LSR InputRow
           LDX CursorRow
           CPX BotMargin
           BCC Be3b1
           JSR WINDOW_SCROLL_UP
           JMP UPDATE_CURSOR_ROW
Be3b1		INC CursorRow
		JMP UPDATE_CURSOR_ROW

;************* Do CARRIAGE RETURN

ScreenReturn
           LDY LefMargin
           STY CursorCol
           JSR Cursor_Down

;************* Do ESCAPE
; Cancels Insert, Reverse and Quote modes
; TODO: handle CBM-II and C128 ESC sequences here @@@@@@@@@@@@@@@@@@@@@

Escape
           LDA #0
           STA INSRT
           STA ReverseFlag
           STA QuoteMode
           JMP IRQ_EPILOG

;************* Scroll Window DOWN

WINDOW_SCROLL_DOWN
           LDX BotMargin
           INX
Be3cb     DEX
           JSR Cursor_BOL
           CPX TopMargin
           BEQ Be3fe

!if EXTENDED = 0 {
		LDA Line_Addr_Lo-1,X     		; Screen Line address table LO - 1
		STA SAL					; Pointer: Tape Buffer/ Screen Scrolling
		LDA Line_Addr_Hi-1,X 			; Screen Line address table HI - 1
		STA SAL+1
}
!if EXTENDED = 1 {
           DEX
           JSR Set_Screen_SAL			;PATCH to calculate screen pointer
           INX
}
Be3d8		INY
           LDA (SAL),Y
           STA (ScrPtr),Y				;@@@@@@@@@@@@@@@ COLOURPET
           CPY RigMargin
           BCC Be3d8
           BCS Be3cb

;************* Scroll Window UP

WINDOW_SCROLL_UP
           LDX TopMargin
           DEX
Be3e6      INX
           JSR Cursor_BOL
           CPX BotMargin
           BCS Be3fe

!if EXTENDED = 0 {
		LDA Line_Addr_Lo+1,X			; Screen line address table LO + 1
		STA SAL					; Pointer: Tape Buffer/ Screen Scrolling
		LDA Line_Addr_Hi+1,X			; Screen line address table HI + 1
		STA SAL+1					; Pointer: Tape Buffer/ Screen Scrolling
}
!if EXTENDED = 1 {
           INX
           JSR Set_Screen_SAL			;PATCH to calculate screen pointer
           DEX
}
Be3f3      INY
           LDA (SAL),Y
           STA (ScrPtr),Y				;@@@@@@@@@@@@@@@ COLOURPET
           CPY RigMargin
           BCC Be3f3
           BCS Be3e6

Be3fe      JSR Erase_To_EOL			; Clear the bottom line

;************* Check Keyboard Scroll Control
; This code looks very different from older ROMS

           LDA STKEY					; Key Scan value
           LDX #$ff					;
           LDY #0
           CMP #$a0
           BNE Be41b

Be40b      CPX STKEY					; Key Scan value
           BNE Be40b					; Loop when key still pressed

Be40f      LDA STKEY					; Key Scan value
           ASL
           CMP #$40 					; '@'
           BEQ Be41f

           JSR CHKSTOP				; Check if STOP key pressed
           BNE Be40f

Be41b      CMP #$20 					; Is it a <SPACE>?
           BNE Be427					; No, exit

Be41f      DEX						; Yes, do delay
           BNE Be41f					; Loop back
           DEY
           BNE Be41f					; Loop back

           STY CharsInBuffer			; Clear buffer
Be427      RTS

;************* Correct Jiffy Clock Timer
; TODO: Analyze JIFFY CLOCK differences from older ROMs

ADVANCE_TIMER_CORR
           LDA #6
           STA JIFFY6DIV5

;************* Update Jiffy Clock

ADVANCE_TIMER
           JSR ADVANCE_JIFFY_CLOCK		; In EDITROMEXT file
           DEC JIFFY6DIV5
           BEQ ADVANCE_TIMER_CORR
           RTS
           !fill $e442-*,$aa			; 14 bytes

;************* Main IRQ Dispatcher
; This entry point must not move! It is called directly from KERNAL
; *=e442
IRQ_MAIN
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
Be452      JMP (CINV)

;************* IRQ

IRQ_NORMAL
           JSR ADVANCE_TIMER
           LDA Blink
           BNE Be474
           DEC BLNCT
           BNE Be474
           LDA #$14
           STA BLNCT
           LDY CursorCol
           LSR BlinkPhase
           LDA (ScrPtr),Y				; Get character from the screen
           BCS Be470
           INC BlinkPhase
           STA CursorChar
Be470      EOR #$80					; Flip the reverse bit
           STA (ScrPtr),Y				; Put it back on the screen
Be474      LDY #0
           LDA PIA1_Port_A 			; Keyboard ROW select
           ASL 
           ASL 
           ASL 
           BPL Be487
           STY CAS1
           LDA PIA1_Cont_B
           ORA #8
           BNE Be490
Be487      LDA CAS1
           BNE Be493
           LDA PIA1_Cont_B
           AND #$f7
Be490      STA PIA1_Cont_B
Be493      BCC Be49e
           STY CAS2
           LDA VIA_Port_B
           ORA #16
           BNE Be4a7
Be49e      LDA CAS2
           BNE Be4aa
           LDA VIA_Port_B
           AND #$ef
Be4a7      STA VIA_Port_B
Be4aa      JSR SCAN_KEYBOARD
           JMP IRQ_END

;###################################################################################
           !fill $e4be-*,$aa			;########################################
;###################################################################################

;************* Original Keyboard Scanner

OLD_SCAN_KEYBOARD
           LDA #$ff
           STA Key_Image			; Key Image
           LDA CharsInBuffer
           PHA
           JSR SCAN_KEYBOARD		; EXTENDED Keyboard scanner in EXTROM
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
Be4dd      CMP #3 				; <STOP>
           BNE Be4e5
           LDA #$ef
           STA STKEY
Be4e5      RTS

;#############################################################################
           !fill $e54e-*,$aa		;########################################
;#############################################################################

;************* Select Character Set

SELECT_CHAR_SET
           CMP #1
           BNE Be557
Be552	   	JSR CRT_SET_TEXT_NEW
           BMI Be5a7
Be557      CMP #2
           BEQ Be552
           BNE Be59b

;*************

ProcControl_B
           CMP #1
           BNE Be567
           JSR CLEAR_KEYFLAGS_210
           JMP IRQ_EPILOG
Be567      CMP #2 				; <$82> - Switch to old (PET) char set
           BNE ProcControl_C
           JSR CRT_SET_TEXT_OLD
           BMI Be5a7

;************* Do TAB

JUMP_TO_TAB
           LDA CursorCol
           AND #$f8
           STA NextTab
           LSR
           LSR
           LSR
           TAX
           LDA #1
           STA DOS_Syntax
           LDY CursorCol
Me582      CPY NextTab
           BEQ Be590
           ASL DOS_Syntax
           INC NextTab
           JMP Me582
Be590      RTS

;************* Scroll or Select Character Set

Scroll_Or_Select_Charset
           CMP #$19 				; <Ctrl> Y - Scroll window up
           BNE SELECT_CHAR_SET

           JSR WINDOW_SCROLL_UP
           JMP Me5d9
Be59b      CMP #15 				; <Ctrl> O - Set top left window corner
           BNE Be5aa

           LDA CursorRow
           STA TopMargin
           LDA CursorCol
           STA LefMargin
Be5a7      JMP IRQ_EPILOG

Be5aa      CMP #14 				; <Ctrl> N - Text mode
           BNE Be5b3
           JSR CRT_SET_TEXT
           BMI Be5a7

Be5b3      CMP #7 				; <Ctrl> G - Bell
           BNE Be5a7
           JSR BEEP
           BEQ Be5a7

;*************

ProcControl_A
           CMP #$15 				; <Ctrl> U -> Delete line
           BNE ProcControl_B
           LDA TopMargin
           PHA
           LDA CursorRow
           STA TopMargin
           JSR WINDOW_SCROLL_DOWN
Me5ca      PLA
           STA TopMargin
           JSR CURSOR_LEFT_MARGIN
           BNE Be5ea

;*************

ProcControl_C
           CMP #$19 				; <Ctrl> Y - Scroll window down
           BNE Be5de
           JSR WINDOW_SCROLL_DOWN
Me5d9      JSR UPDATE_CURSOR_ROW
           BNE Be5ea
Be5de      CMP #15 				; <143> - Set lower right window corner
           BNE Be5ed
           LDA CursorRow
           STA BotMargin
           LDA CursorCol
           STA RigMargin
Be5ea      JMP IRQ_EPILOG
Be5ed      CMP #14 				; <142> - Graphics mode
           BNE Be5b3
           JSR CRT_SET_GRAPHICS
           BMI Be5ea

           !fill $e600-*,$aa		; 10 bytes

;************* End of IRQ

IRQ_END
           PLA
           TAY
           PLA
           TAX
           PLA
           RTI

;************* Restore Character at Cursor

Restore_Char_at_Cursor
           LDY CursorCol			; Cursor Column on Current Line
           STA (ScrPtr),Y			; Pointer: Current Screen Line Address
           LDA #2				; Set blink count so cursor appears immediately
           STA BLNCT				; Timer: Countdown to Toggle Cursor
           RTS

;************* Editor Initialization
; TODO: Initialize colourpet locations

INIT_EDITOR
           LDA #$7f
           STA VIA_IER			; VIA, Register E - I/O Timers
           LDX #$6d
           LDA #0
           STA HOMECT				; Clear Home Count
;-------------
;removed   STA $E4 				; Clear REPEAT ($80 = Repeat, $40 = disable)
;-------------
Be61a      STA JIFFY_CLOCK,X		; Clear Real-Time Jiffy Clock (approx) 1/60 Sec
           DEX
           BPL Be61a
           STX KEYFLAGS 			; $FF = Clear all flags

;************* Set IRQ Vector
; Normally $E455 - (Note: Execudesk changes this to $E900)
;
           LDA #<IRQ_NORMAL		; Set IRQ Vector 
           STA CINV
           LDA #>IRQ_NORMAL
           STA CINV+1
;*************

           LDA #9
           STA XMAX				; Size of Keyboard Buffer
           LDA #3
           STA DFLTO				; Default Output (CMD) Device (3)
           LDA #15
           STA PIA1_Port_A 		; Keyboard row select
           ASL 
           STA VIA_Port_B
           STA VIA_DDR_B
           STX PIA2_Port_B
           STX VIA_Timer_1_Hi
           LDA #$3d 				;
           STA PIA1_Cont_B
           BIT PIA1_Port_B 		; Keyboard row
           LDA #$3c 				;
           STA PIA2_Cont_A
           STA PIA2_Cont_B
           STA PIA1_Cont_A
           STX PIA2_Port_B
           LDA #14
           STA BLNCT				; Timer: Countdown to Toggle Cursor
           STA Blink				; Cursor Blink enable: 0 = Flash Cursor
           STA DELAY				; Repeat Delay Counter
           STA KOUNT				; Repeat Speed Counter
           STA VIA_IER
           JSR FULL_SCREEN_WINDOW	; Exit Window - Set screen size (ie: 80x25)

;************* Clear Tab Stops (80 bits)
           LDX #12
           LDA #0
Be66d      STA TABS_SET,X				; Table of 80 bits to set TABs
           DEX
           BPL Be66d

           LDA #<DEFAULT_SCREEN_VECTOR	; LO Address of Screen Input vector (from E006)
           LDX #>DEFAULT_SCREEN_VECTOR	; HI 
           STA SCRIV					; Input from screen vector (from E006)
           STX SCRIV+1				; Input from screen vector (from E006)

           LDA #<ChrOutNormal
           LDX #>ChrOutNormal
           STA SCROV					; Print to screen vector (from E009)
           STX SCROV+1				; Print to screen vector (from E009)

           LDA #16
           STA CHIME
           JSR Double_Beep				; Power-up chimes
           BEQ Double_Beep				; More chimes (4 total)

;************* Character Out Margin Beep

ChrOutMarginBeep
           JSR CHROUT_SCREEN			; Output to Screen
           TAX
           LDA RigMargin				; Physical Screen Line Length
           SEC
           SBC CursorCol				; Cursor Column on Current Line
           CMP #5					; 5 characters from end of line
           BNE Be6d0
           TXA
           CMP #$1d 					; <Cursor Right> ?
           BEQ Double_BEEP				; Ring BELL
           AND #$7f
           CMP #$20 					; <SPACE>
           BCC Be6d0

;************* Do BELL

Double_BEEP
           JSR BEEP
BEEP
!if SILENT=0 {
           LDY CHIME					; Chime Time FLAG
} ELSE {
		NOP
		RTS
}
           BEQ Be6d0

           LDA #16
           STA VIA_ACR
           LDA #15
           STA VIA_Shift
           LDX #7
Be6b7      LDA SOUND_TAB-1,X
           STA VIA_Timer_2_Lo
           LDA CHIME					; Chime Time

Be6bf      DEY
           BNE Be6bf					; delay loop
           SEC
           SBC #1
           BNE Be6bf					; delay loop
           DEX
           BNE Be6b7					; delay loop
           STX VIA_Shift
           STX VIA_ACR
Be6d0		RTS


;************* Set Screen SAL
!if EXTENDED = 1 {

Set_Screen_SAL
           TXA
           LDX #$c7 					; 199?  #<SAL ?
           BNE Be6dc
}

;************* Move Cursor to Beginning of Line

Cursor_BOL
           LDY LefMargin
           DEY

;************* Screen Pointer calculation
; This routine replaces the screen address table from previous roms

!if EXTENDED = 1 { !source "extscreenptr.asm" }

;************* Modifier Keys

ModifierKeys
           !byte $00,$00,$00,$00,$00,$00,$41,$00
           !byte $01,$00

;###################################################################################
           !fill $e721-*, $aa			;########################################
;###################################################################################

;************* SHIFT RUN/STOP string

RUN_String
      	!byte $44,$cc,$22,$2a,$0d		; dL"*<CR>
		!byte $52,$55,$4e,$0d			; run<cr>

;************* CRTC Chip Register Setup Tables

!if COLUMNS = 80 {
	!if REFRESH = 0 { !source "crtc-80-50hz.asm" }
	!if REFRESH = 1 { !source "crtc-80-60hz.asm" }
}

!if COLUMNS = 40 {
	!if SOFT40 = 1 {
		!if REFRESH = 0 { !source "crtc-soft40-50hz.asm" }
		!if REFRESH = 1 { !source "crtc-soft40-60hz.asm" }
	} ELSE {
		!if REFRESH = 0 { !source "crtc-40-50hz.asm" }
		!if REFRESH = 1 { !source "crtc-40-60hz.asm" }
		!if REFRESH = 2 { !source "crtc-40-pal.asm" }
		!if REFRESH = 3 { !source "crtc-40-ntsc.asm" }
	}
}

;************* BELL Sound Table

SOUND_TAB
           !byte $0e,$1e,$3e,$7e,$3e,$1e,$0e

;************* Screen Line Address Tables

!if COLUMNS = 80 {!source "screen-80.asm"}
!if COLUMNS = 40 {!source "screen-40.asm"}


;************* CRTC Chip Register Setup Tables 
;
; These are copies of the above files. 
; TODO: Figure out how the old and new files are used!!!!

!if COLUMNS = 80 {
	!if REFRESH = 0 { !source "crtc-80-50hz-old.asm" }
	!if REFRESH = 1 { !source "crtc-80-60hz-old.asm" }
}

!if COLUMNS = 40 {
	!if SOFT40 = 1 {
		!if REFRESH = 0 { !source "crtc-soft40-50hz-old.asm" }
		!if REFRESH = 1 { !source "crtc-soft40-60hz-old.asm" }
	} ELSE {
		!if REFRESH = 0 { !source "crtc-40-50hz-old.asm" }
		!if REFRESH = 1 { !source "crtc-40-60hz-old.asm" }
		!if REFRESH = 2 { !source "crtc-40-pal-old.asm" }
		!if REFRESH = 3 { !source "crtc-40-ntsc-old.asm" }
	}
}


		!byte $28			; ??????

;##############################################################################
           !fill $e7ff-*,$ff	; Fill to end of 2K ###########################
;##############################################################################
 
		!byte $1a			; ??????

