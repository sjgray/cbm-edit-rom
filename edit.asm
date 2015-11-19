; PET/CBM EDIT ROM - Steve J. Gray - Started: Nov 29/2013
; ================
; A Project to create replacement EDIT ROMs for the PET/CBM line of computers.
; Use MAKE.BAT to assemble (ACME.EXE must be in same folder or in search path).
;
; Edit these VARIABLES to choose which features are included.
;
; The most important is the CODEBASE variable. It determines which main code to use, which will determine
; how many features are available:
;
;   CODEBASE=0 for 40-column (2001/30xx/40xx) machines
;   CODEBASE=1 for 80-column (80xx/82xx/9000) machines
;   CODEBASE=2 for 80-column (8296/8296D) machines (mostly DIN keyboard versions)
;
; Both CODEBASE=0 and CODEBASE=2 have limited customizability. You may change screen/keyboard and
; a few other options. CODEBASE=1 is designed for maximum custimizability (for example COLOURPET,
; ESC codes, Soft40, SS40, Wedge etc).
;
; If there are no options listed it means that support has not been added yet!
;
; NOTE!: Not all combinations may be valid!!
;
; NOTE: It seems that SuperPET's are NOT compatible with 4K edit roms. More investigation is needed.
;
; DIRECTIVE	  FEATURE			VALID OPTIONS			NOTES / FUTURE OPTIONS
;----------	  -------			-------------			----------------------

CODEBASE  = 1   ; Code Base			0=4000, 1=8000, 2=8296		
;
KEYSCAN   = 1   ; Keyboard Scanner		0=Graphic, 1=Business, 2=Extended, 3=C64
KEYBOARD  = 4	; Keyboard type:		0=N,1=B,2=DIN,3=C64,4=BSJG,5=NSJG,6=BZ
;                                               7=CBM-II (requires hardware mod)
COLUMNS   = 40	; Screen Width:			40 or 80 columns
SOFT40    = 0	; 40 columns on 8032s?		0=No, 1=Yes
SS40      = 0	; Software Switchable Soft-40	0=No, 1=Yes
SS40MODE  = 80  ; Initial SS40 Mode		40 or 80 columns
BOOTCASE  = 1	; Initial Screen Mode		0=Text, 1=Graphics
REFRESH   = 3	; Screen refresh:		0=Euro,1=NA,2=PAL,3=NTSC
MOT6845   = 0   ; Is CRTC a Motorola6845?       0=No, 1=Yes			Probably 0=No for compatibility
HERTZ     = 50	; Line Frequency (Clock):	50=Euro.			50=Euro, 60=NorthAmerica
IRQFIX    = 1   ; Fix Jiffy Clock		0=No, 1=Yes			Still needs investigating
COLOURPET = 1	; ColourPET additions?		0=No, 1=Yes
COLOURVER = 0	; ColourPET Hardware Version	0=Beta,1=Release		0=ColourRAM at $8400, 1=$8800 (use for VICE)
COLOURMODE= 0	; ColourPET Hardware Type	0=Digital, 1=Analog
DEFAULTFG = 5	; ColourPET Foreground colour   0 to 15 RGBI
DEFAULTBG = 0	; ColourPET Background colour   0 to 15 RGBI
REBOOT    = 1	; Add keyboard reboot? 		0=No, 1=Yes
ESCCODES  = 1	; Add ESC codes? 		0=No, 1=Yes
EXECUDESK = 0	; Add Execudesk Menu?		0=No, 1=Yes
SILENT    = 0	; Disable BELL/CHIME		0=Normal, 1=Disabled
REPEATOPT = 1	; Key Repeat Option		0=No (Always ON), 1=Yes
WEDGE     = 1	; DOS Wedge			0=No, 1=Yes
WEDGEMSG  = 3	; Show wedge message?		0=No, 1=Yes,2=Custom, 3=ColourPET	Only valid when WEDGE=1
CRUNCH    = 0   ; Remove unneeded code (NOPS) when posible? 0=No, 1=Yes
;
DEBUG 	  = 0	; Add debugging			0=No, 1=Yes

; As of Nov17/2015 the "EXTENDED" option has been replaced by "CODEBASE"!!!!!
;
; To generate Edit ROMs that are Byte-exact matches to actual Commodore ROMS set the
; following options (If an option is not listed assume "0"):
;
; 901499-01 ROM: CODEBASE=0,KEYBOARD=0,COLUMNS=40,REPEATOPT=0    [edit-4-40-n-60Hz]
; 901474-04 ROM: CODEBASE=1,KEYBOARD=1,COLUMNS=80,REPEATOPT=1
; 324243-04 ROM: CODEBASE=2,KEYBOARD=2,COLUMNS=80,REPEATOPT=0
;
; Additional Edit ROMs will be listed as they are tested and verified as byte-exact.

;---------------------- Output filename

!TO "editrom.bin",plain				; Generic output file with no load address
;!TO "cpet-40-nsjg-ntsc.bin",plain		; ColourPET output file with no load address

;---------------------- These are the symbol definitions for PET/CBM memory and IO chips

!SOURCE "memzeropage.asm"			; $0000-00FF	Zero Page 
!SOURCE "memlow.asm"				; $0100-03FC	Low Memory
!SOURCE "memchips.asm"				; $E800-E8FF	Chips
!SOURCE "memkernal.asm"				; $F000-FFFF	Kernal

!IF COLOURPET = 1 { !SOURCE "colourpet.asm" }	; Non-standard memory usage (may change without notice)

;---------------------- Debug stuff

DBLINE = SCREEN_RAM + 24 * COLUMNS		; Calculate bottom line of screen for debug

;---------------------- Standard 2K Edit ROM code here
; $E000-E7FF are for normal Edit ROMS

!IF CODEBASE=0 {!SOURCE "editrom40.asm"}	; 40-column CODEBASE
!IF CODEBASE=1 {!SOURCE "editrom80.asm"}	; 80-column CODEBASE
!IF CODEBASE=2 {!SOURCE "editrom80.asm"}	; 80-column EXTENDED CODEBASE

;---------------------- Extended 4K Edit ROM code here
;
; $E800-E8FF is not visible as I/O is in this space (the IO.ASM file can be used to place comments here)
; $E900-EFFF for Extended ROM start address

!IF CODEBASE = 2 {
	!SOURCE "editromext.asm" 
} ELSE {		
	!IF COLOURPET + ESCCODES + WEDGE + EXECUDESK + SS40 + SOFT40 > 0 {

		!SOURCE "io.asm"	; filler not visible due to I/O space!

		!IF EXECUDESK = 1 { !SOURCE "execudesk.asm" }
		!IF WEDGE = 1	  { !SOURCE "editwedge.asm" }
		!IF COLOURPET = 1 { !SOURCE "colourpetsubs.asm" }
		!IF ESCCODES = 1  { !SOURCE "editescape.asm" }
		!IF REBOOT = 1    { !SOURCE "editreboot.asm" }
		!IF SS40 = 1      { !SOURCE "editsoft40.asm" }

		!FILL $F000-*,$FF	; PAD to 4K ##########################
	}
}
