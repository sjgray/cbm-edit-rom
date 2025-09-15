; PET/CBM Editor ROM Project - CODEBASE 0 - Clearscreen Routine
; ==========================   EDITROM40CLS.ASM
;
; This routine clears the screen. Since there is no windowing it clears EVERY byte in the screen memory,
; including non-visible bytes. It also calculates the HI byte of the start of each screen line and
; stores it into the Screen Line Link table. LO bytes are stored in ROM at $E798. These addresses are
; used for printing to the screen. Entries with HI BIT CLEARED are linked to the line above it.
;
; This routine will be placed at $E042 for normal options, however when SS40 is enabled it is too big
; to fit and will cause a "too much code generated" error so it must be relocated.
; There should be enough space just before $E600.

;*********************************************************************************************************
;** WIN_CLEAR  [E042]  - Called from Jump Table
;*********************************************************************************************************
; This clears the screen and also generates a new line-link table, which also acts as the HI byte for the
; screen-line table. The LO bytes of the screen line table are in ROM.
; In the line-link table the HI BIT of each entry is used as a FLAG to indicate that the line is linked.
; So, supporting SS40 will require storing two screen addresses tables HI and LO and ignoring all bits in
; the line link table.

WIN_CLEAR
FULL_SCREEN	 					; This label is needed for SS40 and ESC code compatibility.
		LDX #(ROWS-1)				; Start at the bottom of the screen (25-1=24 lines)

;[E042]--------- First we have to figure out the first character on the LAST line of the screen

!IF SS40=0 {						; Not switchable so used FIXED columns
        !IF COLUMNS=40 {
                LDA #$C0				; $83C0 = First character on last line of 40-col screen
		LDY #$83 }
        !IF COLUMNS=80 {
                LDA #$80				; $8780 = First character on last line of 80-col screen
		LDY #$87 }
} ELSE {						; Switchable, so check current mode
		LDA SCNWIDTH				; Get current Soft Screen Width
		CMP #40					; Is it >40 column mode?
		BNE WCLR				; Yes, skip
		LDA #$C0				; $83C0 = First character on last line of 40-col screen
		LDY #$83
		BCC WCLOOP				; Skip over 80 col

WCLR		LDA #$80				; $8780 = First character on last line of 80-col screen
		LDY #$87
}

;[E048]-------- Fill in the Line-link Table with screen address HI bytes. HI bit of each entry is SET to indicate NO link

WCLOOP		STY LineLinkTable,X			; LOOP[      Save HI byte of screen address to table
		SEC					;

!IF SS40=0 {    SBC #COLUMNS }				;   Subtract Hard-coded Screen Width (one physical line)
!IF SS40=1 {    SBC SCNWIDTH }				;   Subtract Soft Screen Width

		BCS WCSKIP1				;   did we move past page? No, skip ahead
		DEY					;   Yes, next page
WCSKIP1		DEX					;   Previous line
		BPL WCLOOP				; ] If not at top of screen loop up for more

;[E053]-------- We are at HOME position so store HI pointer to screen pointer, clear Reverse flag.

		STY ScrPtr + 1				; Store in screen pointer HI (Should be $80)
		INX					; X=0
		STX ReverseFlag    			; Clear RVS Flag
		STX ScrPtr    				; Store 0 to screen Pointer LO (pointer should point to $8000 - HOME position)

;[E05A]-------- Clear all Screen Memory

		LDA #$20				; <SPACE>
CLS_LOOP
	        STA SCREEN_RAM,X			; LOOP[  Screen RAM page 0
		STA SCREEN_RAM + $100,X			;        Screen RAM page 1
		STA SCREEN_RAM + $200,X			;        Screen RAM page 2
		STA SCREEN_RAM + $300,X			;        Screen RAM page 3 (including non-visible)

	!IF (ROWS*COLUMNS > 1024) | (SS40=1) {		; ADDED For 80 column or SS40
		STA SCREEN_RAM + $400,X			;        Screen RAM page 4
		STA SCREEN_RAM + $500,X			;        Screen RAM page 5
		STA SCREEN_RAM + $600,X			;        Screen RAM page 6
		STA SCREEN_RAM + $700-48,X		;        Screen RAM page 7 (preserve non-visible)
	}
		INX					;   Next position
		BNE CLS_LOOP				; ] Loop back for more

;[E06B]Added--  Clear all Colour Memory

!IF COLOURPET=1 {
                LDA ColourV				; Colour Value (FG+BG)
CCLS_LOOP
		STA COLOUR_RAM,X			; LOOP[  Colour RAM page 0
		STA COLOUR_RAM + $100,X			;        Colour RAM page 1
		STA COLOUR_RAM + $200,X			;        Colour RAM page 2

	!IF (ROWS*COLUMNS > 1024) | (SS40=1) {		; For 80 column or SS40
		STA COLOUR_RAM + $300,X			;        Colour RAM page 3 (including non-visible)
		STA COLOUR_RAM + $400,X			;        Colour RAM page 4
		STA COLOUR_RAM + $500,X			;        Colour RAM page 5
		STA COLOUR_RAM + $600,X			;        Colour RAM page 6
		STA COLOUR_RAM + $700-48,X		;        Colour RAM page 7 (except non-visible)
	} ELSE {
		STA COLOUR_RAM + $300-24,X		;        Colour RAM page 3 (except non-visible)
	}

		INX					;   Next position
		BNE CCLS_LOOP				; ] Loop back for more
}

!IF (SS40+COLOURPET)>0 {
                JMP CURSOR_HOME }                       ; If relocated, jump back
