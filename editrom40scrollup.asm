; PET/CBM Editor ROM Project - CODEBASE 0 - Scroll Screen and Line Link
; ========================== - EDITROM40SCROLLUP.ASM

;*********************************************************************************************************
;** WIN_SCROLL_UP / ESCAPE_V  [E3D1] (Called from Jump Table)
;*********************************************************************************************************
; Scrolls entire screen UP. Also scroll up line-link table.
; ZP Pointers: (SAL) as Source, (ScrPtr) as DESTINATION.

ESCAPE_V						; Included for ESC code compatibility
WIN_SCROLL_UP
!IF DEBUG=1 {	INC DBLINE+20}

		LDX #ROWS				; Hard-coded Screen Lines (normally 25)
		STX CursorRow   			; Current Cursor Physical Line Number

WSU_LOOP1	LDX #$FF				; Will be incremented to Zero immediately below

;[E3D7]		--------------------------------------- Set up screen pointers, scroll line link table entry for the current line

WSU_LOOP2	INX					; LOOP[
		LDA Line_Addr_Lo,X			;   Screen line address table LO
		STA ScrPtr    				;   Set up Pointer LO for screen scrolling
		LDA LineLinkTable,X			;   Screen Line Link Table (address table HI)
		ORA #$80				;   Make sure HI BIT is set
		STA ScrPtr + 1				;   Set up pointer HI for screen scrolling

		CPX #(ROWS-1)				;   Second Last Line? (usually 24)
		BCS WSU_ClearLastRow			;   Yes, so skip ahead to exit loop
		LDY LineLinkTable + 1,X			;   No, so get NEXT Line's Line Link entry
		BMI WSU_SKIP1				;   is HI BIT set? Yes, leave it as is and skip ahead
		AND #$7F				;   No, then CLEAR HI BIT

WSU_SKIP1	STA LineLinkTable,X			;   Store it in the CURRENT Line Link entry (IE scroll the high bits UP)
		TYA
		ORA #$80				;   Set HI BIT
		STA SAL + 1				;   $C8
		LDA Line_Addr_Lo + 1,X			;   Screen line address LO table from ROM
		STA SAL    				;   Set screen line pointer LO

!IF COLOURPET=1 { JSR ColourPET_SyncPointers }			;   Sync both colour screen pointers

;[E3F9]		--------------------------------------- Now we scroll the screen line (characters and colour)

!IF SS40=0 {	LDY #COLUMNS-1				;   Hard-coded Screen Width
    } ELSE {	LDY SCNWIDTH				;   Soft Screen Width
     		DEY }					;   Subtract 1

WSU_LOOP3	LDA (SAL),Y 				;   LOOP[[  Read character from screen
		STA (ScrPtr),Y 				;     Write it back
!IF COLOURPET = 1 {
		LDA (ColourSAL),Y			;     Read colour from screen
		STA (ColourPtr),Y			;     Write it back
}
		DEY					;     Next character
		BPL WSU_LOOP3				;   ]] Loop back for more
		BMI WSU_LOOP2				; ] Loop back for more

;[E404]		---------------------------------------

WSU_ClearLastRow
		STA LineLinkTable,X			; Store to Screen Line Link Table
!IF COLOURPET=1 { JSR ColourPET_SyncPointers }			;   Sync both colour screen pointers

;[E406]		--------------------------------------- Clear Characters on the last line

!IF SS40=0 {	LDY #COLUMNS-1				;   Hard-coded Screen Width
    } ELSE {	LDY SCNWIDTH				;   Soft Screen Width
		DEY }					;   Subtract 1

		LDA #$20				; <SPACE>

WSU_LOOP4	STA (ScrPtr),Y 				; LOOP[  Write <SPACE> to the screen
		DEY					;   Next character
		BPL WSU_LOOP4				; ] Loop back for more

;		--------------------------------------- Clear Colour on the last line

!IF COLOURPET = 1 {

	!IF SS40=0 {	LDY #COLUMNS-1			;   Hard-coded Screen Width
	    } ELSE {	LDY SCNWIDTH			;   Soft Screen Width
			DEY }				;   -1

		LDA ColourV				; Colour Value

WSU_COLOUR	STA (ColourPtr),Y			; LOOP[ Write it
		DEY					;       Next character
		BPL WSU_COLOUR				; ] Loop back for more
}

		DEC CursorRow   			; Point to the previous screen ROW
		LDA LineLinkTable			; Screen Line Link Table
		BPL WSU_LOOP1				; ] Loop back for more

;		--------------------------------------- Relocation fix
!IF COLOURPET = 1 { JMP CHECK_SCROLL_CONTROL }		; If relocated jump back to continue
