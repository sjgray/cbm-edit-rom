; PET/CBM EDIT ROM - Steve J. Gray - Started: Nov 29/2013
; ================
; This is the main Assembler file. It brings in the USER-DEFINED variables and acts on them to build a
; functional EDITOR ROM.
;
;---------------------- Get User Variables and validate some settings, and set output file

!SOURCE "edit.asm"							; Include USER-DEFINED variables
!IF SS40+COLOURPET>0 { ESCCODES=1 }					; Make sure ESC Codes is ON if SS40 or COLOURPET is enabled
!IF SS40=1 { SOFT40=0 }                         			; Make sure SOFT40 is OFF if SS40 is enabled
!IF COLOURPET=0 { !TO "editrom.bin",plain }				; Generic output file with no load address
!IF COLOURPET>0 { !TO "cpetrom.bin",plain }				; ColourPET output file with no load address

;---------------------- These are the symbol definitions for PET/CBM memory and IO chips

!SOURCE "memzeropage.asm"						; $0000-00FF	Zero Page 
!SOURCE "memlow.asm"							; $0100-03FC	Low Memory
!SOURCE "memchips.asm"							; $E800-E8FF	Chips
!SOURCE "memkernal.asm"							; $F000-FFFF	Kernal
!SOURCE "membasic4.asm"							; BASIC

!IF COLOURPET=1 { !SOURCE "colourpet.asm" }				; Non-standard memory usage (may change without notice)

;---------------------- Debug stuff

DBLINE = SCREEN_RAM + 24 * COLUMNS					; Calculate bottom line of screen for debug

;---------------------- Standard 2K Edit ROM code here
; $E000-E7FF are for normal Edit ROMS

!IF CODEBASE=0 {!SOURCE "editrom40.asm"}				; 40-column CODEBASE
!IF CODEBASE=1 {!SOURCE "editrom80.asm"}				; 80-column CODEBASE
!IF CODEBASE=2 {!SOURCE "editrom82.asm"}				; 80-column EXTENDED CODEBASE

;---------------------- Extended 4K Edit ROM code here
;
; $E800-E8FF is not visible as I/O is in this space (the IO.ASM file can be used to place comments here)
; $E900-EFFF for Extended ROM start address

!IF CODEBASE = 2 {
	!SOURCE "editromext.asm" 
} ELSE {		
	!IF (COLOURPET + ESCCODES + WEDGE + EXECUDESK + SS40 + AUTORUN > 0) | (BACKARROW=2) {
		!IF OPTROM=0 {!SOURCE "io.asm"}				; Filler not visible due to I/O space!
		!IF OPTROM=1 { *=$9000 }  				; Assemble to option ROM at $9000
		!IF OPTROM=2 { *=$A000 }  				; Assemble to option ROM at $A000
		!IF OPTROM=99 {!SOURCE "io.asm"}			; Special case for development purposes

		!IF EXECUDESK = 1 { !SOURCE "execudesk.asm" }
		!IF AUTORUN   = 1 { !SOURCE "editautorun.asm" }
		!IF BANNER > 0    { !SOURCE "editbanner.asm" }
		!IF WEDGE = 1	  { !SOURCE "editwedge.asm" }
		!IF COLOURPET = 1 { !SOURCE "colourpetsubs.asm" }
		!IF ESCCODES = 1  { !SOURCE "editescape.asm" }
		!IF REBOOT = 1    { !SOURCE "editreboot.asm" }
		!IF SS40 = 1      { !SOURCE "editsoft40.asm" }
		!IF BACKARROW = 2 { !SOURCE "editbarrow.asm" }
INFOSTRING	
		!IF INFO = 1      { !SOURCE "info.asm" }

		!IF OPTROM=0 { !FILL $F000-*,$FF }			; PAD to 4K ##########################
	}
}
