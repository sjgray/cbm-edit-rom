; PET/CBM EDIT ROM - Codebase 2 Extended ROM Code
; ================
; This code goes in the upper half of the 4K EDIT ROMS

;*=e900

;*********************************************************************************************************
; AUTORUN - Special case for CODEBASE 2
;*********************************************************************************************************
; If AUTORUN=1 then the keyboard stuffer routine expects the autorun code to
; be at $E900 so we will place a JMP here that jumps over the CODEBASE 2 code.

!IF AUTORUN=1 { JMP AUTODISPATCH }

;*********************************************************************************************************
; Unknown bytes
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

!source "keyboard.asm"

!fill $f000-*,$00 				;pad to 4K

