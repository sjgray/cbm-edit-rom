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
; To switch between 40/80 column we also need to include ESC codes (ESC-X to switch)

;************** Init Switchable Soft-40

SS40_INIT80	LDA #80					; Set 80 column mode
		STA SCNWIDTH				; Store it
		RTS

SS40_INIT40	LDA #40					; Set 40 column mode
		STA SCNWIDTH				; Store it
		RTS

;************** Switch Modes

SS40_SwapModes
		LDA SCNWIDTH				; Check current screen width
		CMP #40					; Is it 40?
		BEQ SS40_SET80				; Yes, switch it to 80

SS40_SET40	JSR SS40_INIT40				; No, switch it to 40
		JMP SS40_DOIT

SS40_SET80	JSR SS40_INIT80				; Set to 80

SS40_DOIT	JSR CRT_SET_TEXT_SS40			; Program CRTC for Text mode
		JSR FULL_SCREEN_WINDOW			; Clear windows
		JSR WINDOW_CLEAR			; Clear the screen
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
;
; This routine looks at the current screen width then sets the
; screen line pointer from the appropriate table (40 or 80)

SS40_ScreenPointers
		LDA SCNWIDTH			; What is current screen width?
		CMP #40				; Is it 40?
		BEQ SS40_Pointer40		; Yes, skip down

SS40_Pointer80
		LDA Line_Addr_Lo,X		; Screen Line Addresses LO (80 column table)
		STA ScrPtr			; Pointer: Current Screen Line Address LO
		LDA Line_Addr_Hi,X		; Screen Line Addresses HI (80 column table)
		STA ScrPtr+1         		; Pointer: Current Screen Line Address HI
		RTS

SS40_Pointer40
		LDA Line_Addr_Lo2,X		; Screen Line Addresses LO (additional 40 column table)
		STA ScrPtr			; Pointer: Current Screen Line Address LO
		LDA Line_Addr_Hi2,X		; Screen Line Addresses HI (additional 40 column table)
		STA ScrPtr+1         		; Pointer: Current Screen Line Address HI
		RTS

;-------------- Sync Pointers - Current Line
;
; This takes the current line number in X and then uses the lookup tables
; to find the screen address of the start of the line and stores them
; in the Character pointers.

SS40_SyncPointersX
		LDA SCNWIDTH				; What is current screen width?
		CMP #40					; Is it 40?
		BEQ SS40_SPX40				; Yes, skip down
SS40_SPX80
		LDA Line_Addr_Lo,X			; Screen Line Addresses LO (80 COL)
		STA ScrPtr				; Pointer: Current Screen Line Address LO
		LDA Line_Addr_Hi,X			; Screen Line Addresses HI (80 COL)
		STA ScrPtr+1         			; Pointer: Current Screen Line Address HI
		RTS

SS40_SPX40
		LDA Line_Addr_Lo2,X			; Screen Line Addresses LO (40 COL)
		STA ScrPtr				; Pointer: Current Screen Line Address LO
		LDA Line_Addr_Hi2,X			; Screen Line Addresses HI (40 COL)
		STA ScrPtr+1         			; Pointer: Current Screen Line Address HI
		RTS


;-------------- Sync Pointers - Next Line
;
; This takes the current line number in X and then uses the lookup tables
; to find the screen address of the start of the NEXT line and stores them
; in the Character pointers.

SS40_SyncPointers
		LDA SCNWIDTH				; What is current screen width?
		CMP #40					; Is it 40?
		BEQ SS40_SP40				; Yes, skip down
SS40_SP80
		LDA Line_Addr_Lo+1,X			; Screen line address table LO + 1 (80 COL)
		STA SAL					; Pointer: Tape Buffer/ Screen Scrolling
		LDA Line_Addr_Hi+1,X			; Screen line address table HI + 1 (80 COL)
		STA SAL+1				; Pointer: Tape Buffer/ Screen Scrolling
		RTS

SS40_SP40
		LDA Line_Addr_Lo2+1,X			; Screen line address table LO + 1 (40 COL)
		STA SAL					; Pointer: Tape Buffer/ Screen Scrolling
		LDA Line_Addr_Hi2+1,X			; Screen line address table HI + 1 (40 COL)
		STA SAL+1				; Pointer: Tape Buffer/ Screen Scrolling
		RTS

;-------------- 

SS40_SyncPointers2
		LDA SCNWIDTH				; What is current screen width?
		CMP #40					; Is it 40?
		BEQ SS40_SP240				; Yes, skip down
SS40_SP280
		LDA Line_Addr_Lo-1,X			; Screen line address table LO + 1 (80 COL)
		STA SAL					; Pointer: Tape Buffer/ Screen Scrolling
		LDA Line_Addr_Hi-1,X			; Screen line address table HI + 1 (80 COL)
		STA SAL+1				; Pointer: Tape Buffer/ Screen Scrolling
		RTS

SS40_SP240
		LDA Line_Addr_Lo2-1,X			; Screen line address table LO + 1 (40 COL)
		STA SAL					; Pointer: Tape Buffer/ Screen Scrolling
		LDA Line_Addr_Hi2-1,X			; Screen line address table HI + 1 (40 COL)
		STA SAL+1				; Pointer: Tape Buffer/ Screen Scrolling
		RTS


;************** Additional CRTC Setup Table

		!if REFRESH = 0 { !source "crtc-ss40-50hz.asm" }
		!if REFRESH = 1 { !source "crtc-ss40-60hz.asm" }
		!if REFRESH = 2 { !source "crtc-ss40-pal.asm" }
		!if REFRESH = 3 { !source "crtc-ss40-ntsc.asm" }

;************** Additional Screen Line Address Tables
;
; The primary screen line table will be set to 80 column, so the additional
; table is for the 40 column screen

!SOURCE "screen2-40.asm"				; Add the Character RAM table

!IF COLOURPET=1 { !SOURCE "screen2-40c.asm" }		; Add the Colour RAM table

