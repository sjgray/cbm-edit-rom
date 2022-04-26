; PET/CBM EDIT ROM - Steve J. Gray - Started: Nov 29/2013
; ================
; This is the main Assembler file. It brings in the USER-DEFINED variables and acts on them to build a
; functional EDITOR ROM.
;
;---------------------- Get User Variables and validate some settings, and set output file

	!SOURCE "edit.asm"						; Include USER-DEFINED variables
	!IF COLOURPET>0 { ESCCODES=1 }					; Make sure ESC Codes is ON if SS40 or COLOURPET is enabled
	!IF SS40=1      { SOFT40=0 }                         		; Make sure SOFT40 is OFF if SS40 is enabled

	!IF COLOURPET=0 { !TO "editrom.bin",plain }			; Generic output file with no load address
	!IF COLOURPET>0 { !TO "cpetrom.bin",plain }			; ColourPET output file with no load address

;---------------------- These are the symbol definitions for PET/CBM memory and IO chips

	!SOURCE "memzeropage.asm"					; $0000-00FF	Zero Page 
	!SOURCE "memlow.asm"						; $0100-03FC	Low Memory
	!SOURCE "memchips.asm"						; $E800-E8FF	Chips
	!SOURCE "memkernal.asm"						; $F000-FFFF	Kernal
	!SOURCE "membasic4.asm"						; BASIC

	!IF COLOURPET=1 { !SOURCE "memcpet.asm" }			; Non-standard memory usage (may change without notice)

;---------------------- Debug stuff

	DBLINE = SCREEN_RAM + 24 * COLUMNS				; Calculate bottom line of screen for debug

;=======================================================================
; Standard 2K Edit ROM code starts here
;=======================================================================
; $E000-E7FF are for normal Edit ROMS.
; The CODEBASE setting determines which BASE features are included,
; which roughly determines which machine they were targetted to.
; This area MAY include NEW code depending on SETTINGS. Some new code may
; require standard code to be relocated to EXT code area.

	!IF CODEBASE=0 {!SOURCE "editrom40.asm"}			; 40-column CODEBASE
	!IF CODEBASE=1 {!SOURCE "editrom80.asm"}			; 80-column CODEBASE
	!IF CODEBASE=2 {!SOURCE "editrom82.asm"}			; 80-column EXTENDED CODEBASE

;=======================================================================
; Determine if we need to assemble a 4K ROM
;=======================================================================
; We must include this area if:
;   1) We are using CODEBASE 2
;   2) Certain EXTended features are enabled
;   3) BACKARROW feature needs relocating.

	!IF ((CODEBASE=2) | ((COLOURPET + ESCCODES + WEDGE + EXECUDESK + SS40 + AUTORUN + KEYRESET) > 0) | (BACKARROW=2) | (CODEBASE=0 & KEYSCAN=3)) {
		!SOURCE "editrom_hi.asm"
	}

; Do not place code below this point!
