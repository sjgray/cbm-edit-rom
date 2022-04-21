; PET/CBM EDIT ROM - Keyboard Matrix Selection
; ================
; This adds the appropriate keyboard matrix or matrices depending on options:
; KEYSCAN=n  -- which keyboard scanning routine is used
; KEYBOARD=n -- to select the matrix layout
;
; Note: Not all keyboards are defined for all options! Please check source
;------------------------------------------------------------------------------

!if KEYSCAN=0 { !source "keyboard-tables1.asm" }	; Graphic (Normal) Keyboard Scanner - Simple
!if KEYSCAN=1 { !source "keyboard-tables1.asm" }	; Business Keyboard Scanner - Simple with code for specific shifted keys
!if KEYSCAN=2 { !source "keyboard-tables2.asm" }	; Extended Keyboard Scanner - Two Tables (Normal and Shifted)
!if ((CODEBASE>0) & (KEYSCAN=3)) { 
		!source "keyboard-tables3.asm" }	; C64 keyboard tables (only on newer codebases; put in ext space on codebase 0)
