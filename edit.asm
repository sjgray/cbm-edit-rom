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
;   CODEBASE=0 for 40-column (30xx/40xx) machines with Universal Dynamic Motherboard
;   CODEBASE=1 for 80-column (80xx/82xx/9000) machines with Universal Dynamic Motherboard
;   CODEBASE=2 for 80-column (8296/8296D) machines (mostly DIN keyboard versions)
;
; Both CODEBASE=0 and CODEBASE=2 have limited customizability. You may change screen/keyboard and
; a few other options. CODEBASE=1 is designed for maximum customizability (for example COLOURPET,
; ESC codes, Soft40, SS40, Wedge etc).
;
; If there are no options listed it means that support has not been added yet!
;
; NOTE!: Not all combinations may be valid!!
; NOTE: SuperPET's are NOT compatible with 4K edit roms
;
;================================================================================
; The following DATE and COMMENT strings will be placed in the IO area (if used).
; Take care that comments do not overflow into code space!

!macro DATE    { !pet "2017-03-03" }
!macro COMMENT { !pet "sjg" }

;================================================================================

; VARIABLE	  FEATURE			VALID OPTIONS			NOTES / FUTURE OPTIONS
;---------	  -------			-------------			----------------------
CODEBASE  = 1   ; Code Base			0=4000, 1=8000, 2=8296		
OPTROM    = 0   ; Location of EXT code		0=Extended Edit ROM area ($E800-EFFF), 1=$9000, 2=$A000

KEYSCAN   = 1   ; Keyboard Scanner		0=Graphic, 1=Business, 2=DIN
KEYBOARD  = 1	; Keyboard type:		0=N-QWERTY,1=B-QWERTY,2=DIN,3=C64,4=B-SJG,5=N-SJG,6=B-QWERTZ,7=B-AZERTY,8=CBM-II (requires hardware mod)
REFRESH   = 1	; Screen refresh:		0=Internal-Euro,1=Internal-NA,2=External-PAL,3=External-NTSC,9=Custom
REPEATOPT = 0	; Key Repeat Option		0=No (Always ON), 1=Yes
COLUMNS   = 40	; Screen Width:			40 or 80 columns
HERTZ     = 60	; Line Frequency (Clock):	50=Euro,60=N.America
IRQFIX    = 0   ; Fix Jiffy Clock		0=No, 1=Yes			Still needs investigating
BOOTCASE  = 1	; Initial Screen Mode		0=Text/Lower, 1=Upper/Graphics

ESCCODES  = 1	; Add ESC codes? 		0=No, 1=Yes			Enable when using COLOURPET or SS40.
AUTORUN   = 1   ; Set for BANNER and/or WEDGE	0=No, 1=Yes			Enable if you use EITHER banner and/or wedge.
BYPASS    = 1   ; Check for key to bypass 	0=No, 1=Yes			Hold key on ROW9 to bypass custom banner, wedge or other autostart option
BANNER    = 5   ; Custom Banner (power on msg)  0=No, N=Banner# (1-5 or 99)     Refer to docs or source. 99=debug message
WEDGE     = 1	; DOS Wedge			0=No, 1=Yes
WEDGEMSG  = 0	; Show wedge message?		0=No, 1=Yes
SOFT40    = 0	; 40 columns on 8032s?		0=No, 1=Yes			Do NOT enable SOFT40 and SS40 at the same time!
SS40      = 0	; Software Switchable Soft-40	0=No, 1=Yes			Also set ESCCODES=1
SS40MODE  = 80  ; Initial SS40 Mode		40 or 80 columns		Valid when SS40=1

COLOURPET = 1	; ColourPET additions?		0=No, 1=Yes			Also set ESCCODES=1
COLOURVER = 1	; ColourPET Hardware Version	0=Beta,1=Release		0=ColourRAM at $8400, 1=$8800 (use for VICE)
COLOURMODE= 0	; ColourPET Hardware Type	0=Digital, 1=Analog
DEFAULTFG = 5	; ColourPET Foreground colour   0 to 15 RGBI 			0=black 1=dkgrey 2=dkblue 3=ltblue 4=dkgreen 5=ltgreen 6=dkcyan 7=ltcyan
DEFAULTBG = 0	; ColourPET Background colour   0 to 15 RGBI 			8=dkred 9=ltred 10=dkpurple 11=ltpurple 12=dkyellow 13=ltyellow 14=ltgrey 15=white
DEFAULTBO = 0   ; ColourPET Border colour       0 to 15 RGBI
BYPASSFG  = 5   ; ColourPET Bypass FG     	0 to 15 RGBI			Colours when AUTOSTART is bypassed
BYPASSBG  = 0   ; ColourPET Bypass BG     	0 to 15 RGBI

MOT6845   = 0   ; Is CRTC a Motorola6845?       0=No, 1=Yes			Probably 0=No for compatibility
REBOOT    = 1	; Add keyboard reboot? 		0=No, 1=Yes
EXECUDESK = 0	; Add Execudesk Menu?		0=No, 1=Yes			Note: Requires BOOT to TEXT mode!
SILENT    = 0	; Disable BELL/CHIME		0=Normal, 1=Disabled
CRUNCH    = 0   ; Remove unneeded code (NOPS) when posible? 0=No, 1=Yes
BACKARROW = 2   ; Patch for screen mode toggle  0=NO, 1=Yes 2K, 2=Yes EXT	Note: B keyboard scanner only
INFO      = 1   ; Add project info to code area 0=NO, 1=Yes
;
DEBUG 	  = 0	; Add debugging			0=No, 1=Yes

;----------------------------------------------------------------------------------------------------------------------------------------
!IF SS40+COLOURPET>0 { ESCCODES=1 }		; Make sure ESC Codes is ON if SS40 or COLOURPET is enabled
!IF SS40=1 { SOFT40=0 }                         ; Make sure SOFT40 is OFF if SS40 is enabled

;
; To generate Edit ROMs that are Byte-exact matches to actual Commodore ROMS set the
; following options (If an option is not listed assume "0"):
;
; 901498-01 -> CODEBASE=0,KEYSCAN=0,KEYBOARD=0,COLUMNS=40,REFRESH=1,BOOTCASE=1,HERTZ=50,REPEATOPT=0   [edit-4-40-n-50Hz]
; 901499-01 -> CODEBASE=0,KEYSCAN=0,KEYBOARD=0,COLUMNS=40,REFRESH=1,BOOTCASE=1,HERTZ=60,REPEATOPT=0   [edit-4-40-n-60Hz]
; 901474-04 -> CODEBASE=1,KEYSCAN=1,KEYBOARD=1,COLUMNS=80,REFRESH=0,BOOTCASE=0,HERTZ=50,REPEATOPT=1   [edit-4-80-b-50Hz]
; 324243-04 -> CODEBASE=2,KEYSCAN=2,KEYBOARD=2,COLUMNS=80,REFRESH=0,BOOTCASE=0,HERTZ=50,REPEATOPT=0   [edit-4-80-din-50Hz] (8296D)
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
!SOURCE "membasic4.asm"				; BASIC

!IF COLOURPET = 1 { !SOURCE "colourpet.asm" }	; Non-standard memory usage (may change without notice)

;---------------------- Debug stuff

DBLINE = SCREEN_RAM + 24 * COLUMNS		; Calculate bottom line of screen for debug

;---------------------- Standard 2K Edit ROM code here
; $E000-E7FF are for normal Edit ROMS

!IF CODEBASE=0 {!SOURCE "editrom40.asm"}	; 40-column CODEBASE
!IF CODEBASE=1 {!SOURCE "editrom80.asm"}	; 80-column CODEBASE
!IF CODEBASE=2 {!SOURCE "editrom82.asm"}	; 80-column EXTENDED CODEBASE

;---------------------- Extended 4K Edit ROM code here
;
; $E800-E8FF is not visible as I/O is in this space (the IO.ASM file can be used to place comments here)
; $E900-EFFF for Extended ROM start address

!IF CODEBASE = 2 {
	!SOURCE "editromext.asm" 
} ELSE {		
	!IF COLOURPET + ESCCODES + WEDGE + EXECUDESK + SS40 + SOFT40 + BACKARROW + AUTORUN > 0 {
		!IF OPTROM=0 {!SOURCE "io.asm"}	; Filler not visible due to I/O space!
		!IF OPTROM=1 { *=$9000 }  	; Assemble to option ROM at $9000
		!IF OPTROM=2 { *=$A000 }  	; Assemble to option ROM at $A000
		
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

		!IF OPTROM=0 { !FILL $F000-*,$FF }	; PAD to 4K ##########################
	}
}
