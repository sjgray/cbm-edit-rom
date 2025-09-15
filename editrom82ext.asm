; PET/CBM Editor ROM Project - CODEBASE 2 - Extended Area Main Code
; ==========================   EDITROM82EXT.ASM
;
; This code goes in the upper half of the 4K EDIT ROMS ($9000)
;
;*********************************************************************************************************
; AUTORUN - Special case for CODEBASE 2
;*********************************************************************************************************
; If AUTORUN=1 then the keyboard stuffer routine expects the autorun code to
; be at $E900 so we will place a JMP here that jumps over the CODEBASE 2 code.

!IF AUTORUN=1 { JMP AUTODISPATCH }		; Handle AUTORUN tasks

;*********************************************************************************************************
; Unknown bytes
;*********************************************************************************************************

!IF CRUNCH=0 {
                !IF CBMROM=6 {
                        !BYTE $16,$43,$48,$20,$07,$07	; to match 324243-02b-c2
                } ELSE {
                        !BYTE $16,$44,$20,$20,$07,$01	; to match the rest
                }
}

;*********************************************************************************************************
;** Jump Table for Extended Functions [E909]
;*********************************************************************************************************
; (Does anything use this table? - not called from EDITROM itself!)

!IF CRUNCH=0 {
           JMP CHROUT_WITH_DIACRITICS		;[E906] $EA87 -
           JMP IS_DIACRITIC_CHAR		;[E909] $EAA9 -
           JMP Screen_Input_Ext			;[E90C] $EB3A -
           JMP Check_Diacritic			;[E90F] $EB44 -
           JMP IS_SPECIAL_KEY			;[E912] $EB80 -
           JMP IS_VOCAL				;[E915] $EB8B -
           JMP PET_TO_ASCII			;[E918] $EB96 - Target not called - leftover code?
           JMP SCAN_KEYBOARD_EXT		;[E91B] $E924 -

           !FILL $E924-*,$AA			; 6 bytes
}

;*********************************************************************************************************
;** Extended Routines [E924]
;*********************************************************************************************************

!SOURCE "extkeyscan.asm"			;[$E924] New Keyboard Scanner
!SOURCE "extprinting.asm"			;[$EA27] Enhanced printing
!SOURCE "extcrtc.asm"				;[$EBC2] New CRTC programming subs
!SOURCE "extclock.asm"				;[$EC0E] New Jiffy Clock routines
!SOURCE "exttabs.asm"				;[$EC4B] Tab Stops

;*********************************************************************************************************
;** Filler [EC55-EE84]
;*********************************************************************************************************

!IF CRUNCH=0 {
	!IF (CBMROM=7) | (CBMROM=10) {
		!FILL $EC80-*,$AA			; Filler
		!BYTE $FF,$FF,$B8			; I suspect this is a corrupt ROM
	}

	!IF NOFILL=0 {					; Fille560 bytes
		!IF CBMROM=0  { !FILL $EE85-*,$FF }	; For custom ROM
;????	        !IF CBMROM=6  { !FILL $EE85-*,$AA }	; To match 324324-02b-c2
		!IF CBMROM=7  { !FILL $EE85-*,$AA }	; To match 324324-01
		!IF CBMROM=8  { !FILL $EE85-*,$FF }	; To match324324-03
		!IF CBMROM=9  { !FILL $EE85-*,$FF }	; To match324324-04
		!IF CBMROM=10 { !FILL $EE85-*,$AA }	; To match324728-02
	}
}

;*********************************************************************************************************
;** Extended Keyboard Scanning Tables [EE85]
;*********************************************************************************************************

!SOURCE "extkeytables.asm"

;*********************************************************************************************************
;** Keyboard Tables [EF5F]
;*********************************************************************************************************

!SOURCE "keyboard.asm"				; Add keyboard according to KEYBOARD setting

!FILL $F000-*,$00 				; Pad to 4K
