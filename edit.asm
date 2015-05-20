; PET/CBM EDIT ROM - Steve J. Gray - Started: Nov 29/2013
; ================
; A Project to create replacement EDIT ROMs for the PET/CBM line of computers.
; Use MAKE.BAT to assemble (ACME.EXE must be in same folder or in search path).
;
;----------------------- Assembler directives to choose which features are included
;
; If there are no options listed it means that support has not been added yet!
; NOTE!: Not all combinations may be valid!!
;
; Note: It seems that SuperPET's are NOT compatible with 4K edit roms.
;       More investigation is needed.
;
; DIRECTIVE	  FEATURE			VALID OPTIONS			NOTES / FUTURE OPTIONS
;----------	  -------			-------------			----------------------
EXTENDED  = 0	; Extended Editor?		0=No, 1=Yes
KEYSCAN   = 1   ; Keyboard Scanner		0=Graphic, 1=Business, 2=Extended, 3=C64
KEYBOARD  = 5	; Keyboard type:		0=N,1=B,2=DIN,3=C64,4=BSJG,5=NSJG,6=BZ
;                                               7=CBM-II (requires hardware mod)

COLUMNS   = 40	; Screen Width:			40 or 80
SOFT40    = 0	; 40 columns on 8032s?		0=No, 1=Yes
SS40      = 0	; Software Switchable Soft-40	0=No, 1=Yes
BOOTCASE  = 1	; Initial Screen Mode		0=Text, 1=Graphics
REFRESH   = 3	; Screen refresh:		0=Euro,1=NA,2=PAL,3=NTSC

HERTZ     = 50	; Line Frequency (Clock):					50=Euro, 60=NorthAmerica

COLOURPET = 1	; ColourPET additions?		0=No, 1=Yes
COLOURVER = 1	; ColourPET Hardware Version	0=Beta,1=Release
COLOURMODE= 0	; ColourPET Hardware Type	0=Digital, 1=Analog
DEFAULTFG = 5	; ColourPET Foreground colour   0 to 15 RGBI
DEFAULTBG = 0	; ColourPET Background colour   0 to 15 RGBI

REBOOT    = 1	; Add keyboard reboot? 		0=No, 1=Yes
ESCCODES  = 1	; Add ESC codes? 		0=No, 1=Yes
EXECUDESK = 0	; Add Execudesk Menu?		0=No, 1=Yes
SILENT    = 0	; Disable BELL/CHIME		0=Normal, 1=Disabled
REPEATOPT = 1	; Key Repeat Option		0=No (Always ON), 1=Yes
WEDGE     = 1	; DOS Wedge			0=No, 1=Yes
WEDGEMSG  = 3	; Show wedge message?		0=No, 1=Yes,2=Custom		Only valid when WEDGE=1

DEBUG 	  = 0	; Add debugging			0=No, 1=Yes

; To generate Edit ROMs that are Byte-exact matches to actual Commodore ROMS set the
; following options (If an option is not listed assume "0"):
;
; 324243-04 ROM: EXTENDED=1,KEYBOARD=2,COLUMNS=80,REPEATOPT=0
; 901474-04 ROM: EXTENDED=0,KEYBOARD=1,COLUMNS=80,REPEATOPT=1


;---------------------- Output filename

;!TO "editrom.bin",plain			; Generic output file with no load address
!TO "cpet-40-nsjg-ntsc.bin",plain		; ColourPET output file with no load address

;---------------------- These are the symbol definitions for PET/CBM memory and IO chips

!source "memzeropage.asm"	; $00-FF	Zero Page 
!source "memlow.asm"		; $0100-03FC	Low Memory
!source "memchips.asm"		; $E800-E8FF	Chips
!source "memkernal.asm"		; $F000-FFFF	Kernal

!if COLOURPET = 1 { !source "colourpet.asm" }

;---------------------- Debug stuff

DBLINE = SCREEN_RAM + 24 * COLUMNS	; Calculate bottom line of screen for debug

;---------------------- Standard 2K Edit ROM code here
;*=e000				; Target address, normally $e000 for EDIT ROM

!source "editrom.asm"

;---------------------- Extended 4K Edit ROM code here
; *=e900			; Extended ROM start address ($e800-e8ff is reserved for IO)

!if EXTENDED  = 1 {
	!source "editromext.asm" 
} ELSE {		
	!if COLOURPET + ESCCODES + WEDGE + EXECUDESK + SS40 + SOFT40 > 0 { !source "io.asm"}

	!if EXECUDESK = 1 { !source "execudesk.asm" }
	!if WEDGE = 1	  { !source "editwedge.asm" }
	!if COLOURPET = 1 { !source "colourpetsubs.asm" }
	!if ESCCODES = 1  { !source "editescape.asm" }
	!if REBOOT = 1    { !source "editreboot.asm" }
	!if SS40 = 1      { !source "editsoft40.asm" }
}

!if EXTENDED + EXECUDESK + COLOURPET + ESCCODES + WEDGE + SS40 > 0 { !fill $F000-*,$FF } ; PAD to 4K ##########################
