;*********************************************************************************************************
;** WIN_SCROLL_UP / ESCAPE_V  [E3D1] (Called from Jump Table)
;** Scrolls entire screen UP. Also scroll up line-link table
;*********************************************************************************************************

ESCAPE_V
WIN_SCROLL_UP
		LDX #ROWS				; Hard-coded Screen Lines (normally 25)
		STX CursorRow   			; Current Cursor Physical Line Number

WSU_LOOP1	LDX #$FF

;[E3D7]		--------------------------------------- Set up screen pointers, scroll line link table entry for the current line

WSU_LOOP2	INX					; LOOP[
		LDA Line_Addr_Lo,X			;   Screen line address table LO
		STA ScrPtr    				;   Set up Pointer LO for screen scrolling
		LDA LineLinkTable,X			;   Screen Line Link Table (address table HI)
		ORA #$80				;   Make sure HI BIT is set
		STA ScrPtr+1				;   Set up pointer HI for screen scrolling 
		CPX #ROWS-1				;   Last Line?
		BCS WSU_SKIP2				;   Yes, so skip ahead to exit loop
		LDY LineLinkTable+1,X			;   No, so get NEXT Line's Line Link entry
		BMI WSU_SKIP1				;   is HI BIT set? Yes, leave it as is and skip ahead
		AND #$7F				;   No, then CLEAR HI BIT

WSU_SKIP1	STA LineLinkTable,X			;   Store it in the CURRENT Line Link entry (IE scroll the high bits UP)
		TYA
		ORA #$80				;   Set HI BIT
		STA SAL+1				;   $C8
		LDA Line_Addr_Lo+1,X			;   Screen line address table
		STA SAL    				;   Pointer: Tape Buffer/ Screen Scrolling

;[E3F9]		--------------------------------------- Now we scroll the video screen lines

!IF SS40=0 {	LDY #COLUMNS-1				;   Hard-coded Screen Width
 } ELSE {	LDY SCNWIDTH }				;   Soft Screen Width

WSU_LOOP3	LDA (SAL),Y 				;   LOOP[[  Read character from screen
		STA (ScrPtr),Y 				;     Write it back
		DEY					;     Next character
		BPL WSU_LOOP3				;   ]] Loop back for more
		BMI WSU_LOOP2				; ] Loop back for more

WSU_SKIP2	STA LineLinkTable,X			; Store to Screen Line Link Table

;[E406]		--------------------------------------- Clear the last screen line

!IF SS40=0 {	LDY #COLUMNS-1				;   Hard-coded Screen Width
} ELSE {	LDY SCNWIDTH				;   Soft Screen Width
		DEY }					;   -1

		LDA #$20				; <SPACE>

WSU_LOOP4	STA (ScrPtr),Y 				; LOOP[  Write <SPACE> to the screen
		DEY					;   Next character
		BPL WSU_LOOP4				; ] Loop back for more

		DEC CursorRow   			; Current Cursor Physical Line Number
		LDA LineLinkTable			; Screen Line Link Table / Editor Temps (40 col)
		BPL WSU_LOOP1				; ] Loop back for more
