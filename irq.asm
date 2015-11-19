; PET/CBM EDIT ROM - IRQ Handler Routines
; ================
; The IRQ does the work of updating the clock/timer, checking interrupts and calling the keyboard scanner.


IRQ_MAIN
		PHA
		TXA
		PHA
		TYA
		PHA
		TSX
		LDA STACK+4,X
		AND #16
		BEQ Be452
		JMP (CBINV)	; Vector: BRK Instr. Interrupt [D478]
Be452		JMP (CINV)	; Vector: Hardware Interrupt   [E455] Points to 'IRQ_NORMAL'

;************** IRQ (Called from Jump Table)
; Normally: $E455

IRQ_NORMAL
		!IF IRQFIX=1 {
			JMP ADVANCE_TIMER		; was JSR ADVANCE_TIMER
		} ELSE {
			JSR UDTIME			; Update System Jiffy Clock. KERNAL routine $FFEA 			
		}

IRQ_NORMAL2						; ie458
		LDA Blink				; Cursor Blink enable: 0 = Flash Cursor
		BNE Be474				; skip it
		DEC BLNCT				; Timer: Countdown to Toggle Cursor
		BNE Be474				; skip it

;		----------------------------------------- BLINK THE CURSOR

		LDA #$14
!if REPEATOPT = 1 {
		BIT RPTFLG
		BPL ie468
		LDA #2					; make cursor blink immediately
}
ie468		STA BLNCT
		LDY CursorCol				; Column where cursor lives
		LSR BlinkPhase				; Is it blinking?
!IF COLOURPET=1 {
		LDX CursorColour			; Get colour
}
		LDA (ScrPtr),Y				; Get character from the screen
		BCS Be470				; Yes, skip

!IF COLOURPET=1 {
		TAX
		LDA (COLOURPTR),Y			; Get Colour at cursor
		STA CursorColour			; Save it
		TXA
}
		INC BlinkPhase				; count
		STA CursorChar				; Remember the character at cursor (to be restored when cursor moves)

Be470		EOR #$80				; Flip the reverse bit
		STA (ScrPtr),Y				; Put it back on the screen

!IF COLOURPET=1 {
		LDA COLOURV				; Get current colour
		STA (COLOURPTR),Y			; Write it
}

;		----------------------------------------- Check IEEE and Cassette status

Be474		LDY #0
		LDA PIA1_Port_A 			; Keyboard ROW select - PIA#1, Register 0
							; Upper bits: IEEE and Cassette
							; Lower bits: Keyboard ROW select

!if CODEBASE<2 {
		AND #$F0				; Mask off lower 4 bits (reset keyboard scan row)
		STA PIA1_Port_A				; Keyboard ROW select - PIA#1, Register 0				CHIP
		LDA PIA1_Port_A				; Keyboard ROW select - PIA#1, Register 0				CHIP
} 
!IF COLOURPET=0 {
		ASL					; Shift upper bits to lower 
		ASL 
		ASL 
		BPL Be487				; Is CASSETTE#1 Sense? No, skip

		STY CAS1				; Yes, Tape Motor Interlock #1
		LDA PIA1_Cont_B
		ORA #8					; Is CASSETTE#2 Sense?
		BNE Be490				; No, skip

Be487		LDA CAS1				; Yes, Tape Motor Interlock #1
		BNE Be493

		LDA PIA1_Cont_B
		AND #$f7				; Mask off bit 4
Be490		STA PIA1_Cont_B
Be493		BCC Be49e

		STY CAS2				; Tape Motor Interlock #2
		LDA VIA_Port_B
		ORA #16
		BNE Be4a7
Be49e		LDA CAS2				; Tape Motor Interlock #2
		BNE Be4aa
		LDA VIA_Port_B
		AND #$ef
Be4a7		STA VIA_Port_B
}

Be4aa		JSR SCAN_KEYBOARD			; Scan the keyboard

!if REBOOT=1 {  JSR CheckReboot }			; Check for soft reset ******* should this go above Be474?????????????????

		JMP IRQ_END				; Return from Interrupt

;