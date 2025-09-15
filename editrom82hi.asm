; PET/CBM Editor ROM Project - CODEBASE 2 - Brings in Extended Features
; ==========================   EDITROM82HI.ASM
;
; $E800-EFFF for Extended ROM start address. Includes two sections:
;   1) $E800-E8FF - IO Area
;   3) $E900-EFFF - Extended area (Codebase 2 if required, New code)

;*=E800

;=======================================================================
; IO Area
;=======================================================================
; $E800-E8FF is not visible to the PET cpu as I/O is in this space.
; When not trying to duplicate existing code binaries, the IO.ASM file can
; be used to place comments here that will be readable in the ROM via
; binary viewers.

!IF OPTROM=0 {
	; Use Commodore Info block here for specific ROM revisions
	!IF CBMROM=6  { !BINARY "io-324243-02b-c2.bin" }; 4v4e 324728-02
	!IF CBMROM=7  { !BINARY "io-324243-01.bin" }	; 4v2e 324243-01 (901474-04)
	!IF CBMROM=8  { !BINARY "io-324243-03.bin" }	; 4v4  324243-03
	!IF CBMROM=9  { !BINARY "io-324243-04.bin" }	; 4v4e 324243-04
	!IF CBMROM=10 { !BINARY "io-324728-02.bin" }	; 4v4e 324728-02

	!IF NOFILL=0 {
		!IF CBMROM=6  { !FILL $E900-*,$AA }	; pad for 324728-02
		!IF CBMROM=7  { !FILL $E900-*,$AA }	; pad for 324324-01
		!IF CBMROM=8  { !FILL $E900-*,$FF }	; pad for 324324-03
		!IF CBMROM=9  { !FILL $E900-*,$FF }	; pad for 324324-04
		!IF CBMROM=10 { !FILL $E900-*,$FF }	; pad for 324728-02
	}
}

;=======================================================================
; EXTENDED Area - Standard CODEBASE 2
;=======================================================================
;*=E900

		!SOURCE "editrom82ext.asm"

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

;---------------------- If OPTION ROM then adjust Code assembly address

	!IF OPTROM=1  { *=$9000 }  				; Assemble to option ROM at $9000
	!IF OPTROM=2  { *=$A000 }  				; Assemble to option ROM at $A000
	!IF OPTROM=99 {!SOURCE "io.asm"}			; Special case for development purposes

;---------------------- These features require AUTORUN

	!IF AUTORUN = 1 {
		!SOURCE "editautorun.asm"
		!IF BANNER > 0    { !SOURCE "editbanner.asm" }
		!IF WEDGE = 1	  { !SOURCE "editwedge.asm" }
	}

;---------------------- These features require ESC codes

	!IF ESCCODES = 1 {
		!SOURCE "editescape.asm"

		; If SS40=1 include the following files that will no longer fit
		!IF SS40 = 1 { !SOURCE "editsoft40.asm" }
	}

;---------------------- These features can stand alone

	; If SS40 or COLOURPET then CLS routine wont fit
	!IF (SS40 + COLOURPET) >0 {
		!SOURCE "editrom82cls.asm"				; Relocate Screen clear
		!SOURCE "editrom82lm.asm"				; Relocate CURSOR_LM code
		!SOURCE "editrom82scrollup.asm"				; Relocate scroll up code
	}


;---------------------- Full ColourPET support

	!IF COLOURPET>0 {
		!SOURCE "colourpet.asm"					; Common code (Init, PETSCII check, Colour conversion)
		!SOURCE "colourpet80.asm"				; colour subs for CODEBASE 1 and 2
	}

;---------------------- Additional Features

	!IF KEYSCAN=3		{ !SOURCE "keyboard-tables3.asm" }	; C64 Keyboard Scanning Tables
	!IF EXECUDESK > 0	{ !SOURCE "execudesk.asm" }		; Execudesk Code
	!IF KEYRESET = 1	{ !SOURCE "editreboot.asm" }		; Keyboard Reset Code
	!IF BACKARROW = 2	{ !SOURCE "editbarrow.asm" }		; Back Arrow "hack" Code
	!IF IRQDEBUG = 1	{ !SOURCE "debug.asm" }			; IRQ Debug Code
	!IF UPET = 1		{ !SOURCE "upet.asm" }			; UltraPET Code (Andre Fachat)

;=========================================================================================================
; INFOSTRING
;=========================================================================================================
; Used to include project INFO into the code area so it can be used with ESC-BackArrow
; This string can be included twice:
;   1. In hidden I/O area from $E800-E8FF.
;   2. Here at end of EXT binary (which needs a label so it can be printed).

!IF INFO > 0 {
INFOSTRING	!SOURCE "info.asm"
}

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
