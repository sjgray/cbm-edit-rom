; PET/CBM EDIT ROM - Extended ROM Code
; ================
; This code goes in the upper half of the 4K EDIT ROMS
; NOTE: The code from $E800-E8FF is not visible - fill with copyright or comments
;
;*=e800
;*********************************************************************************************************
;** Hidden I/O Area used for Copyright and version info text
;*********************************************************************************************************
!IF CRUNCH=0 {
		!SOURCE "copyright-4v4e.asm"			; Use Commodore's info block	
		!FILL $e900-*,$ff 				; pad
} ELSE {
		!SOURCE "io.asm"				; Include our own info text with settings
}

;*=e900

;*********************************************************************************************************
;** Custom Features go here. Set CRUNCH=1 to make space available!!!!!!
;** There is limited space (about 600 bytes with CRUNCH=1 - see below) to add features.
;*********************************************************************************************************

!IF (COLOURPET + ESCCODES + WEDGE + EXECUDESK + SS40 + AUTORUN > 0) | (BACKARROW=2) {

		!IF EXECUDESK = 1 { !SOURCE "execudesk.asm" }		; 1,514 bytes... Don't even think about it ;-)
		!IF AUTORUN   = 1 { !SOURCE "editautorun.asm" }		; 70+ bytes
		!IF BANNER > 0    { !SOURCE "editbanner.asm" }		; 120+ bytes
		!IF WEDGE = 1	  { !SOURCE "editwedge.asm" }		; 560+ bytes
		!IF COLOURPET = 1 { !SOURCE "colourpetsubs.asm" }	;
		!IF ESCCODES = 1  { !SOURCE "editescape.asm" }		; 460+ bytes
		!IF REBOOT = 1    { !SOURCE "editreboot.asm" }		; 28 bytes
		!IF SS40 = 1      { !SOURCE "editsoft40.asm" }		;
		!IF BACKARROW = 2 { !SOURCE "editbarrow.asm" }		; 21 bytes
}

;*********************************************************************************************************
;** Start of Extended Code Area [E900]
;*********************************************************************************************************

!IF CRUNCH=0 {
           !byte $16,$44,$20,$20,$07,$01	;??????????
}

;*********************************************************************************************************
;** Jump Table for Extended Functions [E609]
;*********************************************************************************************************
; (Does anything use this table? - not called from EDITROM itself!)

!IF CRUNCH=0 {
           JMP CHROUT_WITH_DIACRITICS
           JMP IS_DIACRITIC_CHAR
           JMP Screen_Input_Ext
           JMP Check_Diacritic
           JMP IS_SPECIAL_KEY
           JMP IS_VOCAL
           JMP PET_TO_ASCII			;not called? not in EDITROM.ASM
           JMP SCAN_KEYBOARD

           !fill $e924-*,$aa			; 6 bytes
}

;*********************************************************************************************************
;** Extended Routines [E929-EC4A]
;*********************************************************************************************************

!source "extkeyscan.asm"			;[$E924] New Keyboard Scanner
!source "extprinting.asm"			;[$EA27] Enhanced printing
!source "extcrtc.asm"				;[$EBC2] New CRTC programming subs
!source "extclock.asm"				;[$EC0E] New Jiffy Clock routines
!source "exttabs.asm"				;[$EC4B] Tab Stops

;*********************************************************************************************************
;** Filler [EC55-EE84]
;*********************************************************************************************************

!IF CRUNCH=0 {	!fill $ee85-*,$ff }		; 560 bytes!!!!!!!!!!!!!!!!!!!!!!!!!!!

;*********************************************************************************************************
;** Extended Keyboard Scanning Tables [EE85]
;*********************************************************************************************************

!source "extkeytables.asm"

;*********************************************************************************************************
;** Keyboard Tables [EF5F]
;*********************************************************************************************************

!if KEYBOARD = 0 {!source "kbdx-n.asm" }
!if KEYBOARD = 1 {!source "kbdx-b.asm" }
!if KEYBOARD = 2 {!source "kbdx-din.asm" }
!if KEYBOARD = 3 {!source "kbdx-c64.asm" }

!fill $f000-*,$00 				;pad to 4K

