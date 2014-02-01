; PET/CBM EDIT ROM - Soft Reboot (C)2013 Steve J. Gray
; ================
; Soft Reboot - Hold down a combination of keys to reset the computer.
; The RebootCodes table holds 10 values, one for each keyboard ROW. All
; values must match to trigger the reset. Note the values are RAW Keyboard
; column bits NOT PETSCII. When a key is DOWN the bit in that column is ZERO.
; IE, $FF means NO keys are down. Do not fill table with all $FF's or the 
; machine will reboot constantly.

CheckReboot
		LDY #9					; ROW=9
CheckLoop
		STY PIA1_Port_A 			; Keyboard row select
		LDA PIA1_Port_B				; Keyboard col - keypressed
		CMP RebootCodes,Y
		BNE CheckOut				; Exit if no match
		DEY					; ROW=ROW-1
		BPL CheckLoop				; Get more if not <0

		JMP ($FFFC)				; All keys match, so reset!

CheckOut	RTS

RebootCodes
;		----------------- Normal/Graphic Keyboard: @-SHIFT-SHIFT-DEL
!if (KEYBOARD=0) OR (KEYBOARD=5) {
		!byte $ff	; ROW 0 - No keys
		!byte $7f	; ROW 1 - <DEL>
		!byte $ff	; ROW 2 - No keys
		!byte $ff	; ROW 3 - No keys
		!byte $ff	; ROW 4 - No keys
		!byte $ff	; ROW 5 - No keys
		!byte $ff	; ROW 6 - No keys
		!byte $ff	; ROW 7 - No keys
		!byte $dc	; ROW 8 - @ + Both Shifts
		!byte $ff	; ROW 9 - No keys
}

;		----------------- Business Keyboard: To be determined
!if (KEYBOARD=1) OR (KEYBOARD=4) {
		!byte $0	; ROW 0 - No keys
		!byte $0	; ROW 1 - No keys
		!byte $0	; ROW 2 - No keys
		!byte $0	; ROW 3 - No keys
		!byte $0	; ROW 4 - No keys
		!byte $0	; ROW 5 - No keys
		!byte $0	; ROW 6 - No keys
		!byte $0	; ROW 7 - No keys
		!byte $0	; ROW 8 - No keys
		!byte $0	; ROW 9 - No keys
}

;		----------------- DIN Keyboard: To be determined
!if KEYBOARD=2 { 
		!byte $0	; ROW 0 - No keys
		!byte $0	; ROW 1 - No keys
		!byte $0	; ROW 2 - No keys
		!byte $0	; ROW 3 - No keys
		!byte $0	; ROW 4 - No keys
		!byte $0	; ROW 5 - No keys
		!byte $0	; ROW 6 - No keys
		!byte $0	; ROW 7 - No keys
		!byte $0	; ROW 8 - No keys
		!byte $0	; ROW 9 - No keys
}

;		--------------- C64 Keyboard: To be determined
!if KEYBOARD=3 { 
		!byte $0	; ROW 0 - No keys
		!byte $0	; ROW 1 - No keys
		!byte $0	; ROW 2 - No keys
		!byte $0	; ROW 3 - No keys
		!byte $0	; ROW 4 - No keys
		!byte $0	; ROW 5 - No keys
		!byte $0	; ROW 6 - No keys
		!byte $0	; ROW 7 - No keys
		!byte $0	; ROW 8 - No keys
		!byte $0	; ROW 9 - No keys
}
