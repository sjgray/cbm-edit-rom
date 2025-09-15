; PET/CBM Editor ROM Project - BackArrow Hack/Patch
; ==========================   EDITBARROW.ASM
;
; This is a hack to allow the SHIFT-BACKARROW key to perform quick changing
; of either the SCREEN MODE or 40/80 MODE depending on the BACKACTION setting.
;
; 0=Toggle Screen Text/Graphic Font
; 1=Toggle 40/80 Column Mode (either soft40 or hardware 40/80)
; Adapted from 8096 EDITROM found at World of Commodore 2015

;*********************************************************************************************************
;** Check for BackArrow key
;*********************************************************************************************************

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

;*********************************************************************************************************
;** Do BackArrow action
;*********************************************************************************************************
; BACKACTION=0 to toggle Text/Graphics mode
; BACKACTION=1 to toggle 40/80 column

DoBackArrow:

;-------------- Toggle Graphic/Text screen mode

!IF BACKACTION=0 {
		LDA VIA_PCR 		; VIA PCR - Reg#C
		EOR #$02		; toggle bit 1 (graphic/text mode bit)
		STA VIA_PCR 		; VIA PCR - Reg#C
}

;-------------- Toggle 40/80 mode

!IF BACKACTION=1 {
                !IF SS40=1 {JMP SS40_SwapModes }      ; Swap 40/80 mode
}

;-------------- Reset FG/BG colour to BYPASS colours
; Quick way to reset colours when FG/BG are the same or just want a known colour for CLS

!IF BACKACTION=2 {
        !IF COLOURPET=1 {
                LDA #(DEFAULTFG+16*DEFAULTBG) ;Current colour FG/BG value
                STA ColourV
        }
}

                RTS                     ; Needs to be here incase of bad settings!
