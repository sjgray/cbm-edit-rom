; PET/CBM EDIT ROM - Steve J. Gray - Started: Nov 29/2013
; ================
; A Project to create replacement EDIT ROMs for the PET/CBM line of computers.
; Use MAKE.BAT to assemble (ACME.EXE must be in same folder or in search path).
;
;----------------------- Assembler directives to choose which features are included
;
; For byte-exact 324243-04 ROM, set EXTENDED=1,KEYBOARD=2,COLUMNS=80,REPEATOPT=0,REFRESH=0,HERTZ=50
; For byte-exact 901474-04 ROM, set EXTENDED=0,KEYBOARD=1,COLUMNS=80,REPEATOPT=1,REFRESH=0,HERTZ=50
;
; If there no options are listed it means that support has not been added yet!
; NOTE!: Not all combinations may be valid!!
;
; DIRECTIVE		FEATURE				VALID OPTIONS			FUTURE OPTIONS
;----------		-------				-------------			--------------
EXTENDED  = 0		; ROM Size:			0=2K, 1=4K
KEYBOARD  = 1		; Keyboard type:		0=N,1=B,2=DIN,3=C64
COLUMNS   = 80		; Screen Width:			40 or 80
SOFT40    = 0		; 40 columns on 8032s?		0=No, 1=Yes
BOOTCASE  = 1		; Initial Screen Mode		0=Text, 1=Graphics
REFRESH   = 3		; Screen refresh:		0=Euro,1=NA,2=PAL,3=NTSC

HERTZ     = 50		; Line Frequency (Clock):					50=Euro, 60=NorthAmerica

COLOURPET = 1		; ColourPET additions?		0=No, 1=Yes
COLOURVER = 1           ; ColourPET Hardware Version	0=Beta,1=Release
DEFAULTFG = 5		; ColourPET Foreground colour   0 to 15 RGBI
DEFAULTBG = 0		; ColourPET Background colour   0 to 15 RGBI

REBOOT    = 0		; Add keyboard reboot? 						0=No, 1=Yes
ESCCODES  = 1		; Add ESC codes? 						0=No, 1=Yes
EXECUDESK = 0		; Add Execudesk Menu?						0=No, 1=Yes
SILENT    = 0		; Disable BELL/CHIME		0=Normal, 1=Disabled
REPEATOPT = 1		; Key Repeat Option		0=No (Always ON), 1=Yes

DEBUG 	  = 0		; Add debugging			0=No, 1=Yes

;---------------------- Output filename

!to "editrom.bin",plain		; Name of output file with no load address

;---------------------- These are the symbol definitions for PET/CBM memory and IO chips

!source "stdzeropage.asm"	; $00-FF	Zero Page 
!source "stdlowmem.asm"		; $0100-03FC	Low Memory
!source "stdchips.asm"		; $E800-E8FF	Chips
!source "stdkernal.asm"		; $F000-FFFF	Kernal

!if COLOURPET = 1 { !source "colourpet.asm" }

;---------------------- Debug stuff

DBLINE = SCREEN_RAM + 24 * COLUMNS	; Calculate bottom line of screen for debug

;---------------------- Standard 2K Edit ROM code here
;*=e000				; Target address, normally $e000 for EDIT ROM

!source "editrom.asm"

;---------------------- Extended 4K Edit ROM code here
; *=e900			; Extended ROM start address ($e800-e8ff is reserved for IO)

!if EXTENDED  = 1 { !source "editromext.asm" }
!if COLOURPET = 1 { !source "colourpetsubs.asm" }
!if ESCCODES = 1  { !source "escapeseq.asm" }

!IF EXTENDED + COLOURPET + ESCCODES > 0 { !fill $F000-*,$FF } ; PAD to 4K ##########################
