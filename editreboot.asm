; PET/CBM EDIT ROM - Soft Reboot (C)2013-2025 Steve J. Gray
; ================
; Soft Reboot - Hold down a combination of keys to reset the computer.
; The RebootCodes table holds 10 or 16 values, one for each keyboard ROW. All
; values must match to trigger the reset. Note the values are RAW Keyboard
; column bits NOT PETSCII. When a key is DOWN the bit in that column is ZERO.
; IE, $FF means NO keys are down. Do not fill table with all $FF's or the 
; machine will reboot constantly.
;
; OPTIONS: KEYBOARD selects reboot matrix

CheckReboot	; NOTE: We are scanning the matrix in REVERSE compared to EDITROM
		!IF KEYBOARD=8 {
			LDY #15				; ROW=15
		} ELSE {
			LDY #9				; ROW=9
		}
CheckLoop
		STY PIA1_Port_A 			; Keyboard row select
		LDA PIA1_Port_B				; Keyboard col - keypressed
		CMP RebootCodes,Y
		BNE CheckOut				; Exit if no match
		DEY					; ROW=ROW-1
		BPL CheckLoop				; Get more if not <0

		!IF UPET=1 {
			JMP RebootUPet
		} ELSE {
			JMP ($FFFC)			; All keys match, so reset!
		}

;-------------- We should leave ROW 9 selected on exit so that STOP key can be detected in KERNAL

CheckOut
		LDY #9					; Leave at last ROW
		STY PIA1_Port_A 			; Keyboard row select
		RTS

;-------------- Reboot Code Table
;
; Note: Rows are entered in reverse order compared to the keyboard matrix
; IMPORTANT!: Be aware of keyboard "ghosting", which means pressing multiple keys
; can sometimes cause other keys to appear pressed.

RebootCodes
;		----------------- Normal/Graphic Keyboard: @-SHIFT-SHIFT-DEL
!if (KEYBOARD=0) OR (KEYBOARD=5) OR (KEYBOARD=9) {
		!byte %11111111	; ROW 9 - No keys
		!byte %01111111	; ROW 8 - <DEL>
		!byte %11111111	; ROW 7 - No keys
		!byte %11111111	; ROW 6 - No keys
		!byte %11111111	; ROW 5 - No keys
		!byte %11111111	; ROW 4 - No keys
		!byte %11111111	; ROW 3 - No keys
		!byte %11111111	; ROW 2 - No keys
		!byte %11011100	; ROW 1 - @ + Both Shifts
		!byte %11111111	; ROW 0 - No keys
}

;		----------------- Business Keyboard: ESC-SHIFT-SHIFT-DEL
!if (KEYBOARD=1) OR (KEYBOARD=4) OR (KEYBOARD=6) OR (KEYBOARD=7) {
		!byte %11111111	; ROW 9
		!byte %11111111	; ROW 8
		!byte %10111110	; ROW 7 - (ghost), ESC
		!byte %11111111	; ROW 6
		!byte %01111111	; ROW 5 - DEL
		!byte %11111111	; ROW 4
		!byte %10111110	; ROW 3 - SHIFT, SHIFT
		!byte %11111111	; ROW 2
		!byte %11111111	; ROW 1
		!byte %11111111	; ROW 0
}

;		----------------- DIN Keyboard: ESC-SHIFT-SHIFT-DEL
!if KEYBOARD=2 { 
		!byte %11011111	; ROW 9 - DEL
		!byte %11111111	; ROW 8
		!byte %10111110	; ROW 7 - (ghost), ESC
		!byte %11111111	; ROW 6
		!byte %11111111	; ROW 5
		!byte %11111111	; ROW 4
		!byte %10111110	; ROW 3 - SHIFT, SHIFT
		!byte %11111111	; ROW 2
		!byte %11111111	; ROW 1
		!byte %11111111	; ROW 0
}

;		--------------- C64 Keyboard: CTRL-SHIFT-SHIFT-DEL
!if KEYBOARD=3 { 
		!byte %01111111	; ROW 9 - DEL
		!byte %11111111	; ROW 8
		!byte %11111110	; ROW 7 - CTRL
		!byte %11111101	; ROW 6 - SHIFT
		!byte %10111111	; ROW 5 - SHIFT
		!byte %11111111	; ROW 4
		!byte %11111111	; ROW 3
		!byte %11111111	; ROW 2
		!byte %11111111	; ROW 1 - row not connected
		!byte %11111111	; ROW 0 - row not connected
}

;		--------------- B modified Keyboard: ESC-SHIFT-SHIFT-DEL
!if KEYBOARD=4 { 
		!byte %11111111	; ROW 9
		!byte %11111111	; ROW 8
		!byte %11111111	; ROW 7
		!byte %11111111	; ROW 6
		!byte %11111111	; ROW 5
		!byte %11111111	; ROW 4
		!byte %10101110	; ROW 3 - SHIFT, (ghost), SHIFT
		!byte %11111111	; ROW 2
		!byte %11111111	; ROW 1
		!byte %10101110	; ROW 0 - (ghost), DEL, ESC
}

;		--------------- CBM-II Keyboard (16 ROWS): ?
;		Note: The CBM-II keyboard is 16x6. Two columns are not connected
;		TODO: Development is in progress; wiring is TBD
!if KEYBOARD=8 { 
		!byte %11111111	; ROW 15
		!byte %11111111	; ROW 14
		!byte %11111111	; ROW 13
		!byte %11111111	; ROW 12
		!byte %11111111	; ROW 11
		!byte %11111111	; ROW 10
		!byte %11111111	; ROW 9
		!byte %11111111	; ROW 8
		!byte %11111111	; ROW 7
		!byte %11111111	; ROW 6
		!byte %11111111	; ROW 5
		!byte %11111111	; ROW 4
		!byte %11111111	; ROW 3
		!byte %11111111	; ROW 2
		!byte %11111111	; ROW 1
		!byte %11111111	; ROW 0
}
