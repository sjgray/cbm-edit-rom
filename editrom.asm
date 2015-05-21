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
;    * Soft-switchable SOFT40
;    * Soft-switchable real 40/80 columns (requires hardware mod)
;    * Extended screen editor - C128 or CBM-II compatible ESC sequences
;    * Keyboard soft-reset (kinda like CTRL-ALT-DEL on PC's)
;    * Autoboot from default drive
;    * DOS Wedge
;
;-----------------------------------------------------------------------------------------------
* = $e000	; Normal start address for EDIT ROM is $E000
;-----------------------------------------------------------------------------------------------


;************* Edit ROM Jump Table
;
; Note: Not all KERNAL and BASIC calls go through this table.
;       There are FIVE hard-coded entry points: $E0A7, $E116, $E202, $E442, $E600

EDITOR
		JMP RESET_EDITOR		; Main Initialization (called from Kernal power up reset) 
		JMP GETKEY			; Get Character From Keyboard Buffer (FIXED ENTRY POINT. Must not move!)
		JMP INPUT_CHARACTER		; Input From Screen or Keyboard	(FIXED ENTRY POINT. Must not move!)
		JMP CHROUT_SCREEN		; Output to Screen		(FIXED ENTRY POINT. Must not move!)
		JMP IRQ_MAIN			; Main IRQ Handler		(FIXED ENTRY POINT. Must not move!)
		JMP IRQ_NORMAL			; Actual IRQ (clock, keyboard scan)
		JMP IRQ_END			; Return From Interrupt		(FIXED ENTRY POINT. Must not move!)
		JMP WINDOW_CLEAR		; Clear Window
		JMP CRT_SET_TEXT		; Set CRTC to TEXT mode
		JMP CRT_SET_GRAPHICS		; Set CRTC to GRAPHICS mode
		JMP CRT_PROGRAM			; Program CRTC (Table pointer in A/X, chr set in Y)
		JMP WINDOW_SCROLL_DOWN		; Scroll DOWN
		JMP WINDOW_SCROLL_UP		; Scroll UP
		JMP SCAN_KEYBOARD		; Scan Keyboard
		JMP BEEP			; Ring BELL/CHIME

!IF REPEATOPT = 1 {
		JMP SET_REPEAT_MODE		; Set REPEAT MODE
} else {
		JMP BEEP			; Ring BELL/CHIME
}
		JMP WINDOW_SET_TOP		; Set Window Top
		JMP WINDOW_SET_BOTTOM		; Set Window Bottom


;************* Set REPEAT MODE (Called from Jump Table)
; Flag: $80 = Repeat, $40 = disable

SET_REPEAT_MODE

!if REPEATOPT = 1 {
		STA RPTFLG				;$E4
} else {
		NOP
		NOP
}
		RTS

;###################################################################################
           !fill $e04b-*,$aa	; 17 bytes #########################################
;###################################################################################

;************** Reset Editor (Called from Jump Table)

RESET_EDITOR

!if COLOURPET=0 {
		JSR INIT_EDITOR
} ELSE {
		JSR ColourPET_Init			; Initialize ColourPET settings
}

!IF BOOTCASE=0 { JSR CRT_SET_TEXT }			; Set Screen to TEXT mode
!IF BOOTCASE=1 { JSR CRT_SET_GRAPHICS }		; Set Screen to GRAPHICS mode

;************** Clear Window (Called from Jump Table)

WINDOW_CLEAR
		LDX TopMargin				; Window Top line
		DEX					; prep for loop
Be054		INX					; Next line
		JSR UPDATE_CURSOR_R2			; was: CURSOR_LEFT_MARGIN  ; Was: Cursor_BOL
		JSR Erase_To_EOL			; Erase the line
		CPX BotMargin				; Check if at the last line
		BCC Be054				; No, go do next line

;************** Home the Cursor

CURSOR_HOME
		LDX TopMargin				; Go to TOP of window
		STX CursorRow				; put cursor there too

;************** Move cursor to LEFT MARGIN

CURSOR_LEFT_MARGIN
		LDY LefMargin				; Get Left margin
		STY CursorCol				; Set cursor there

;************** Update Cursor ROW - Get pointer from Screen Line Address Tables (and Colour)
; TODO: Update for Soft40 (check screen width and set pointer from appropriate table)
; ----

UPDATE_CURSOR_ROW
		LDX CursorRow				;$E06C Current Cursor Physical Line Number

!if EXTENDED=0 {
		JMP UPDATE_CURSOR_R3			;$E06F
} ;zxcvb Added this!!!!!!!!!!!!!!!!!!!!!!!!!!!

;		----------------------------------------

UPDATE_CURSOR_R2
		LDY LefMargin				; First column of window
		DEY
UPDATE_CURSOR_R3
		LDA Line_Addr_Lo,X			; Screen Line Addresses LO
UPDATE_SCREEN_PTR
	!IF COLOURPET=1 {
		JSR ColourPET_SyncPointersX		; Sync Pointers to Current Line
	} ELSE {
		!IF SS40=1 {
			JSR SS40_SyncPointersX		; Update screen pointers based on current screen width
		} ELSE {
			STA ScrPtr			; Pointer: Current Screen Line Address LO
			LDA Line_Addr_Hi,X		; Screen Line Addresses HI
			STA ScrPtr+1         		; Pointer: Current Screen Line Address HI
		}
	}
		RTS

!if EXTENDED=1 {
           	JMP Update_ScrPtr			; New Screen pointer calculation routine
           	JMP Cursor_BOL				; HOW DO WE GET TO THIS CODE?
UPDATE_PNT
           	JMP Update_ScrPtr			; New Screen pointer calculation routine @@@@@@@@@@ PATCH
Me072		INY
      		STY CursorCol	
		JMP IRQ_EPILOG
		TAX
		TAX
}


;************** CRTC Programming and Screen Modes

!source "crtc.asm"

;################################################################################################
		!fill $e0a7-*,$aa	;########################################################
;################################################################################################


;************** Get a KEY from keyboard buffer (Called from Jump Table)
; $E0A7 - FIXED ENTRY POINT!!!!!
;
; Reads a character from 'KEYD' then shifts remaining buffer characters
; If there is NO key it will return $FF.

GETKEY
!if DEBUG=1 { INC DBLINE+2,X }			; DEBUG
		LDY KEYD				; Get key at start of buffer
		LDX #0 					; Start at 0

getkey1		LDA KEYD+1,X				; LOOP START - Now shift the next keys in line
		STA KEYD,X				; to the front of the buffer
!if DEBUG=1 { STA DBLINE+10,X }			; DEBUG - update screen
		INX
		CPX CharsInBuffer			; Num Chars in Keyboard Buffer
		BNE getkey1				; Done? No, loop for another

		DEC CharsInBuffer			; Reduce Num Chars in Keyboard Buffer

		TYA					; Put the character in Accumulator
!if DEBUG=1 { STA DBLINE+3 }				; DEBUG - 4th chr on bottom line
		CLI
		RTS

;************** Get Line
;
; The PET is usually in this routine, waiting for keypresses and printing them or acting on them.
; This routine continually loops until a <CR> is pressed. When <CR> is pressed then the line
; where the cursor is, is processed. If the <RUN> key is pressed then the string is stuffed into
; the keyboard buffer (overwriting whatever might be there)

GetLine		JSR ChrOutMarginBeep			; 
GetLin10
!if DEBUG=1 { INC DBLINE+5 }				; DEBUG - 6th chr on bottom line

		LDA CharsInBuffer			; Are there any keys waiting?
		STA Blink 				; 0 chars -> blink cursor
		BEQ GetLin10 				; loop until char in buffer

!if DEBUG=1 { INC DBLINE+6 }				; DEBUG - 7th chr on bottom line

;************** Got a character, so process it

		SEI
		LDA BlinkPhase				; Flag: Last Cursor Blink On/Off
		BEQ Be0d3
		LDA CursorChar				; Character Under Cursor
		LDY #0
		STY BlinkPhase				; Flag: Last Cursor Blink On/Off
		JSR Restore_Char_at_Cursor		; Put character on screen
Be0d3		JSR GETKEY				; Get Character From Keyboard Buffer
		CMP #$83				; Is it the <RUN> key?
		BNE Be0ea				; No, skip ahead

;		--------------------------------------- Stuff the <RUN> string to the keyboard buffer

		SEI
		LDX #9					; Length of string
		STX CharsInBuffer			; Set number of characters in buffer
Be0df		LDA RUN_String-1,X			; Normally:  dL"*<CR>run<cr>
		STA KEYD-1,X				; stuff it into the buffer
		DEX
		BNE Be0df				; loop back for more
		BEQ GetLin10

;		--------------------------------------- Check for RETURN key

Be0ea		CMP #13 				; Check if <RETURN> pressed
		BNE GetLine				; if not go get more keys

;*******************************************************************************************
; Parse the line. When the <CR> key is pressed the line where the cursor lives is executed
;*******************************************************************************************

;!if DEBUG=1 { INC DBLINE+7 }				; DEBUG - 8th chr on bottom line

		LDY RigMargin				; Physical Screen Line Length
		STY CRSW 				; # 0 -> Screen Input
Be0f2		LDA (ScrPtr),Y				; Read Character from Screen RAM
		CMP #$20 				; <SPACE> Ignore trailing blanks
		BNE Be0fb				; Yes, exit out
		DEY					; move to previous character position
		BNE Be0f2				; At start of line? No, loop back for more

Be0fb		INY					; last was not <SPACE> so move ahead one
		STY LastInputCol			; record the position
		JSR CURSOR_TO_LEFT_MARGIN		; move to the start of the line
		NOP
		STY QuoteMode 				; Turn off quote mode
		LDA InputRow				; Cursor Y-X Pos. at Start of INPUT
		BMI Screen_Input
		CMP CursorRow				; Current Cursor Physical Line Number
		BNE Screen_Input
		LDA InputCol
		STA CursorCol				; Cursor Column on Current Line
		CMP LastInputCol			; Pointer: End of Logical Line for INPUT
		BCC Screen_Input
		BCS Be144

;################################################################################################
		!fill $e116-*,$aa	; #######################################################
;################################################################################################

;************** Input a Character (Called from Jump Table)
;
; $E116 - FIXED ENTRY POINT!!!!!

INPUT_CHARACTER
		TYA
		PHA
		TXA
		PHA
		JMP (SCRIV)				; Input from Screen Vector

;************** Default Screen Vector

DEFAULT_SCREEN_VECTOR
		LDA CRSW				; Flag: INPUT or GET from Keyboard
		BEQ GetLin10

;************** Screen Input

Screen_Input

!if EXTENDED=0 {
iE121		LDY CursorCol				; Cursor Column on Current Line
		LDA (ScrPtr),Y				; Pointer: Current Screen Line Address
		STA DATAX				; Current Character to Print
} else {
		JSR Screen_Input_Ext			; PATCH for extended ROM
		BVS Be13b
		NOP
}
		AND #$3f 				; '?'
		ASL DATAX				; Current Character to Print
		BIT DATAX
		BPL Be131
		ORA #$80
Be131		BCC Be137
		LDX QuoteMode				; Flag: Editor in Quote Mode, $00 = NO
		BNE Be13b
Be137		BVS Be13b
		ORA #$40 				; '@'
Be13b

!if EXTENDED=0 { INC CursorCol }			; Cursor Column on Current Line

!if EXTENDED=1 {
		NOP					; PATCH for conditional cursor?
		NOP
}
		JSR CheckQuote				; ?? Was: INCREASE_COL ??
		CPY LastInputCol			; Pointer: End of Logical Line for INPUT
		BNE Be15b
Be144		LDA #0
		STA CRSW				; Flag: INPUT or GET from Keyboard
		LDA #13
		LDX DFLTN				; Default Input Device (0)
		CPX #3
		BEQ Be156
		LDX DFLTO				; Default Output (CMD) Device (3)
		CPX #3
		BEQ Be159
Be156		JSR CHROUT_SCREEN			; Output to Screen
Be159		LDA #13
Be15b		STA DATAX				; Current Character to Print
		PLA
		TAX
		PLA
		TAY
		LDA DATAX				; Current Character to Print
		CMP #$de				; PI symbol
		BNE Be169
		LDA #$ff				; replace with $FF (PI in alt set)
Be169		RTS

;************** Check Quote Mode

CheckQuote
		CMP #$22 				; <QUOTE>
		BNE Be176
		LDA QuoteMode				; Flag: Editor in Quote Mode, $00 = NO
		EOR #1					; toggle the BIT
		STA QuoteMode				; Flag: Editor in Quote Mode, $00 = NO
		LDA #$22 				; reload the <QUOTE>
Be176		RTS

;************** Put Character to Screen

CHARACTER_TO_SCREEN
		ORA #$40 				; '@'
Me179		LDX ReverseFlag
		BEQ Be17f
Me17d		ORA #$80
Be17f

!if EXTENDED=0 {
		LDX INSRT				; Flag: Insert Mode, >0 = # INSTs
		BEQ iE185
		DEC INSRT				; Flag: Insert Mode, >0 = # INSTs
}

!if EXTENDED=1 {		
		JSR CHROUT_WITH_DIACRITICS		; PATCH (located in EDITROMEXT.ASM)
		BVS IRQ_EPILOG				; Do not print character! Character pending
		NOP
}

iE185
		JSR Restore_Char_at_Cursor		; Put character on screen
		INC CursorCol				; Cursor Column on Current Line
		LDY RigMargin				; Physical Screen Line Length
		CPY CursorCol				; Cursor Column on Current Line
		BCS IRQ_EPILOG
		LDX CursorRow				; Current Cursor Physical Line Number
Me192		JSR Cursor_Down				; Go to next line
		LDY LefMargin				; First column of window
		STY CursorCol				; Cursor Column on Current Line

;************** IRQ Completion

IRQ_EPILOG
		LDA #0
		STA HOMECT				; Home Count
Me19d		PLA
		TAY
		LDA INSRT				; Flag: Insert Mode, >0 = # INSTs
		BEQ Be1a5
		LSR QuoteMode				; Flag: Editor in Quote Mode, $00 = NO
Be1a5		PLA
		TAX
		PLA
		CLI
		RTS

;************** Move Cursor to End of Previous Line

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
Be1ba		DEC CursorRow				; Current Cursor Physical Line Number
		STY CursorCol				; Cursor Column on Current Line
		JMP UPDATE_CURSOR_ROW			; Set Screen Pointers

;************** Erase To End of Line
;
; Called from WINDOW_CLEAR
; This routine is relocated/updated for COLOURPET

!if COLOURPET=0 {

Erase_To_EOL
		LDA #$20 				; <SPACE>
Be1c3		INY
		STA (ScrPtr),Y				; Pointer: Current Screen Line Address
		CPY RigMargin
		BCC Be1c3
		RTS
}

;************** Move Cursor to Left Margin
ESCAPE_J						; Esc-j Start-of-Line
CURSOR_TO_LEFT_MARGIN
		LDY LefMargin				; First column of window
		STY CursorCol				; Cursor Column on Current Line
		LDY #0
		RTS

;************** Set Full Screen (Exit Window)
;
; This routine is used to set the screen size parameters for the printing routines
; OPTIONS: 'COLUMNS' determines 40 or 80 column screen
;          'SS40'    when COLUMNS=80 uses col size determined by Soft40 'SCNWIDTH' memory location
; Note: Changing SCNWIDTH does not change CRTC parameters. Use the ESC-X command!!!

FULL_SCREEN_WINDOW
		LDA #0					; Top/Left=0
		TAX
		JSR WINDOW_SET_TOP			; Set Window Top
		LDA #24					; 25 lines   (0-24)

!if COLUMNS=80 {
	!if SS40=1 {
		LDX SCNWIDTH				; Current SS40 screen width
	} ELSE {
		LDX #$4f 				; 80 columns (0-79)
	}
}

!if COLUMNS=40 {
		LDX #$27				; 40 columns (0-39)
}

;************** Set Bottom Right Corner of Window

WINDOW_SET_BOTTOM
		STA BotMargin				; Last line of window
		STX RigMargin				; Physical Screen Line Length
		RTS

;************** Set Top Left Corner of Window

WINDOW_SET_TOP
		STA TopMargin				; First line of window
		STX LefMargin				; First column of window
		RTS

;################################################################################################
		!fill $e202-*,$aa	; 28 bytes ##############################################
;################################################################################################

; ************ Output Character to Screen Dispatch (Called from Jump Table)
;
; $E202 - FIXED ENTRY POINT!!!!!
; Some BASIC and KERNAL calls jump directly here rather than going through the jump table.

CHROUT_SCREEN
		PHA
		STA DATAX				; Current Character to Print
		TXA
		PHA
		TYA
		PHA
		JMP (SCROV) 				; Via Screen Output Vector (normally 'ChrOutNormal')

;************** Output Character to Screen
; SCROV vector normally points here

ChrOutNormal
		LDA #0
		STA CRSW				; Flag: INPUT or GET from Keyboard

!if EXTENDED=0 {
		LDY CursorCol				; Cursor Column on Current Line
		LDA DATAX				; Current Character to Print
		AND #$7F				; Strip off top bit (REVERSE)
}
!if EXTENDED=1 {
		JSR CONDITIONAL_LR_CURSOR		; PATCH for conditional
		BVS IRQ_EPILOG
		NOP
}

;************** CHECK HERE FOR ESC CODES

!IF ESCCODES=1 {
		JMP CheckESC				; Check for ESC as last Char, then ESC as current Char. If so, perform it.
ESC_DONE	STA LASTCHAR				; Save the character

} ELSE {
		CMP #$1b				; <ESC>	key? **** Also SHIFT-ESC $9B (Conflicts with COLOUR CODE!)
		BNE Be21d
		JMP Escape				; Cancel RVS/INS/QUOTE modes
}

ESC_DONE2

;************** Reload character and check high bit 

Be21d		LDA DATAX				; Current Character to Print
!if COLOURPET=1 { JSR CheckColourCodes }		; Check table of color values @@@@@@@@@@@@@@@@ COLOURPET

		BPL Be224				; Handle unshifted characters
		JMP ChrOutHighBitSet			; Handle shifted characters

;************** Handle unshifted characters

Be224		CMP #13 				; <RETURN>
		BNE Be22b
		JMP ScreenReturn

Be22b		CMP #$20 				; <SPACE>
		BCC Be237 				; -> Control code
		AND #$3f 				; '?'
		JSR CheckQuote				; Check For Quotes
		JMP Me179 				; -> Print to screen

Be237		LDX INSRT				; Flag: Insert Mode, >0 = # INSTs
		BEQ Be23e
		JMP Me17d 				; -> Print reverse to screen
Be23e		CMP #$14 				; <DEL>
		BNE Be262
		LDY LefMargin				; First column of window
		CPY CursorCol				; Cursor Column on Current Line
		BCC Be24d
		JSR CURSOR_TO_END_OF_PREVIOUS_LINE
		BNE Be25c				; Was: BPL Be25c

Be24d		DEC CursorCol				; Cursor Column on Current Line
		LDY CursorCol				; Cursor Column on Current Line

!if COLOURPET=0 {
Be251		INY
		LDA (ScrPtr),Y				; Read Character from Screen RAM
		DEY					; move to the left
		STA (ScrPtr),Y				; Write Character to Screen RAM
		INY
		CPY RigMargin
		BNE Be251
} ELSE {
		JSR ColourPET_Scroll_Left		; Scroll both Screen and Colour LEFT	@@@@@@@@@@@@@@ ColourPET
}

;-------------------------------------------------------
; Note: "80240.PRG" jumps here ($E25C)
; Question: Should we pad here for compatibility, or would including "Soft-40" be ok?
;-------------------------------------------------------

Be25c		LDA #$20 				; <SPACE>
		STA (ScrPtr),Y				; put it on the screen! 
!if COLOURPET=1 {
		LDA COLOURV				; Get the current Colour	@@@@@@@@@@@@@@@ ColourPET
		STA (COLOURPTR),Y			; put it to Colour MEM		@@@@@@@@@@@@@@@ ColourPET
}
		BNE Be299

Be262		LDX QuoteMode				; Flag: Editor in Quote Mode, $00 = NO
		BEQ Be269
		JMP Me17d

Be269		CMP #$12 				; <RVS>
		BNE Be26f
		STA ReverseFlag
Be26f		CMP #$13 				; <HOME>
		BNE Be283
		LDA HOMECT 				; Home Count (<HOME><HOME> sets window to full screen)
		BPL Be27b
		JSR FULL_SCREEN_WINDOW			; Set to full screen
		CLC
Be27b		ROR HOMECT				; Reset Home Count
		JSR CURSOR_HOME				; Home the cursor
		JMP Me19d

Be283		CMP #$1d 				; <CURSOR RIGHT>
		BNE Be292
		INY
		STY CursorCol				; Cursor Column on Current Line
		DEY
		CPY RigMargin				; Physical Screen Line Length
		BCC Be299
		JMP Me192

Be292		CMP #$11 				; <CURSOR DOWN>
		BNE Be29c
		JSR Cursor_Down				; Go to next line
Be299		JMP IRQ_EPILOG

Be29c		CMP #9 					; <TAB>
		BNE Be2d0
		JSR JUMP_TO_TAB				; Perform <TAB>
Be2a3		LDY NextTab
		INC NextTab
		CPY RigMargin				; Physical Screen Line Length
		BCC Be2b6
		LDA RigMargin				; Physical Screen Line Length
		STA CursorCol				; Cursor Column on Current Line
		DEC NextTab				; temp var
		BNE Be299
Be2b6		ASL DOS_Syntax				; temp var
		BNE Be2c5
		INX
		CPX #10					; Length of tab table
		BEQ Be299
		LDA #1
		STA DOS_Syntax				; temp var
Be2c5		LDA TABS_SET,X				; Get TAB from table
		AND DOS_Syntax				; temp var
		BEQ Be2a3

!if EXTENDED=0 {
		INY
		STY CursorCol
} ELSE {
		JMP Me072
}

Be2d0		CMP #$16 				; <Ctrl V> : Erase to EOL
		BNE Be2e0
		LDA #$20				; <SPACE>
		DEY

Be2d7		INY
		STA (ScrPtr),Y				; Write it to the screen
!if COLOURPET=1 {
		LDA COLOURV				; Current Colour		@@@@@@@@@@@@@@ COLOURPET
		STA (COLOURPTR),Y			; Write it to Colour RAM	@@@@@@@@@@@@@@ COLOURPET
}
		CPY RigMargin				; are we at right margin?
		BCC Be2d7

		BCS Be299
Be2e0		CMP #$15				; <Ctrl U> - DELETE LINE
		BEQ DELETE_LINE
		JMP Scroll_Or_Select_Charset

;************** Delete Line

ESCAPE_D						; Esc-d Delete Line
DELETE_LINE
		LDA TopMargin				; Top Line of Window
		PHA
		LDA CursorRow				; Current Cursor Physical Line Number
		STA TopMargin				; Top Line of Window
		JSR WINDOW_SCROLL_UP			; Scroll window up
		JMP Me5ca

;************** Character Output with High Bit SET

ChrOutHighBitSet
		AND #$7f				; strip off top bit
		CMP #$7f				; special case: code for PI (7F)
		BNE Be2fc
		LDA #$5e 				; replace with screen code 5E
Be2fc		CMP #$20 				; <Shift SPACE>
           	BCC Be303
           	JMP CHARACTER_TO_SCREEN

Be303     	CMP #13 				; <Shift RETURN>
           	BNE Be30a
		JMP ScreenReturn

Be30a		LDX QuoteMode	
		BNE Be342
		CMP #$14 				; <INS>
           	BNE Be33e
           	LDY RigMargin
           	LDA (ScrPtr),Y				; Read it from the screen
           	CMP #$20 				; <SPACE>
		BNE Be38c
		CPY CursorCol
		BCC Be38c
		BEQ Be38c
		LDY RigMargin

!if COLOURPET=0 {
Be322		DEY
		LDA (ScrPtr),Y				; Read it from the Screen
		INY
		STA (ScrPtr),Y				; Write it to the Screen
		DEY
		CPY CursorCol
		BNE Be322
} ELSE {
		JSR ColourPET_Insert
}
		LDA #$20 				; <SPACE>
		STA (ScrPtr),Y				; Write it to the Screen

		LDA RigMargin				; Physical Screen Line Length
		SEC
		SBC CursorCol				; Cursor Column on Current Line
		SBC INSRT				; Flag: Insert Mode, >0 = # INSTs
		BMI Be38c
		INC INSRT				; Flag: Insert Mode, >0 = # INSTs
		BNE Be38c
Be33e		LDX INSRT				; Flag: Insert Mode, >0 = # INSTs
		BEQ Be347
Be342		ORA #$40 				; '@'
		JMP Me17d

Be347		CMP #$11 				; <CURSOR UP>
		BNE Be358
		LDX TopMargin
		CPX CursorRow
		BCS Be38c	
		DEC CursorRow
		JSR UPDATE_CURSOR_ROW
		BNE Be38c

Be358		CMP #$12 				; <RVS OFF>
		BNE Be360
		LDA #0
		STA ReverseFlag

Be360		CMP #$1d 				; <CURSOR LEFT>
		BNE Be373
		LDY LefMargin
		CPY CursorCol
		BCC Be36f 				;@@@@@@@@@@@@@@@ was: BNE $E38C
		JSR CURSOR_TO_END_OF_PREVIOUS_LINE
		BNE Be38c				;@@@@@@@@@@@@@@@ was: BPL Be38c
Be36f		DEC CursorCol
		BPL Be38c				;@@@@@@@@@@@@@@@ was: BNE Be38c

Be373		CMP #$13 				; <CLR>
		BNE Be37c
		JSR WINDOW_CLEAR
		BNE Be38c

Be37c		CMP #9 					; <Shift TAB>
		BNE Be38f
		JSR JUMP_TO_TAB
		LDA TABS_SET,X
		EOR DOS_Syntax
		STA TABS_SET,X
Be38c		JMP IRQ_EPILOG

Be38f		CMP #$16 				; <Shift Ctrl-V>
		BEQ ERASE_TO_SOL
		JMP ProcControl_A

;************** Erase to Start of Line
; TODO: Update for ColourPET

ESCAPE_P						; Esc-p Erase Begin
ERASE_TO_SOL
		LDA #$20 				; <SPACE>
		LDY LefMargin
Be39a		CPY CursorCol
		BCS Be38c
		STA (ScrPtr),Y				; Write it to the screen	@@@@@@@@@@@@@@ COLOURPET?
		INY
		BNE Be39a

;************** Do Cursor DOWN, Go to next line

Cursor_Down
		LSR InputRow
		LDX CursorRow
		CPX BotMargin
		BCC Be3b1
		JSR WINDOW_SCROLL_UP
		JMP UPDATE_CURSOR_ROW
Be3b1		INC CursorRow
		JMP UPDATE_CURSOR_ROW

;************** Do CARRIAGE RETURN

ScreenReturn
		LDY LefMargin
		STY CursorCol
		JSR Cursor_Down

;************** Do ESCAPE
; Cancels Insert, Reverse and Quote modes

ESCAPE_O						; Esc-o (escape) Also: <ESC><ESC>
Escape
		LDA #0
		STA INSRT
		STA ReverseFlag
		STA QuoteMode

!IF ESCCODES = 1 { STA LASTCHAR }

		JMP IRQ_EPILOG

;************** Scroll Window DOWN (Called from Jump Table)

ESCAPE_W						; Esc-w Scroll Down
WINDOW_SCROLL_DOWN
		LDX BotMargin
		INX
Be3cb		DEX
		JSR UPDATE_CURSOR_R2			;@@@@@@@@@@ was: JSR CURSOR_LEFT_MARGIN	; Was: Cursor_BOL
		CPX TopMargin
		BEQ Be3fe

!if EXTENDED=0 {
	!if COLOURPET=0 {
		!IF SS40=0 {
			LDA Line_Addr_Lo-1,X     		; Screen Line address table LO - 1
			STA SAL					; Pointer: Tape Buffer/ Screen Scrolling
			LDA Line_Addr_Hi-1,X 			; Screen Line address table HI - 1
			STA SAL+1
		} ELSE {
			JSR SS40_SyncPointers2
		}
	} ELSE {
		JSR ColourPET_SyncPointers2 		; Synchronize Pointers			@@@@@@@@@@@@@@@ COLOURPET
	}
}

!if EXTENDED=1 {
		DEX
		JSR Set_Screen_SAL			;PATCH to calculate screen pointer
		INX
}

Be3d8		INY
!if COLOURPET=0 {
		LDA (SAL),Y				; Read Character from Screen SOURCE
		STA (ScrPtr),Y				; Write it to Screen DESTINATION
} ELSE {
		JSR ColourPET_Scroll_Dest
}
		CPY RigMargin
		BCC Be3d8
		BCS Be3cb

;************** Scroll Window UP (Called from Jump Table)

ESCAPE_V						; Esc-v Scroll Up
WINDOW_SCROLL_UP
		LDX TopMargin
		DEX
Be3e6		INX
		JSR UPDATE_CURSOR_R2			;@@@@@@@@@@@@@@ was: CURSOR_LEFT_MARGIN			; Was: Cursor_BOL
		CPX BotMargin
		BCS Be3fe

!if EXTENDED=0 {
	!if COLOURPET=0 {
		!IF SS40=0 {	
			LDA Line_Addr_Lo+1,X			; Screen line address table LO + 1
			STA SAL					; Pointer: Tape Buffer/ Screen Scrolling
			LDA Line_Addr_Hi+1,X			; Screen line address table HI + 1
			STA SAL+1				; Pointer: Tape Buffer/ Screen Scrolling
		} ELSE {
			JSR SS40_SyncPointers
		}
	} ELSE {
		JSR ColourPET_SyncPointers		; Synchronize Pointers			@@@@@@@@@@@@@@@ COLOURPET
	}

}
!if EXTENDED=1 {
		INX
		JSR Set_Screen_SAL			;PATCH to calculate screen pointer
		DEX
}

Be3f3		INY
!if COLOURPET=0 {
		LDA (SAL),Y				; Read Character from Screen SOURCE
		STA (ScrPtr),Y				; Write to Screen DESTINATION
} ELSE {
		JSR ColourPET_Scroll_Dest		; Scroll Character and Colour RAM	
}
		CPY RigMargin
		BCC Be3f3
		BCS Be3e6

Be3fe		JSR Erase_To_EOL			; Clear the bottom line

;************** Check Keyboard Scroll Control

!if EXTENDED=0 { !source "scrollpause-b.asm" }
!if EXTENDED=1 { !source "scrollpause-din.asm" }


;************** Correct Jiffy Clock Timer
; Patch for 50 Hz
; TODO: Analyze JIFFY CLOCK differences from older ROMs
; TODO: make selectable

!if EXTENDED=0 {
ADVANCE_TIMER
		JSR UDTIME			; $FFEA / jmp $f768	udtim	Update System Jiffy Clock
		INC JIFFY6DIV5			; Counter to speed TI by 6/5
		LDA JIFFY6DIV5			; Counter to speed TI by 6/5
		CMP #$06			; every 6 IRQ's
		BNE IRQ_NORMAL2			; no, jump back to IRQ routine
		LDA #$00      			; yes, reset counter
		STA JIFFY6DIV5			; Counter to speed TI by 6/5
		BEQ ADVANCE_TIMER		; re-do jiffy clock update
} ELSE {

ADVANCE_TIMER_CORR
		LDA #6
		STA JIFFY6DIV5
ADVANCE_TIMER
		JSR ADVANCE_JIFFY_CLOCK		; In EDITROMEXT file
		DEC JIFFY6DIV5
		BEQ ADVANCE_TIMER_CORR
		RTS
}

;####################################################################################################
		!fill $e442-*,$aa	; 0 bytes ###################################################
;                                       ; @@@@@@@@@@@@ COLOURPET Additions must fit before this!!!!!!
;####################################################################################################


;************** Main IRQ Dispatcher (Called from Jump Table)
; $E442 - FIXED ENTRY POINT!!!!!!!!!!!!
; This entry point must not move! It is called directly from KERNAL

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
		JMP (CBINV)	; Vector: BRK Instr. Interrupt [D478]
Be452		JMP (CINV)	; Vector: Hardware Interrupt   [E455] Points to 'IRQ_NORMAL'

;************** IRQ (Called from Jump Table)
; Normally: $E455

IRQ_NORMAL
		JMP ADVANCE_TIMER 			;@@@@@@@@@@@@@@@ was: JSR ADVANCE_TIMER  ***** FIX? ******

IRQ_NORMAL2						; ie458
		LDA Blink				; Cursor Blink enable: 0 = Flash Cursor
		BNE Be474				; skip it
		DEC BLNCT				; Timer: Countdown to Toggle Cursor
		BNE Be474				; skip it

;		----------------------------------------- BLINK THE CURSOR

		LDA #$14
!if REPEATOPT = 1 {
		BIT RPTFLG
		BPL ie468
		LDA #2					; make cursor blink immediately
}
ie468		STA BLNCT
		LDY CursorCol				; Column where cursor lives
		LSR BlinkPhase				; Is it blinking?
!IF COLOURPET=1 {
		LDX CursorColour			; Get colour
}
		LDA (ScrPtr),Y				; Get character from the screen
		BCS Be470				; Yes, skip

!IF COLOURPET=1 {
		TAX
		LDA (COLOURPTR),Y			; Get Colour at cursor
		STA CursorColour			; Save it
		TXA
}
		INC BlinkPhase				; count
		STA CursorChar				; Remember the character at cursor (to be restored when cursor moves)

Be470		EOR #$80				; Flip the reverse bit
		STA (ScrPtr),Y				; Put it back on the screen

!IF COLOURPET=1 {
		LDA COLOURV				; Get current colour
		STA (COLOURPTR),Y			; Write it
}

;		----------------------------------------- Check IEEE and Cassette status

Be474		LDY #0
		LDA PIA1_Port_A 			; Keyboard ROW select - PIA#1, Register 0
							; Upper bits: IEEE and Cassette
							; Lower bits: Keyboard ROW select

!if EXTENDED=0 {
		AND #$F0				; Mask off lower 4 bits (reset keyboard scan row)
		STA PIA1_Port_A				; Keyboard ROW select - PIA#1, Register 0				CHIP
		LDA PIA1_Port_A				; Keyboard ROW select - PIA#1, Register 0				CHIP
} 
!IF COLOURPET=0 {
		ASL					; Shift upper bits to lower 
		ASL 
		ASL 
		BPL Be487				; Is CASSETTE#1 Sense? No, skip

		STY CAS1				; Yes, Tape Motor Interlock #1
		LDA PIA1_Cont_B
		ORA #8					; Is CASSETTE#2 Sense?
		BNE Be490				; No, skip

Be487		LDA CAS1				; Yes, Tape Motor Interlock #1
		BNE Be493

		LDA PIA1_Cont_B
		AND #$f7				; Mask off bit 4
Be490		STA PIA1_Cont_B
Be493		BCC Be49e

		STY CAS2				; Tape Motor Interlock #2
		LDA VIA_Port_B
		ORA #16
		BNE Be4a7
Be49e		LDA CAS2				; Tape Motor Interlock #2
		BNE Be4aa
		LDA VIA_Port_B
		AND #$ef
Be4a7		STA VIA_Port_B
}

Be4aa		JSR SCAN_KEYBOARD			; Scan the keyboard

!if REBOOT=1 {  JSR CheckReboot }			; Check for soft reset

		JMP IRQ_END				; Return from Interrupt

;###########################################################################################
;!if DEBUG=0 {	!fill $e4be-*,$aa }			;###################################
;###########################################################################################

;************* Keyboard Scanner

!if KEYSCAN=0 { !source "keyscan-g.asm" }
!if KEYSCAN=1 { !source "keyscan-b.asm" }
!if KEYSCAN=2 { !source "keyscan-din.asm" }
!if KEYSCAN=3 { !source "keyscan-c64.asm" }
!if KEYSCAN=4 { !source "keyscan-cbm2.asm" }


;###########################################################################################
!if EXTENDED=1 { !fill $e54e-*,$aa }			;###################################
;###########################################################################################


;************** Select Character Set
!if EXTENDED=1 {

SELECT_CHAR_SET
		CMP #1
		BNE Be557
Be552		JSR CRT_SET_TEXT_NEW
		BMI Be5a7
Be557		CMP #2
		BEQ Be552
		BNE Be59b

;**************

ProcControl_B
		CMP #1
		BNE Be567
		JSR CLEAR_KEYFLAGS_210
		JMP IRQ_EPILOG

Be567		CMP #2 				; <$82> - Switch to old (PET) char set
		BNE ProcControl_C
		JSR CRT_SET_TEXT_OLD
		BMI Be5a7
}

;************** Do TAB

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
Me582		CPY NextTab
		BEQ Be590
		ASL DOS_Syntax
		INC NextTab
		JMP Me582
Be590		RTS

;************** More character code checking

Scroll_Or_Select_Charset
		CMP #$19 			; <Ctrl> Y = $19 = 25 = Scroll window up

!if EXTENDED=1 {
		BNE SELECT_CHAR_SET
} ELSE {
		BNE Be59b
}
		JSR WINDOW_SCROLL_UP 		; Window Scroll Up
		JMP Me5d9


Be59b		CMP #15 			; <CTRL> O = $0F = 15 = Set top left window corner
		BNE Be5aa

ESCAPE_T					; ESC-T = Set Window Top
		LDA CursorRow
		STA TopMargin
		LDA CursorCol
		STA LefMargin
Be5a7		JMP IRQ_EPILOG

Be5aa		CMP #14 			; <CTRL> N = $0E = 14 = Text mode
		BNE Be5b3
		JSR CRT_SET_TEXT
		BMI Be5a7

Be5b3		CMP #7 				; <CTRL> G = $07 = 07 = Ring Bell
		BNE Be5a7
		JSR BEEP
		BEQ Be5a7

;************** Continue checking codes... 

ProcControl_A
		CMP #$15 			; <CTRL> SHIFT-U = Insert Line						
		BNE ProcControl_C		; @@@@@@ Was: BNE ProcControl_B

ESCAPE_I					; ESC-I = Insert Line
		LDA TopMargin
		PHA
		LDA CursorRow
		STA TopMargin
		JSR WINDOW_SCROLL_DOWN		; Scroll Window Down
Me5ca		PLA
		STA TopMargin
		JSR CURSOR_LEFT_MARGIN
		BNE Be5ea

;************** Handle additional Codes > 127

ProcControl_C
		CMP #$19 			; <CTRL> SHIFT-Y = $99 = 153 = Scroll window up
		BNE Be5de
!IF COLOURPET=0 {
		JSR WINDOW_SCROLL_DOWN		; CONFLICT with colour code = LT GREEN
}
Me5d9		JSR UPDATE_CURSOR_ROW
		BNE Be5ea

Be5de		CMP #15 			; <CTRL> SHIFT-O = $8F = 143 = Set Window Bottom
		BNE Be5ed

ESCAPE_B					; ESC-B = Set Window Bottom
		LDA CursorRow
		STA BotMargin
		LDA CursorCol
		STA RigMargin
Be5ea		JMP IRQ_EPILOG

Be5ed		CMP #14 			; <CTRL> SHIFT-N = $8E = 142 = Graphics mode
		BNE Be5b3
		JSR CRT_SET_GRAPHICS
		BMI Be5ea


;################################################################################
		!fill $e600-*,$aa	; 10 bytes ##############################
;################################################################################


;************** End of IRQ (Called from Jump Table)
; $E600 - FIXED ENTRY POINT!!!!!!!
; This entry point must not move! It is called directly from KERNAL
; Do not modify this routine!

IRQ_END		PLA
		TAY
		PLA
		TAX
		PLA
		RTI

;************** Restore Character at Cursor
; This routine is called to put the character back at the cursor position.
; It is called to put the initial character on the screen and as part of the
; cursor blinking routine.

Restore_Char_at_Cursor
		LDY CursorCol			; Cursor Column on Current Line		
		STA (ScrPtr),Y			; Pointer: Current Screen Line Address
!if COLOURPET=1 {
;		LDY CursorCol			; Cursor Column on Current Line
		LDA COLOURV			; Get current Colour
		STA (COLOURPTR),Y		; Set the Colour
}
		LDA #2				; Set blink count so cursor appears immediately
		STA BLNCT			; Timer: Countdown to Toggle Cursor
		RTS

;************** Editor Initialization

INIT_EDITOR
		LDA #$7f
		STA VIA_IER			; VIA, Register E - I/O Timers
		LDX #$6d
		LDA #0
		STA HOMECT			; Clear Home Count

!if REPEATOPT = 1 { STA RPTFLG }		; Clear REPEAT ($80 = Repeat, $40 = disable)

Be61a		STA JIFFY_CLOCK,X		; Clear Real-Time Jiffy Clock (approx) 1/60 Sec
		DEX
		BPL Be61a

!if EXTENDED=1 { STX KEYFLAGS }		; $FF = Clear all flags

;-------------- Set IRQ Vector - Normally $E455 or $E900 for Execudesk

!IF EXECUDESK=0 {
		LDA #<IRQ_NORMAL		; Normal IRQ Vector LO
		STA CINV
		LDA #>IRQ_NORMAL		; Normal IRQ Vector HI
		STA CINV+1
} ELSE {
		LDA #<IRQ_EDESK			; Execudesk IRQ Vector LO
		STA CINV
		LDA #>IRQ_EDESK			; Execudesk IRQ Vector HI
		STA CINV+1
}

;-------------- Init SS40

!if SS40=1 {	JSR SS40_INIT80 }		; Initialize Switchable Soft-40

;-------------- 

		LDA #9
		STA XMAX			; Size of Keyboard Buffer
		LDA #3
		STA DFLTO			; Default Output (CMD) Device (3)
		LDA #15
		STA PIA1_Port_A 		; Keyboard ROW select
		ASL 
		STA VIA_Port_B
		STA VIA_DDR_B
		STX PIA2_Port_B
		STX VIA_Timer_1_Hi
		LDA #$3d
		STA PIA1_Cont_B
		BIT PIA1_Port_B 		; Keyboard COL read
		LDA #$3c
		STA PIA2_Cont_A
		STA PIA2_Cont_B
		STA PIA1_Cont_A
		STX PIA2_Port_B
		LDA #14
		STA BLNCT			; Timer: Countdown to Toggle Cursor
		STA Blink			; Cursor Blink enable: 0 = Flash Cursor
		STA DELAY			; Repeat Delay Counter
		STA KOUNT			; Repeat Speed Counter
		STA VIA_IER
		JSR FULL_SCREEN_WINDOW		; Exit Window - Set screen size (ie: 80x25)

;************** Clear Tab Stops (80 bits)

		LDX #12
		LDA #0
Be66d		STA TABS_SET,X			; Table of 80 bits to set TABs
		DEX
		BPL Be66d

		LDA #<DEFAULT_SCREEN_VECTOR	; LO Address of Screen Input vector (from E006)
		LDX #>DEFAULT_SCREEN_VECTOR	; HI 
		STA SCRIV			; Input from screen vector (from E006)
		STX SCRIV+1			; Input from screen vector (from E006)

		LDA #<ChrOutNormal
		LDX #>ChrOutNormal
		STA SCROV			; Print to screen vector (from E009)
		STX SCROV+1			; Print to screen vector (from E009)

!IF ESCCODES=1 {
		LDA #1
		STA BELLMODE
}
		LDA #16
		STA CHIME

!if WEDGE=1 {	JSR WEDGE_PREP }		; Activate WEDGE

		JSR Double_BEEP			; Power-up chimes
		BEQ Double_BEEP			; More chimes (4 total)


;************** Character Out Margin Beep

ChrOutMarginBeep
		JSR CHROUT_SCREEN		; Output to Screen
		TAX
		LDA RigMargin			; Physical Screen Line Length
		SEC
		SBC CursorCol			; Cursor Column on Current Line
		CMP #5				; 5 characters from end of line
		BNE Be6d0
		TXA
		CMP #$1d 			; <Cursor Right> ?
		BEQ Double_BEEP			; Ring BELL
		AND #$7f
		CMP #$20 			; <SPACE>
		BCC Be6d0

;************** Do BELL

Double_BEEP
		JSR BEEP
BEEP
!if SILENT=0 {
		LDY CHIME			; Chime Time FLAG
} ELSE {
		NOP
		RTS
}

!IF ESCCODES=1 {
		LDA BELLMODE
		BPL BELLENABLED
		RTS
}
BELLENABLED	BEQ Be6d0
		LDA #16
		STA VIA_ACR
		LDA #15
		STA VIA_Shift
		LDX #7
Be6b7		LDA SOUND_TAB-1,X
		STA VIA_Timer_2_Lo
		LDA CHIME			; Chime Time

Be6bf		DEY
		BNE Be6bf			; delay loop
		SEC
		SBC #1
		BNE Be6bf			; delay loop
		DEX
		BNE Be6b7			; delay loop
		STX VIA_Shift
		STX VIA_ACR
Be6d0		RTS

!if EXTENDED=1 {

;************** Set Screen SAL (for EXTENDED ROM)
Set_Screen_SAL
		TXA
		LDX #$c7 			; 199?  #<SAL ?
		BNE Be6dc

;************** Move Cursor to Beginning of Line (for EXTENDED ROM)

Cursor_BOL
		LDY LefMargin
		DEY

;************** Screen Pointer calculation (for EXTENDED ROM)
; This routine replaces the screen address table from previous roms

		!source "extscreenptr.asm"

;************** Modifier Keys (for EXTENDED ROM)

ModifierKeys
		!byte $00,$00,$00,$00,$00,$00,$41,$00
		!byte $01,$00
}

;###################################################################################
!if EXTENDED=1 { !fill $e721-*, $aa }		;###################################
;###################################################################################

;************** Keyboard Decoding Table

!source "keyboard.asm"


;************** SHIFT RUN/STOP string

RUN_String
		!byte $44,$cc,$22,$2a,$0d	; dL"*<CR>
		!byte $52,$55,$4e,$0d		; run<CR>

;************** CRTC Chip Register Setup Tables (2K ROMs)

!source "crtc-tables.asm"

;************** BELL Sound Table

SOUND_TAB	!byte $0e,$1e,$3e,$7e,$3e,$1e,$0e

;************* Screen Line Address Tables

!if COLUMNS=80 {
		!source "screen-80.asm"
		!if COLOURPET > 0 {
			!SOURCE "screen-80c.asm" 		; Colour address table (future hardware)
		}
}

!if COLUMNS=40 {
		!source "screen-40.asm"
		!if COLOURPET > 0 {
			!IF COLOURVER = 0 { !SOURCE "screen-40c!.asm" }		; Colour address table
			!IF COLOURVER = 1 { !SOURCE "screen-40c.asm" }		; Colour address table
		}
}


;##############################################################################
!if EXTENDED=0 {
		!byte $cd		; to match 901474-04 ##################
		!fill $e800-*,$aa	; 78 bytes - Fill to end of 2K ########
} ELSE {
		!source "extextra.asm"	; Unused code        ##################
		!byte $28		; to match 324243-04 ##################
		!fill $e7ff-*,$ff	; Fill to end of 2K  ##################
		!byte $1a		; to match 324243-04 ##################
}
;##############################################################################
