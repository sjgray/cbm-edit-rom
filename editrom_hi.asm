; PET/CBM EDIT ROM - Extended ROM Code (only if needed)
; ================
; $E800-EFFF for Extended ROM start address. Includes two sections:
;   1) $E800-E8FF - IO Area
;   3) $E900-EFFF - Extended area (Codebase 2 if required, New code)
 
;*=e800

;=======================================================================
; IO Area
;=======================================================================
; $E800-E8FF is not visible to the PET cpu as I/O is in this space.
; When not tring to duplicate existing code binaries, the IO.ASM file can
; be used to place comments here that will be readable in the ROM via
; binary viewers.

	!IF OPTROM=0 {
		!IF CODEBASE=2 {
			!SOURCE "io_euro-4v4e.asm"			; Use Commodore's info block	
			!IF NOFILL=0 { !FILL $e900-*,$ff }		; pad with $FF as per Commodore ROMS
		} ELSE {
			!SOURCE "io.asm"				; Filler not visible due to I/O space!
			!IF NOFILL=0 { !FILL $E900-*,$20 }		; pad with SPACES for non-cbm
		}
	}

;=======================================================================
; EXTENDED Area
;=======================================================================
;*=e900

;=======================================================================
; CODEBASE 2 Code
;=======================================================================
; This code is included only for Codebase 2

	!IF CODEBASE = 2 {!SOURCE "editrom82ext.asm" }

;=======================================================================
; NEW Code
;=======================================================================
; The EXTended features will go here. This is NEW code that has been added,
; or code that must be RELOCATED due to lack of space in the 2K area 
; due to restrictions of HARDCODED entrypoints.
;
; It is very likely that CODEBASE 2 will not have enough space for many of
; these additions.
;
; If OPTROM is greater than 0 then this code will be put in the OPTION ROM space.

	;----- If OPTION ROM then adjust Code assembly address
	
	!IF OPTROM=1 { *=$9000 }  				; Assemble to option ROM at $9000
	!IF OPTROM=2 { *=$A000 }  				; Assemble to option ROM at $A000
	!IF OPTROM=99 {!SOURCE "io.asm"}			; Special case for development purposes

	;----- These features require AUTORUN

	!IF AUTORUN = 1 {
		!SOURCE "editautorun.asm"
		!IF BANNER > 0    { !SOURCE "editbanner.asm" }
		!IF WEDGE = 1	  { !SOURCE "editwedge.asm" }		
	}

	;----- These features require ESC codes

	!IF ESCCODES = 1 {
		!SOURCE "editescape.asm"
		!IF COLOURPET = 1 {
			!SOURCE "cpetsubs.asm"
			!IF CODEBASE=0 { !SOURCE "screen1c.asm" }
 		}

		!IF SS40 = 1 {
			!SOURCE "editsoft40.asm"
			!IF CODEBASE=0 {
				!SOURCE "editrom40link.asm"	; Relocate linking code here to make space in main.
				!SOURCE "editrom40scrollup.asm"	; Relocate scroll up code here to make space in main.
				JMP CHECK_SCROLL_CONTROL	; Jump back to main.
			}
		}
	}

	;----- These features can stand alone

	!IF KEYSCAN=3	  { !SOURCE "keyboard-tables3.asm" }	; C64 Keyboard Scanning Tables
	!IF KEYRESET = 1  { !SOURCE "editreboot.asm" }		; Keyboard Reset Code
	!IF BACKARROW = 2 { !SOURCE "editbarrow.asm" }		; Back Arrow "hack" Code
	!IF EXECUDESK > 0 { !SOURCE "execudesk.asm" }		; Execudesk Code
	!IF UPET = 1      { !SOURCE "upet.asm" }		; UltraPET Code (Andre Fachat)

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

	!IF OPTROM=0 {
		!IF NOFILL=0 { !FILL $F000-*,$FF }		; PAD to 4K ######################
	}				

; This is the end of the EXT code.
; Do not place code below this point!
