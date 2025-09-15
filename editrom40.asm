; PET/CBM Editor ROM Project - CODEBASE 0 (4000-series) Main code
; ==========================   EDITROM40.ASM
;
; This is reverse engineered source code for the EDIT ROMs of the Commodore PET/CBM computers.
; The "901499-01" ROM was used as a base. Addresses inside [brackets] are original code addresses.
; Much of this disassembly comes from the 80-column source code, my own disassembly, and combined
; with Edilbert Kirk's 80-column disassembly.
;
; The EDIT ROM is mapped from $E000 to $EFFF (4K). Many Early versions used only $E000-$E7FF (2K).
; Note that the area from $E800 to $E8FF (256 bytes) is not available due to the I/O chips in this range.

;*********************************************************************************************************
;** EDITOR Jump Table  [E000]
;*********************************************************************************************************
; NOTE: Not all KERNAL and BASIC calls go through this table.
; There are FIVE hard-coded entry points: $E0A7, $E116, $E202, $E442, $E600

EDITOR					; ENTRY  JUMP  - DESCRIPTION
		JMP RESET_EDITOR	; [E000] $E036 - Main Initialization (called from KERNAL power up reset at $FD16)
		JMP GETKEY		; [E003] $E0A7 - Get Character From Keyboard Buffer	(FIXED ENTRY POINT. Must not move!)
		JMP INPUT_CHARACTER	; [E006] $E116 - Input From Screen or Keyboard		(FIXED ENTRY POINT. Must not move!)
		JMP CHROUT_SCREEN	; [E009] $E202 - Output to Screen			(FIXED ENTRY POINT. Must not move!)
		JMP IRQ_MAIN		; [E00C] $E442 - Main IRQ Handler			(FIXED ENTRY POINT. Must not move!)
		JMP IRQ_NORMAL		; [E00F] $E455 - Actual IRQ (clock, keyboard scan)
		JMP IRQ_END		; [E012] $E600 - Return From Interrupt			(FIXED ENTRY POINT. Must not move!)
		JMP WIN_CLEAR		; [E015] $E042 - Clear Window
		JMP CRT_SET_TEXT	; [E018] $E60F - Set CRTC to TEXT mode
		JMP CRT_SET_GRAPHICS	; [E01B] $E617 - Set CRTC to GRAPHICS mode
		JMP CRT_PROGRAM		; [E01E] $E61D - Program CRTC (Table pointer in A/X, chr set in Y)
		JMP WIN_SCROLL_DN	; [E021] $E6EA - Scroll DOWN
		JMP WIN_SCROLL_UP	; [E024] $E3D1 - Scroll UP
		JMP SCAN_KEYBOARD	; [E027] $E4BF - Scan Keyboard
		JMP BEEP		; [E02A] $E657 - Ring BELL/CHIME
		JMP NOTSUPPORTED 	; [E02D] $E098 - Set REPEAT Flag   			(Function Not supported)
		JMP NOTSUPPORTED 	; [E030] $E098 - Set Window Top    			(Function Not supported)
		JMP NOTSUPPORTED 	; [E033] $E098 - Set Window Bottom 			(Function Not supported)


;*********************************************************************************************************
;** RESET_EDITOR  [E036]  - Called from Jump Table
;*********************************************************************************************************
; Initializes Editor, then sets the screen to TEXT or GRAPHICS mode.

RESET_EDITOR
!IF COLOURPET=1 {
		JSR ColourPET_Init			; Initialize ColourPET plus Editor
} ELSE {
		JSR INIT_EDITOR				; Initialize the Editor
}

!IF FONTSET=0	{ JSR CRT_SET_TEXT }			; Set Screen to TEXT mode
!IF FONTSET=1	{ JSR CRT_SET_GRAPHICS }		; Set Screen to GRAPHICS mode

		JSR BEEP_BEEP 				; Ring BELL
		JSR BEEP_BEEP 				; Ring BELL

;*********************************************************************************************************
;** WIN_CLEAR  [E042]  - Called from Jump Table
;*********************************************************************************************************
; This routine clears the screen. Since there is no windowing it clears all of the screen memory. It
; calculates the HI byte of the start of each screen line and stores it into the Screen Line Link table.
; LO bytes are stored in ROM at $E798. These addresses are used for printing to the screen. Entries with
; HI BIT CLEARED are linked to the line above it. This routine will go here, in it's usual spot for fixed
; 40/80 column option. However, if we are using SS40 or COLOURPET then the routine will not
; fit and must be relocated!

!IF SS40 = 0 { !SOURCE "editrom40cls.asm"
		} ELSE { JMP WIN_CLEAR }

;*********************************************************************************************************
;** CURSOR_HOME  [E06B]
;*********************************************************************************************************
; Moves the cursor to the HOME position

CURSOR_HOME
		LDY #0					; ROW=0, COL=0
		STY CursorCol   			; Store to Cursor Column on Current Line
		STY CursorRow   			; Store to Current Cursor Physical Line Number

!IF COLOURPET =1 {
 		JSR ColourPET_SyncPointers
		JMP CURSOR_LM
}

;*********************************************************************************************************
;** CURSOR_LM  [E071]
;*********************************************************************************************************
; Moves Cursor to start of line (Left Margin)
; Sets Screen-line pointer, and determines if line is linked

; Check if code will fit here. If not, it will be relocated to EXTended area.
!IF (SS40+COLOURPET)=0 { !SOURCE "editrom40lm.asm" }	; Include original code here

;-------------- Unsupported Functions Jump Here [E098]

NOTSUPPORTED	RTS

;*********************************************************************************************************
;** GETKEY  [E0A7]  - Called from Jump Table - FIXED ENTRY POINT!
;*********************************************************************************************************
; Get a KEY from keyboard buffer. Reads a character from 'KEYD' then shifts remaining buffer characters
; If there is NO key it will return $FF.
; FIXED ENTRY POINT! This must not move! (~14 bytes filler for std rom)

!IF NOFILL=0 { !FILL $E0a7-*,$AA }			; FIXED ENTRY POINT!
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
;*********************************************************************************************************
; The PET is usually in this routine, waiting for keypresses and printing them or acting on them.
; This routine continually loops until a <RETURN> is pressed. When <RETURN> is pressed then the line
; where the cursor is, is processed. If the <RUN> key is pressed then the string is stuffed into
; the keyboard buffer (overwriting whatever might be there).

GETLINE
		JSR ChrOutMarginBeep			; Check for BELL at near-end of line
GETLINE2
		LDA CharsInBuffer			; Are there any keys waiting?
		STA Blink 				; 0 chars -> blink cursor
		BEQ GETLINE2 				; loop until char in buffer

;		--------------------------------------- Got a character, so process it

		SEI
		LDA BlinkPhase				; Flag: Last Cursor Blink On/Off
		BEQ GL_1				; no, so no need to restore original character
		LDA CursorChar				; Character Under Cursor
		LDY #0
		STY BlinkPhase				; Reset blinkphase
		JSR RESTORE_CHR_AT_CRSR			; Restore OLD character under cursor before processing new one
GL_1		JSR GETKEY				; Get Character From Keyboard Buffer
		CMP #$83				; Is it the <RUN> key?
		BNE GL_3				; No, skip ahead

;		--------------------------------------- Stuff the <RUN> string to the keyboard buffer

		SEI
		LDX #9					; Length of string
		STX CharsInBuffer			; Set number of characters in buffer
GL_2		LDA RUN_STRING-1,X			; LOOP[    Normally:  dL"*<RETURN>run<RETURN>
		STA KEYD-1,X				;   stuff it into the buffer
		DEX					;   next character
		BNE GL_2				; ] Loop back for more
		BEQ GETLINE2

;		--------------- Check for RETURN key

GL_3		CMP #$0D 				; Check if <RETURN> pressed
		BNE GETLINE				; if not go get more keys

;*********************************************************************************************************
;** PARSE_LINE  [E0EE]
;*********************************************************************************************************
; When the <RETURN> key is pressed the line where the cursor lives is executed


		LDY RightMargin   			; Physical Screen Line Length
		STY CRSW   				; Flag: INPUT or GET from Keyboard

PL_LOOP		LDA (ScrPtr),Y				; LOOP[  Pointer: Current Screen Line Address
		CMP #$20				;   Is it <SPACE>?
		BNE PL_SKIP				;   No, found end of line, skip ahead
		DEY					;   Yes, move to previous position
		BNE PL_LOOP				; ] At start of line? No, loop back for more

;		------------------------ Process line

PL_SKIP 	INY					; last checked was not space so move one forward
		STY LastInputCol			; Pointer: End of Logical Line for INPUT
		LDY #0					; COL=0, QUOTEMODE=0		[40]
		STY CursorCol   			; Cursor Column on Current Line	[40]
		STY QuoteMode   			; Flag: Editor in Quote Mode
		LDA InputRow   				; Cursor Y-X Pos. at Start of INPUT
		BMI Screen_Input
		CMP CursorRow   			; Current Cursor Physical Line Number
		BNE Screen_Input
		LDA InputCol
		STA CursorCol   			; Cursor Column on Current Line
		CMP LastInputCol   			; Pointer: End of Logical Line for INPUT
		BCC Screen_Input
		BCS Screen_Input2

;*********************************************************************************************************
;** INPUT_CHARACTER  [E116]  - Called from Jump Table - FIXED ENTRY POINT!
;*********************************************************************************************************
; Push X and Y to stack then call Input a Character routine via pointer
; FIXED ENTRY POINT! This must not move!


!IF NOFILL=0 { !FILL $E116-*,$AA }			; FIXED ENTRY POINT!

;#########################################################################################################

INPUT_CHARACTER
		TYA
		PHA
		TXA
		PHA

; On CODEBASE 1 there is a JMP(SCRIV) here, where SCRIV normally points to DEFAULT_SCREEN_VECTOR

;*********************************************************************************************************
;** DEFAULT_SCREEN_VECTOR  [E11A]
;*********************************************************************************************************
; This checks the Input Flag to see if input is from SCREEN or KEYBOARD
; then jumps to the appropriate code.


DEFAULT_SCREEN_VECTOR
		LDA CRSW   				; Get Input Flag: INPUT or GET from Keyboard
		BEQ GETLINE2				; Is it ZERO? Yes, Loop back up to Input from Keyboard

;*********************************************************************************************************
;** Screen Input  [E11E]
;*********************************************************************************************************

Screen_Input	LDY CursorCol				; Cursor Column on Current Line
		LDA (ScrPtr),Y				; Pointer: Current Screen Line Address
		STA DATAX				; Current Character to Print
		AND #$3F
		ASL DATAX				; Current Character to Print
		BIT DATAX				; Current Character to Print
		BPL SI_SKIP1
		ORA #$80
SI_SKIP1	BCC SI_SKIP2
		LDX QuoteMode				; Flag: Editor in Quote Mode
		BNE SI_SKIP3
SI_SKIP2	BVS SI_SKIP3
		ORA #$40				; '@'
SI_SKIP3	INC CursorCol				; Cursor Column on Current Line
		JSR CheckQuote				; Switch Quote flag
		CPY LastInputCol			; Pointer: End of Logical Line for INPUT
		BNE SI_SKIP6

; [E141]	--------------------------------------- Screen Input 2

Screen_Input2	LDA #$00
		STA CRSW				; Flag: INPUT or GET from Keyboard
		LDA #$0D				; <RETURN>
		LDX DFLTN				; Default Input Device (0)
		CPX #$03				; 3=SCREEN
		BEQ SI_SKIP4
		LDX DFLTO				; Default Output (CMD) Device (3)
		CPX #$03
		BEQ SI_SKIP5
SI_SKIP4	JSR CHROUT_SCREEN			; Output to screen
SI_SKIP5	LDA #$0D				; <RETURN>
SI_SKIP6 	STA DATAX  				; Current Character to Print
		PLA
		TAX
		PLA
		TAY
		LDA DATAX  				; Current Character to Print
		CMP #$DE				; Is it <PI>?
		BNE SI_DONE				; No, skip ahead
		LDA #$FF				; Yes, substitute screen code
SI_DONE		RTS

;[E167]		--------------------------------------- Check Quote Mode

CheckQuote	CMP #$22 				; Is it <QUOTE>?
		BNE CQ_DONE				; No, skip ahead
		LDA QuoteMode				; Flag: Editor in Quote Mode, $00 = NO
		EOR #1					; toggle the BIT
		STA QuoteMode				; Flag: Editor in Quote Mode, $00 = NO
		LDA #$22 				; reload the <QUOTE>
CQ_DONE		RTS

;*********************************************************************************************************
;** CHAR_TO_SCREEN [E174]
;*********************************************************************************************************
; This puts a character in 'A' to screen. The character is handled differently according to the entry
; point. For example, when QUOTE mode is ON special characters are printed in RVS using CHAR_TO_SCREEN3.
; Checks if wrapping to the next line and links lines if required.
; Scrolls screen up if required.

CHAR_TO_SCREEN	ORA #$40 				; '@'
CHAR_TO_SCREEN2 LDX ReverseFlag    			; Flag: Print Reverse Chars. -1=Yes
		BEQ CTS_SKIP1

CHAR_TO_SCREEN3	ORA #$80				; Toggle the upper bit (reverse characters)
CTS_SKIP1	LDX INSRT  				; Flag: Insert Mode, >0 = # INSTs
		BEQ CTS_SKIP2
		DEC INSRT  				; Flag: Insert Mode, >0 = # INSTs
CTS_SKIP2

!IF COLOURPET = 1 {
		JSR ColourPET_PutChar_at_Cursor		; Put character AND Colour on screen
} ELSE {
		JSR RESTORE_CHR_AT_CRSR
}
		INC CursorCol   			; Move to next column
		LDY RightMargin   			; Physical Screen Line Length (Right Margin)
		CPY CursorCol   			; Get Column again. Compare to Right Margin
		BCS IRQ_EPILOG				; Is it past the Margin? Yes, we are done

;               ----------------------------------------

		LDX CursorRow   			; Current Cursor Physical Line Number
		CPY #(COLUMNS*2-1)			; Compare to physical line width! ************ TEST FIX FOR 40/80!
		BNE CTS_SKIP3				; It's not at the end, so skip ahead
		JSR LINKLINES				; If it is then link them!
		JSR CURSOR_DOWN				; Move Cursor to next line
		LDA #$00				; First character on line
		STA CursorCol   			; Cursor Column on Current Line
		BEQ IRQ_EPILOG

CTS_SKIP3	CPX #ROWS-1				; Last screen line?

!IF SS40=0 {	BNE LINKLINES2				; No, continue
} ELSE {	JMP LINKLINES2 }			; No, continue (code has been relocated too far for branching)

		JSR SCROLL_UP				; Yes, Scroll screen and adjust line link

;*********************************************************************************************************
;** IRQ_EPILOG  [E1A6]
;*********************************************************************************************************
; IRQ Completion. We jump here when printing is complete.

IRQ_EPILOG	PLA
		TAY
		LDA INSRT				; Flag: Insert Mode, >0 = # INSTs
		BEQ IRQE_1
		LSR QuoteMode				; Flag: Editor in Quote Mode
IRQE_1		PLA
		TAX
		PLA
		CLI					; Allow interrupts again
		RTS

;*********************************************************************************************************
;** LINKLINES  [E1B3]
;*********************************************************************************************************
; These routines are for 40-column line linking. When a character is printed to column 40 the line and the
; line below are linked into one 80-character logical line.; IE: two physical lines become one logical line.
; X holds the physical line#. Checks ROW to make sure it's not on last line.
; If SS40=0 then we include the code here in it's normal location, otherwise we relocate it to EXT space.

		!IF SS40=0 {!SOURCE "editrom40link.asm" }

;*********************************************************************************************************
;** CURSOR_TO_EOPL  [E1DE]
;*********************************************************************************************************
; Back to previous line when actioning DEL or LEFT

CURSOR_TO_EOPL
!IF SS40=0 {	LDY #COLUMNS-1				; Hard-coded Screen Width-1 (ie: 39)
} ELSE {	LDY SCNWIDTH				; Soft Screen Width
		DEY }					; -1

		LDX CursorRow   			; Get Current Cursor Physical Line Number
		BNE PL_SKIP1				; Is it Zero? No, ok to proceed, so skip ahead
		STX CursorCol   			; Yes, movement is invalid. Cursor Column on Current Line
		PLA					; pull the character from the stack
		PLA					; pull the character from the stack
		BNE IRQ_EPILOG				; jump back up to finish up

;[E1EA]-------- Check if previous line is linked to the one above

PL_SKIP1	LDA LineLinkTable - 1,X			; Get PREVIOUS line's Line Link value
		BMI PL_SKIP2				; Is HI BIT SET? Yes, this is a NON-lined line, so skip ahead
		DEX					; No, it's a linked line so go back one more line
		LDA LineLinkTable - 1,X			; Get PREVIOUS line's Line Link value
		LDY #COLUMNS*2 -1			; Now set cursor to end of linked line

;[E1F3]-------- Update pointers for new cursor position

PL_SKIP2	DEX					; Back to previous line
		STX CursorRow   			; Current Cursor Physical Line Number
		STA ScrPtr + 1				; Store to Current Screen Line Address pointer
		LDA Line_Addr_Lo,X			; Get LO byte from ROM table
		STA ScrPtr    				; Store to Current Screen Line Address pointer
		STY CursorCol   			; Store to Cursor Column on Current Line
		STY RightMargin   			; Store to Physical Screen Line Length
		RTS

;*********************************************************************************************************
;** CHROUT_SCREEN  [E202] - Called from Jump Table - FIXED ENTRY POINT!
;*********************************************************************************************************
; Some BASIC/KERNAL routines bypass the Jump Table and jump directly here.
; Output Character to Screen Dispatch
; FIXED ENTRY POINT! This must not move!

!IF NOFILL=0 { !FILL $E202-*,$AA }			; FIXED ENTRY POINT!
;#########################################################################################################

CHROUT_SCREEN	PHA
		STA DATAX				; Current Character to Print
		TXA
		PHA
		TYA
		PHA
;							80-column machines have JMP(SCROV) here.
;							where SCROV would normally point to 'CHROUT_NORMAL'

;*********************************************************************************************************
;** CHROUT_NORMAL [E209]
;*********************************************************************************************************
; Output Character to Screen. Character to print must be in DATAX.
; On 80 column machines, SCROV vector would point here

CHROUT_NORMAL	LDA #0
		STA CRSW   				; Flag: INPUT or GET from Keyboard
		LDY CursorCol   			; Cursor Column on Current Line
		LDA DATAX  				; Current Character to Print
		AND #$7F				; Mask off top bit (graphics characters)

;[E213]------------------------------------------------ Check for ESC Character
!IF ESCCODES=1 {
		JMP CheckESC				; Check for ESC as last Char, then ESC as current Char. If so, perform it.
ESC_DONE	STA LASTCHAR				; Save the character

} ELSE {
	!IF COLOURPET=0 {				; Remove for COLOURPET
		CMP #$1B				; <ESC>	key? **** Also SHIFT-ESC $9B (Conflicts with COLOUR CODE!)
		BNE CHROUT_CHECK
		JMP ESCAPE				; Cancel RVS/INS/QUOTE modes
	}
}
ESC_DONE2

;[E21A]		--------------------------------------- Reload character and check HIGH BIT

CHROUT_CHECK	LDA DATAX  				; Current Character to Print
!IF COLOURPET=1 {
 		JSR CheckColourCodes			; Check for PETSCII colour codes. Exit if Quote mode on @@@@@@@@@@@@@@@@ COLOURPET
		LDA DATAX				; Reload for check
		}

		BPL CHROUT_LO				; Is top bit CLEAR? Yes, handle UNSHIFTED Character
		JMP CHROUT_HI				; No, Handle SHIFTED Character

;*********************************************************************************************************
;** Character Output with HIGH BIT CLEAR [E224]
;*********************************************************************************************************
; This routine handles characters in the range 0 to 127.
; Checked: RETURN,DELETE,RVS,HOME,CRSR-RIGHT,CRSR-DOWN,ERASE-EOL,TEXT,BELL,TAB

;[E224]         --------------------------------------- Check for RETURN

CHROUT_LO	CMP #$0D				; Is it <RETURN>?
		BNE COU_SKIP1				; No, skip ahead
		JMP CURSOR_RETURN			; Yes, Handle <RETURN>

;[E228]		--------------------------------------- Check for Control Codes Range (0-31)

COU_SKIP1 	CMP #$20				; <SPACE>
		BCC COU_SKIP2				; No, it's 0-31
		AND #$3F				; Yes, Mask off HI BIT
		JSR CheckQuote				; Switch Quote flag if found
		JMP CHAR_TO_SCREEN2

;[E234]		--------------------------------------- Check Insert MODE

COU_SKIP2	LDX INSRT  				; Flag: Insert Mode, >0 = # INSTs
		BEQ COU_SKIP3				; Is FLAG=0? Yes, skip ahead
		JMP CHAR_TO_SCREEN3

;[E23B]		--------------------------------------- Check for DELETE

COU_SKIP3	CMP #$14				; Is it <DEL>?
		BNE COU_SKIP6				; No, skip ahead
		DEY					; Yes, move to the left
		STY CursorCol   			; Cursor Column on Current Line
		BPL COU_SKIP4
		JSR CURSOR_TO_EOPL			; Back to previous line (rename this label?)
		JMP COU_SKIP5

;[E24A]		--------------------------------------- Perform DELETE

COU_SKIP4
!IF COLOURPET = 0 {
		INY
		LDA (ScrPtr),Y				; Pointer: Current Screen Line Address
		DEY
		STA (ScrPtr),Y				; Pointer: Current Screen Line Address
		INY
		CPY RightMargin   			; Physical Screen Line Length
		BNE COU_SKIP4
} ELSE {
		JSR ColourPET_Scroll_Left		; Scroll both Screen and Colour LEFT	@@@@@@@@@@@@@@ ColourPET
}

;[E255]		--------------------------------------- Erase the character at the end
COU_SKIP5
		LDA #$20				; <SPACE>
		STA (ScrPtr),Y				; Put it on the screen!
!IF COLOURPET=1 {
		DEY
		LDA ColourV				; Get the current Colour		@@@@@@@@@@@@@@@ ColourPET
		STA (ColourPtr),Y			; Put it to Colour MEM			@@@@@@@@@@@@@@@ ColourPET
}
		BNE COU_SKIP11

COU_SKIP6	LDX QuoteMode   			; Flag: Editor in Quote Mode
		BEQ COU_SKIP7
		JMP CHAR_TO_SCREEN3

;[E262]		--------------------------------------- Check for RVS

COU_SKIP7	CMP #$12				; Is it <RVS>?
		BNE COU_SKIP8
		STA ReverseFlag    			; Flag: Print Reverse Chars. -1=Yes
		BEQ COU_SKIP11

;[E26A]		--------------------------------------- Check for HOME

COU_SKIP8	CMP #$13				; Is it <HOME>?
		BNE COU_SKIP9				; No, skip ahead
		JSR CURSOR_HOME				; Cursor to start of line

;[E271]		--------------------------------------- Check for CURSOR RIGHT

COU_SKIP9	CMP #$1D				; Is it <CRSR-RIGHT>?
		BNE COU_SKIP12
		INY
		STY CursorCol   			; Cursor Column on Current Line
		DEY
		CPY RightMargin   			; Physical Screen Line Length
		BCC COU_SKIP11
		JSR CURSOR_DOWN				; Move Cursor to next line
		LDY #$00
COU_SKIP10	STY CursorCol   			; Cursor Column on Current Line
COU_SKIP11	JMP IRQ_EPILOG				; Finish Up

;[E287]		--------------------------------------- Check for CURSOR DOWN

COU_SKIP12	CMP #$11				; Is it <CRSR-DOWN>?
		BNE COU_SKIP14				; No, skip ahead
		CLC
		TYA
!IF SS40=0 {	ADC #COLUMNS				; Add Fixed Screen Width for next line
} ELSE {	ADC SCNWIDTH }				; Add Soft Screen Width
		TAY
		CMP RightMargin   			; Compare it to Screen Line Length
		BCC COU_SKIP10				; Less, so it's ok
		BEQ COU_SKIP10				; Equal, also ok
		JSR CURSOR_DOWN				; More, so Move Cursor to next line
COU_FINISH	JMP IRQ_EPILOG				; Finish Up

;[E29C]		--------------------------------------- Check for ERASE TO END OF LINE

COU_SKIP14	!IF BUGFIX=0 { CMP #$10 }		; Is it CTRL-P? (BUG!)
		!IF BUGFIX=1 { CMP #$16 }		; Is it CTRL-V? Erase to Start (BUG is FIXED!)
		BNE COU_SKIP15				; No, skip ahead

;[E2A0]		--------------------------------------- Erase to End of Line

ERASE_TO_EOL

!IF COLOURPET>0 {
		JSR ColourPET_Erase_To_EOL		; Replace with ColourPET Version
		JMP COU_FINISH				; Jump to continue
}

;[E2A0]
!IF COLOURPET=0 {
		LDA #$20				; Yes, set character to <SPACE>
		DEY
ETEL_LOOP 	INY					; LOOP[
		STA (ScrPtr),Y				;   Store <SPACE> to screen
		CPY RightMargin				;   Is it end of line?
		BCC ETEL_LOOP				; ] No, loop back for more
		BCS COU_FINISH				; Yes, Finish up
}
;[E2AC]		--------------------------------------- Check for TEXT MODE

COU_SKIP15	CMP #$0E				; Is it <TEXT>? CTRL-N
		BNE COU_SKIP16				; No, skip ahead
		JSR CRT_SET_TEXT			; Yes, Set screen to TEXT mode
		BMI COU_FINISH				; Finish up

;[E2B5]		--------------------------------------- Check for BELL

COU_SKIP16	CMP #$07				; Is it <BELL>?
		BNE COU_SKIP17				; No, skip ahead
		JSR BEEP
		BEQ COU_FINISH				; Finish up

;		--------------------------------------- Check for TAB

COU_SKIP17	CMP #$09				; Is it <TAB>?
		BNE COU_FINISH				; Finish up

COU_SKIP18	CPY RightMargin   			; Physical Screen Line Length
		BCC COU_SKIP20
		LDY RightMargin   			; Physical Screen Line Length

COU_SKIP19	STY CursorCol   			; Cursor Column on Current Line
		JMP IRQ_EPILOG				; Finish Up

COU_SKIP20	INY
		JSR CHECK_TAB				; Check TAB
		BEQ COU_SKIP18				; Is this a TAB position?
		BNE COU_SKIP19				; No, Loop back

;*********************************************************************************************************
;** CHROUT_HI [E2D5]
;*********************************************************************************************************
; Character Output when High Bit SET (characters in the range 128 to 256).
; Handles: INS,CRSR-UP,RVS-OFF,CRSR-LEFT,CLR,ERASE-SOL,GRAPHICS,BELL,SET-TAB

CHROUT_HI
		AND #$7F				; strip off top bit
		CMP #$7F				; is it $FF?
		BNE COH_SKIP1				; No, skip
		LDA #$5E				; Yes, substitute with $5E (PI character)

COH_SKIP1	CMP #$20				; Is it <SPACE>?
		BCC COH_SKIP2				; Less? Yes, skip ahead and check more
		JMP CHAR_TO_SCREEN			; 32 to 127 -> 160-255. Jump and print it

;[E2E4]		--------------------------------------- Check for SHIFT-RETURN

COH_SKIP2	CMP #$0D				; Is it <SHIFT-RETURN>?
		BNE COH_SKIP3				; No, skip ahead (continue)
		JMP CURSOR_RETURN			; Yes, handle it

;[E2EB]		--------------------------------------- Check Quote Mode

COH_SKIP3	LDX QuoteMode   			; Flag: Editor in Quote Mode
		BNE COH_SKIP6				; No, skip ahead

;[E2EF]		--------------------------------------- Check for INSERT

		CMP #$14				; Is it <INS>? (SHIFT-DEL)
		BNE COH_SKIP5				; No, skip ahead

;[E2F3]		--------------------------------------- INS was pressed

CHECK_INSERT	LDY RightMargin   			; Right margin
		LDA (ScrPtr),Y				; Read the character at the end of the line
		CMP #$20				; Is the character a <SPACE>?
		BNE COH_SKIP4				; No, skip ahead
		CPY CursorCol				; Cursor Column on Current Line
		BNE DO_INSERT

COH_SKIP4	CPY #(COLUMNS*2-1)			; Hard Coded Screen Width*2-1 (79)
		BEQ COU_SKIP11				; Yes, go back up for more
		JSR WIN_SCROLL_DN			; Check for and perform scrolling DOWN

;*********************************************************************************************************
;** Do INSERT  [E306]
;*********************************************************************************************************

DO_INSERT 	LDY RightMargin   			; Start at right margin

!IF COLOURPET=0 {
INS_LOOP1 	DEY					; LOOP[  move back one
		LDA (ScrPtr),Y 				;   Get character from screen
		INY					;   Next character
		STA (ScrPtr),Y				;   Put character back to screen
		DEY					;   Next position
		CPY CursorCol   			;   Have we reached current Cursor position?
		BNE INS_LOOP1				; ] No, loop back for more
} ELSE {
		JSR ColourPET_Insert
}
		LDA #$20				; <SPACE>
		STA (ScrPtr),Y 				; Write <SPACE> to screen at cursor position
		INC INSRT				; Flag: Insert Mode, >0 = # INSTs
		BNE COH_FINISH

COH_SKIP5	LDX INSRT  				; Flag: Insert Mode, >0 = # INSTs
		BEQ COH_CHECK1

COH_SKIP6	ORA #$40				; Set BIT 6
		JMP CHAR_TO_SCREEN3			; Print it

;*********************************************************************************************************
;** Continue checking
;*********************************************************************************************************

;[E324]		--------------------------------------- Check for CURSOR UP

COH_CHECK1	CMP #$11				; Is it <CRSR-UP>? (SHIFT-CRSR-DOWN)
		BNE COH_CHECK2

;*********************************************************************************************************
;** Do CURSOR UP  [E32A]
;*********************************************************************************************************

		LDA CursorCol   			; Cursor Column on Current Line
!IF SS40=0 {	CMP #COLUMNS				; Compare to Fixed Screen Width
} ELSE {	CMP SCNWIDTH }				; Compare to Soft Screen Width
		BCC COH_SKIP7				; Is it less? No, skip ahead
!IF SS40=0 {	SBC #COLUMNS				; Yes, subtract Fixed Screen Width
} ELSE {	SBC SCNWIDTH }				; Yes, subtract Soft Screen Width
		STA CursorCol   			; Cursor Column on Current Line
		BCS COH_FINISH

COH_SKIP7	LDX CursorRow   			; Current Cursor Physical Line Number
		BEQ COH_FINISH
		LDA MYCH,X				; Serial Word Buffer
		BPL COH_SKIP8
		DEC CursorRow   			; Current Cursor Physical Line Number
		JSR CURSOR_LM				; Cursor to start of line
		BCC COH_FINISH

COH_SKIP8	DEX
		DEX
		STX CursorRow   			; Current Cursor Physical Line Number
		JSR CURSOR_LM				; Cursor to start of line
		LDA CursorCol   			; Cursor Column on Current Line
		CLC
		ADC #COLUMNS
		STA CursorCol				; Cursor Column on Current Line
		BNE COH_FINISH

;[E353]		--------------------------------------- Check for RVS OFF

COH_CHECK2	CMP #$12				; Is it <OFF>? (SHIFT-RVS)
		BNE COH_CHECK3				; No, skip ahead
		LDA #0					; Set RVS OFF
		STA ReverseFlag    			; Store it
		BEQ COH_FINISH

;[E35D]		--------------------------------------- Check for CURSOR LEFT

COH_CHECK3	CMP #$1D				; Is it <CRSR-LEFT>? (SHIFT-CRSR-RIGHT)
		BNE COH_CHECK4				; No, skip ahead

		DEY
		STY CursorCol   			; Cursor Column on Current Line
		BPL COH_FINISH
		JSR CURSOR_TO_EOPL
		JMP IRQ_EPILOG				; Finish Up

;[E36C]		--------------------------------------- Check for CLEAR SCREEN

COH_CHECK4	CMP #$13				; Is it <CLR>? (SHIFT-HOME)
		BNE COH_CHECK5				; No, skip ahead
		JSR WIN_CLEAR				; Yes, Clear the Screen
COH_FINISH	JMP IRQ_EPILOG				; Finish Up

;[E376]		--------------------------------------- Check for ERASE TO START OF LINE

COH_CHECK5
!IF COLOURPET=0 {
		CMP #$16				; Is it <ERASE-END>? (SHIFT-CTRL-V) - CONFLICTS with COLOURPET!
		BNE COH_CHECK6				; No, skip ahead
} ELSE {
		JMP COH_CHECK6				; Just Skip ahead		@@@@@@@@@@ COLOURPET
}

;*********************************************************************************************************
;** ERASE_TO_SOL / ESCAPE_P [E37A]
;*********************************************************************************************************
; Erases from cursor to Start of Line

ESCAPE_P						; Label for ESC codes
ERASE_TO_SOL
		LDA #$20				; <SPACE>
		LDY #0					; Start at beginning of line
ESOL_LOOP	CPY CursorCol   			; LOOP[  Cursor Column on Current Line
		BCS COH_FINISH				;   Finish up
		STA (ScrPtr),Y				;   Pointer: Current Screen Line Address

;!IF COLOURPET = 1 {				; Clear Colour (could this be optional?)
;		LDA ColourV				;   Current Colour			@@@@@@@@@@ COLOURPET
;		STA (ColourPtr),Y			;   Write Current COLOUR to colour RAM	@@@@@@@@@@ COLOURPET
;}
		INY					; Go forware to next character position
		BNE ESOL_LOOP				; ] Loop back for more. This should never fail.

;*********************************************************************************************************
;** Continue checking characters with HI bit set
;*********************************************************************************************************

;[E387]		--------------------------------------- Check for SET GRAPHICS MODE

COH_CHECK6	CMP #$0E				; Is it <GRAPHICS>? (SHIFT-TEXT)
		BNE COH_CHECK7				; No, skip ahead
		JSR CRT_SET_GRAPHICS			; Yes, Set screen to graphics mode
		BMI COH_FINISH				; Finish up

;[E390]		--------------------------------------- Check for BELL

COH_CHECK7	CMP #$07				; Is it <BELL>?
		BNE COH_CHECK8				; No, skip ahead
		JSR BEEP_BEEP				; Ring the Bell
		BEQ COH_FINISH				; Finish up

;[E399]		--------------------------------------- Check for SET TAB

COH_CHECK8	CMP #$09				; Is it <SET-TAB>? (SHIFT-TAB)
		BNE COH_FINISH				; No, Finish up
		JSR CHECK_TAB				; Set TAB
		EOR TAB_SET 				; Table of 80 bits to set TABs (80col)
		STA $03F0,X
		JMP IRQ_EPILOG				; Finish Up

;*********************************************************************************************************
;** CURSOR_DOWN  [E3A9]
;*********************************************************************************************************
; Go to next line. If at bottom of window SCROLL UP.

CURSOR_DOWN	SEC
		LSR InputRow   				; Cursor Y-X Pos. at Start of INPUT
		LDX CursorRow   			; Current Cursor Physical Line Number

CD_LOOP1	INX					; LOOP[
		CPX #ROWS				;   Last line of screen?
		BNE CD_SKIP
		JSR WIN_SCROLL_UP			;   Scroll Screen Up

CD_SKIP		LDA LineLinkTable,X			;   Screen Line Link Table / Editor Temps (40 col)
		BPL CD_LOOP1				; ] Is HI bit CLEAR? Yes then go back for more
		STX CursorRow   			; Current Cursor Physical Line Number
		JMP CURSOR_LM				; Cursor to start of line

;*********************************************************************************************************
;** CURSOR_RETURN  [E3BF]
;*********************************************************************************************************
; Cursor to start of line, then CURSOR DOWN. Also performs ESCAPE.

CURSOR_RETURN	JSR CURSOR_DOWN				; Move to next line
		LDA #0					; Column 0
		STA CursorCol   			; Set Cursor Column on Current Line

;*********************************************************************************************************
;** ESCAPE / ESCAPE_O [E3C6]
;*********************************************************************************************************
; Cancels Insert, Reverse and Quote modes

ESCAPE_O
ESCAPE		LDA #0
		STA INSRT  				; Flag: Insert Mode, >0 = # INSTs
		STA ReverseFlag    			; Flag: Print Reverse Chars. -1=Yes
		STA QuoteMode   			; Flag: Editor in Quote Mode

!IF ESCCODES = 1 { STA LASTCHAR }

		JMP IRQ_EPILOG				; Finish Up

;*********************************************************************************************************
;** WIN_SCROLL_UP / ESCAPE_V  [E3D1]  - Called from Jump Table
;*********************************************************************************************************
; Scrolls entire screen UP. Also scroll up line-link table
; IF SS40=0 then we include the routine here in it's normal location, otherwise relocate it to EXT space.

!IF (SS40+COLOURPET)=0 { !SOURCE "editrom40scrollup.asm" }

;*********************************************************************************************************
;** Check Keyboard Scroll Control  [E415]
;*********************************************************************************************************
; Check if KEY is held down.

CHECK_SCROLL_CONTROL
		LDA PIA1_Port_B				; Keyboard COL read
		CMP #$FE				; Is KEY held down?
		BNE CSC_SKIP				; No, skip over delay

;[E41C]		--------------------------------------- Scroll delay
		LDY #$00

SCROLL_DELAY	NOP					; LOOP[
		DEX
		BNE SCROLL_DELAY 			; ] Loop back for more
		DEY
		BNE SCROLL_DELAY 			; ] Loop back for more

		STY CharsInBuffer    			; No. of Chars. in Keyboard Buffer (Queue)

;[E427]		--------------------------------------- Scroll complete

CSC_SKIP	LDX CursorRow   			; Current Cursor Physical Line Number
		RTS

!IF CRUNCH = 0 {
		TAX					; Filler
		TAX					; Filler
		TAX					; Filler
		TAX					; Filler
}

;*********************************************************************************************************
;** Jiffy Clock Timer Correction Patch  [E42E]
;*********************************************************************************************************

ADVANCE_TIMER
		JSR UDTIME				; Update System Jiffy Clock. KERNAL routine $FFEA
		INC JIFFY6DIV5				; Counter to speed TI by 6/5 (40col)
		LDA JIFFY6DIV5				; Counter to speed TI by 6/5 (40col)
		CMP #$06				; 6 IRQ's?
		BNE IRQ_NORMAL2				; No, do normal IRQ
		LDA #0					; Reset IRQ adjustment counter
		STA JIFFY6DIV5 				; Counter to speed TI by 6/5 (40col)
		BEQ ADVANCE_TIMER			; was IRQ_MAIN		; Do normal IRQ


;*********************************************************************************************************
;** MAIN IRQ ENTRY  [E442][E455]  - Called from Jump Table - FIXED ENTRY POINT!
;*********************************************************************************************************
; The CRTC chip's V-Sync line is fed to a VIA to generate IRQ's. When an IRQ is triggered, the
; Clock is updated, the keyboard scanned, IEEE polled, and tape monitored.
; FIXED ENTRY POINT! This must not move! It is called directly from KERNAL

!IF NOFILL=0 { !FILL $E442-*,$AA }			; FIXED ENTRY POINT!
;#########################################################################################################

!SOURCE "irq.asm"

;*********************************************************************************************************
;** KEYBOARD SCANNER  [E4BE]
;*********************************************************************************************************
; The Keyboard is scanned during the IRQ and one keystroke is stored to KEYD. Other routines transfer
; this keystroke to or from a small 10-byte buffer. The keyboard scanner does the actual interfacing to
; the hardware to read the rows and columns of the keyboard matrix. When a key is pressed it gets the
; keycode from the keyboard matrix table. If no key is pressed, then $FF is returned.

!IF KEYSCAN=0 { !SOURCE "keyscan-g.asm" }		; Graphic Keyboard
!IF KEYSCAN=1 { !SOURCE "keyscan-b.asm" }		; Business Keyboard
!IF KEYSCAN=2 { !SOURCE "keyscan-din.asm" }		; German DIN Keyboard
!IF KEYSCAN=3 { !SOURCE "keyscan-c64.asm" }		; C64 Keyboard
!IF KEYSCAN=4 { !SOURCE "keyscan-cbm2.asm" }		; CBM2 Keyboard (future implementation)

;*********************************************************************************************************
;** JUMP_TO_TAB  [E588]
;*********************************************************************************************************
; Tab positions are stored in a table of 80 bits (10 bytes).

CHECK_TAB	TYA
		AND #$07				; Only look at lower 3 bits (values 0 to 7)
		TAX
		LDA POWERSOF2,X				; Get BIT position value
		STA TAB_SET   				; Table of 80 bits to set TABs
		TYA
		LSR
		LSR
		LSR
		TAX
		LDA TABS_SET+2,X			; Get the BITS for that group of tabs (Table of 80 bits to set TABs)
		BIT TABS_SET+1  				; Set FLAG for testing???? (Table of 80 bits to set TABs)
		RTS

;*********************************************************************************************************
;** WIN_CLEAR  [RELOCATED]  - Called from Jump Table
;*********************************************************************************************************
; When the Soft40 option is enabled we must relocate this routine here since it will not fit in it's normal
; location. When finished we must jump back to the end of it's normal position

!IF SS40=1 {
		!SOURCE "editrom40cls.asm"
		JMP CURSOR_HOME				; The WIN_CLR routine flows into the HOME routine
}

;*********************************************************************************************************
;** IRQ_END  [E600]  - Called from Jump Table - FIXED ENTRY POINT!
;*********************************************************************************************************
; The IRQ routine jumps here when completed.
; Do not modify this routine!

!IF NOFILL=0 { !FILL $E600-*,$AA }			; FIXED ENTRY POINT!
;#########################################################################################################

IRQ_END		PLA
		TAY
		PLA
		TAX
		PLA
		RTI

;*********************************************************************************************************
;** RESTORE_CHR_AT_CRSR  [E606]
;*********************************************************************************************************
; This routine is called to put the character back at the cursor position.
; It is called to put the initial character on the screen and as part of the cursor blinking routine.
; NOTE: ColourPET: DOES NOT set/change COLOUR ATTRIBUTE!

RESTORE_CHR_AT_CRSR
		LDY CursorCol  				; Cursor Column on Current Line
		STA (ScrPtr),Y				; Pointer: Current Screen Line Address
		LDA #$02
		STA BLNCT  				; Timer: Countdown to Toggle Cursor
		RTS

;*********************************************************************************************************
;** CRT_SET_TEXT  [E60F]  - Called from Jump Table
;*********************************************************************************************************
; TEXT MODE lower case, upper case and limited graphics. Characters take 10 scanlines (normally).

CRT_SET_TEXT	LDA #<CRT_CONFIG_TEXT			; Point to CRTC Table
		LDX #>CRT_CONFIG_TEXT			; Point to CRTC Table
		LDY #$0E				; Character Set = TEXT
		BNE CRT_PROGRAM

;*********************************************************************************************************
;** CRT_SET_GRAPHICS  [E617]  - Called from Jump Table
;*********************************************************************************************************
; GRAPHICS mode has uppercase and full graphics. Characters take 8 scanlines

CRT_SET_GRAPHICS
		LDA #<CRT_CONFIG_GRAPHICS      		; Point to CRTC Table
		LDX #>CRT_CONFIG_GRAPHICS      		; Point to CRTC Table
		LDY #$0C				; Character Set = GRAPHICS

;*********************************************************************************************************
;** CRT_PROGRAM  [E61D]  - Called from Jump Table
;*********************************************************************************************************
; The CRTC controller controls the parameters for generating the display on the monitor. The CRTC chip
; has several registers that must be set properly according to the type of connected display. These set
; characters on the line, left and right margins, lines on the screen, height of each line and
; positioning of the top of the screen. The parameters are read from a table and written to the CRTC
; controller chip. The VIA chip is used to select which of the two fonts from the CHARACTER ROM is used.
;
; Parameters: Table pointer in A/X, CHRSET in Y
; OPTIONS: 'SS40' uses new routine in upper rom

CRT_PROGRAM	STA SAL					; Pointer LO: Tape Buffer/ Screen Scrolling
		STX SAL+1				; Pointer HI
		LDA VIA_PCR				; Get current register byte VIA Register C - CA2	CHIP
		AND #$F0				; mask out lower nibble
		STA FNLEN				; save it to Temp Variable
		TYA					; Move 'Character Set' byte to A
		ORA FNLEN				; update lower nibble in Temp Variable
		STA VIA_PCR				; write it back to VIA Register C - CA2			CHIP

;*********************************************************************************************************
;** Write to the CRTC controller  [E62E]
;*********************************************************************************************************
; Reads register values from table and writes to CRTC chip.

		LDY #$11				; Number of bytes to copy = 17

CRT_LOOP	LDA (SAL),Y				; LOOP[   Pointer: Tape Buffer/ Screen Scrolling
		STY CRT_Address				;   Select the register to update 6545/6845 CRT		CHIP
		STA CRT_Status				;   Write to the register
		DEY					;   Next character
		BPL CRT_LOOP				; ] Loop for more
		RTS

;*********************************************************************************************************
;** ChrOutMarginBeep  [E63C]
;*********************************************************************************************************
; Checks the cursor position and rings the BELL if near the end of the line (6 characters before)

ChrOutMarginBeep
		JSR CHROUT_SCREEN			; Output character to screen (chr code in A)
		TAX					; Save the character to X
		LDA RightMargin   			; Physical Screen Line Length-1
		SEC
		SBC CursorCol   			; Subtract Cursor Column on Current Line
		CMP #5					; Are we at the 6th last character on the line?
		BNE BELLDONE				; No, exit out SILENT (to RTS)

;[E649]		--------------------------------------- Check for Cursor RIGHT

		TXA					; Yes, reload the character to print
		CMP #$1D				; Is it <CRSR-RIGHT>?
		BEQ BEEP_BEEP				; Yes, do Double BELL
		AND #$7F				; Mask off HI BIT
		CMP #$20				; Is it a control code?
		BCC BELLDONE				; Yes, exit out (to RTS)

;*********************************************************************************************************
;** BEEP / BEEP_BEEP [E654]/[E657]
;*********************************************************************************************************
; Rings the BELL

BEEP_BEEP	JSR BEEP				; Double BELL
BEEP							; Single BELL

!IF SILENT=0 {
		LDY CHIME				; Chime Time FLAG
} ELSE {
		!IF CRUNCH=0 { NOP }			; To keep code aligned
		RTS
}

BELLENABLED	BEQ BELLDONE
		LDA #16
		STA VIA_ACR
		LDA #15
		STA VIA_Shift
		LDX #7					; Size of BELL table
BELLOOP1	LDA SOUND_TAB-1,X			; LOOP[
		STA VIA_Timer_2_Lo
		LDA CHIME				; Chime Time

BELLOOP2	DEY					; LOOP[[
		BNE BELLOOP2				; ]] Delay loop
		SEC
		SBC #1
		BNE BELLOOP2				; ]] Delay loop
		DEX
		BNE BELLOOP1				; ] Delay loop
		STX VIA_Shift
		STX VIA_ACR
BELLDONE	RTS

;*********************************************************************************************************
;** INIT_EDITOR  [E683]
;*********************************************************************************************************
; Initializes the Editor. Clears Clock. Sets IRQ Vector. Sets Keyboard buffer size. Clears TABs.
; Sets zero-page locations. And finally, chimes the BELL.

INIT_EDITOR	LDA #$7f
		STA VIA_IER				; VIA, Register E - I/O Timers
		LDX #$6d
		LDA #0
INITED1		STA JIFFY_CLOCK,X			; Clear Real-Time Jiffy Clock (approx) 1/60 Sec
		DEX
		BPL INITED1
		LDX #$0A				; 10 bytes to set
INITED2		STA TAB_SET+1,X				; LOOP[   TAB table $03F0
		DEX					;   Next position
		BPL INITED2				; ] Loop back for more
		STA RPTFLG				; Repeat Flag

;		--------------------------------------- Set IRQ Vector - Normally $E455 or $E900 for Execudesk

!IF EXECUDESK=1 {
		LDA #<IRQ_EDESK				; Execudesk IRQ Vector LO
		STA CINV
		LDA #>IRQ_EDESK				; Execudesk IRQ Vector HI
		STA CINV+1
} ELSE {
		LDA #<IRQ_NORMAL			; Normal IRQ Vector LO
		STA CINV
		LDA #>IRQ_NORMAL			; Normal IRQ Vector HI
		STA CINV+1
}

;		--------------------------------------- Init SS40

!IF SS40=1 {
		LDA #HARD4080				; 40/80 Switcher board setting
		STA SCN4080BOARD			; Set it
		!IF SS40MODE=40 { JSR SS40_INIT40 }	; Initialize Switchable Soft-40 to 40 columns
		!IF SS40MODE=80 { JSR SS40_INIT80 }	; Initialize Switchable Soft-40 to 80 columns
}
;		--------------------------------------- Continue

		LDA #$03				; 3=Screen
		STA DFLTO  				; Set Default Output (CMD) to Screen

		LDA #$0F
		STA PIA1_Port_A 			; Keyboard ROW select [E810]
		ASL
		STA VIA_Port_B				; VIA Register 0 (flags) [E840]
		STA VIA_DDR_B				;
		STX PIA2_Port_B				;
		STX VIA_Timer_1_Hi			;

		LDA #$3D
		STA PIA1_Cont_B				; PIA#1 Register 13 (Retrace flag and interrupt) [E813]
		BIT PIA1_Port_B 			; Keyboard COL read

		LDA #$3C
		STA PIA2_Cont_A
		STA PIA2_Cont_B
		STA PIA1_Cont_A
		STX PIA2_Port_B

		LDA #$0C
		STA VIA_PCR 				; VIA Register C (cb2) [E84C]
		STA BLNCT  				; Timer: Countdown to Toggle Cursor
		STA Blink  				; Cursor Blink enable: 0 = Flash Cursor

		LDA #$09
		STA XMAX  				; Max keyboard buffer size (40 col)

		LDA #$10
		STA CHIME 				; Chime Time 0=off (40col)
		STA DELAY				; Repeat key countdown (40col)
		STA KOUNT 				; Delay between repeats (40col)

;		--------------------------------------- Patches for new features here

!IF ESCCODES=1 {
		LDA #1					; 1=Enabled
		STA BELLMODE				; Flag to Enable BELL
}

!IF AUTORUN=1 {	JSR AUTOSTART }				; Do Autostart Prep

		RTS

;*********************************************************************************************************
;** Check Scroll action for new linked line [E6EA]
;*********************************************************************************************************
; Check what action to do when linking lines. When the cursor is:
; 1) On the last line 		- Scroll all lines UP
; 2) On the second last line 	- Clear the bottom line
; 3) Otherwise			- Scroll lower lines DOWN.

ESCAPE_W						; This label for ESC codes if needed.
WIN_SCROLL_DN
		LDX CursorRow  				; Get Current Cursor Physical Line Number
		INX					; Next line
		CPX #(ROWS-1)				; Will it be the last line on the screen (24)?
		BEQ CLEAR_SCREEN_LINE 			; Yes, Clear a screen line and move cursor to start of line
		BCC SCROLL_DOWN				; No it's less, jump to Scroll screen lines DOWN
		JMP SCROLL_UP				; No it's more, jump to Scroll screen up

;*********************************************************************************************************
;** SCROLL_DOWN  [E6F6]
;*********************************************************************************************************
; Scrolls the screen DOWN from the current ROW in order to make a blank line.
; Used when you insert characters on a single line and the characters after the cursor need to be pushed to
; the next line. Adjusts ALL Line Links.

SCROLL_DOWN	LDX #ROWS-2				; Start at bottom of the screen (ROW 24 minus 1)
SD_LOOP1 	LDA LineLinkTable+1,X			; LOOP[  Get NEXT line's HI byte from Line Link table
		ORA #$80				;   Make sure HI bit is set
		STA SAL+1				;   Store it to destination screen pointer
		LDY LineLinkTable,X			;   Get CURRENT line's HI byte from Line Link Table
		BMI SD_SKIP				;   Is HI bit SET? Yes, skip ahead
		AND #$7F				;   No, CLEAR HI bit
SD_SKIP		STA LineLinkTable+1,X			;   Store it back to Line link table
		TYA
		ORA #$80				;   SET HI bit
		STA ScrPtr + 1				;   Store to screen line SOURCE pointer

!IF SS40=0 {	LDY #COLUMNS - 1				;   Hard-coded Screen Width-1 (ie: 39)
  } ELSE   {    LDY SCNWIDTH				;   Soft Screen Width
		DEY }					;   -1

		LDA Line_Addr_Lo + 1,X			;   Get screen's LO byte from Screen line address table
		STA SAL    				;   Store it to DESTINATION screen pointer
		LDA Line_Addr_Lo,X			;   Get Previous lines LO byte from Screen line address table
		STA ScrPtr    				;   Store it to the SOURCE pointer

;[E717]		--------------------------------------- Copy the line
;***** Need to fix for colourpet!!!!!!!!!!!!!!!!!!!!

SD_LOOP2	LDA (ScrPtr),Y 				;   LOOP[[  Read character from screen
		STA (SAL),Y				;     Write to new destination
		DEY					;     Next character
		BPL SD_LOOP2				;   ]] Loop back for more
		DEX					;   Next line (above)
		CPX CursorRow   			;   Current Cursor Physical Line Number
		BNE SD_LOOP1				; ] Loop back for more
		INX

;*********************************************************************************************************
;** CLEAR_SCREEN_LINE  [E724]
;*********************************************************************************************************
; Clears one line of the screen. X holds line#. Adjusts Line Link entry for specified line.
;***** Need to fix for colourpet!!!!!!!!!!!!!!!!!!!!

CLEAR_SCREEN_LINE
		LDA LineLinkTable,X			; Get current line's Line Link entry
		ORA #$80				; Make sure HI BIT is set
		STA ScrPtr + 1				; Store it to the screen pointer
		AND #$7F				; Clear the HI BIT again
		STA LineLinkTable,X			; Store it to the Line Link Table
		LDA Line_Addr_Lo,X			; Get screen line's address LO byte from ROM table
		STA ScrPtr    				; Store it to screen pointer LO

!IF SS40=0 {	LDY #COLUMNS - 1			; Hard-coded Screen Width-1
   } ELSE {	LDY SCNWIDTH				; Soft Screen Width
		DEY }					; -1

;-------------- Clear Colour line
; This is added before the screen ram routine so we can save and restore .Y

!IF COLOURPET = 1 {
		TYA					; Save .Y
		PHA
		LDA ColourV				; Current Colour
CCSL_LOOP	STA (ColourPtr),Y			; LOOP[    Write SPACE to screen
		DEY					;   Next position
		BPL CCSL_LOOP				; ] Loop back for more
		PLA
		TAY					; Restore .Y
}

;-------------- Clear screen line

		LDA #$20				; <SPACE>
CSL_LOOP	STA (ScrPtr),Y				; LOOP[    Write SPACE to screen
		DEY					;   Next position
		BPL CSL_LOOP				; ] Loop back for more

		JMP CURSOR_LM				; Cursor to start of line

;*********************************************************************************************************
;** Keyboard Decoding Table  [E???]
;*********************************************************************************************************

!SOURCE "keyboard.asm"					; This brings in the proper table.

;*********************************************************************************************************
;** SHIFT RUN/STOP string  [E721]
;*********************************************************************************************************

RUN_STRING	!byte $44,$cc,$22,$2a,$0d		; dL"*<RETURN>
		!byte $52,$55,$4e,$0d			; run<RETURN>

;*********************************************************************************************************
;** Screen Line Address Table [E798]
;*********************************************************************************************************
; This codebase has line linking so there is only one screen line table for the LO bytes.
; High bytes are calculated and put in the Line-link table

!SOURCE "screen0v.asm"


;*********************************************************************************************************
;** CRTC Chip Register Setup Tables (2K ROMs) [E7B1]
;*********************************************************************************************************

!SOURCE "crtc-tables.asm"

;*********************************************************************************************************
;** BELL Sound Table  [E7D5]
;*********************************************************************************************************

SOUND_TAB	!byte $0e,$1e,$3e,$7e,$3e,$1e,$0e	; BELL chime values

;*********************************************************************************************************
;*** POWERS OF 2 TABLE  [E7DC]
;*********************************************************************************************************
; This table is used by the TAB routine.

POWERSOF2       !byte $80,$40,$20,$10,$08,$04,$02,$01	; BIT table

;*********************************************************************************************************
;** VERSION BYTE [E7E6]
;*********************************************************************************************************

!IF HERTZ=50 {	!byte $29 }				; 901498-01 [edit-4-40-n-50]
!IF HERTZ=60 {	!byte $BB }				; 901499-01 [edit-4-40-n-60]

;*********************************************************************************************************
;** SMALL PATCHES HERE [E7E7]
;*********************************************************************************************************
; Small patches can go here when [SETTING]=1. Some patches can be put in upper area when [SETTING]=2.

!IF BACKARROW=1 { !SOURCE "editbarrow.asm" }		; Patch for Back Arrow

;*********************************************************************************************************
;** FILLER
;*********************************************************************************************************

!IF NOFILL=0 { !FILL $E800-*,$AA }			; Fill to end of 2K

;#########################################################################################################
;END! DO NOT ADD ANYTHING BELOW THIS LINE!!!!!!!!
