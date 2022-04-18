; PET/CBM EDIT ROM  - Commented and Adapted by Steve J. Gray, Nov 17, 2015 to Dec 27, 2018
; ================    sjgray@rogers.com
;
; ***** THIS IS 80-COLUMN EXTENDED CODEBASE *****
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
; See EDIT.ASM for assemble OPTIONS!
; Use MAKE.BAT to assemble a binary file with the current options.
;
;-----------------------------------------------------------------------------------------------
; BUG!: the 80-column screen editor does not support line-linking. This means that you are
;       limited to entering BASIC lines to the maximum width of one screen line.
;       This ALSO applies when you have defined a window... you will be limited to the width
;       of the window. Take caution when editing BASIC lines inside a window; any line that
;       wraps around to the next line will be TRUNCATED if you edit it inside a window!!!!!

;-----------------------------------------------------------------------------------------------
* = $e000	; Normal start address for EDIT ROM is $E000

;*********************************************************************************************************
;** Edit ROM Jump Table  [E000]
;** Note: Not all KERNAL and BASIC calls go through this table.
;** There are FIVE hard-coded entry points: $E0A7, $E116, $E202, $E442, $E600
;*********************************************************************************************************

EDITOR		JMP RESET_EDITOR	; [E000] Main Initialization (called from Kernal power up reset at $FD16) 
		JMP GETKEY		; [E003] Get Character From Keyboard Buffer	(FIXED ENTRY POINT. Must not move!)
		JMP INPUT_CHARACTER	; [E006] Input From Screen or Keyboard		(FIXED ENTRY POINT. Must not move!)
		JMP CHROUT_SCREEN	; [E009] Output to Screen			(FIXED ENTRY POINT. Must not move!)
		JMP IRQ_MAIN		; [E00C] Main IRQ Handler			(FIXED ENTRY POINT. Must not move!)
		JMP IRQ_NORMAL		; [E00F] Actual IRQ (clock, keyboard scan)
		JMP IRQ_END		; [E012] Return From Interrupt			(FIXED ENTRY POINT. Must not move!)
		JMP WIN_CLEAR		; [E015] Clear Window
		JMP CRT_SET_TEXT	; [E018] Set CRTC to TEXT mode
		JMP CRT_SET_GRAPHICS	; [E01B] Set CRTC to GRAPHICS mode
		JMP CRT_PROGRAM		; [E01E] Program CRTC (Table pointer in A/X, chr set in Y)
		JMP WIN_SCROLL_DN	; [E021] Scroll Window DOWN
		JMP WIN_SCROLL_UP	; [E024] Scroll Window UP
		JMP SCAN_KEYBOARD	; [E027] Scan Keyboard
		JMP BEEP		; [E02A] Ring BELL/CHIME
		JMP SET_REPEAT_MODE	; [E02D] Set REPEAT MODE
		JMP WIN_SET_TOP		; [E030] Set Window Top
		JMP WIN_SET_BOT		; [E033] Set Window Bottom


;*********************************************************************************************************
;** SET_REPEAT_MODE  [E036]  (Called from Jump Table)
;** Sets Repeat mode to 'A'. Flag: $80 = Repeat, $40 = disable
;*********************************************************************************************************

SET_REPEAT_MODE
		!IF REPEATOPT = 1 {
			STA RPTFLG			;$E4
		} else {
			!IF CRUNCH=0 {
				NOP
				NOP
			}
		}
		RTS

;*********************************************************************************************************
;** Filler
;*********************************************************************************************************

!IF CRUNCH=0 {	!FILL $e04b-*,$aa }			; 17 bytes 

;*********************************************************************************************************
;** RESET_EDITOR  [E04B]  (Called from Jump Table)
;** Initializes Editor, then sets the screen to TEXT or GRAPHICS mode.
;*********************************************************************************************************

RESET_EDITOR
		JSR INIT_EDITOR

!IF FONTSET=0	{ JSR CRT_SET_TEXT_NEW }		; Set Screen to TEXT mode
!IF FONTSET=1	{ JSR CRT_SET_GRAPHICS_NEW }		; Set Screen to GRAPHICS mode

;*********************************************************************************************************
;** WINDOOW_CLEAR  [E051]  (Called from Jump Table)
;** This routine Clears the current window. It clears ONLY the screen memory specified.
;** Since this is the 80-column codebase there is no line-linking code. Both LO and HI
;** screen address tables are in ROM.
;*********************************************************************************************************

WIN_CLEAR	LDX TopMargin				; Window Top line
		DEX					; prep for loop
WC_LOOP		INX					; Next line
		JSR Cursor_BOL				; Cursor to beginning of line
		JSR ERASE_TO_EOL			; Erase the line
		CPX BotMargin				; Check if at the last line
		BCC WC_LOOP				; No, go do next line

;*********************************************************************************************************
;** CURSOR_HOME  [E05F]
;** Moves the cursor to the HOME position of the current WINDOW.
;*********************************************************************************************************

CURSOR_HOME	LDX TopMargin				; Go to TOP of window
		STX CursorRow				; put cursor there too

;*********************************************************************************************************
;** CURSOR_LM  [E063]
;** Moves cursor to LEFT MARGIN of the current WINDOW.
;*********************************************************************************************************

CURSOR_LM	LDY LeftMargin				; Get Left margin
		STY CursorCol				; Set cursor there

;*********************************************************************************************************
;** Update Cursor ROW - Get pointer from Screen Line Address Tables (and Colour)
;** TODO: Update for Soft40 (check screen width and set pointer from appropriate table)
;*********************************************************************************************************

UPDATE_CURSOR_ROW
		LDX CursorRow				; [E06C] Current Cursor Physical Line Number
          	JMP Update_ScrPtr			; New Screen pointer calculation routine
           	JMP Cursor_BOL				; HOW DO WE GET TO THIS CODE?

;*********************************************************************************************************
;** Update Screen Pointers
;*********************************************************************************************************

UPDATE_PNT     	JMP Update_ScrPtr			; New Screen pointer calculation routine @@@@@@@@@@ PATCH
Me072		INY
      		STY CursorCol	
		JMP IRQ_EPILOG
		TAX
		TAX

;*********************************************************************************************************
;** CRTC Programming and Screen Modes  [E07A]
;*********************************************************************************************************

!SOURCE "crtc.asm"

;*********************************************************************************************************
;** GETKEY  [E0A7]  (Called from Jump Table)
;** Get a KEY from keyboard buffer. Reads a character from 'KEYD' then shifts remaining buffer characters
;** If there is NO key it will return $FF.
;*********************************************************************************************************
!FILL $e0a7-*,$aa ; FIXED ENTRY POINT! This must not move!
;#########################################################################################################

GETKEY
		LDY KEYD				; Get key at start of buffer
		LDX #0 					; Start at 0
GK_LOOP		LDA KEYD+1,X				; LOOP[ START - Now shift the next keys in line
		STA KEYD,X				;   to the front of the buffer
		INX
		CPX CharsInBuffer			;   Num Chars in Keyboard Buffer
		BNE GK_LOOP				; ] Done? No, loop for another
		DEC CharsInBuffer			; Reduce Num Chars in Keyboard Buffer
		TYA					; Put the character in Accumulator
		CLI
		RTS

;*********************************************************************************************************
;** GETLINE  [E0BC]
;** The PET is usually in this routine, waiting for keypresses and printing them or acting on them.
;** This routine continually loops until a <RETURN> is pressed. When <RETURN> is pressed then the line
;** where the cursor is, is processed. If the <RUN> key is pressed then the string is stuffed into
;** the keyboard buffer (overwriting whatever might be there)
;*********************************************************************************************************

GETLINE		JSR ChrOutMarginBeep			; 
GETLINE2	!IF DEBUG=1 { INC DBLINE+5 }		; DEBUG - 6th chr on bottom line
		LDA CharsInBuffer			; Are there any keys waiting?
		STA Blink 				; 0 chars -> blink cursor
		BEQ GETLINE2 				; loop until char in buffer

!IF DEBUG=1 { INC DBLINE+6 }				; DEBUG - 7th chr on bottom line

;[E0C5]		--------------- Got a character, so process it

		SEI
		LDA BlinkPhase				; Check if cursor in blink phase
		BEQ GL_1				; no, so no need to restore original character
		LDA CursorChar				; yes, get character under Cursor
		LDY #0					; 
		STY BlinkPhase				; Reset blinkphase
		JSR RESTORE_CHR_AT_CRSR			; Restore OLD character under cursor before processing new one
GL_1		JSR GETKEY				; Get Character From Keyboard Buffer
		CMP #$83				; Is it the <RUN> key?
		BNE GL_3				; No, skip ahead

;[E0DA]		---------------- Stuff the <RUN> string to the keyboard buffer

		SEI
		LDX #9					; Length of string
		STX CharsInBuffer			; Set number of characters in buffer
GL_2		LDA RUN_STRING-1,X			; Normally:  dL"*<RETURN>run<RETURN>
		STA KEYD-1,X				; stuff it into the buffer
		DEX
		BNE GL_2				; loop back for more
		BEQ GETLINE2

;[E0EA]		--------------- Check for RETURN key

GL_3		CMP #$0D 				; Check if <RETURN> pressed
		BNE GETLINE				; if not go get more keys


;*********************************************************************************************************
;** PARSE_LINE  [E0EE]
;** When the <RETURN> key is pressed the line where the cursor lives is executed
;*********************************************************************************************************

PARSE_LINE
		!IF DEBUG=1 { INC DBLINE+7 }		; DEBUG - 8th chr on bottom line

		LDY RightMargin				; Physical Screen Line Length
		STY CRSW 				; # 0 -> Screen Input

PL_LOOP		LDA (ScrPtr),Y				; LOOP[  Read Character from Screen RAM
		CMP #$20 				;   Is it <SPACE> Ignore trailing blanks
		BNE PL_SKIP				; 	No, exit out
		DEY					; 	Yes, move to previous position
		BNE PL_LOOP				; ] At start of line? No, loop back for more

;[E0FB]		------------------------ Process line

PL_SKIP 	INY					; last was not <SPACE> so move ahead one
		STY LastInputCol			; record the position
		JSR CURSOR_TO_LM			; Move to the start of the line [80] 
!IF CRUNCH=0 {	NOP }					; (this is a patch)		[80] 
		STY QuoteMode 				; Turn off quote mode
		LDA InputRow				; Cursor Y-X Pos. at Start of INPUT
		BMI Screen_Input
		CMP CursorRow				; Current Cursor Physical Line Number
		BNE Screen_Input
		LDA InputCol
		STA CursorCol				; Cursor Column on Current Line
		CMP LastInputCol			; Pointer: End of Logical Line for INPUT
		BCC Screen_Input
		BCS Screen_Input2

;*********************************************************************************************************
;** INPUT_CHARACTER  [E116]  (Called from Jump Table) - FIXED ENTRY POINT!!!!!
;** Push X and Y to stack then call Input a Character routine via pointer
;*********************************************************************************************************
!FILL $e116-*,$aa ; FIXED ENTRY POINT! This must not move!
;#########################################################################################################

INPUT_CHARACTER TYA
		PHA
		TXA
		PHA
		JMP (SCRIV)				; Jump to Input from Screen routine (Vector normally points to DEFAULT_SCREEN_VECTOR)

;*********************************************************************************************************
;** DEFAULT_SCREEN_VECTOR  [E11D]
;** Input from Screen Routine
;*********************************************************************************************************

DEFAULT_SCREEN_VECTOR
		LDA CRSW				; Flag: INPUT or GET from Keyboard
		BEQ GETLINE2

;*********************************************************************************************************
;** Screen Input [E121]
;*********************************************************************************************************

Screen_Input	JSR Screen_Input_Ext			; PATCH for extended ROM $EB3A
		BVS SI_SKIP3				;  /
		NOP					; /

		AND #$3f 				; '?'
		ASL DATAX				; Current Character to Print
		BIT DATAX
		BPL SI_SKIP1
		ORA #$80
SI_SKIP1	BCC SI_SKIP2
		LDX QuoteMode				; Flag: Editor in Quote Mode, $00 = NO
		BNE SI_SKIP3
SI_SKIP2	BVS SI_SKIP3
		ORA #$40 				; '@'
SI_SKIP3
		NOP					; PATCH for conditional cursor?
		NOP					; /

		JSR INCREASE_COL			; Was: CheckQuote / Was: INCREASE_COL
		CPY LastInputCol			; Pointer: End of Logical Line for INPUT
		BNE SI_SKIP6

;		--------------------------------------- Screen Input 2

Screen_Input2
		LDA #0
		STA CRSW				; Flag: INPUT or GET from Keyboard
		LDA #13
		LDX DFLTN				; Default Input Device (0)
		CPX #3
		BEQ SI_SKIP4
		LDX DFLTO				; Default Output (CMD) Device (3)
		CPX #3
		BEQ SI_SKIP5
SI_SKIP4	JSR CHROUT_SCREEN			; Output to Screen
SI_SKIP5	LDA #13
SI_SKIP6	STA DATAX				; Current Character to Print
		PLA
		TAX
		PLA
		TAY
		LDA DATAX				; Current Character to Print
		CMP #$de				; PI symbol
		BNE SI_DONE
		LDA #$ff				; replace with $FF (PI in alt set)
SI_DONE 	RTS

;		--------------------------------------- Check Quote Mode

CheckQuote
		CMP #$22 				; Is it <QUOTE>?
		BNE CQ_DONE				; No, we're done
		LDA QuoteMode				; Flag: Editor in Quote Mode, $00 = NO
		EOR #1					; toggle the BIT
		STA QuoteMode				; Flag: Editor in Quote Mode, $00 = NO
		LDA #$22 				; reload the <QUOTE>
CQ_DONE		RTS

;*********************************************************************************************************
;** CHAR_TO_SCREEN  [E177]
;** This puts a character in 'A' to screen. The character is handled differently according to the entry
;** point. For example, when QUOTE mode is ON special characters are printed in RVS using CHAR_TO_SCREEN3
;*********************************************************************************************************

CHAR_TO_SCREEN	ORA #$40 				; '@'
CHAR_TO_SCREEN2 LDX ReverseFlag				; Flag: Print Reverse Chars. -1=Yes
		BEQ CTS_SKIP1

CHAR_TO_SCREEN3	ORA #$80

CTS_SKIP1	JSR CHROUT_WITH_DIACRITICS		; PATCH (located in EDITROMEXT.ASM)
		BVS IRQ_EPILOG				;  / Do not print character! Character pending
		NOP					; /

CTS_SKIP2

!IF COLOURPET=0 {
		JSR RESTORE_CHR_AT_CRSR			; Put character on screen
} ELSE {
		JSR Put_ColourChar_at_Cursor		; Put character AND Colour on screen
}
;		--------------------------------------- Handle screen wrap

		INC CursorCol				; Cursor Column on Current Line
		LDY RightMargin				; Physical Screen Line Length
		CPY CursorCol				; Cursor Column on Current Line
		BCS IRQ_EPILOG
		LDX CursorRow				; Current Cursor Physical Line Number
CHAR_TO_SCREEN4	JSR CURSOR_DOWN				; Go to next line
		LDY LeftMargin				; First column of window
		STY CursorCol				; Cursor Column on Current Line

;*********************************************************************************************************
;** IRQ_EPILOG  [E199]
;** IRQ Completion. We jump here when printing is complete.
;*********************************************************************************************************

IRQ_EPILOG	LDA #0
		STA HOMECT				; Home Count
IRQ_EPILOG2 	PLA
		TAY
		LDA INSRT				; Flag: Insert Mode, >0 = # INSTs
		BEQ IRQE_SKIP
		LSR QuoteMode				; Flag: Editor in Quote Mode, $00 = NO
IRQE_SKIP	PLA
		TAX
		PLA
		CLI					; Allow interrupts again
		RTS

;*********************************************************************************************************
;** CURSOR_TO_EOPL  [E1AA]
;** Move Cursor to End of Previous Line
;*********************************************************************************************************

CURSOR_TO_EOPL	LDY RightMargin				; Physical Screen Line Length
		LDX TopMargin
		CPX CursorRow				; Current Cursor Physical Line Number
		BCC CEPL_SKIP
		LDY LeftMargin				; First column of window
		STY CursorCol				; Cursor Column on Current Line
		PLA
		PLA
		BNE IRQ_EPILOG
CEPL_SKIP	DEC CursorRow				; Current Cursor Physical Line Number
		STY CursorCol				; Cursor Column on Current Line
		JMP UPDATE_CURSOR_ROW			; Set Screen Pointers

;*********************************************************************************************************
;** ERASE_TO_ELO  [E1C1] 
;** Erases from cursor to end of line
;** Called from WIN_CLEAR. This routine is relocated/updated for COLOURPET
;*********************************************************************************************************

ERASE_TO_EOL
		LDA #$20 				; <SPACE>
EEOL_LOOP	INY
		STA (ScrPtr),Y				; Pointer: Current Screen Line Address
		CPY RightMargin
		BCC EEOL_LOOP
		RTS

;*********************************************************************************************************
;** CURSOR_TO_LM / ESCAPE_J  [E1CB]
;** Move Cursor to Left Margin
;*********************************************************************************************************

ESCAPE_J						; Esc-j Start-of-Line
CURSOR_TO_LM
		LDY LeftMargin				; First column of window
		STY CursorCol				; Cursor Column on Current Line
		LDY #0
		RTS

;*********************************************************************************************************
;** FULL_SCREEN  [E1D2]
;** Set Full Screen (Exit Window). This routine set the screen to full size.
;** OPTIONS: 'COLUMNS' determines 40 or 80 column screen
;**          'SS40'    when COLUMNS=80 uses col size determined by Soft40 'SCNWIDTH' memory location
;** Note: Changing SCNWIDTH does not change CRTC parameters. Use the ESC-X command!!!
;*********************************************************************************************************

FULL_SCREEN	LDA #0					; Top/Left=0
		TAX
		JSR WIN_SET_TOP			; Set Window Top

!IF ROWS=16 {   LDA #15 }				; 16 lines   (0-15) For special case
!IF ROWS=25 {	LDA #24	}				; 25 lines   (0-24)
!IF ROWS=32 {	LDA #31	}				; 32 lines   (0-31) For 8296 machines ONLY (they have more screen ram)
!IF ROWS=35 {	LDA #34	}				; 35 lines   (0-34) For 8296 machines ONLY (they have more screen ram)

!IF COLUMNS=80 {
	!IF SS40=1 {
		LDX SCNWIDTH				; Current SS40 screen width
	} ELSE {
		LDX #$4f 				; 80 columns (0-79)
	}
}

!IF COLUMNS=40 { LDX #39 }				; 40 columns (0-39)
!IF COLUMNS=32 { LDX #31 }				; 32 columns (0-31)

;*********************************************************************************************************
;** WIN_SET_BOT  [E1DC]
;** Set Bottom Right Corner of Window
;*********************************************************************************************************

WIN_SET_BOT	STA BotMargin				; Last line of window
		STX RightMargin				; Physical Screen Line Length
		RTS

;*********************************************************************************************************
;** WIN_SET_TOP  [E1E1]
;** Set Top Left Corner of Window
;*********************************************************************************************************

WIN_SET_TOP	STA TopMargin				; First line of window
		STX LeftMargin				; First column of window
		RTS

;*********************************************************************************************************
;** CHROUT_SCREEN  [E202]  (Called from Jump Table)
;** $E202 - FIXED ENTRY POINT! Some BASIC/KERNAL bypass the Jump Table and jump directly here
;** Output Character to Screen Dispatch 
;*********************************************************************************************************
!FILL $e202-*,$aa ; FIXED ENTRY POINT! This must not move!
;#########################################################################################################

CHROUT_SCREEN	PHA
		STA DATAX				; Current Character to Print
		TXA
		PHA
		TYA
		PHA
		JMP (SCROV) 				; Via Screen Output Vector (normally 'ChrOutNormal')

;*********************************************************************************************************
;** CHROUT_NORMAL  [E20C]
;** Output Character to Screen. Character to print must be in DATAX.
;** SCROV vector normally points here
;*********************************************************************************************************

CHROUT_NORMAL	LDA #0
		STA CRSW				; Flag: INPUT or GET from Keyboard
		JSR CONDITIONAL_LR_CURSOR		; PATCH for conditional
		BVS IRQ_EPILOG
		NOP

;[PATCH]	--------------------------------------- CHECK HERE FOR ESC CODES

!IF ESCCODES=1 {
		JMP CheckESC				; Check for ESC as last Char, then ESC as current Char. If so, perform it.
ESC_DONE	STA LASTCHAR				; Save the character

} ELSE {
		CMP #$1B				; <ESC>	key? **** Also SHIFT-ESC $9B (Conflicts with COLOUR CODE!)
		BNE CHROUT_CHECK
		JMP ESCAPE				; Cancel RVS/INS/QUOTE modes
}
ESC_DONE2

;		--------------------------------------- Reload character and check high bit 

CHROUT_CHECK	LDA DATAX				; Current Character to Print
		BPL CHROUT_LO				; Handle unshifted characters
		JMP CHROUT_HI				; Handle shifted characters

;*********************************************************************************************************
;** Character Output with High Bit CLEAR  [E224]
;** This section checks characters in the range 0 to 127.
;** UN-SHIFTED character have the HI BIT is CLEAR
;*********************************************************************************************************

;		--------------------------------------- Check for RETURN

CHROUT_LO	CMP #$0D 				; Is it <RETURN>?
		BNE Be22b				; No, skip to next check
		JMP CURSOR_RETURN			; Yes, Handle <RETURN>

;		--------------------------------------- Check for Control Codes Range (0-31)

Be22b		CMP #$20 				; <SPACE>
		BCC Be237 				; -> Control code
		AND #$3f 				; '?'
		JSR CheckQuote				; Check For Quotes
		JMP CHAR_TO_SCREEN2			; -> Print to screen

Be237		LDX INSRT				; Flag: Insert Mode, >0 = # INSTs
		BEQ Be23e
		JMP CHAR_TO_SCREEN3			; -> Print reverse to screen

;		--------------------------------------- Check for DELETE

Be23e		CMP #$14 				; <DEL>
		BNE Be262

;		--------------------------------------- DELETE - Check if it would wrap to previous line

		LDY LeftMargin				; Get left margin
		CPY CursorCol				; Is it cursor at left margin?
		BCC Be24d				; No, skip ahead
		JSR CURSOR_TO_EOPL			; Yes, move to previous line
		BPL Be25c				; Skip ahead if we are at the top line

;[E24D]		--------------------------------------- Perform DELETE

Be24d		DEC CursorCol				; Move cursor one position to the LEFT
		LDY CursorCol				; Get the new cursor position

!IF COLOURPET=0 {
Be251		INY					; LOOP[
		LDA (ScrPtr),Y				;   Read Character from Screen RAM
		DEY					;   move to the left
		STA (ScrPtr),Y				;   Write Character to Screen RAM
		INY					;   Next column
		CPY RightMargin				;   Is it at the Right margin?
		BNE Be251				; ] No, so go back for more
} ELSE {
		JSR ColourPET_Scroll_Left		; Scroll both Screen and Colour LEFT	@@@@@@@@@@@@@@ ColourPET
}

;[E25C]		--------------------------------------- Entry point for "80240.PRG"

Be25c		LDA #$20 				; <SPACE>
		STA (ScrPtr),Y				; put it on the screen!
!IF COLOURPET=1 {
		LDA COLOURV				; Get the current Colour	@@@@@@@@@@@@@@@ ColourPET
		STA (COLOURPTR),Y			; put it to Colour MEM		@@@@@@@@@@@@@@@ ColourPET
}
		BNE Be299

Be262		LDX QuoteMode				; Flag: Editor in Quote Mode, $00 = NO
		BEQ Be269
		JMP CHAR_TO_SCREEN3

;		--------------------------------------- Check for RVS

Be269		CMP #$12 				; Is it <RVS>?
		BNE Be26f				; No, skip ahead
		STA ReverseFlag				; Yes, Set RVS flag

;		--------------------------------------- Check for HOME and HOME-HOME

Be26f		CMP #$13 				; Is it <HOME>?
		BNE Be283				; No, skip ahead
		LDA HOMECT 				; Is Home Count=0 (<HOME><HOME> sets window to full screen)
		BPL Be27b				; Yes, skip ahead
		JSR FULL_SCREEN				; Set to full screen (remove any window)
		CLC
Be27b		ROR HOMECT				; Reset Home Count
		JSR CURSOR_HOME				; Home the cursor
		JMP IRQ_EPILOG2

;		--------------------------------------- Check for CURSOR RIGHT

Be283		CMP #$1d 				; Is it <CURSOR RIGHT>?
		BNE Be292				; No, skip ahead
		INY					; Yes, increment column
		STY CursorCol				; Update Column
		DEY					; Go back
		CPY RightMargin				; Is it at Right Margin?
		BCC Be299				; No, skip ahead
		JMP CHAR_TO_SCREEN4			; Yes

;		--------------------------------------- Check for CURSOR DOWN

Be292		CMP #$11 				; Is it <CURSOR DOWN>?
		BNE Be29c				; No, skip ahead
		JSR CURSOR_DOWN				; Go to next line
Be299		JMP IRQ_EPILOG

;		--------------------------------------- Check for TAB

Be29c		CMP #9 					; Is it <TAB>?
		BNE Be2d0				; No, skip to next check (see [BUG?]

		JSR JUMP_TO_TAB				; Perform <TAB>
Be2a3		LDY NextTab				; LOOP[
		INC NextTab
		CPY RightMargin				;   Physical Screen Line Length
		BCC Be2b6				;   
		LDA RightMargin				;   Physical Screen Line Length
		STA CursorCol				;   Cursor Column on Current Line
		DEC NextTab				;   temp var
		BNE Be299				;   Exit
Be2b6		ASL DOS_Syntax				;   temp var
		BNE Be2c5
		INX
		CPX #10					;   Have we reached end of tab table?
		BEQ Be299				;   Yes, so no tab found. Exit.
		LDA #1
		STA DOS_Syntax				;   temp var
Be2c5		LDA TABS_SET,X				;   Get TAB from table
		AND DOS_Syntax				;   temp var
		BEQ Be2a3				; ]LOOP
		JMP Me072				; This seems to be a fix for EDITROM80 bug here???????

;[E2D0]		--------------------------------------- Check for Erase to End of line

Be2d0		CMP #$16 				; Is it <Ctrl V>? - Erase to EOL? NOTE: 40-col code has BUG here
		BNE Be2e0				; No, skip ahead

;[E2D4]		--------------------------------------- Erase to End of Line

		LDA #$20				; <SPACE>
		DEY

Be2d7		INY
		STA (ScrPtr),Y				; Write it to the screen
!IF COLOURPET=1 {
		PHA
		LDA COLOURV				; Current Colour		@@@@@@@@@@@@@@ COLOURPET
		STA (COLOURPTR),Y			; Write it to Colour RAM	@@@@@@@@@@@@@@ COLOURPET
		PLA}
		CPY RightMargin				; are we at right margin?
		BCC Be2d7
		BCS Be299

;[E2E0]		--------------------------------------- Check for Delete Line

Be2e0		CMP #$15				; Is it <Ctrl U>? - DELETE LINE
		BEQ DELETE_LINE				; Yes, go do it
		JMP Scroll_Or_Select_Charset		; No, skip ahead

;*********************************************************************************************************
;** Delete Line [E2E7]
;*********************************************************************************************************

ESCAPE_D						; Esc-d Delete Line
DELETE_LINE
		LDA TopMargin				; Top Line of Window
		PHA
		LDA CursorRow				; Current Cursor Physical Line Number
		STA TopMargin				; Top Line of Window
		JSR WIN_SCROLL_UP			; Scroll window up
		JMP Me5ca

;*********************************************************************************************************
;** CHROUT_HI  [E2F4]
;** Character Output when High Bit SET (characters in the range 128 to 255).
;** Handles: RETURN,INS,CRSR-UP,
;*********************************************************************************************************

CHROUT_HI	AND #$7f				; strip off top bit
		CMP #$7f				; special case: code for PI (7F)
		BNE COH_SKIP1
		LDA #$5e 				; replace with screen code 5E

COH_SKIP1	CMP #$20 				; Is it a Control Character?
           	BCC COH_SKIP2				; Yes, skip ahead to check
           	JMP CHAR_TO_SCREEN			; No, so just jump to print it as-is

;		--------------------------------------- Check for SHIFT-RETURN

COH_SKIP2     	CMP #13 				; Is it <SHIFT><RETURN>?
           	BNE COH_SKIP3				; No, skip ahead
		JMP CURSOR_RETURN			; Yes, handle it

;		--------------------------------------- Check Quote Mode

COH_SKIP3	LDX QuoteMode				; Is QUOTE MODE on?
		BNE COH_SKIP6				; No, skip ahead

;		--------------------------------------- Check for INSERT

		CMP #$14 				; Is it <INS>? (Shift-DEL)
           	BNE COH_SKIP5				; No, skip ahead

;		--------------------------------------- Check if INSERT is possible

CHECK_INSERT	LDY RightMargin				; Right margin
           	LDA (ScrPtr),Y				; Read the character at the end of the line
           	CMP #$20 				; Is it <SPACE>?
		BNE Be38c				; No, so no room to insert. Skip ahead

COH_SKIP4	CPY CursorCol				; There is a space, but are we at end of line?
		BCC Be38c				; Yes, so cancel insert
		BEQ Be38c				; Yes, so cancel insert

;		---------------------------------------- Do INSERT

DO_INSERT	LDY RightMargin

!IF COLOURPET=0 {
INS_LOOP1	DEY
		LDA (ScrPtr),Y				; Read it from the Screen
		INY
		STA (ScrPtr),Y				; Write it to the Screen
		DEY
		CPY CursorCol
		BNE INS_LOOP1
} ELSE {
		JSR ColourPET_Insert
}
		LDA #$20 				; <SPACE>
		STA (ScrPtr),Y				; Write it to the Screen

		LDA RightMargin				; Physical Screen Line Length
		SEC
		SBC CursorCol				; Cursor Column on Current Line
		SBC INSRT				; Flag: Insert Mode, >0 = # INSTs
		BMI Be38c
		INC INSRT				; Flag: Insert Mode, >0 = # INSTs
		BNE Be38c

;		--------------------------------------- Check for INSERT in QUOTE MODE

COH_SKIP5	LDX INSRT				; Flag: Insert Mode, >0 = # INSTs
		BEQ COH_CHECK1

COH_SKIP6	ORA #$40 				; '@'
		JMP CHAR_TO_SCREEN3

;		--------------------------------------- Check for CURSOR UP

COH_CHECK1	CMP #$11 				; Is it <CRSR-UP>? (SHIFT-CRSR-DOWN)
		BNE Be358				; No, skip ahead

;		--------------------------------------- Do Cursor UP

		LDX TopMargin
		CPX CursorRow
		BCS Be38c	
		DEC CursorRow
		JSR UPDATE_CURSOR_ROW
		BNE Be38c

;		--------------------------------------- Check for RVS

Be358		CMP #$12 				; Is it <OFF>?  (SHIFT-RVS)
		BNE Be360				; No, skip ahead
		LDA #0					; Set RVS OFF
		STA ReverseFlag				; Store it

;		--------------------------------------- Check for CURSOR LEFT

Be360		CMP #$1d 				; Is it <LEFT>? (Shift-Cursor RIGHT)
		BNE Be373				; No, skip ahead
		LDY LeftMargin			
		CPY CursorCol				; Are we at the left margin already?
		BCC Be36f 				; No, skip ahead         	@@@@@@@@@@@@@@@ was: BNE $E38C
		JSR CURSOR_TO_EOPL			; Yes, go to end previous line
		BPL Be38c				;				@@@@@@@@@@@@@@@ was: BPL Be38c
Be36f		DEC CursorCol				; Move one position LEFT
		BPL Be38c				;				@@@@@@@@@@@@@@@ was: BNE Be38c

;		--------------------------------------- Check for CLEAR SCREEN

Be373		CMP #$13 				; Is it <CLR>? (SHIFT-HOME)
		BNE Be37c				; No, skip ahead
		JSR WIN_CLEAR			; Yes, clear the screen/window
		BNE Be38c

;		--------------------------------------- Check for SET TAB

Be37c		CMP #9 					; Is it <SET-TAB>? (SHIFT-TAB)
		BNE Be38f				; No, skip ahead

;		--------------------------------------- Set a TAB STOP HERE

		JSR JUMP_TO_TAB
		LDA TABS_SET,X
		EOR DOS_Syntax
		STA TABS_SET,X
Be38c		JMP IRQ_EPILOG

;		--------------------------------------- Check for ERASE TO START OF LINE

Be38f		CMP #$16 				; Is it <SHIFT>CTRL-V?  (Conflicts with COLOURPET!
!IF COLOURPET=0 {
		BEQ ERASE_TO_SOL			; Remove Conflict			
}
		JMP ProcControl_A

;*********************************************************************************************************
;** ERASE_TO_SOL / ESCAPE_P [E396]
;** Erases from cursor to Start of Line
;*********************************************************************************************************

ESCAPE_P
ERASE_TO_SOL	LDA #$20 				; <SPACE>
		LDY LeftMargin				; Start at Left Margin
ESOL_LOOP	CPY CursorCol				; LOOP[ Have we reached the cursor position?
		BCS Be38c				;   Yes, skip ahead
		STA (ScrPtr),Y				;   No, Write it to the screen
!IF COLOURPET=1 {
		LDA COLOURV				;   Current Colour
		STA (COLOURPTR),Y			;   Write Current Colour to colour RAM
}
		INY					;   Move to next column
		BNE ESOL_LOOP				; ] Loop back for more

;*********************************************************************************************************
;** CURSOR_DOWN [E3A3]
;** Do Cursor DOWN, Go to next line. If at bottom of window SCROLL UP.
;*********************************************************************************************************

CURSOR_DOWN	LSR InputRow
		LDX CursorRow
		CPX BotMargin
		BCC Be3b1
		JSR WIN_SCROLL_UP
		JMP UPDATE_CURSOR_ROW
Be3b1		INC CursorRow
		JMP UPDATE_CURSOR_ROW

;*********************************************************************************************************
;** CURSOR_RETURN [E3B6]
;** Cursor to start of line, then CURSOR DOWN. Also performs ESCAPE
;*********************************************************************************************************

CURSOR_RETURN	LDY LeftMargin
		STY CursorCol
		JSR CURSOR_DOWN

;*********************************************************************************************************
;** ESCAPE / ESCAPE_O [E3BD]
;** Cancels Insert, Reverse and Quote modes
;*********************************************************************************************************

ESCAPE_O
ESCAPE		LDA #0
		STA INSRT
		STA ReverseFlag
		STA QuoteMode

!IF ESCCODES = 1 { STA LASTCHAR }

		JMP IRQ_EPILOG

;*********************************************************************************************************
;** WIN_SCROLL_DN / ESCAPE_W  [E3C8] (Called from Jump Table)
;** Scrolls the current Window DOWN 
;*********************************************************************************************************

ESCAPE_W
WIN_SCROLL_DN	LDX BotMargin
		INX
Be3cb		DEX
		JSR Cursor_BOL				;@@@@@@@@@@ was: JSR CURSOR_LM
		CPX TopMargin
		BEQ Be3fe

		DEX
		JSR Set_Screen_SAL			;PATCH to calculate screen pointer
		INX
Be3d8		INY
		LDA (SAL),Y				; Read Character from Screen SOURCE
		STA (ScrPtr),Y				; Write it to Screen DESTINATION
		CPY RightMargin
		BCC Be3d8
		BCS Be3cb

;*********************************************************************************************************
;** WIN_SCROLL_UP / ESCAPE_V  [E3E8] (Called from Jump Table)
;** Scrolls current Window UP 
;*********************************************************************************************************

ESCAPE_V						; Esc-v Scroll Up
WIN_SCROLL_UP
		LDX TopMargin
		DEX
Be3e6		INX
		JSR Cursor_BOL				;@@@@@@@@@@@@@@ was: CURSOR_LEFT_MARGIN			; Was: Cursor_BOL
		CPX BotMargin
		BCS Be3fe
		INX
		JSR Set_Screen_SAL			;PATCH to calculate screen pointer
		DEX
Be3f3		INY
		LDA (SAL),Y				; Read Character from Screen SOURCE
		STA (ScrPtr),Y				; Write to Screen DESTINATION
		CPY RightMargin
		BCC Be3f3
		BCS Be3e6

Be3fe		JSR ERASE_TO_EOL			; Clear the bottom line

;*********************************************************************************************************
;** Check Keyboard Scroll Control E40B]
;*********************************************************************************************************

!SOURCE "scrollpause-din.asm"

;*********************************************************************************************************
;** Jiffy Clock Timer Correction Patch [E431]
;*********************************************************************************************************

!SOURCE "jiffyfix.asm"

;*********************************************************************************************************
;** MAIN IRQ ENTRY [E442][E455] (Called from Jump Table) - FIXED ENTRY POINT!
;** This entry point must not move! It is called directly from KERNAL
;** The CRTC chip's V-Sync line is fed to a VIA to generate IRQ's. When an IRQ is triggered, the
;** Clock is updated, the keyboard scanned, ieee polled and tape monitored.
;*********************************************************************************************************
!FILL $e442-*,$aa ; FIXED ENTRY POINT! This routine must not move!
;#########################################################################################################

!SOURCE "irq.asm"
!IF DEBUG=0 { !FILL $e4be-*,$aa }			;

;*********************************************************************************************************
;** KEYBOARD SCANNER  [E4BE]
;** The Keyboard is scanned during the IRQ and one keystroke is stored to KEYD. Other routines transfer
;** this keystroke to or from a small 10-byte buffer. The keyboard scanner does the actual interfacing to
;** the hardware to read the rows and columns of the keyboard matrix. When a key is pressed it gets the
;** keycode from the keyboard matrix table. If no key is pressed, then $FF is returned.
;*********************************************************************************************************

!IF KEYSCAN=0 { !SOURCE "keyscan-g.asm" }		; Graphic Keyboard
!IF KEYSCAN=1 { !SOURCE "keyscan-b.asm" }		; Business Keyboard
!IF KEYSCAN=2 { !SOURCE "keyscan-din.asm" }		; German DIN Keyboard
!IF KEYSCAN=3 { !SOURCE "keyscan-c64.asm" }		; C64 Keyboard  (future implementation)
!IF KEYSCAN=4 { !SOURCE "keyscan-cbm2.asm" }		; CBM2 Keyboard (future implementation)

;*********************************************************************************************************
;** Filler
;*********************************************************************************************************

!fill $e54e-*,$aa 					; 68 bytes (can we put anything here?)

;*********************************************************************************************************
;** Select Character Set
;*********************************************************************************************************

!SOURCE "extcset.asm"

;*********************************************************************************************************
;** JUMP_TO_TAB  [E570]
;** Tab positions are stored in a table of 80 bits (10 bytes). This routine
;*********************************************************************************************************

JUMP_TO_TAB	LDA CursorCol				; Get Cursor column on current line
		AND #$f8				; mask off upper 5 bits
		STA NextTab				; This will be the new column to jump to
		LSR					; shift right 3 bits (divide by 8)
		LSR
		LSR
		TAX
		LDA #1					; Set bit 0 to 1
		STA DOS_Syntax				; temp storage
		LDY CursorCol				; Get Cursor column on current line
JTTAB1 		CPY NextTab				; LOOP[ Is 
		BEQ JTTABDONE				;   Yes, exit out
		ASL DOS_Syntax				;   No, Move the "1" bit forward
		INC NextTab				;   Move ahead one column
		JMP JTTAB1				; ] Loop back for more
JTTABDONE	RTS

;		------------- More character code checking

Scroll_Or_Select_Charset
		CMP #$19 			; <Ctrl> Y = $19 = 25 = Scroll window up
		BNE SELECT_CHAR_SET
		JSR WIN_SCROLL_UP 		; Window Scroll Up
		JMP Me5d9

Be59b		CMP #15 			; <CTRL> O = $0F = 15 = Set top left window corner
		BNE Be5aa

;*********************************************************************************************************
;** ESCAPE_T
;** This sets the Window's Top-Left corner to the current cursor position
;*********************************************************************************************************

ESCAPE_T	LDA CursorRow				; Get current cursor ROW
		STA TopMargin				; Store it as the TOP
		LDA CursorCol				; Get current cursor COL
		STA LeftMargin				; Store it as the LEFT
Be5a7		JMP IRQ_EPILOG

;		--------------------------------------- Check for CTRL-N

Be5aa		CMP #14 				; Is it CTRL-N? (Text mode)
		BNE Be5b3				; No, skip ahead
		JSR CRT_SET_TEXT_EXT			; Yes, do it
		BMI Be5a7

;		--------------------------------------- Check for CTRL-G

Be5b3		CMP #7 					; Is it CTRL-G? (Ring Bell)
		BNE Be5a7				; No, skip ahead
		JSR BEEP				; Yes, do BEEP
		BEQ Be5a7

;*********************************************************************************************************
;** ProcControl_A  [E5BC]
;** Continue checking codes.
;*********************************************************************************************************

ProcControl_A
!IF COLOURPET=0 {
		CMP #$15 				; Is it CTRL-SHIFT-U? (Insert Line) - CONFLICT with colour code = DK YELLOW					
		BNE ProcControl_B			; @@@@@@ Was: BNE ProcControl_B
} ELSE {
		JMP ProcControl_B
}

;*********************************************************************************************************
;** ESCAPE_I
;** Insert a blank line at current cursor position
;*********************************************************************************************************

ESCAPE_I	LDA TopMargin
		PHA
		LDA CursorRow
		STA TopMargin
		JSR WIN_SCROLL_DN			; Scroll Window Down
Me5ca		PLA
		STA TopMargin
		JSR CURSOR_LM
		BNE EB_DONE

;[E5D2]		--------------------------------------- Check for CTRL-SHIFT-Y

ProcControl_C	CMP #$19 				; Is it CTRL-SHIFT-Y? (Scroll window up)
		BNE Be5de				; No, skip ahead

!IF COLOURPET=0 {
		JSR WIN_SCROLL_DN			; CONFLICT with colour code = LT GREEN
}
Me5d9		JSR UPDATE_CURSOR_ROW
		BNE EB_DONE

;[E5DE]		--------------------------------------- Check for CTRL-SHIFT-O

Be5de		CMP #15 				; Is it CTRL-SHIFT-O? (Set Window Bottom)
		BNE Be5ed				; No, skip ahead


;*********************************************************************************************************
;** ESCAPE_B
;** Set Windos Bottom-Left
;*********************************************************************************************************

ESCAPE_B					; ESC-B = Set Window Bottom
		LDA CursorRow
		STA BotMargin
		LDA CursorCol
		STA RightMargin
EB_DONE		JMP IRQ_EPILOG

;[E5ED]		--------------------------------------- Check for CTRL-SHIFT-N

Be5ed		CMP #14 				; Is it CTRL-SHIFT-N? (Graphics mode)
		BNE Be5b3				; No, skip ahead
		JSR CRT_SET_GRAPHICS_EXT		; Yes, do it
		BMI EB_DONE


;*********************************************************************************************************
;** IRQ_END  [E600]  (Called from Jump Table) - FIXED ENTRY POINT!
;** The IRQ routine jumps here when completed. Do not modify this routine!
;*********************************************************************************************************
!FILL $e600-*,$aa ;FIXED ENTRY POINT! This routine must not move! It is called directly from KERNAL
;#########################################################################################################

IRQ_END		PLA
		TAY
		PLA
		TAX
		PLA
		RTI

;*********************************************************************************************************
;** RESTORE_CHR_AT_CRSR  [E606]
;** This routine is called to put the character back at the cursor position.
;** It is called to put the initial character on the screen and as part of the cursor blinking routine.
;** NOTE: ColourPET: DOES NOT set/change COLOUR ATTRIBUTE!
;*********************************************************************************************************

RESTORE_CHR_AT_CRSR
		LDY CursorCol				; Cursor Column on Current Line		
		STA (ScrPtr),Y				; Put the character on the screen!!!!!!!!!!!!!!!!!!!!! 
		LDA #2					; Set blink count so cursor appears immediately
		STA BLNCT				; Timer: Countdown to Toggle Cursor
		RTS

;*********************************************************************************************************
;** INIT_EDITOR  [E60F]
;** Initializes the Editor. Clears Clock. Sets IRQ Vector. Sets Keyboard buffer size. Clears TABs.
;** Sets zero-page locations. And finally, chimes the BELL.
;*********************************************************************************************************

INIT_EDITOR	LDA #$7f
		STA VIA_IER			; VIA, Register E - I/O Timers
		LDX #$6d
		LDA #0
		STA HOMECT			; Clear Home Count (80-col)

!IF REPEATOPT = 1 { STA RPTFLG }		; Clear REPEAT ($80 = Repeat, $40 = disable)

INITED1		STA JIFFY_CLOCK,X		; Clear Real-Time Jiffy Clock (approx) 1/60 Sec
		DEX
		BPL INITED1

		STX KEYFLAGS			; $FF = Clear all flags

;		-------------------------------- Set IRQ Vector - Normally $E455 or $E900 for Execudesk

!IF EXECUDESK=1 {
		LDA #<IRQ_EDESK			; Execudesk IRQ Vector LO
		STA CINV
		LDA #>IRQ_EDESK			; Execudesk IRQ Vector HI
		STA CINV+1
} ELSE {
		LDA #<IRQ_NORMAL		; Normal IRQ Vector LO
		STA CINV
		LDA #>IRQ_NORMAL		; Normal IRQ Vector HI
		STA CINV+1
}

;		-------------------------------- Init SS40
!IF SS40=1 {
	!IF SS40MODE=80 {
		JSR SS40_INIT80			; Initialize Switchable Soft-40 to 80 columns
	} ELSE {
		JSR SS40_INIT40			; Initialize Switchable Soft-40 to 40 columns
	}
}
;		-------------------------------

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
		JSR FULL_SCREEN			; Exit Window - Set screen size (ie: 80x25)

;[E669]		--------------------------------------- Clear Tab Stops (80 bits) 

CLEAR_TABS	LDX #12					; 12 bytes (10 bytes plus?)
		LDA #0					; To Clear the table
CT_LOOP		STA TABS_SET,X				; LOOP[  Table of 80 bits to set TABs
		DEX					;   next byte
		BPL CT_LOOP				; ] Loop back for more

;		--------------------------------------- Set Screen Input and Output Vectors

		LDA #<DEFAULT_SCREEN_VECTOR		; LO Address of Screen Input vector (from E006)
		LDX #>DEFAULT_SCREEN_VECTOR		; HI 
		STA SCRIV				; Input from screen vector (from E006)
		STX SCRIV+1				; Input from screen vector (from E006)

		LDA #<CHROUT_NORMAL
		LDX #>CHROUT_NORMAL
		STA SCROV				; Print to screen vector (from E009)
		STX SCROV+1				; Print to screen vector (from E009)

		LDA #$10
		STA CHIME

;		--------------------------------------- Patches for new features here

!IF ESCCODES=1 {
		LDA #1					; Default BELL is ON
		STA BELLMODE				; Set it
}

!IF AUTORUN=1 {	JSR AUTOSTART }				; Do Autostart Prep

;		--------------------------------------- Finish up by ringing BELL 4 times

		JSR BEEP_BEEP				; Power-up chimes
		BEQ BEEP_BEEP				; More chimes (4 total)



;*********************************************************************************************************
;** ChrOutMarginBeep  [E68C]
;** Checks the cursor position and rings the BELL if near the end of the line
;*********************************************************************************************************

ChrOutMarginBeep
		JSR CHROUT_SCREEN		; Output to Screen
		TAX
		LDA RightMargin			; Physical Screen Line Length
		SEC
		SBC CursorCol			; Cursor Column on Current Line
		CMP #5				; 5 characters from end of line
		BNE BELLDONE
		TXA
		CMP #$1d 			; <Cursor Right> ?
		BEQ BEEP_BEEP			; Ring BELL
		AND #$7f
		CMP #$20 			; <SPACE>
		BCC BELLDONE

;;*********************************************************************************************************
;** BEEP / BEEP_BEEP  [E6A7]
;** Rings the BELL
;*********************************************************************************************************

BEEP_BEEP	JSR BEEP				; Double BEEP
BEEP							; Single BEEP

!IF SILENT=0 {
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
BELLENABLED	BEQ BELLDONE
		LDA #16
		STA VIA_ACR
		LDA #15
		STA VIA_Shift
		LDX #7
BELLOOP1	LDA SOUND_TAB-1,X
		STA VIA_Timer_2_Lo
		LDA CHIME			; Chime Time

BELLOOP2	DEY
		BNE BELLOOP2			; delay loop
		SEC
		SBC #1
		BNE BELLOOP2			; delay loop
		DEX
		BNE BELLOOP1			; delay loop
		STX VIA_Shift
		STX VIA_ACR
BELLDONE	RTS


;*********************************************************************************************************
;** Set Screen SAL (for EXTENDED ROM)
;*********************************************************************************************************

Set_Screen_SAL	TXA
		LDX #$c7 			; 199?  #<SAL ?
		BNE Be6dc

;*********************************************************************************************************
;** Move Cursor to Beginning of Line (for EXTENDED ROM)
;*********************************************************************************************************

Cursor_BOL	LDY LeftMargin
		DEY

;*********************************************************************************************************
;** Screen Pointer calculation (for EXTENDED ROM)
;** This routine replaces the screen address table from previous roms
;*********************************************************************************************************

!SOURCE "extscreenptr.asm"

;*********************************************************************************************************
;** Modifier Keys (for EXTENDED ROM)
;*********************************************************************************************************

ModifierKeys	!byte $00,$00,$00,$00,$00,$00,$41,$00
		!byte $01,$00

;*********************************************************************************************************
;** Filler
;*********************************************************************************************************

!fill $e721-*, $aa 					;

;*********************************************************************************************************
;** SHIFT RUN/STOP string  [E721]
;*********************************************************************************************************

RUN_STRING	!byte $44,$cc,$22,$2a,$0d		; dL"*<RETURN>
		!byte $52,$55,$4e,$0d			; run<RETURN>

;*********************************************************************************************************
;** CRTC Chip Register Setup Tables (2K ROMs) [E72A]
;*********************************************************************************************************

!SOURCE "crtc-tables.asm"

;*********************************************************************************************************
;** BELL Sound Table  [E74D]
;*********************************************************************************************************

SOUND_TAB	!byte $0e,$1e,$3e,$7e,$3e,$1e,$0e	; BELL chime values

;*********************************************************************************************************
;** Screen Line Address Tables  [E755][E76E]
;*********************************************************************************************************


		!SOURCE "screen1v.asm"						; Screen RAM address table

!IF COLUMNS=40 {
		!IF COLOURPET > 0 {
			!IF COLOURVER = 0 { !SOURCE "screen-40c!.asm" }		; Colour address table with colour shift compensation
			!IF COLOURVER = 1 { !SOURCE "screen-40c.asm" }		; Colour address table 
		}
}

;*********************************************************************************************************
;** OLD CRTC Configuration Tables for 8296D Euro
;*********************************************************************************************************

!SOURCE "crtc-8296D-80-50hz-old.asm"

;*********************************************************************************************************
;** Small patches here  [E787]
;*********************************************************************************************************

!IF BACKARROW = 1 { !SOURCE "editbarrow.asm" }		; Patch for BackArrow toggling of screen mode

;*********************************************************************************************************
;** Extra Bytes - Unused Code and Version Byte?
;*********************************************************************************************************

!IF CRUNCH=0 {
; 		Apr 15/2019 - Removed this code due to re-org and screen register mixup
;		!SOURCE "extextra.asm"			; Unused code
;		!byte $28				; Version? To match 324243-04
}

;*********************************************************************************************************
;** Filler
;*********************************************************************************************************

		!fill $e7ff-*,$ff			; Fill to end of 2K
		!byte $1a				; to match 324243-04

;*********************************************************************************************************
;END! DO NOT ADD ANYTHING BELOW THIS LINE!!!!!!!!
