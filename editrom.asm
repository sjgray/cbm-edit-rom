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

	!IF COLOURPET=1 { !SOURCE "colourpet.asm" }			; Non-standard memory usage (may change without notice)

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

;----------------------- Determine if we need to generate more code!
; We must include this area if:
;   1) We are using CODEBASE 2
;   2) Certain EXTended features are enabled
;   3) BACKARROW feature needs relocating.

	!IF (CODEBASE=2) | ((COLOURPET + ESCCODES + WEDGE + EXECUDESK + SS40 + AUTORUN + KEYRESET) > 0) | (BACKARROW=2) {

;=======================================================================
; EXT 4K Edit ROM code starts here
;=======================================================================
; $E800-EFFF for Extended ROM start address. Includes two sections:
;   1) $E800-E8FF - IO Area
;   3) $E900-EFFF - Extended area

;=======================================================================
; IO Area
;=======================================================================
; $E800-E8FF is not visible to the PET cpu as I/O is in this space.
; When not tring to duplicate existing code binaries, the IO.ASM file can
; be used to place comments here that will be readable in the ROM via binary viewers.

	!IF OPTROM=0 {!SOURCE "io.asm"}					; Filler not visible due to I/O space!
	!fill $E900-*,$20 

;=======================================================================
; CODEBASE 2 Code
;=======================================================================
; This code is included only for Codebase 2

	!IF CODEBASE = 2 {!SOURCE "editromext.asm" }

;=======================================================================
; NEW Code
;=======================================================================
; The EXTended features will go here. This is NEW code that has been added,
; or code that must be RELOCATED due to lack of space in the 2K area 
; due to restrictions of HARDCODED entrypoints.
;
; It is very likely that CODEBASE 2 will not have enough space for many of
; these additions.
; If OPTROM is greater than 0 then this code will be put in the OPTION ROM space.

	;----- If OPTION ROM then adjust Code assembly address
	
	!IF OPTROM=1 { *=$9000 }  				; Assemble to option ROM at $9000
	!IF OPTROM=2 { *=$A000 }  				; Assemble to option ROM at $A000
	!IF OPTROM=99 {!SOURCE "io.asm"}			; Special case for development purposes

	;----- These features require AUTORUN

	!IF AUTORUN   = 1 {
		!SOURCE "editautorun.asm"
		!IF BANNER > 0    { !SOURCE "editbanner.asm" }
		!IF WEDGE = 1	  { !SOURCE "editwedge.asm" }		
	}

	;----- These features require ESC codes

	!IF ESCCODES = 1  {
		!SOURCE "editescape.asm"
		!IF COLOURPET = 1 { !SOURCE "colourpetsubs.asm" }

		!IF SS40 = 1      {
			!SOURCE "editsoft40.asm"
			!IF (CODEBASE=0) {
				!SOURCE "editrom40link.asm"		; Relocate linking code here to make space in main.
				!SOURCE "editrom40scrollup.asm"		; Relocate scroll up code here to make space in main.
				JMP CHECK_SCROLL_CONTROL		; Jump back to main.
			}
		}
	}

	;----- These features can stand alone

	!IF KEYRESET = 1  { !SOURCE "editreboot.asm" }			; Keyboard Reset Code
	!IF BACKARROW = 2 { !SOURCE "editbarrow.asm" }			; Back Arrow "hack" Code
	!IF EXECUDESK > 0 { !SOURCE "execudesk.asm" }			; Execudesk Code
	!IF UPET = 1      { !SOURCE "upet.asm" }			; UltraPET Code (Andre Fachat)

;=========================================================================================================
; INFOSTRING
;=========================================================================================================
; Used to include project INFO into the code area so it can be used with ESC-BackArrow
; This string can be included twice:
;   1. In hidden I/O area from $E800-E8FF.
;   2. Here at end of EXT binary (which needs a label so it can be printed).

INFOSTRING
	!IF INFO > 0      { !SOURCE "info.asm" }

;=========================================================================================================
; END OF CODE
;=========================================================================================================
; We finish off by padding the binary to exactly 4K bytes.
;#########################################################################################################

	!IF OPTROM=0 { !FILL $F000-*,$FF }				; PAD to 4K ######################

}
; This is the end of the check for EXT code.
; Do not place code below this point!