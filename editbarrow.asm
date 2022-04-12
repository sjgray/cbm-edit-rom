; PET/CBM EDIT ROM - BackArrow Hack/Patch
; ================ - Adapted from 8096 edit rom found at World of Commodore 2015
;
; The BACKACTION variable determines which action code is included:
; 0=Toggle Screen Text/Graphic Font
; 1=Toggle 40/80 Column Mode (either soft40 or hardware 40/80)

TestBackArrow
		LDY KEYFLAGS		; Is it a Shifted Char?
		BEQ TestBAExit		; No, so exit and store key
		CMP #$5F		; Is it BackArrow key?
		BEQ DoBackArrow		; Yes, toggle the screen mode then RETURN (do not store key!)
TestBAExit	INX			; No, Increment character count
		STX CharsInBuffer	; Num Chars in Keyboard Buffer
		RTS

;--------------------------------------- Do the action

DoBackArrow:

;--------------------------------------- Toggle the Screen Mode
; This toggles the screen from normal to graphic and back
;
!IF BACKACTION=0 {
		LDA VIA_PCR 		; VIA PCR - Reg#C
		EOR #$02		; toggle bit 1 (graphic/text mode bit)
		STA VIA_PCR 		; VIA PCR - Reg#C
		RTS
}

;---------------------------------------- Toggle between 40/80 column
; This toggles the screen between 40 or 80 column mode (8032 models)
;
!IF BACKACTION=1 {
		JMP SS40_SwapModes	; Swap 40/80 mode
}
		