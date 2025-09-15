; PET/CBM Editor ROM Project - Steve J. Gray, Started: Nov 29/2013. Updated: 2025-09-10 for new assembly method.
; ==========================   EDITROM.ASM
;
; Main file for all CODEBASEs. It uses the settings specified in a configuration file and then brings in the
; necessary files to build the binary.
;
; NOTE: This has been changed. It no longer brings in the settings from EDIT.ASM. Now, you specify the
;       settings file for ACME to process, which then brings in THIS file. This means you can now have
;       multiple settings files for generating different binaries using command-line or batch files.
;
;---------------------- Symbol definitions for PET/CBM memory and IO chips

	!SOURCE "memzeropage.asm"				; $0000-00FF	Zero Page
	!SOURCE "memlow.asm"					; $0100-03FC	Low Memory
	!SOURCE "membasic4.asm"					; $B000-DFFF	BASIC
	!SOURCE "memchips.asm"					; $E800-E8FF	Chips
	!SOURCE "memkernal.asm"					; $F000-FFFF	KERNAL

;=======================================================================
; DEBUG
;=======================================================================
; DEBUG info, if enabled, is placed on the last line of the active screen,
; erasing characters. For special REFRESH settings (26/27) an extra
; visible line will be added below the active screen, and DEBUG info does
; not cover the active screen characters.
; The extra line can show 24,48, or 80, depending on computer model.

!IF (DEBUG + IRQDEBUG)>0 {
	!IF  (REFRESH=26) | (REFRESH=27) {
		DBLINE = SCREEN_RAM + ROWS * COLUMNS		; On 26th line
	} ELSE {
		DBLINE = SCREEN_RAM + (ROWS-1) * COLUMNS	; On LAST line (ACTIVE SCREEN)
	}
}

;=======================================================================
; Standard 2K Edit ROM code starts here
;=======================================================================
; $E000-E7FF are for normal Edit ROMS.
; The CODEBASE setting determines which BASE features are included,
; which roughly determines which machine they were targeted to.
; This area MAY include NEW code depending on SETTINGS. Some new code may
; require standard code to be relocated to EXT code area.

* = $E000							; Normal start address for EDIT ROM is $E000

	!IF CODEBASE=0 {!SOURCE "editrom40.asm"}		; 40-column CODEBASE C0
	!IF CODEBASE=1 {!SOURCE "editrom80.asm"}		; 80-column CODEBASE C1
	!IF CODEBASE=2 {!SOURCE "editrom82.asm"}		; 80-column Extended CODEBASE C2

;=======================================================================
; Determine if we need to assemble a 4K ROM
;=======================================================================
; We must include this area if:
;   1) We are using CODEBASE 2.
;   2) Certain EXTended features are enabled.
;   3) BACKARROW feature needs relocating.
;   4) IRQDEBUG=1

	!IF ((CODEBASE=2) | (IRQDEBUG=1) | ((COLOURPET + ESCCODES + WEDGE + EXECUDESK + SS40 + AUTORUN + KEYRESET) > 0) | (BACKARROW=2) | (CODEBASE=0 & KEYSCAN=3)) {
		!IF CODEBASE=0 {	!SOURCE "editrom40hi.asm" }
		!IF CODEBASE=1 {	!SOURCE "editrom80hi.asm" }
		!IF CODEBASE=2 {	!SOURCE "editrom82hi.asm" }
	}

; Do not place code below this point!
