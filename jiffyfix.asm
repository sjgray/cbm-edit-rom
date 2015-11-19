; PET/CBM EDIT ROM - Jiffy Clock Timer Fix
; ================

;************** Correct Jiffy Clock Timer
; Patch for 50 Hz
; TODO: Analyze JIFFY CLOCK differences from older ROMs
; TODO: make selectable

!if CODEBASE<2 {
ADVANCE_TIMER
		JSR UDTIME			; Update System Jiffy Clock. KERNAL routine $FFEA
		INC JIFFY6DIV5			; Counter to speed TI by 6/5
		LDA JIFFY6DIV5			; Counter to speed TI by 6/5
		CMP #$06			; every 6 IRQ's
		BNE IRQ_NORMAL2			; no, jump back to IRQ routine
		LDA #$00      			; yes, reset counter
		STA JIFFY6DIV5			; Counter to speed TI by 6/5
		BEQ ADVANCE_TIMER		; re-do jiffy clock update
} ELSE {

ADVANCE_TIMER_CORR
		LDA #6
		STA JIFFY6DIV5
ADVANCE_TIMER
		JSR ADVANCE_JIFFY_CLOCK		; In EDITROMEXT file
		DEC JIFFY6DIV5
		BEQ ADVANCE_TIMER_CORR
		RTS
}
