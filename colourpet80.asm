; PET/CBM Editor ROM Project - ColourPET routines for 80-column (CODEBASE 1/2)
; ==========================   COLOURPET80.ASM
;
; These are subroutines for manipulating colour memory for printing to the screen, moving memory
; for scrolling, inserting, deleteing characters etc.
;
; Routines: ColourPET_SyncPointers, ColourPET_Scroll_Left, ColourPET_Insert, ColourPET_Scroll_Dest
;           ColourPET_Erase_To_EOL, ColourPET_PutChar_at_Cursor, Restore_Colour_at_Cursor
;
;*********************************************************************************************************
; Sync Pointers - Current Line
;*********************************************************************************************************
; This takes the current line number in X and then uses the lookup tables
; to find the screen and colour ram address of the start of the line and stores them
; in the Character and Colour pointers.

ColourPET_SyncPointersX
		STA ScrPtr				; Pointer: Current Screen Line Address LO
!IF (CODEBASE=0) {
		LDA CLine_Addr_Hi,X			; Screen Line Addresses HI
		AND #%11110111
} ELSE {
		LDA Line_Addr_Hi,X			; Screen Line Addresses HI
}

		STA ScrPtr+1         			; Pointer: Current Screen Line Address HI

		LDA CLine_Addr_Lo,X			; Colour Screen Line Addresses LO
		STA ColourPtr				; Colour Pointer: Current Screen Line Address LO
		LDA CLine_Addr_Hi,X			; Colour Screen Line Addresses HI
		STA ColourPtr + 1      			; Colour Pointer: Current Screen Line Address HI

		RTS

;*********************************************************************************************************
; Sync Pointers - Next Line
;*********************************************************************************************************
; This takes the current line number in X and then uses the lookup tables
; to find the screen and colour ram address of the start of the NEXT line and stores them
; in the Character and Colour pointers.

ColourPET_SyncPointers

!IF (CODEBASE=0) {
		LDA CLine_Addr_Hi+1,X			; Screen Line Addresses HI
		AND #%11110111
} ELSE {
		LDA Line_Addr_Hi+1,X			; Screen Line Addresses HI
}
		STA SAL+1				; Pointer: Tape Buffer/ Screen Scrolling

		LDA CLine_Addr_Lo+1,X     		; Screen Line address table LO + 1
		STA ColourPtr2				; Second Colour RAM Pointer
		LDA CLine_Addr_Hi+1,X 			; Screen Line address table HI + 1
		STA ColourPtr2 + 1			;
		RTS

ColourPET_SyncPointers2
		LDA Line_Addr_Lo-1,X			; Screen line address table LO - 1
		STA SAL					; Pointer: Tape Buffer/ Screen Scrolling
!IF (CODEBASE=0) {
		LDA CLine_Addr_Hi-1,X			; Screen Line Addresses HI
		AND #%11110111
} ELSE {
		LDA Line_Addr_Hi-1,X			; Screen Line Addresses HI
}
		STA SAL+1				; Pointer: Tape Buffer/ Screen Scrolling

		LDA CLine_Addr_Lo-1,X     		; Screen Line address table LO - 1
		STA ColourPtr2				; Second Colour RAM Pointer
		LDA CLine_Addr_Hi-1,X 			; Screen Line address table HI - 1
		STA ColourPtr2 + 1			;
		RTS


;*********************************************************************************************************
; Scroll Left
;*********************************************************************************************************

ColourPET_Scroll_Left
CPSL1		INY
		LDA (ScrPtr),Y				; Read Character from Screen RAM
		DEY					; move to the left
		STA (ScrPtr),Y				; Write Character to Screen RAM
		INY
		LDA (ColourPtr),Y			; Read Colour from Colour RAM	@@@@@@@@@@@@@@ ColourPET
		DEY					; move to the left
		STA (ColourPtr),Y			; Write Colour to Colour RAM	@@@@@@@@@@@@@@ ColourPET
		INY
		CPY RightMargin
		BNE CPSL1
		RTS

;*********************************************************************************************************
; Insert
;*********************************************************************************************************
ColourPET_Insert
CPI1		DEY
		LDA (ScrPtr),Y				; Read Character from Screen RAM
		INY					; move to the left
		STA (ScrPtr),Y				; Write Character to Screen RAM
		DEY
		LDA (ColourPtr),Y			; Read Colour from Colour RAM	@@@@@@@@@@@@@@ ColourPET
		INY					; move to the left
		STA (ColourPtr),Y			; Write Colour to Colour RAM	@@@@@@@@@@@@@@ ColourPET
		DEY
		CPY CursorCol
		BNE CPI1

		LDA ColourV				; Current Colour              	@@@@@@@@@@@@@@ COLOURPET
		STA (ColourPtr),Y			; Write it to the Colour RAM	@@@@@@@@@@@@@@ COLOURPET

		RTS

;*********************************************************************************************************
; Copy Character and Colour from SOURCE to DEST
;*********************************************************************************************************

ColourPET_Scroll_Dest
		LDA (SAL),Y				; Read Character from Screen SOURCE
		STA (ScrPtr),Y				; Write it to Screen DESTINATION
		LDA (ColourPtr2),Y			; Read Colour from Colour RAM SOURCE	@@@@@@@@@@@@@@@ COLOURPET
		STA (ColourPtr),Y			; Write it to Screen DESTINATION	@@@@@@@@@@@@@@@ COLOURPET
		RTS

;*********************************************************************************************************
; Erase to End of Line
;*********************************************************************************************************
; Clears ONE line on the screen from current cursor to RIGHT margin
; Called from WINDOW_CLEAR and WINDOW_SCROLL_UP.
; Replaces equivilent non-colour routine.
; Must not modify X since it is used as a line counter in WINDOW_CLEAR.

ColourPET_Erase_To_EOL
		TYA					; Save the Current offset
		PHA					; to the stack

		LDA #$20 				; <SPACE>
CEOL		INY					; next character
		STA (ScrPtr),Y				; Pointer: Current Screen Line Address @@@@@@@@@@@@@@ ColourPET
 		CPY RightMargin
		BCC CEOL				; loop up for more

		PLA					; Pull the offset from the stack
		TAY					;

		LDA ColourV				; The current colour
CEOL2		INY					; Next colour ram location
		STA (ColourPtr),Y			; Clear Colour RAM
		CPY RightMargin
		BCC CEOL2				; loop up for more
		RTS

;*********************************************************************************************************
; Writes the NEW Character and Colour to the Screen
;*********************************************************************************************************
ColourPET_PutChar_at_Cursor
		PHA				; Save the character
		LDY CursorCol			; Cursor Column on Current Line
		LDA ColourV			; Current Colour Attribute
		STA (ColourPtr),Y		; Put the Colour to ColourRAM
		PLA				; Restore the character
		LDY CursorCol			; Cursor Column on Current Line
		STA (ScrPtr),Y			; Put the character on the screen!!!!!!!!!!!!!!!!!!!!!
		LDA #2				; Set blink count so cursor appears immediately
		STA BLNCT			; Timer: Countdown to Toggle Cursor
		RTS

;*********************************************************************************************************
; Writes the OLD Colour at Cursor Position to the screen
;*********************************************************************************************************
Restore_Colour_at_Cursor
		PHA				; Push Character
		LDY CursorCol			; Cursor Column on Current Line
		LDA ColourV			; Get current Colour
		STA (ColourPtr),Y		; Set the Colour
		PLA				; Pull Character
		LDY CursorCol			; Cursor Column on Current Line
		STA (ScrPtr),Y			; Put the character on the screen!!!!!!!!!!!!!!!!!!!!!
		LDA #2				; Set blink count so cursor appears immediately
		STA BLNCT			; Timer: Countdown to Toggle Cursor
		RTS
