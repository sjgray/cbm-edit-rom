;*********************************************************************************************************
;** WIN_CLEAR  [$E042]  (Called from Jump Table) 
;** This routine clears the screen. Since there is no windowing it clears EVERY byte in the screen memory,
;** including non-visible bytes. It also calculates the HI byte of the start of each screen line and
;** stores it into the Screen Line Link table. LO bytes are stored in ROM at $E798. These addresses are
;** used for printing to the screen. Entries with HI BIT CLEARED are linked to the line above it.
;*********************************************************************************************************
; This routine will be placed at $E042 for normal options, however when Soft40 is enabled ("SS40"=1) it
; is too big to fit and will cause a "too much code generated" error so it must be relocated.
; There should be enough space just before $E600.

FULL_SCREEN 	; This codebase does not have windowing, so this label is needed for Soft40 compatibility

WIN_CLEAR	LDX #ROWS-1				; Start at the bottom of the screen (25-1=24 lines)

!IF SS40=0 {						; If switchable then we need to check screen mode to properly set address of last line

 !IF COLUMNS=40 {LDA #$C0				; $83C0 = First character on last line of 40-col screen
		 LDY #$83}
 !IF COLUMNS=80 {LDA #$80				; $8780 = First character on last line of 80-col screen
		 LDY #$87}
} ELSE {						; Yes, so check current mode
		LDA SCNWIDTH				; Get current Soft Screen Width
		CMP #40					; Is it >40 column mode?
		BCS WC80				; Yes, skip
		LDA #$C0				; $83C0 = First character on last line of 40-col screen
		LDY #$83	
		BCC WCLOOP				; Skip over 80 col
WC80		LDA #$80				; $8780 = First character on last line of 80-col screen
		LDY #$87	
}

WCLOOP		STY LineLinkTable,X			; LOOP[      Save HI byte of screen address to table
		SEC					;

!IF SS40=0 {	SBC #COLUMNS				;   Subtract Hard-coded Screen Width (one physical line)
    } ELSE {    SBC SCNWIDTH }				;   Subtract Soft Screen Width

		BCS WCSKIP1				;   did we move past page? No, skip ahead
		DEY					;   Yes, next page
WCSKIP1		DEX					;   Previous line
		BPL WCLOOP				; ] Loop up for more

		STY ScrPtr+1				; Store in screen pointer HI
		INX					; X=0
		STX ReverseFlag    			; Clear RVS Flag
		STX ScrPtr    				; Store 0 to screen Pointer LO (pointer should point to $8000 - HOME position)

;[$E05A]	------------------------------- Clear all Screen Memory 

		LDA #$20				; <SPACE>
CLS_LOOP	STA SCREEN_RAM,X			; LOOP[  Screen RAM page 1
		STA SCREEN_RAM+$100,X			;        Screen RAM page 2
		STA SCREEN_RAM+$200,X			;        Screen RAM page 3
		STA SCREEN_RAM+$300,X			;        Screen RAM page 4 (this also clears non-visible)

!IF (COLUMNS >40) OR (SS40=1) {
		STA SCREEN_RAM+$400,X			;        Screen RAM page 5
		STA SCREEN_RAM+$500,X			;        Screen RAM page 6
		STA SCREEN_RAM+$600,X			;        Screen RAM page 7
		STA SCREEN_RAM+$700,X			;        Screen RAM page 8
}
		INX					;   Next position
		BNE CLS_LOOP				; ] Loop back for more

!IF (COLOURPET=1) {
		JSR ClearColourRAM
}

