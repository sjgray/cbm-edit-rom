; PET/CBM EDIT ROM  - Commented and Adapted by Steve J. Gray, Nov 17, 2015
; ================    sjgray@rogers.com
; 
; ***** THIS IS 40-COLUMN CODEBASE *****
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
* = $e000	; Normal start address for EDIT ROM is $E000
;-----------------------------------------------------------------------------------------------


;************* Edit ROM Jump Table [$E000]
;
; NOTE: Not all KERNAL and BASIC calls go through this table.
;       There are FIVE hard-coded entry points: $E0A7, $E116, $E202, $E442, $E600

EDITOR
		JMP  RESET_EDITOR 	; Main Initialization (called from Kernal power up reset $FD16) 
		JMP  GETKEY 		; Get Character From Keyboard Buffer
		JMP  INPUT_CHARACTER 	; Input From Screen or Keyboard
		JMP  CHROUT_SCREEN 	; Output to Screen
		JMP  IRQ_MAIN 		; Main IRQ Handler (this is hardcoded in kernal $FFFE!)
		JMP  IRQ_NORMAL 	; Actual IRQ (clock, keyboard scan)
		JMP  IRQ_END 		; Return From Interrupt
		JMP  WINDOW_CLEAR 	; Clear Screen
		JMP  CRT_SET_TEXT 	; Initialize CRTC to TEXT mode
		JMP  CRT_SET_GRAPHICS 	; Initialize CRTC to GRAPHICS mode
		JMP  CRT_PROGRAM 	; Initialize CRTC (table ptr in A/X, chr set in Y)
		JMP  WINDOW_SCROLL_DOWN ; Scroll Down
		JMP  WINDOW_SCROLL_UP 	; Scroll Screen Up
		JMP  SCAN_KEYBOARD 	; Scan Keyboard
		JMP  BEEP 		; Ring BELL
		JMP  NOTSUPPORTED 	; Set REPEAT Flag   (Function Not supported)
		JMP  NOTSUPPORTED 	; Set Window Top    (Function Not supported)
		JMP  NOTSUPPORTED 	; Set Window Bottom (Function Not supported)

;************** Reset Editor (Called from Jump Table) [$E036]

RESET_EDITOR
		JSR INIT_EDITOR		; Initialize EDITOR

!IF BOOTCASE=0 { JSR CRT_SET_TEXT }	; Set Screen to TEXT mode
!IF BOOTCASE=1 { JSR CRT_SET_GRAPHICS }	; Set Screen to GRAPHICS mode

		JSR DOUBLE_BEEP 	; Ring BELL
		JSR DOUBLE_BEEP 	; Ring BELL

;************** Clear Window (Called from Jump Table) [$E042]
;
; This routine clears the screen. Since there is no windowing it clears EVERY byte
; in the screen memory, including non-visible bytes. It also calculates the HI byte
; of the start of each screen line and stores it into the Screen Line Link table.
; LO bytes are stored in ROM at $E798. These addresses are used for printing to the screen.
; Entries with HI BIT CLEARED are linked to the line immediately above it.

WINDOW_CLEAR
		LDX #$18		; 24 lines
		LDA #$C0		; $83C0 = Address of first character on last line of screen?
		LDY #$83		;

WCLOOP
		STY LineLinkTable,X	; LOOP[      Save HI byte of screen address to table
		SEC			;
		SBC #$28		;   Subtract 40 characters (one physical line)
		BCS WCSKIP1		;   did we move past page? No, skip ahead
		DEY			;   Yes, next page
WCSKIP1
		DEX			;   Previous line
		BPL WCLOOP		; ] Loop up for more

		STY ScrPtr+1		; Store in screen pointer HI
		INX			; X=0
		STX ReverseFlag    	; Clear RVS Flag
		STX ScrPtr    		; Store 0 to screen Pointer LO (pointer should point to $8000 - HOME position)

;		----------------------- Clear all Screen Memory [$E05A]

		LDA #$20		; <SPACE>
CLS_LOOP				; LOOP[
		STA SCREEN_RAM,X	;   Screen RAM page 1
		STA SCREEN_RAM+$100,X	;   Screen RAM page 2
		STA SCREEN_RAM+$200,X	;   Screen RAM page 3
		STA SCREEN_RAM+$300,X	;   Screen RAM page 4
		INX			;   Next position
		BNE CLS_LOOP		; ] Loop back for more

;************** Home the Cursor [$E06B]
; Moves the cursor to the HOME position of the current WINDOW.

CURSOR_HOME
		LDY #$00		; ROW=0, COL=0
		STY CursorCol   	; Store to Cursor Column on Current Line
		STY CursorRow   	; Store to Current Cursor Physical Line Number

;************** Cursor to start of line [$E071]

CURSOR_LEFT_MARGIN
		LDX CursorRow   	; Get Current Cursor Physical Line Number
		LDA LineLinkTable,X	; Get Current Line's Screen Line Link entry
		ORA #$80		; Make sure HIGH bit is set
		STA ScrPtr+1		; Store in Current Screen Line Address HI
		LDA Line_Addr_Lo,X	; Get the LO byte from table in ROM
		STA ScrPtr    		; Store to Current Screen Line Address LO
		LDA #$27       		; 40 characters/line minus 1 = 39
		STA RigMargin   		; Set Physical Screen Line Length = 40
		CPX #$18		; Line 24? (0-24) last line cannot be linked
		BEQ CLM_SKIP1		; Yes, skip ahead
		LDA LineLinkTable+1,X 	; Check next line in screen line link table
		BMI CLM_SKIP1  		; Is HIGH bit set? (negative value) Yes, so NO linked line
		LDA #$4F		; No, then line is linked. 79 = two screen lines
		STA RigMargin   		; Store in Physical Screen Line Length
CLM_SKIP1 	
		LDA CursorCol   	; Cursor Column on Current Line
		CMP #$28		; Is it greater than 40?
		BCC NOTSUPPORTED	; No, skip
		SBC #$28		; Yes, subtract 40
		STA CursorCol   	; Cursor Column on Current Line

;-------------- Unsupported Functions Jump Here [$E098]
NOTSUPPORTED
		RTS

;################################################################################################
		!fill $e0a7-*,$aa	;########################################################
;################################################################################################

;************** Get a KEY from keyboard buffer (Called from Jump Table) [$E0A7]
;FIXED ENTRY POINT!!!! This entry point must not move! It is called directly from KERNAL or BASIC.
; Reads a character from 'KEYD' then shifts remaining buffer characters.
; If there is NO key it will return $FF.

GETKEY
!if DEBUG=1 { INC DBLINE+2,X }				; DEBUG
		LDY KEYD				; Get key at start of buffer
		LDX #0 					; Start at 0

GK_LOOP		LDA KEYD+1,X				; LOOP[ START - Now shift the next keys in line
		STA KEYD,X				;   to the front of the buffer
!if DEBUG=1 { STA DBLINE+10,X }				;   DEBUG - update screen
		INX
		CPX CharsInBuffer			;   Num Chars in Keyboard Buffer
		BNE GK_LOOP				; ] Done? No, loop for another

		DEC CharsInBuffer			; Reduce Num Chars in Keyboard Buffer

		TYA					; Put the character in Accumulator
!if DEBUG=1 { STA DBLINE+3 }				; DEBUG - 4th chr on bottom line
		CLI
		RTS

;************** Get Line
;
; The PET is usually in this routine, waiting for keypresses and printing them or acting on them.
; This routine continually loops until a <RETURN> is pressed. When <RETURN> is pressed then the line
; where the cursor is, is processed. If the <RUN> key is pressed then the string is stuffed into
; the keyboard buffer (overwriting whatever might be there)

GETLINE		JSR ChrOutMarginBeep			; Check for BELL at near-end of line 
GETLINE2

!if DEBUG=1 { INC DBLINE+5 }				; DEBUG - 6th chr on bottom line

		LDA CharsInBuffer			; Are there any keys waiting?
		STA Blink 				; 0 chars -> blink cursor
		BEQ GETLINE2 				; loop until char in buffer

!if DEBUG=1 { INC DBLINE+6 }				; DEBUG - 7th chr on bottom line

;************** Got a character, so process it

		SEI
		LDA BlinkPhase				; Flag: Last Cursor Blink On/Off
		BEQ GL_1
		LDA CursorChar				; Character Under Cursor
		LDY #0
		STY BlinkPhase				; Flag: Last Cursor Blink On/Off
		JSR Restore_Char_at_Cursor		; Put character on screen
GL_1		JSR GETKEY				; Get Character From Keyboard Buffer
		CMP #$83				; Is it the <RUN> key?
		BNE GL_3				; No, skip ahead

;		---------------- Stuff the <RUN> string to the keyboard buffer

		SEI
		LDX #9					; Length of string
		STX CharsInBuffer			; Set number of characters in buffer
GL_2		LDA RUN_String-1,X			; Normally:  dL"*<RETURN>run<RETURN>
		STA KEYD-1,X				; stuff it into the buffer
		DEX
		BNE GL_2				; loop back for more
		BEQ GETLINE2

;		--------------- Check for RETURN key

GL_3		CMP #$0D 				; Check if <RETURN> pressed
		BNE GETLINE				; if not go get more keys

;**********************************************************************************************
; Parse the line. When the <RETURN> key is pressed the line where the cursor lives is executed
;**********************************************************************************************

;!if DEBUG=1 { INC DBLINE+7 }		; DEBUG - 8th chr on bottom line

		LDY RigMargin   	; Physical Screen Line Length
		STY CRSW   		; Flag: INPUT or GET from Keyboard

PL_LOOP					; LOOP[
		LDA (ScrPtr),Y		;   Pointer: Current Screen Line Address
		CMP #$20		;   Is it <SPACE>?
		BNE PL_SKIP		;   No, found end of line, skip ahead
		DEY			;   Move to previous character
		BNE PL_LOOP		; ] Loop back for more

;		------------------------ Process line
PL_SKIP 
		INY			; last checked was not space so move one forward
		STY LastInputCol	; Pointer: End of Logical Line for INPUT
		LDY #$00		; COL=0, QUOTEMODE=0		[40]
		STY CursorCol   	; Cursor Column on Current Line	[40]
		STY QuoteMode   	; Flag: Editor in Quote Mode
		LDA InputRow   		; Cursor Y-X Pos. at Start of INPUT
		BMI Screen_Input
		CMP CursorRow   	; Current Cursor Physical Line Number
		BNE Screen_Input
		LDA InputCol
		STA CursorCol   	; Cursor Column on Current Line
		CMP LastInputCol   	; Pointer: End of Logical Line for INPUT
		BCC Screen_Input
		BCS Screen_Input2

;################################################################################################
		!fill $e116-*,$aa	; #######################################################
;################################################################################################

;************** Input a Character (Called from Jump Table) [$E116]
;FIXED ENTRY POINT!!!! This entry point must not move! It is called directly from KERNAL or BASIC.

INPUT_CHARACTER
		TYA
		PHA
		TXA
		PHA
; 		On 80-column core there is a JMP(SCRIV) here
;		where SCRIV normally points to DEFAULT_SCREEN_VECTOR

;		----------------------- Default Screen Vector [$E11A]
DEFAULT_SCREEN_VECTOR
		LDA CRSW   		; Get Input Flag: INPUT or GET from Keyboard
		BEQ GETLINE2		; Is it ZERO? Yes, Loop back up to Input from Keyboard

;		------------------------ Screen Input [$E11E]
Screen_Input
		LDY CursorCol		; Cursor Column on Current Line
		LDA (ScrPtr),Y		; Pointer: Current Screen Line Address
		STA DATAX		; Current Character to Print
		AND #$3F
		ASL DATAX		; Current Character to Print
		BIT DATAX		; Current Character to Print
		BPL SI_SKIP1
		ORA #$80
SI_SKIP1	BCC SI_SKIP2
		LDX QuoteMode		; Flag: Editor in Quote Mode
		BNE SI_SKIP3
SI_SKIP2	BVS SI_SKIP3
		ORA #$40
SI_SKIP3	INC CursorCol		; Cursor Column on Current Line
		JSR CheckQuote		; Switch Quote flag
		CPY LastInputCol	; Pointer: End of Logical Line for INPUT
		BNE SI_SKIP6

;		------------------------ Screen Input 2 [$E141]
Screen_Input2
		LDA #$00
		STA CRSW		; Flag: INPUT or GET from Keyboard
		LDA #$0D		; <RETURN>
		LDX DFLTN		; Default Input Device (0)
		CPX #$03		; 3=SCREEN
		BEQ SI_SKIP4
		LDX DFLTO		; Default Output (CMD) Device (3)
		CPX #$03	
		BEQ SI_SKIP5
SI_SKIP4	JSR CHROUT_SCREEN	; output to screen
SI_SKIP5	LDA #$0D		; <RETURN>
SI_SKIP6 	STA DATAX  		; Current Character to Print
		PLA
		TAX
		PLA
		TAY
		LDA DATAX  		; Current Character to Print
		CMP #$DE		; Is it <PI>?
		BNE SI_DONE		; No, skip ahead
		LDA #$FF		; Yes, substitute screen code
SI_DONE		RTS

;************** Check Quote Mode [$E167]
CheckQuote
		CMP #$22 		; Is it <QUOTE>?
		BNE CQSKIP		; No, skip ahead
		LDA QuoteMode		; Flag: Editor in Quote Mode, $00 = NO
		EOR #1			; toggle the BIT
		STA QuoteMode		; Flag: Editor in Quote Mode, $00 = NO
		LDA #$22 		; reload the <QUOTE>
CQSKIP		RTS

;************** Put Character to Screen [$E174]
; After characters have been processed, come here to print them

CHAR_TO_SCREEN
		ORA #$40

CHAR_TO_SCREEN2 
		LDX ReverseFlag    	; Flag: Print Reverse Chars. -1=Yes
		BEQ CTS_SKIP1

CHAR_TO_SCREEN3
		ORA #$80		; toggle the upper bit (reverse characters)
CTS_SKIP1	LDX INSRT  		; Flag: Insert Mode
		BEQ CTS_SKIP2
		DEC INSRT  		; Flag: Insert Mode

CTS_SKIP2	JSR Restore_Char_at_Cursor
		INC CursorCol   	; Cursor Column on Current Line
		LDY RigMargin   	; Physical Screen Line Length
		CPY CursorCol   	; Cursor Column on Current Line
		BCS IRQ_EPILOG
		LDX CursorRow   	; Current Cursor Physical Line Number
		CPY #$4F		; 79=maximum line length (2 physical lines) minus 1
		BNE CTS_SKIP3
		JSR LINKLINES		; Set 80-column line indicator
		JSR CURSOR_DOWN		; Move Cursor to next line
		LDA #$00		; First character on line
		STA CursorCol   	; Cursor Column on Current Line
		BEQ IRQ_EPILOG

CTS_SKIP3	CPX #$18		; Last screen line?
		BNE LINKLINES2		; No, continue
		JSR SCROLL_UP		; Yes, Scroll screen and adjust line link

;************** IRQ Completion [$E1A6]
; We jump here when printing is complete.

IRQ_EPILOG
		PLA
		TAY
		LDA INSRT		; Flag: Insert Mode
		BEQ IRQE_1
		LSR QuoteMode		; Flag: Editor in Quote Mode
IRQE_1
		PLA
		TAX
		PLA
		CLI			; Allow interrupts again
		RTS

;************** Link Lines [$E1B3]
; These routines are for 40-column line linking. When a character is printed to
; column 40 the line and the line below are linked into one 80-character logical line.
; IE: two physical lines become one logical line.
; X hold physical line#. Checks ROW to make sure it's not on last line.

LINKLINES	CPX #$17		; Are we at last screen ROW? 23 ?
		BCS LL_SKIP		; Yes, skip out
		LDA LineLinkTable+2,X	; No, safe to link the next line to this one
		ORA #$80		; Link the line by SETTING the upper bit
		STA LineLinkTable+2,X	; Store to line link table
LL_SKIP		RTS

;		--------------- Convert 40 character line to 80 characters [$E1BE]

LINKLINES2	JSR LINKLINES3		; Adjust line link and move to start of line
		JMP IRQ_EPILOG		; Finish Up

;		--------------- Scroll screen UP [$E1C4]

SCROLL_UP	JSR WINDOW_SCROLL_UP	; Scroll Screen Up
		DEC InputRow   		; Cursor Y-X Pos. at Start of INPUT
		DEC CursorRow   	; Current Cursor Physical Line Number
		LDX CursorRow   	; Current Cursor Physical Line Number

;		--------------- Adjust Line Link and Move to start of line [$E1CD]

LINKLINES3	ASL LineLinkTable+1,X 	; Shift to lose HI BIT
		LSR LineLinkTable+1,X 	; HI BIT is now CLEARED
		JSR LINKLINES		; set line link
		LDA CursorCol   	; Get Cursor Column on Current Line
		PHA			; Remember column
		JSR CURSOR_LEFT_MARGIN	; Cursor to start of line
		PLA			; Restore column
		STA CursorCol   	; Store Cursor Column on Current Line
		RTS

;************** Back to previous line when actioning DEL or LEFT [$E1DE]

PREV_LINE	LDY #$27		; Column 39
		LDX CursorRow   	; Get Current Cursor Physical Line Number
		BNE PL_SKIP1		; Is it Zero? No, ok to proceed, so skip ahead
		STX CursorCol   	; Yes, movement is invalid. Cursor Column on Current Line
		PLA			; pull the character from the stack
		PLA			; pull the character from the stack
		BNE IRQ_EPILOG		; jump back up to finish up

PL_SKIP1	LDA LineLinkTable-1,X	; Get PREVIOUS line's Line Link value
		BMI PL_SKIP2		; Is HI BIT SET? Yes, skip ahead
		DEX			; No, it's ok to go back to previous line
		LDA LineLinkTable-1,X	; Get PREVIOUS line's Line Link value
		LDY #$4F		; Column 79

PL_SKIP2	DEX
		STX CursorRow   	; Current Cursor Physical Line Number
		STA ScrPtr+1		; Store to Current Screen Line Address pointer
		LDA Line_Addr_Lo,X	; Get LO byte from ROM table
		STA ScrPtr    		; Store to Current Screen Line Address pointer
		STY CursorCol   	; Store to Cursor Column on Current Line
		STY RigMargin   	; Store to Physical Screen Line Length
		RTS

;################################################################################################
;		!fill $e202-*,$aa	; 0 bytes ##############################################
;################################################################################################

; ************ Output Character to Screen Dispatch (Called from Jump Table) [$E202]
;FIXED ENTRY POINT!!!! This entry point must not move! It is called directly from KERNAL or BASIC.

CHROUT_SCREEN
		PHA
		STA DATAX		; Current Character to Print
		TXA
		PHA
		TYA
		PHA
;		80-column machines have JMP(SCROV) here.
;		where SCROV would normally point to 'ChrOutNormal'

;************** Output Character to Screen [$E209]
; On 80 column machines, SCROV vector would point here

ChrOutNormal
		LDA #$00
		STA CRSW   		; Flag: INPUT or GET from Keyboard
		LDY CursorCol   	; Cursor Column on Current Line
		LDA DATAX  		; Current Character to Print
		AND #$7F		; Mask off top bit (graphics characters)
		CMP #$1B		; Is it <ESC>?
		BNE CHAR_HIGH_CHECK	; No, so skip ahead
		JMP Escape		; Yes, Cancel INS/RVS/Quote

;************** Reload character and check HI BIT [$E21A]
CHAR_HIGH_CHECK
		LDA DATAX  		; Current Character to Print
		BPL CHAR_UNSHIFTED	; Is top bit CLEAR? Yes, handle UNSHIFTED Character
		JMP ChrOutHighBitSet	; No, Handle SHIFTED Character

;************** Handle unshifted characters [$E221]
CHAR_UNSHIFTED
		CMP #$0D		; Is it <RETURN>?
		BNE CU_SKIP1		; No, skip ahead
		JMP ScreenReturn		; Yes, Handle <RETURN>
CU_SKIP1 
		CMP #$20		; Is it <SPACE>?
		BCC CU_SKIP2		; No, it's 0-31
		AND #$3F		; Yes, Mask off HI BIT
		JSR CheckQuote		; Switch Quote flag if found
		JMP CHAR_TO_SCREEN2
CU_SKIP2
		LDX INSRT  		; Flag: Insert Mode
		BEQ CU_SKIP3		; Is FLAG=0? Yes, skip ahead
		JMP CHAR_TO_SCREEN3
CU_SKIP3
		CMP #$14		; Is it <DEL>?
		BNE CU_SKIP6		; No, skip ahead
		DEY			; Yes, move to the left
		STY CursorCol   	; Cursor Column on Current Line
		BPL CU_SKIP4
		JSR PREV_LINE		; Back to previous line
		JMP CU_SKIP5
CU_SKIP4
		INY
		LDA (ScrPtr),Y		; Pointer: Current Screen Line Address
		DEY
		STA (ScrPtr),Y		; Pointer: Current Screen Line Address
		INY
		CPY RigMargin   	; Physical Screen Line Length
		BNE CU_SKIP4
CU_SKIP5
		LDA #$20		; <SPACE>
		STA (ScrPtr),Y		; put it on the screen! 
		BNE CU_SKIP11
CU_SKIP6
		LDX QuoteMode   	; Flag: Editor in Quote Mode
		BEQ CU_SKIP7
		JMP CHAR_TO_SCREEN3
CU_SKIP7
		CMP #$12		; Is it <RVS>?
		BNE CU_SKIP8
		STA ReverseFlag    	; Flag: Print Reverse Chars. -1=Yes
		BEQ CU_SKIP11
CU_SKIP8
		CMP #$13		; Is it <HOME>?
		BNE CU_SKIP9
		JSR CURSOR_HOME		; Cursor to start of line
CU_SKIP9
		CMP #$1D		; Is it <CURSOR RIGHT>?
		BNE CU_SKIP12
		INY
		STY CursorCol   	; Cursor Column on Current Line
		DEY
		CPY RigMargin   	; Physical Screen Line Length
		BCC CU_SKIP11
		JSR CURSOR_DOWN		; Move Cursor to next line
		LDY #$00
CU_SKIP10
		STY CursorCol   	; Cursor Column on Current Line

;		------------------------ Finish up
CU_SKIP11
		JMP IRQ_EPILOG		; Finish Up

;		------------------------ More checking
CU_SKIP12
		CMP #$11		; Is it <CURSOR DOWN>?
		BNE CU_SKIP14		; No, skip ahead
		CLC
		TYA
		ADC #$28		; Add 40 for next line
		TAY
		CMP RigMargin   	; Compare it to Screen Line Length
		BCC CU_SKIP10		; Less, so it's ok
		BEQ CU_SKIP10		; Equal, also ok
		JSR CURSOR_DOWN		; More, so Move Cursor to next line

;		------------------------ Finish up
CU_FINISH
		JMP IRQ_EPILOG		; Finish Up

;		------------------------ More character checking
CU_SKIP14
		CMP #$10		; Is it <$10>? (BUG!: This should be #10 or #$16 - Erase to EOL)
		BNE CU_SKIP15		; No, skip ahead

;************** Clear to End of Line [$E2A0]
CLEAR_TO_EOL
		LDA #$20		; Yes, set character to <SPACE>
		DEY
CTEL_LOOP 
		INY			; LOOP[
		STA (ScrPtr),Y		;   Store <SPACE> to screen
		CPY RigMargin		;   Is it end of line?
		BCC CTEL_LOOP		; ] No, loop back for more
		BCS CU_FINISH		; Yes, Finish up

;		------------------------ More character checking
CU_SKIP15
		CMP #$0E		; Is it <TEXT>?
		BNE CU_SKIP16		; No, skip ahead
		JSR CRT_SET_TEXT	; Yes, Set screen to TEXT mode
		BMI CU_FINISH		; Finish up
CU_SKIP16
		CMP #$07		; Is it <BELL>?
		BNE CU_SKIP17		; No, skip ahead
		JSR BEEP		; Ring BELL
		BEQ CU_FINISH		; Finish up
CU_SKIP17
		CMP #$09		; Is it <TAB>?
		BNE CU_FINISH		; Finish up
CU_SKIP18
		CPY RigMargin   	; Physical Screen Line Length
		BCC CU_SKIP20
		LDY RigMargin   	; Physical Screen Line Length
CU_SKIP19
		STY CursorCol   	; Cursor Column on Current Line
		JMP IRQ_EPILOG		; Finish Up
CU_SKIP20
		INY
		JSR CHECK_TAB		; Check TAB
		BEQ CU_SKIP18		; Is this a TAB position?
		BNE CU_SKIP19		; No, Loop back

;************** Character Output with HI BIT set [$E2D5]
; When the HI BIT is set the characters become the SHIFTED function. For example
; SHIFTED DELETE is the same as INSERT

ChrOutHighBitSet
		AND #$7F		; strip off top bit
		CMP #$7F		; is it $FF?
		BNE COH_SKIP1		; No, skip
		LDA #$5E		; Yes, substitute with $5E (PI character)
COH_SKIP1
		CMP #$20		; Is it <SPACE>?
		BCC COH_SKIP2		; Less? Yes, skip ahead and check more
		JMP CHAR_TO_SCREEN	; 32 to 127 -> 160-255. Jump and print it
COH_SKIP2
		CMP #$0D		; Is it <RETURN>?
		BNE COH_SKIP3		; No, skip ahead (continue)
		JMP ScreenReturn	; Yes,
COH_SKIP3
		LDX QuoteMode   	; Flag: Editor in Quote Mode
		BNE COH_SKIP6
		CMP #$14		; Is it SHIFT<DEL>? INSERT
		BNE COH_SKIP5		; No, skip ahead

;		------------------------ INS was pressed
CHECK_INSERT
		LDY RigMargin   	; Right margin
		LDA (ScrPtr),Y		; Read the character at the end of the line
		CMP #$20		; Is the character a <SPACE>?
		BNE COH_SKIP4		; No, skip ahead
		CPY CursorCol		; Cursor Column on Current Line
		BNE DO_INSERT
COH_SKIP4
		CPY #$4F		; Column 79?
		BEQ CU_SKIP11		; Yes, go back up for more
		JSR WINDOW_SCROLL_DOWN	; Check for and perform scrolling UP

;		------------------------ Insert SPACES
DO_INSERT 
		LDY RigMargin   	; Start at right margin
INS_LOOP1 
		DEY			; LOOP[  move back one
		LDA (ScrPtr),Y 		;   Get character from screen
		INY			;   Next character
		STA (ScrPtr),Y		;   Put character back to screen
		DEY
		CPY CursorCol   	;   have we reached current Cursor position?
		BNE INS_LOOP1		; ] No, loop back for more

		LDA #$20		; <SPACE>
		STA (ScrPtr),Y 		; Write <SPACE> to screen
		INC INSRT		; Flag: Insert Mode
		BNE COH_FINISH
COH_SKIP5
		LDX INSRT  		; Flag: Insert Mode
		BEQ COH_CHECK1
COH_SKIP6
		ORA #$40
		JMP CHAR_TO_SCREEN3

;		----------------------- More character checking
COH_CHECK1
		CMP #$11		; Is it <CRSR DOWN>?
		BNE COH_CHECK2

;		----------------------- Do Cursor Down
		LDA CursorCol   	; Cursor Column on Current Line
		CMP #$28		; Is it column 40?
		BCC COH_SKIP7		; No, skip ahead
		SBC #$28		; Yes, subtract 40
		STA CursorCol   	; Cursor Column on Current Line
		BCS COH_FINISH
COH_SKIP7
		LDX CursorRow   	; Current Cursor Physical Line Number
		BEQ COH_FINISH
		LDA MYCH,X		; Serial Word Buffer
		BPL COH_SKIP8
		DEC CursorRow   	; Current Cursor Physical Line Number
		JSR CURSOR_LEFT_MARGIN	; Cursor to start of line
		BCC COH_FINISH
COH_SKIP8
		DEX
		DEX
		STX CursorRow   	; Current Cursor Physical Line Number
		JSR CURSOR_LEFT_MARGIN	; Cursor to start of line
		LDA CursorCol   	; Cursor Column on Current Line
		CLC
		ADC #$28
		STA CursorCol		; Cursor Column on Current Line
		BNE COH_FINISH

;		----------------------- More character checking
COH_CHECK2
		CMP #$12		; Is it SHIFT<RVS> = <RVSOFF>?
		BNE COH_CHECK3

		LDA #$00		; OFF
		STA ReverseFlag    	; Flag: Print Reverse Chars. -1=Yes
		BEQ COH_FINISH

;		----------------------- More character checking
COH_CHECK3
		CMP #$1D		; Is it SHIFT<RIGHT> = <LEFT>?
		BNE COH_CHECK4

		DEY
		STY CursorCol   	; Cursor Column on Current Line
		BPL COH_FINISH
		JSR PREV_LINE
		JMP IRQ_EPILOG		; Finish Up

;		----------------------- More character checking
COH_CHECK4
		CMP #$13		; Is it SHIFT<HOME>=<CLS>?
		BNE COH_CHECK5
		JSR WINDOW_CLEAR	; Clear Screen

;		------------------------ Finish up
COH_FINISH
		JMP IRQ_EPILOG		; Finish Up

;		----------------------- More character checking
COH_CHECK5
		CMP #$16		; Is it SHIFT-<ERASE START> = <ERASE END>?
		BNE COH_CHECK6
;		----------------------- Do Erase to Start
ERASE_TO_START
		LDA #$20
		LDY #$00
ETS_LOOP 				; LOOP[
		CPY CursorCol   	;   Cursor Column on Current Line
		BCS COH_FINISH		;   Finish up
		STA (ScrPtr),Y		;   Pointer: Current Screen Line Address
		INY
		BNE ETS_LOOP		; ] loop back for more

;		----------------------- More character checking
COH_CHECK6
		CMP #$0E		; Is it SHIFT<TEXT> = <GRAPHICS>?
		BNE COH_CHECK7		; No, skip ahead
		JSR CRT_SET_GRAPHICS	; Yes, Set screen to graphics mode
		BMI COH_FINISH		; Finish up
COH_CHECK7
		CMP #$07		; Is it SHIFT<BELL>?
		BNE COH_CHECK8		; No, skip ahead
		JSR DOUBLE_BEEP		; Ring the Bell
		BEQ COH_FINISH		; Finish up
COH_CHECK8
		CMP #$09		; Is it SHIFT<TAB>?
		BNE COH_FINISH		; Finish up
		JSR CHECK_TAB		; Set TAB
		EOR TABS   		; Table of 80 bits to set TABs (80col)
		STA $03F0,X
		JMP IRQ_EPILOG		; Finish Up

;************** Move Cursor to next line [$E3A9]
CURSOR_DOWN
		SEC
		LSR InputRow   		; Cursor Y-X Pos. at Start of INPUT
		LDX CursorRow   	; Current Cursor Physical Line Number
CD_LOOP1					
		INX			; LOOP[
		CPX #$19		;   Last line of screen?
		BNE CD_SKIP
		JSR WINDOW_SCROLL_UP	;   Scroll Screen Up
CD_SKIP
		LDA LineLinkTable,X	;   Screen Line Link Table / Editor Temps (40 col)
		BPL CD_LOOP1		;   Is HI bit CLEAR? Yes then LOOP]
		STX CursorRow   	; Current Cursor Physical Line Number
		JMP CURSOR_LEFT_MARGIN	; Cursor to start of line

;************** Do RETURN [$E3BF]

ScreenReturn
		JSR CURSOR_DOWN		; Move to next line
		LDA #$00		; Column=0
		STA CursorCol   	; Cursor Column on Current Line

;************** Do ESCAPE [$E3C6]
; Cancels Insert, Reverse and Quote modes

ESCAPE_O				; ESC-O (Escape) Also: <ESC><ESC>
Escape
		LDA #$00
		STA INSRT  		; Flag: Insert Mode
		STA ReverseFlag    	; Flag: Print Reverse Chars. -1=Yes
		STA QuoteMode   	; Flag: Editor in Quote Mode
		JMP IRQ_EPILOG		; Finish Up

;************** Scroll Window UP (Called from Jump Table) [$E3D1]
; Works on entire screen. Also scroll up line-link table

ESCAPE_V				; Esc-v Scroll Up
WINDOW_SCROLL_UP
		LDX #$19		; 25 screen lines
		STX CursorRow   	; Current Cursor Physical Line Number

WSU_LOOP1
		LDX #$FF
;		----------------------- Set up screen pointers, scroll line link table entry for the current line
WSU_LOOP2
		INX			; LOOP[
		LDA Line_Addr_Lo,X	;   Screen line address table LO
		STA ScrPtr    		;   Set up Pointer LO for screen scrolling
		LDA LineLinkTable,X	;   Screen Line Link Table (address table HI)
		ORA #$80		;   Make sure HI BIT is set
		STA ScrPtr+1		;   Set up pointer HI for screen scrolling 
		CPX #$18		;   Last Line?
		BCS WSU_SKIP2		;   Yes, so skip ahead to exit loop
		LDY LineLinkTable+1,X	;   No, so get NEXT Line's Line Link entry
		BMI WSU_SKIP1		;   is HI BIT set? Yes, leave it as is and skip ahead
		AND #$7F		;   No, then CLEAR HI BIT
WSU_SKIP1
		STA LineLinkTable,X	;   Store it in the CURRENT Line Link entry (IE scroll the high bits UP)
		TYA
		ORA #$80		;   Set HI BIT
		STA SAL+1		;   $C8
		LDA Line_Addr_Lo+1,X	;   Screen line address table
		STA SAL    		;   Pointer: Tape Buffer/ Screen Scrolling

;               ----------------------- Now we scroll the video screen lines

		LDY #$27		;   40 characters per line
WSU_LOOP3				;   LOOP[[
		LDA (SAL),Y 		;     Read character from screen
		STA (ScrPtr),Y 		;     Write it back
		DEY
		BPL WSU_LOOP3		;   ]] Loop back for more
		BMI WSU_LOOP2		; ] Loop back for more
WSU_SKIP2
		STA LineLinkTable,X	; Store to Screen Line Link Table

;		----------------------- Clear the last screen line

		LDY #$27		; 40 characters on line
		LDA #$20		; <SPACE>
WSU_LOOP4				; LOOP[
		STA (ScrPtr),Y 		;   Write <SPACE> to the screen
		DEY
		BPL WSU_LOOP4		; ] Loop back for more

		DEC CursorRow   	; Current Cursor Physical Line Number
		LDA LineLinkTable	; Screen Line Link Table / Editor Temps (40 col)
		BPL WSU_LOOP1		; ] Loop back for more

;************** Check Keyboard Scroll Control [$E415]

CHECK_SCROLL_CONTROL
		LDA PIA1_Port_B		; Keyboard COL read
		CMP #$FE		; Is KEY held down?
		BNE CSC_SKIP		; No, skip over delay

;		----------------------- Scroll delay

		LDY #$00
SCROLL_DELAY				; Loop [
		NOP
		DEX
		BNE SCROLL_DELAY 	; ] Loop back for more
		DEY
		BNE SCROLL_DELAY 	; ] Loop back for more

		STY CharsInBuffer    	; No. of Chars. in Keyboard Buffer (Queue)

;		----------------------- Scroll complete
CSC_SKIP
		LDX CursorRow   	; Current Cursor Physical Line Number
		RTS

		TAX
		TAX
		TAX
		TAX

;************* Jiffy Clock Timer Correction Patch [$E42E]

ADVANCE_TIMER
		JSR UDTIME		; Update System Jiffy Clock. KERNAL routine $FFEA 
		INC JIFFY6DIV5		; Counter to speed TI by 6/5 (40col)
		LDA JIFFY6DIV5		; Counter to speed TI by 6/5 (40col)
		CMP #$06		; 6 IRQ's?
		BNE IRQ_NORMAL2		; No, do normal IRQ
		LDA #$00		; Reset IRQ adjustment counter
		STA JIFFY6DIV5 		; Counter to speed TI by 6/5 (40col)
		BEQ ADVANCE_TIMER	; was IRQ_MAIN		; Do normal IRQ

;####################################################################################################
;		!fill $e442-*,$aa	; 0 bytes ###################################################
;####################################################################################################

;************** Main IRQ Dispatcher (Called from Jump Table) [$E442]
;FIXED ENTRY POINT!!!! This entry point must not move! It is called directly from KERNAL or BASIC.

IRQ_MAIN	PHA
		TXA
		PHA
		TYA
		PHA
		TSX
		LDA $0104,X		; Stack
		AND #$10		;
		BEQ IRQM_SKIP		; Skip to hardware IRQ

		JMP ($0092) 		; Vector: BRK Instruction Interrupt	(points to $D478)
IRQM_SKIP	JMP ($0090) 		; Vector: Hardware Interrupt		(points to $E455)

;=============== IRQ Handler [$E455]
IRQ_NORMAL
!IF HERTZ=50 {
		JMP ADVANCE_TIMER	; 50Hz correction routine
} ELSE {
		JSR UDTIME		; 60Hz no correction needed. Update System Jiffy Clock = Kernal UDTIME=$FFEA 
}

;		--------------- Blink the cursor
IRQ_NORMAL2
		LDA Blink		; Cursor Blink enable: 0 = Flash Cursor
		BNE PREP_KEYSCAN		; Is >0? Yes, skip
		DEC BLNCT		; Timer: Countdown to Toggle Cursor
		BNE PREP_KEYSCAN		; Is >0? Yes, skip

		LDA #$14		; Normal blink rate
		BIT RPTFLG 		; Repeat Flag (40 col)
		BPL IRQ_SKIP1
		LDA #$02		; Fast blink rate
IRQ_SKIP1
		STA BLNCT  		; Timer: Countdown to Toggle Cursor
		LDY CursorCol   	; Cursor Column on Current Line
		LSR BlinkPhase 		; Flag: Last Cursor Blink On/Off
		LDA (ScrPtr),Y		; Pointer: Current Screen Line Address
		BCS IRQ_SKIP2		; Is Hi bit set? Yes, skip ahead

		INC BlinkPhase		; Flag: Last Cursor Blink On/Off
		STA CursorChar		; Save the character Under Cursor
IRQ_SKIP2
		EOR #$80		; Flip the top bit (reverse character bit)
		STA (ScrPtr),Y		; Pointer: Current Screen Line Address

;		--------------- Prep for keyboard scanning [$E47B]
PREP_KEYSCAN
		LDY #$00
		LDA PIA1_Port_A		; Keyboard ROW select
		AND #$F0
		STA PIA1_Port_A 	; Keyboard ROW select
		LDA PIA1_Port_A 	; Keyboard ROW select

;		--------------- Check tape and IEEE [$E488]
CHECK_TAPE_IEEE
		ASL
		ASL
		ASL
		BPL CTI_SKIP1
		STY CAS1   		; Tape Motor Interlock #1
		LDA PIA1_Cont_B 	; PIA#1 Register 13 (Retrace flag and interrupt
		ORA #$08
		BNE CTI_SKIP2
CTI_SKIP1
		LDA CAS1   		; Tape Motor Interlock #1
		BNE CTI_SKIP3
		LDA PIA1_Cont_B 	; PIA#1 Register 13 (Retrace flag and interrupt
		AND #$F7
CTI_SKIP2
		STA PIA1_Cont_B 	; PIA#1 Register 13 (Retrace flag and interrupt
CTI_SKIP3
		BCC CTI_SKIP4
		STY CAS2 	  	; Tape Motor Interlock #2
		LDA VIA_Port_B 		; VIA Register 0 (flags)
		ORA #$10
		BNE CTI_SKIP5
CTI_SKIP4
		LDA CAS2   		; Tape Motor Interlock #2
		BNE CTI_SKIP6
		LDA VIA_Port_B 		; VIA Register 0 (flags)
		AND #$EF
CTI_SKIP5
		STA VIA_Port_B 		; VIA Register 0 (flags)
CTI_SKIP6
		JSR SCAN_KEYBOARD	; do the keyboard scan
		JMP IRQ_END


;************* Keyboard Scanner [$E4BF]

!if KEYSCAN=0 { !source "keyscan-g.asm" }
!if KEYSCAN=1 { !source "keyscan-b.asm" }
!if KEYSCAN=2 { !source "keyscan-din.asm" }
!if KEYSCAN=3 { !source "keyscan-c64.asm" }
!if KEYSCAN=4 { !source "keyscan-cbm2.asm" }


;--------------- Check TAB [$E588]
CHECK_TAB
		TYA
		AND #$07		; Only look at lower 3 bits (values 0 to 7)
		TAX
		LDA POWERSOF2,X		; GetTable of BIT position values
		STA TABS   		; Table of 80 bits to set TABs
		TYA
		LSR
		LSR
		LSR
		TAX
		LDA TABS+1,X		; Get the BITS for that group of tabs (Table of 80 bits to set TABs)
		BIT TABS   		; Set FLAG for testing???? (Table of 80 bits to set TABs)
		RTS

;################################################################################
		!fill $e600-*,$aa	;########################################
;################################################################################


;************** End of IRQ (Called from Jump Table) [$E600]
; FIXED ENTRY POINT!!!! This entry point must not move! It is called directly from KERNAL or BASIC.

IRQ_END
		PLA
		TAY
		PLA
		TAX
		PLA
		RTI

;************** Restore Character at Cursor [$E606]
; This routine is called to put the character back at the cursor position.
; It is called to put the initial character on the screen and as part of the
; cursor blinking routine.

Restore_Char_at_Cursor
		LDY CursorCol  		; Cursor Column on Current Line
		STA (ScrPtr),Y		; Pointer: Current Screen Line Address
		LDA #$02
		STA BLNCT  		; Timer: Countdown to Toggle Cursor
		RTS

;************** Set Screen to TEXT or GRAPHICS MODE 
;
; TEXT/GRAPHICS mode determines which font is displayed.
; - GRAPHICS mode has uppercase and full graphics. Characters take 8 scanlines
; - TEXT mode has lower case, upper case and limited graphics. Characters take 10 scanlines (normally)
; 
;		-------------- Initialize CRTC to TEXT Mode (Called from Jump Table) [$E60F]
CRT_SET_TEXT
		LDA #<CRT_CONFIG_TEXT	; Point to CRTC Table
		LDX #>CRT_CONFIG_TEXT	; Point to CRTC Table
		LDY #$0E		; Character Set = TEXT
		BNE CRT_PROGRAM

;		-------------- Initialize CRTC to GRAPHICS Mode (Called from Jump Table) [$E617]
CRT_SET_GRAPHICS
		LDA #<CRT_CONFIG_GRAPHICS       ; Point to CRTC Table
		LDX #>CRT_CONFIG_GRAPHICS       ; Point to CRTC Table
		LDY #$0C			; Character Set = GRAPHICS

;************** Program CRTC chip for selected screen MODE (Called from Jump Table) [$E61D]
;
; The CRTC controller controls the parameters for generating the display on the monitor. The CRTC chip has
; several registers that must be set properly according to the type of connected display. These set characters on the line,
; left and right margins, lines on the screen, height of each line and positioning of the top of the screen.
; The parameters are read from a table and written to the CRTC controller chip. The VIA chip is used to select which of the
; two fonts from the CHARACTER ROM is used.
;
; Parameters: Table pointer in A/X, CHRSET in Y
; OPTIONS: 'SS40' uses new routine in upper rom

CRT_PROGRAM
;		--------------------- Set 'Character Set' [$E61D]

		STA SAL				; Pointer LO: Tape Buffer/ Screen Scrolling
		STX SAL+1			; Pointer HI
		LDA VIA_PCR			; Get current register byte VIA Register C - CA2	CHIP 
		AND #$f0			; mask out lower nibble
		STA FNLEN			; save it to Temp Variable
		TYA				; Move 'Character Set' byte to A
		ORA FNLEN			; update lower nibble in Temp Variable
		STA VIA_PCR			; write it back to VIA Register C - CA2			CHIP

;		--------------------- Write to the CRTC controller [$E62E]

		LDY #$11			; Number of bytes to copy = 17

CRT_LOOP	LDA (SAL),Y			; Pointer: Tape Buffer/ Screen Scrolling
		STY CRT_Address			; Select the register to update 6545/6845 CRT		CHIP
		STA CRT_Status			; Write to the register
		DEY
		BPL CRT_LOOP			; loop for more
		RTS

;************** Output character with check for BELL at and of line [$E63C]
; Outputs the character to the screen then checks the cursor column to see if it is near the
; end of the line. If so, it rings the BELL.
ChrOutMarginBeep
		JSR CHROUT_SCREEN		; Output character to screen (chr code in A)
		TAX				; Save the character to X
		LDA RigMargin   		; Physical Screen Line Length
		SEC
		SBC CursorCol   		; Cursor Column on Current Line
		CMP #$05			; Are we at the 5th last character on the line?
		BNE BELLDONE			; No, exit out
		TXA				; Yes, reload the character to print
		CMP #$1D			; Is it <RIGHT>?
		BEQ DOUBLE_BEEP			; Yes, do Double BELL
		AND #$7F			; Mask off HI BIT
		CMP #$20			; Is it a control code?
		BCC BELLDONE			; Yes, exit out

;************** Double BELL [$E654]
DOUBLE_BEEP
		JSR BEEP			; do BELL

;************** Single BELL [$E657]
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

;************** Editor Initialization [$E683]
; This initializes the editor. It sets CHIP registers, clears the CLOCK,
; sets default TAB STOPS, IRQ Vector, Cursor and Flag defaults etc.

INIT_EDITOR
		LDA #$7f
		STA VIA_IER			; VIA, Register E - I/O Timers
		LDX #$6d
		LDA #0

INITED1		STA JIFFY_CLOCK,X		; Clear Real-Time Jiffy Clock (approx) 1/60 Sec
		DEX
		BPL INITED1

		LDX #$0A			; 10 bytes to set
INITED2
		STA TABS+1,X			; LOOP[   TAB table $03F0
		DEX
		BPL INITED2			; ] Loop back for more

		STA RPTFLG			; Repeat Flag

;		-------------- Set IRQ Vector - Normally $E455 or $E900 for Execudesk

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
;		--------------- Continue

		LDA #$03			; 3=Screen
		STA DFLTO  			; Set Default Output (CMD) to Screen
		LDA #$0F
		STA PIA1_Port_A 		; Keyboard ROW select [$E810]
		ASL
		STA VIA_Port_B			; VIA Register 0 (flags) [$E840]
		STA VIA_DDR_B			;
		STX PIA2_Port_B			;
		STX VIA_Timer_1_Hi		;

		LDA #$3D
		STA PIA1_Cont_B			; PIA#1 Register 13 (Retrace flag and interrupt) [$E813]
		BIT PIA1_Port_B 		; Keyboard COL read

		LDA #$3C
		STA PIA2_Cont_A
		STA PIA2_Cont_B
		STA PIA1_Cont_A
		STX PIA2_Port_B

		LDA #$0C
		STA VIA_PCR 			; VIA Register C (cb2) [$E84C]
		STA BLNCT  			; Timer: Countdown to Toggle Cursor
		STA Blink  			; Cursor Blink enable: 0 = Flash Cursor

		LDA #$09
		STA XMAX  			; Max keyboard buffer size (40 col)

		LDA #$10
		STA CHIME 			; Chime Time 0=off (40col)
		STA DELAY			; Repeat key countdown (40col)
		STA KOUNT 			; Delay between repeats (40col)

!IF AUTORUN=1 {	JSR AUTOSTART }			; Do Autostart Prep

		RTS

;************** Check for screen scrolling [$E6EA]

ESCAPE_W					; Esc-w Scroll Down
WINDOW_SCROLL_DOWN
		LDX CursorRow  			; Get Current Cursor Physical Line Number
		INX				; Next line
		CPX #$18			; Will it be the last line on the screen (24)?
		BEQ CLEAR_SCREEN_LINE 		; Yes, Clear a screen line and move cursor to start of line
		BCC SCROLL_DOWN			; No it's less, Scroll screen lines DOWN
		JMP SCROLL_UP			; No it's more, Scroll screen up

;************** Scroll Lines DOWN [$E6F6]
; Used to INSERT a blank line. Scrolls all lines from bottom of screen up to current line
; stored in 'CursorRow'.  Adjusts ALL Line Links.

SCROLL_DOWN
		LDX #$17			; Start at bottom of the screen (ROW 24 minus 1)
SD_LOOP1 
		LDA LineLinkTable+1,X		; LOOP[  Get NEXT line's HI byte from Line Link table
		ORA #$80			;   Make sure HI bit is set
		STA SAL+1			;   Store it to destination screen pointer
		LDY LineLinkTable,X		;   Get CURRENT line's HI byte from Line Link Table
		BMI SD_SKIP			;   Is HI bit SET? Yes, skip ahead
		AND #$7F			;   No, CLEAR HI bit
SD_SKIP
		STA LineLinkTable+1,X		;   Store it back to Line link table
		TYA
		ORA #$80			;   SET HI bit
		STA ScrPtr+1			;   Store to screen line SOURCE pointer
		LDY #$27			;   40 characters per line minus 1 (0-39)
		LDA Line_Addr_Lo+1,X		;   Get screen's LO byte from Screen line address table
		STA SAL    			;   Store it to DESTINATION screen pointer
		LDA Line_Addr_Lo,X		;   Get Previous lines LO byte from Screen line address table
		STA ScrPtr    			;   Store it to the SOURCE pointer

;		------------------------------- Copy the line
SD_LOOP2					;   LOOP[[
		LDA (ScrPtr),Y 			;     Read character from screen
		STA (SAL),Y			;     Write to new destination
		DEY				;     Next character
		BPL SD_LOOP2			;   ]] Loop back for more
		DEX				;   Next line (above)
		CPX CursorRow   		;   Current Cursor Physical Line Number
		BNE SD_LOOP1			; ] Loop back for more

		INX

;************** Clear a screen line [$E724]
; Clears one line of the screen. X holds line#.
; Adjusts Line Link entry for specified line

CLEAR_SCREEN_LINE
		LDA LineLinkTable,X		; Get current line's Line Link entry
		ORA #$80			; Make sure HI BIT is set
		STA ScrPtr+1			; Store it to the screen pointer
		AND #$7F			; Clear the HI BIT again
		STA LineLinkTable,X		; Store it to the Line Link Table
		LDA Line_Addr_Lo,X		; Get screen line's address LO byte from ROM table
		STA ScrPtr    			; Store it to screen pointer LO
		LDY #$27			; Y=40 columns
		LDA #$20			; <SPACE>
CSL_LOOP
		STA (ScrPtr),Y			; LOOP[    Write SPACE to screen
		DEY				;   Y=Y-1
		BPL CSL_LOOP			; ] Loop back for more

		JMP CURSOR_LEFT_MARGIN		; Cursor to start of line

;************** Keyboard Decoding Table [$E73F]

!source "keyboard.asm"

;************** SHIFT RUN/STOP string [$E78F]

RUN_String
		!byte $44,$cc,$22,$2a,$0d	; dL"*<RETURN>
		!byte $52,$55,$4e,$0d		; run<RETURN>


;************* Screen Line Address Tables [$E798]

!source "screen-40-lo.asm"

;************** CRTC Chip Register Setup Tables [$E7B1]

!source "crtc-tables.asm"

;************** BELL Frequency Table [$E7D5]

SOUND_TAB	!byte $0e,$1e,$3e,$7e,$3e,$1e,$0e	; BELL chime values
          

;************** POWERS OF 2 TABLE [$E7DC]
; This table is used by the TAB routine

POWERSOF2       !byte $80,$40,$20,$10,$08,$04,$02,$01	; BIT table

;************** VERSION BYTE?

!IF HERTZ=50 {	!byte $29 }			; 901498-01 [edit-4-40-n-50]
!IF HERTZ=60 {	!byte $BB }			; 901499-01 [edit-4-40-n-60]

;************** SMALL PATCHES HERE

!IF BACKARROW = 1 { !SOURCE "editbarrow.asm" }	; Patch for Back Arrow toggling of screen mode

;************** FILLER

!fill $e800-*,$aa	; Fill to end of 2K