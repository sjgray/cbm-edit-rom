; PET/CBM EDIT ROM - Extended ROM Code
; ================
; This code goes in the upper half of the 4K EDIT ROMS
; NOTE: The code from $E800-E8FF is not visible - fill with copyright or comments
;
;*=e900

;*********************************************************************************************************
;** Custom Features go here. Set CRUNCH=1 to make space available!!!!!!
;** There is limited space (about 600 bytes with CRUNCH=1 - see below) to add features.
;*********************************************************************************************************

;!IF (COLOURPET + ESCCODES + WEDGE + EXECUDESK + SS40 + AUTORUN > 0) | (BACKARROW=2) {
;
;		!IF EXECUDESK = 1 { !SOURCE "execudesk.asm" }		; 1,514 bytes... Don't even think about it ;-)
;		!IF BANNER > 0    { !SOURCE "editbanner.asm" }		; 120+ bytes
;		!IF WEDGE = 1	  { !SOURCE "editwedge.asm" }		; 560+ bytes
;		!IF COLOURPET = 1 { !SOURCE "colourpetsubs.asm" }	;
;		!IF ESCCODES = 1  { !SOURCE "editescape.asm" }		; 460+ bytes
;		!IF REBOOT = 1    { !SOURCE "editreboot.asm" }		; 28 bytes
;		!IF SS40 = 1      { !SOURCE "editsoft40.asm" }		;
;		!IF BACKARROW = 2 { !SOURCE "editbarrow.asm" }		; 21 bytes
;}

;*********************************************************************************************************
;** Start of Extended Code Area [E900]
;*********************************************************************************************************

;*********************************************************************************************************
;** Extended Keyboard Scanning Tables [EE85]
;*********************************************************************************************************

!IF (KEYSCAN=3) {
		!SOURCE "keyboard-tables3.asm"
}

!IF (COLOURPET = 1) {
		!SOURCE "screen1c.asm"
}

