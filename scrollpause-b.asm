; PET/CBM Editor ROM Project - Scroll Pause/Resume Control - B
; ==========================   SCROLLPAUSE-B.ASM
;
;--------------- Check Keyboard Scroll Control

iE40B		LDA PIA1_Port_B		; PIA#1, Register 2 - Keyboard COL input
iE40E		CMP #$FE        	; Is BIT 0 set? ie: key held down?
iE410		BNE iE420       	; no, skip scroll delay loop

;--------------- Scroll Delay and Pause

iE412		LDY #$00       		; Scroll delay
iE414		NOP
		DEX
		BNE iE414       	; Loop back
		DEY
		BNE iE414       	; Loop back

iE41B		LDY #$00        	; Clear keyboard buffer
		STY CharsInBuffer	; No. of Chars. in Keyboard Buffer (Queue)
iE41F		RTS

iE420		CMP #$DF        	; Is BIT 1 set? key held down?
		BNE iE41F       	; no, return
iE424		LDA PIA1_Port_B		; PIA#1, Register 2 - Keyboard ROW input
		CMP #$DF        	; Is BIT 1 set? key held down?
		BEQ iE424       	; yes, loop back
		CMP #$FF        	; no keys?
		BEQ iE424       	; yes, loop back
		BNE iE41B       	; return back up to clear buffer
