; PET/CBM Editor ROM Project - CODEBASE 0 (4000-series) Cursor_LM relocatable code.
; ==========================   EDITROM40LM.ASM

;*********************************************************************************************************
;** CURSOR_LM  [E071]	- This code will be relocated for ColourPET and when SS40=1.
;*********************************************************************************************************
; Moves Cursor to start of current line. Sets Screen-line pointer, and determines if line is linked.
; Sets Right Margin to proper virtual width (ie: 40 or 80) depending if line is linked.
; Writing to screen depends on these pointers being set correctly (including Colour if used).

CURSOR_LM	!IF DEBUG=1 {	INC DBLINE+4}

		LDX CursorRow   			; Get Current Cursor Physical Line Number
		LDA LineLinkTable,X			; Get Current Line's Screen Line Link HI
		ORA #$80				; Make sure HIGH bit is set
		STA ScrPtr + 1				; Store in Current Screen Line Address HI
		LDA Line_Addr_Lo,X			; Get the LO byte from table in ROM
		STA ScrPtr    				; Store to Current Screen Line Address LO

!IF SS40=0 {	LDA #COLUMNS - 1			; Fixed Screen Width -1
	} ELSE {
	        LDA SCNWIDTH				; Soft Screen Width
		SBC #1					; Subtract 1
	}
		STA RightMargin   			; Set Physical Screen Line Length
		CPX #ROWS - 1				; Line 24? (0-24) last line cannot be linked
		BEQ CLM_SKIP1				; Yes, skip ahead
		LDA LineLinkTable+1,X 			; Check next line in screen line link table
		BMI CLM_SKIP1  				; Is HIGH bit set? (negative value) Yes, so NO linked line
							; No, then line is linked (two screen lines)
!IF SS40=0 {	LDA #COLUMNS*2-1			; Fixed width for 2 linked screen lines.  ***** FIX for custom screen widths
	} ELSE {
		LDA SCNWIDTH				; Calculate width based on variable (SS40) screen width
		ASL					; Double it
		SBC #1					; Subtract 1
	}
		STA RightMargin   			; Store in Physical Screen Line Length
;[E08E]
CLM_SKIP1 	LDA CursorCol   			; Cursor Column on Current Line

!IF SS40=0 {    CMP #COLUMNS				; Is it greater than Fixed Screen Width?
	} ELSE {
		CMP SCNWIDTH				; Is it greater than SCNWIDTH?
	}
		BCC NOTSUPPORTED2			; No, skip

!IF SS40=0 {    SBC #COLUMNS				; Yes, subtract Fixed Screen Width
	} ELSE {
		SBC SCNWIDTH				; Yes, subtract SCNWIDTH
	}
		STA CursorCol   			; Cursor Column on Current Line

;-------------- Normal routine is done. This is where code would fall into NOTSUPPORTED's RTS code.

NOTSUPPORTED2						; This provides a jump point to end of routine when relocated (since NOTSUPPORTED will be in main code)

!IF COLOURPET=1		{ JSR ColourPET_SyncPointers}		; Sync colour prointers for scrolling
!IF (SS40+COLOURPET)>0	{ RTS }				; Jump back to normal code
