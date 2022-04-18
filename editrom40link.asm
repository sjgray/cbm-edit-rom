;*********************************************************************************************************
;** LINKLINES [$E1B3]
;** These routines are for 40-column line linking. When a character is printed to
;** column 40 the line and the line below are linked into one 80-character logical line.
;** IE: two physical lines become one logical line.
;** X hold physical line#. Checks ROW to make sure it's not on last line.
;*********************************************************************************************************

LINKLINES	CPX #ROWS-2				; Check if we are below ROW 23?
		BCS LL_SKIP				; Yes, skip out
		LDA LineLinkTable+2,X			; No, safe to link the next line to this one
		ORA #$80				; Link the line by SETTING the upper bit
		STA LineLinkTable+2,X			; Store to line link table
LL_SKIP		RTS

;		--------------------------------------- Convert 40 character line to 80 characters [$E1BE]

LINKLINES2	JSR LINKLINES3				; Adjust line link and move to start of line
		JMP IRQ_EPILOG				; Finish Up

;		--------------------------------------- Scroll screen UP [$E1C4]

SCROLL_UP	JSR WIN_SCROLL_UP			; Scroll Screen Up
		DEC InputRow   				; Cursor Y-X Pos. at Start of INPUT
		DEC CursorRow   			; Current Cursor Physical Line Number
		LDX CursorRow   			; Current Cursor Physical Line Number

;		------------------------------- Adjust Line Link and Move to start of line [$E1CD]

LINKLINES3	ASL LineLinkTable+1,X 			; Shift to lose HI BIT
		LSR LineLinkTable+1,X 			; HI BIT is now CLEARED
		JSR LINKLINES				; Set line link
		LDA CursorCol   			; Get Cursor Column on Current Line
		PHA					; Remember column
		JSR CURSOR_LM				; Cursor to start of line
		PLA					; Restore column
		STA CursorCol   			; Store Cursor Column on Current Line
		RTS
