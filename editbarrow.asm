; PET/CBM EDIT ROM - BackArrow Hack/Patch
; ================ - Adapted from 8096 edit rom found at World of Commodore 2015
;
; The BACKACTION variable determines which action code is included:
; 0=Toggle Screen Text/Graphic Font
; 1=Toggle 40/80 Column Mode (either soft40 or hardware 40/80)

TestBackArrow
!IF KEYBOARD=0 {                        ; Graphics keyboard -> "@" as top left key
                                        ; Note: scanner clears KEYFLAGS, so can only be seen on bit 7 set
		CMP #$c0		; Is it (shifted) "@" key? (top left key).
					; NOTE: this is a graphics character. It will get discarded!

} ELSE {
                              		; others use left arrow as top left key
		LDY KEYFLAGS		; Is it a Shifted Char?
		BEQ TestBAExit		; No, so exit and store key
		CMP #$5F		; Is it BackArrow key?
}
		BEQ DoBackArrow		; Yes, perform the action then RETURN (do not store key!)

TestBAExit	INX			; No, treat it as a normal key and store it, then increment char count
		STX CharsInBuffer	; Num Chars in Keyboard Buffer
		RTS

;---------------------------------------- Do the action
; BACKACTION=0 to toggle Text/Graphics mode
; BACKACTION=1 to toggle 40/80 column

DoBackArrow:

!IF BACKACTION=0 {
		LDA VIA_PCR 		; VIA PCR - Reg#C
		EOR #$02		; toggle bit 1 (graphic/text mode bit)
		STA VIA_PCR 		; VIA PCR - Reg#C
		RTS
}

!IF BACKACTION=1 {
		JMP SS40_SwapModes	; Swap 40/80 mode
}
		