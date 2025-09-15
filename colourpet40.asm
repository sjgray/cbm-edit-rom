; PET/CBM Editor ROM Project - ColourPET routines for CODEBASE 0 (4000 series)
; ==========================   COLOURPET40.ASM 
;
; These are subroutines for manipulating colour memory for printing to the screen, moving memory
; for scrolling, inserting, deleteing characters etc.
;
; Routines: ColourPET_SyncPointers, ColourPET_Scroll_Left, ColourPET_Insert, ColourPET_Scroll_Dest
;           ColourPET_Erase_To_EOL, ColourPET_PutChar_at_Cursor

;*********************************************************************************************************
; Sync Pointers  [NEW]
;*********************************************************************************************************
; This takes the current screen pointers (ScrPtr and SAL) and copies them to the colour screen Pointers
; (ColourPrt and ColourSAL) and adjusts them for the colour offset (8 pages - 2K).
; NOTE: Make sure .X is not changed!

ColourPET_SyncPointers
		LDA ScrPtr         			; Get Current Screen Line LO
		STA ColourPtr				; Copy to Colour Pointer  LO
		LDA SAL         			; Get Current Screen Line LO
		STA ColourSAL				; Copy to Colour Pointer
		LDA ScrPtr+1				; Get Current Screen Line HI
		CLC
		ADC #8					; 8 pages offset $8000->$8800
		STA ColourPtr + 1			; Copy to Colour Pointer  HI

		LDA SAL+1				; Get Current Screen Line HI
		CLC
		ADC #8					; 8 pages offset $8000->$8800
		STA ColourSAL + 1			; Copy to Colour Pointer HI
		RTS

;*********************************************************************************************************
; Scroll Left / Delete character
;*********************************************************************************************************
; Scroll all characters LEFT from the cursor position to the end of the line...
; except if cursor is at the beginning of the line.

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

		STA (ColourPtr),Y			; Write Colour to Colour RAM	@@@@@@@@@@@@@@ ColourPET
		BNE CPSL1
		RTS

;*********************************************************************************************************
; Insert
;*********************************************************************************************************
; Inserts a SPACE at the current cursor position. All character and colour shifted right.

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

;		INY
;		LDA ColourV				; Current Colour              	@@@@@@@@@@@@@@ COLOURPET
;		STA (ColourPtr),Y			; Write it to the Colour RAM	@@@@@@@@@@@@@@ COLOURPET

		RTS

;*********************************************************************************************************
; Copy Character and Colour from SOURCE to DEST
;*********************************************************************************************************

ColourPET_Scroll_Dest
		LDA (SAL),Y				; Read from Screen SOURCE
		STA (ScrPtr),Y				; Write to  Screen DESTINATION
		LDA (ColourSAL),Y			; Read from Colour SOURCE	@@@@@@@@@@@@@@@ COLOURPET
		STA (ColourPtr),Y			; Write to  Colour DESTINATION	@@@@@@@@@@@@@@@ COLOURPET
		RTS

;*********************************************************************************************************
; Erase to End of Line
;*********************************************************************************************************
; Clears ONE line on the screen from current cursor to RIGHT margin
; Called from WINDOW_CLEAR and WINDOW_SCROLL_UP.
; Replaces equivalent non-colour routine.
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
CEOL2		INY					; Next colour RAM location
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
		STA (ScrPtr),Y			; Put the character on the screen!!!!!!!!!!!!!!!!!!!!!

		LDA #2				; Set blink count so cursor appears immediately
		STA BLNCT			; Timer: Countdown to Toggle Cursor
		RTS
