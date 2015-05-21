; PET/CBM EDIT ROM - CRTC Programming for Text/Graphics Screen Modes
; ================
; Programms the CRTC controller chip for various screen timings and Text/Graphic modes.
; This code requires two CRTC Register tables - One for Text and one for Graphics modes.


;************** Set Screen to TEXT or GRAPHICS MODE
;
; TEXT/GRAPHICS mode determines which font is displayed.
; - GRAPHICS mode has uppercase and full graphics. Characters take 8 scanlines
; - TEXT mode has lower case, upper case and limited graphics. Characters take 10 scanlines (normally)
; 
; OPTIONS: 'EXTENDED' and 'SS40'

;-------------- Initialize CRTC to TEXT Mode (Called from Jump Table)

CRT_SET_TEXT

!if EXTENDED=0 {
	!IF SS40=0 {
		LDA #<CRT_CONFIG_TEXT			; Point to CRTC Table
		LDX #>CRT_CONFIG_TEXT			; Point to CRTC Table
		LDY #$0E				; Character Set = TEXT
		BNE CRT_PROGRAM
	} ELSE {
		JMP CRT_SET_GRAPHICS_SS40		; Jump to SS40 version (upper rom)
	}
}

!IF EXTENDED=1 {
		JMP CRT_SET_TEXT_EXT			; Jump to EXTENDED version (upper rom)
		NOP
		NOP
		NOP
		NOP
		NOP
}

;-------------- Initialize CRTC to GRAPHICS Mode (Called from Jump Table)

CRT_SET_GRAPHICS

!if EXTENDED=0 {
	!IF SS40=0 {
		LDA #<CRT_CONFIG_GRAPHICS       	; Point to CRTC Table
		LDX #>CRT_CONFIG_GRAPHICS       	; Point to CRTC Table
		LDY #$0C				; Character Set = GRAPHICS
	} ELSE {
		JMP CRT_SET_GRAPHICS_SS40		; Jump to SS40 version (upper rom)
	}
}
!IF EXTENDED=1 {
		JMP CRT_SET_GRAPHICS_EXT		; Jump to EXTENDED version (upper rom)
		NOP
		NOP
		NOP
}

;************** Program CRTC chip for selected screen MODE (Called from Jump Table)
;
; The CRTC controller controls the parameters for generating the display on the monitor. The CRTC chip has
; several registers that must be set properly according to the type of connected display. These set characters on the line,
; left and right margins, lines on the screen, height of each line and positioning of the top of the screen.
; The parameters are read from a table and written to the CRTC controller chip. The VIA chip is used to select which of the
; two fonts from the CHARACTER ROM is used.
;
; Parameters: Table pointer in A/X, CHRSET in Y
; OPTIONS: 'SS40' uses new routine in upper rom

CRT_PROGRAM

!IF SS40=0 {
;		--------------------- Set 'Character Set'

		STA SAL					; Pointer LO: Tape Buffer/ Screen Scrolling
		STX SAL+1				; Pointer HI
		LDA VIA_PCR				; Get current register byte VIA Register C - CA2	CHIP 
		AND #$f0				; mask out lower nibble
		STA FNLEN				; save it to Temp Variable
		TYA					; Move 'Character Set' byte to A
		ORA FNLEN				; update lower nibble in Temp Variable
		STA VIA_PCR				; write it back to VIA Register C - CA2			CHIP

;		--------------------- Write to the CRTC controller

		LDY #$11				; Number of bytes to copy = 17

Be09b		LDA (SAL),Y				; Pointer: Tape Buffer/ Screen Scrolling
		STY CRT_Address				; Select the register to update 6545/6845 CRT		CHIP
		STA CRT_Status				; Write to the register
		DEY
		BPL Be09b				; loop for more
		RTS
} ELSE {
		JMP CRT_PROGRAM_SS40			; Jump to Switchable Soft-40 version (upper rom)
}
