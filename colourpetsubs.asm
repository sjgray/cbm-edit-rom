; PET/CBM EDIT ROM - ColourPET Subroutines
; ================

!source "copyright-colourpet.asm"

ColourPET_SyncPointers
		LDA Line_Addr_Lo+1,X			; Screen line address table LO + 1
		STA SAL					; Pointer: Tape Buffer/ Screen Scrolling
		LDA Line_Addr_Hi+1,X			; Screen line address table HI + 1
		STA SAL+1				; Pointer: Tape Buffer/ Screen Scrolling

		LDA CLine_Addr_Lo-1,X     		; Screen Line address table LO - 1	@@@@@@@@@@@@@@@ COLOURPET
		STA COLOURPTR2				; Second Colour RAM Pointer		@@@@@@@@@@@@@@@ COLOURPET
		LDA CLine_Addr_Hi-1,X 			; Screen Line address table HI - 1	@@@@@@@@@@@@@@@ COLOURPET
		STA COLOURPTR2+1			;					@@@@@@@@@@@@@@@ COLOURPET
		RTS

ColourPET_Scroll_Left
CPSL1		INY
		LDA (ScrPtr),Y				; Read Character from Screen RAM
		DEY					; move to the left
		STA (ScrPtr),Y				; Write Character to Screen RAM
		INY
		LDA (COLOURPTR),Y			; Read Colour from Colour RAM	@@@@@@@@@@@@@@ ColourPET
		DEY					; move to the left
		STA (COLOURPTR),Y			; Write Colour to Colour RAM	@@@@@@@@@@@@@@ ColourPET
		INY
		CPY RigMargin
		BNE CPSL1
		RTS

ColourPET_Insert
CPI1		DEY
		LDA (ScrPtr),Y				; Read Character from Screen RAM
		INY					; move to the left
		STA (ScrPtr),Y				; Write Character to Screen RAM
		DEY
		LDA (COLOURPTR),Y			; Read Colour from Colour RAM	@@@@@@@@@@@@@@ ColourPET
		INY					; move to the left
		STA (COLOURPTR),Y			; Write Colour to Colour RAM	@@@@@@@@@@@@@@ ColourPET
		DEY
		CPY CursorCol
		BNE CPI1

		LDA COLOURV				; Current Colour              	@@@@@@@@@@@@@@ COLOURPET
		STA (COLOURPTR),Y			; Write it to the Colour RAM	@@@@@@@@@@@@@@ COLOURPET

		RTS

;--------------- Copy Character and Colour from SOURCE to DEST

ColourPET_Scroll_Dest
		LDA (SAL),Y				; Read Character from Screen SOURCE
		STA (ScrPtr),Y				; Write it to Screen DESTINATION
		LDA (COLOURPTR2),Y			; Read Colour from Colour RAM SOURCE	@@@@@@@@@@@@@@@ COLOURPET
		STA (COLOURPTR),Y			; Write it to Screen DESTINATION	@@@@@@@@@@@@@@@ COLOURPET
		RTS
