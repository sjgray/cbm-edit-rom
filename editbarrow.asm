; PET/CBM EDIT ROM - BackArrow Hack/Patch
; ================ - Adapted from 8096 edit rom found at World of Commodore 2015
;
TestBackArrow
		LDY KEYFLAGS		; Is it a Shifted Char?
		BEQ TestBAExit		; No, so exit and store key
		CMP #$5F		; Is it BackArrow key?
		BEQ ToggleScreen	; Yes, toggle the screen mode then RETURN (do not store key!)
TestBAExit	INX			; No, Increment character count
		STX CharsInBuffer	; Num Chars in Keyboard Buffer
		RTS

;------------------------------- Toggle the Screen Mode
; This toggles the screen from normal to graphic and back

ToggleScreen:
		LDA VIA_PCR 	; VIA PCR - Reg#C
		EOR #$02	; toggle bit 1 (graphic/text mode bit)
		STA VIA_PCR 	; VIA PCR - Reg#C
		RTS
