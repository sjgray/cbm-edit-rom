; PET/CBM EDIT ROM   Switchable Soft-40
; ================
; Switchable Soft-40 allows the computer to switch from "real" 80-column mode to
; a simulated 40-column mode and back again. This module is included when 'SS40=1'
;
; To implement SS40 we need to fix the following routines:
; * CRT_SET_TEXT	- Set TEXT mode
; * CRT_SET_GRAPHICS	- Set GRAPHICS mode
; * CRT_PROGRAM		- Programs the CRTC controller chip
; * FULL_SCREEN_WINDOW	- Sets the screen dimensions (Usually hardcoded to 80x25 or 40x25)
; * UPDATE_CURSOR_ROW   - Sets screen pointers
;
; ZP Usage:
; * SCNWIDTH = $f2					; 40 or 80

;************** Init Switchable Soft-40

SS40_INIT80
		LDA #80					; Set 80 column mode
		STA SCNWIDTH				; Store it
		RTS
SS40_INIT40
		LDA #40					; Set 40 column mode
		STA SCNWIDTH				; Store it
		RTS

;************* Set Screen to TEXT or GRAPHICS MODE

CRT_SET_TEXT_SS40
		LDY #$0E				; Character Set = TEXT
		BNE CRT_SET_SS40
CRT_SET_GRAPHICS_SS40
		LDY #$0C				; Character Set = GRAPHICS

CRT_SET_SS40
		LDA SCNWIDTH
		CMP #80
		BEQ CRT_SET_80

		LDA #<CRT_CONFIG_TEXT2			; Point to CRTC Table2 (40 column)
		LDX #>CRT_CONFIG_TEXT2			; Point to CRTC Table2
		BNE CRT_PROGRAM_SS40

CRT_SET_80
		LDA #<CRT_CONFIG_TEXT			; Point to CRTC Table (80 column)
		LDX #>CRT_CONFIG_TEXT			; Point to CRTC Table

;************** Program CRTC chip for selected screen MODE
; Parameters: Table pointer in A/X, CHRSET in Y

CRT_PROGRAM_SS40
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

SS40Loop	LDA (SAL),Y				; Pointer: Tape Buffer/ Screen Scrolling
		STY CRT_Address				; Select the register to update 6545/6845 CRT		CHIP
		STA CRT_Status				; Write to the register
		DEY
		BPL SS40Loop				; loop for more
		RTS


;************** Screen Line Pointers

SS40_Pointers
		RTS


;************** Additional Screen Line Address Tables

!SOURCE "screen2-40.asm"				; Add the Character RAM table
!IF COLOURPET=1 { !SOURCE "screen2-40c.asm" }		; Add the Colour RAM table

