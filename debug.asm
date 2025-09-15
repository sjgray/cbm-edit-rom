; PET/CBM Editor ROM Project - Displays DEBUG info to screen during IRQ
; ==========================   DEBUG.ASM
;
; IRQ DEBUG code - Memory dump during IRQ to screen.
; Displays memory as specified in DEBUGMEM setting.
; Increments the first character of the line for each IRQ.
;
; This will place debug information BELOW the last screen line, which is
; normally not visible. You MUST set the REFRESH setting to 26 or 27
; to make this line visible (ie: 26 lines)!
;  * 40   column screens have 24 extra bytes.
;  * 80   column screens have 48 extra bytes.
;  * 8296 have a 4K+ screen RAM so can use 80 extra bytes.
;
; NOTE: This will allow you to watch memory updates in real time. However,
;       this will slow down the machine a little bit and might interfere in
;	any time-critical operations like TAPE or IEEE transfers.
;
; The main PET IRQ routine should save and restore all registers so there is
; no need to push anything onto the stack in your own code.
;
; IRQ Memory DEBUG - IRQMEM = Start Address, IRQBYTES = how many to show.
;
;===================================================================================

IRQ_Debug

!IF IRQBYTES >0 {
	LDY #IRQBYTES-1		; Number to show (ie: 23,47,79)
IDbLoop
	LDA IRQMEM,Y		; [ Read from source memory
	STA DBLINE+1,Y		;   Write to DEBUG LINE starting from 2nd character
	DEY			;   Decrement index
	BPL IDbLoop		; ] Loop for more
}

; Put additional debug stuff below. Any characters not used for IRQ could be
; used to monitor other specific memory locations here
;------------------------------------------------------------------------------

!IF COLOURPET >0 {
	LDA ScrPtr
	STA DBLINE+3
	LDA ColourPtr
	STA DBLINE+4
	LDA ScrPtr+1
	STA DBLINE+5
	LDA ColourPtr+1
	STA DBLINE+6
	LDA ColourSAL
	STA DBLINE+7
	LDA ColourSALHI
	STA DBLINE+8
}

;------------------------------------------------------------------------------

	RTS
