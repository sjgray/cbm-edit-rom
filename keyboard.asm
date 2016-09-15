; PET/CBM EDIT ROM - Keyboard Matrix Selection
; ================
; This adds the appropriate keyboard matrix or matrices depending on options:
; KEYSCAN=n  -- which keyboard scanning routine is used
; KEYBOARD=n -- to select the matrix layout
;
; Note: Not all keyboards are defined for all options! Please check source
;------------------------------------------------------------------------------

;-------------- Graphic (Normal) Keyboard Scanner - Simple

!if KEYSCAN=0 {
		!if KEYBOARD= 0 { !source "kbd-n.asm" }
		!if KEYBOARD= 1 { !source "kbd-b.asm" }		; QWERTY layout
		!if KEYBOARD= 2 { !source "kbd-din1.asm" }
		!if KEYBOARD= 3 { !source "kbd-c64.asm" }
		!if KEYBOARD= 4 { !source "kbd-bsjg.asm" }	; Modified layout
		!if KEYBOARD= 5 { !source "kbd-nsjg.asm" }	; @ replaced by ESC
		!if KEYBOARD= 6 { !source "kbd-bz.asm" }	; QWERTZ layout
		!if KEYBOARD= 7 { !source "kbd-ba.asm" }	; AZERTY layout (french)
		!if KEYBOARD= 8 { !source "kbd-cbm2.asm" }	; CBM-II layout (requires hardware mod)
}

;--------------  Business Keyboard Scanner - Simple with code for specific shifted keys

!if KEYSCAN=1 {
		!if KEYBOARD= 0 { !source "kbd-n.asm" }
		!if KEYBOARD= 1 { !source "kbd-b.asm" }		; QWERTY layout
		!if KEYBOARD= 2 { !source "kbd-din1.asm" }
		!if KEYBOARD= 3 { !source "kbd-c64.asm" }
		!if KEYBOARD= 4 { !source "kbd-bsjg.asm" }	; Modified layout
		!if KEYBOARD= 5 { !source "kbd-nsjg.asm" }	; @ replaced by ESC
		!if KEYBOARD= 6 { !source "kbd-bz.asm" }	; QWERTZ layout
		!if KEYBOARD= 7 { !source "kbd-ba.asm" }	; AZERTY layout (french)
		!if KEYBOARD= 8 { !source "kbd-cbm2.asm" }	; CBM-II layout (requires hardware mod)
}

;-------------- Extended Keyboard Scanner - Two Tables (Normal and Shifted)

!if KEYSCAN=2 {
		!if KEYBOARD= 0 { !source "kbdx-n.asm" }
		!if KEYBOARD= 1 { !source "kbdx-b.asm" }	; QWERTY layout
		!if KEYBOARD= 2 { !source "kbdx-din.asm" }
		!if KEYBOARD= 3 { !source "kbdx-c64.asm" }
		!if KEYBOARD= 4 { !source "kbdx-bsjg.asm" }	; Modified layout
		!if KEYBOARD= 5 { !source "kbdx-nsjg.asm" }	; @ replaced by ESC
		!if KEYBOARD= 6 { !source "kbdx-bz.asm" }	; QWERTZ layout
		!if KEYBOARD= 7 { !source "kbdx-ba.asm" }	; AZERTY layout (french)
		!if KEYBOARD= 8 { !source "kbdx-cbm2.asm" }	; CBM-II layout (requires hardware mod)
}
