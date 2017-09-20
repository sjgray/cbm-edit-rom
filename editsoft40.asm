; PET/CBM EDIT ROM   Switchable Soft-40
; ================
;
; When 'SS40=1' module is included.
; When 'HARD4080=1' we use hardware 40/80 switching
; Memory location 'SCN4080BOARD' will be set to 1 in INIT routine when HARD4080 is set to 1.
;
; Switchable Soft-40 allows the computer to switch from 80 column to 40 column mode.
; This can be accomplished in two ways:
; 
; 1) Software Only: Programs the CRTC chip's registers. The screen is still 80 characters wide and the
;                   characters are still the same width, but the printable area is reduced by adjusting
;                   the left and right margins.
;
; 2) Hardware Mod:  An add-on board modifies the hardware to behave like "real" 40 or 80 columns. The width
;                   of the characters changes so that 40 column character are twice as wide as 80 column.
;                   Margins remain the same, and in fact, CRTC registers do not need to be modified. 
;
; To implement SS40 we need to fix the following routines:
;
; * CRT_SET_TEXT	- Set TEXT mode
; * CRT_SET_GRAPHICS	- Set GRAPHICS mode
; * CRT_PROGRAM		- Programs the CRTC controller chip
; * FULL_SCREEN_WINDOW	- Sets the screen dimensions (Usually hardcoded to 80x25 or 40x25)
; * UPDATE_CURSOR_ROW   - Sets screen pointers
;
; To switch between 40/80 column we also need to include ESC codes (ESC-X to switch)
;
; SCN4080BOARD low memory location will be set to "1" on powerup if board is installed.
; We can change this to "0" if we want to use the SOFTWARE method to do 40 columns.

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
		JSR FULL_SCREEN				; Clear windows
		JSR WIN_CLEAR				; Clear the screen
		RTS		


;************* Set Screen to TEXT or GRAPHICS MODE

CRT_SET_TEXT_SS40
		LDY #$0E				; Character Set = TEXT
		BNE CRT_SET_SS40
CRT_SET_GRAPHICS_SS40
		LDY #$0C				; Character Set = GRAPHICS

;************* Check 40/80 Mode 
; SCN4080BOARD low memory location will be set to "1" on powerup if board is installed.
; We can change this to "0" if we want to use the SOFTWARE method to do 40 columns.

CRT_SET_SS40	LDA SCN4080BOARD			; is the 40/80 hardware board installed?
		BNE CRT_SET_80				; Yes, use normal CRTC registers

;************** Check Screen Width

		LDA SCNWIDTH				; What is the width?
		CMP #80					; Is it 80?
		BEQ CRT_SET_80				; Yes, jump ahead

;************** Set CRTC Table pointers

CRT_SET_40	LDA #<CRT_CONFIG_TEXT2			; Point to CRTC Table2 (40 column)
		LDX #>CRT_CONFIG_TEXT2			; Point to CRTC Table2
		BNE CRT_PROGRAM_SS40

CRT_SET_80	LDA #<CRT_CONFIG_TEXT			; Point to CRTC Table (80 column)
		LDX #>CRT_CONFIG_TEXT			; Point to CRTC Table

;************** Program CRTC chip for selected screen MODE
; Parameters: Table pointer in A/X, CHRSET in Y

CRT_PROGRAM_SS40
;		--------------------- Set 'Character Set'

		STA MYZP				; Pointer LO
		STX MYZP+1				; Pointer HI
		LDA VIA_PCR				; Get current register byte VIA Register C - CA2	CHIP 
		AND #$f0				; mask out lower nibble
		STA FNLEN				; save it to Temp Variable
		TYA					; Move 'Character Set' byte to A
		ORA FNLEN				; update lower nibble in Temp Variable
		STA VIA_PCR				; write it back to VIA Register C - CA2			CHIP

;		--------------------- Write to the CRTC controller

		LDY #$11				; Number of bytes to copy = 17

SS40Loop	LDA (MYZP),Y				; Pointer
		STY CRT_Address				; Select the register to update 6545/6845 CRT		CHIP
		STA CRT_Status				; Write to the register
		DEY
		BPL SS40Loop				; loop for more

;************** Check if 40/80 Board is installed (and active)
; SCN4080BOARD low memory location will be set to "1" on powerup if board is installed.
; We can change this to "0" if we want to use the SOFTWARE method to do 40 columns.

		LDA SCN4080BOARD			; Is hardware 40/80 board installed?
		BEQ SS40_DONE				; No, we are done.

;************** Set 40/80 Board Control Line
;
; We will use the CRT Controller chip's TA11 line to control the hardware 40/80 switcher.
; Normally TA10 and TA11 are unconnected in a standard PET/CBM system.  When TA11 is 0 the board will switch
; to 80 column, when 1 it will be 40 column. These lines can be controlled by setting the bits of the CRTC
; register 12, which control the video memory start address. Video memory is 2K so only TA0-9 are used. The
; upper TA10-13 lines are used for special features. TA12 is the "REVERSE" line and is normally SET on 12"
; monitor PET/CBM's. TA13 is used for CHR OPTION, which enables the extended character sets.

		LDA SCNWIDTH				; Check screen width
		CMP #40					; Is it 40?
		BEQ SS40_HARD40				; Yes,

SS40_HARD80	LDA $16					; 40/80 Board Control line=0 (TA11, Pin 15)
		BNE SS40_SET_4080CONTROL

SS40_HARD40	LDA $16+$8				; 40/80 Board Control line=1 (TA11, Pin 15)

SS40_SET_4080CONTROL
		LDX #$0C				; CRTC Register 12 (Start Address HI byte)
		STX CRT_Address				; Select the Register
		STA CRT_Status				; Write the data - 40/80 Column mode will now be set!

SS40_DONE	RTS




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

;-------------- Sync Pointers2 - Previous Line

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

