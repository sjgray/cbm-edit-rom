; PET/CBM Editor ROM Project - Configuration File
; ==========================   !324243-04.asm
; edit-4-80-DIN-50   8296D     CBMROM=9
;
; For complete documentation see:  cbmsteve.ca/editrom/index.html
;
; A Project to create replacement EDIT ROMs for the PET/CBM line of computers.
; Edit these settings to choose which features are included. You can copy this file with a different name if you want to
; have multiple setting files or to build standard roms etc to validate source changes, etc...
; ACME.EXE must be in same folder or in search path!
;----------------------------------------------------------------------------------------------------------------------------
; To create a binary type the following: ACME {name of this file}
; For example: ACME !CUSTOM.ASM
;----------------------------------------------------------------------------------------------------------------------------
; The following will be put in the IO area (if used). Ensure comments do not overflow into code space!

!macro DATE      { !pet "2025-09-09" }
!macro COMMENT   { !pet "sjg-editrom" }

;----------------------------------------------------------------------------------------------------------------------------
; NAME		FEATURE				VALID OPTIONS			NOTES / FUTURE OPTIONS
;---------	-------				-------------			----------------------

CODEBASE  = 2   ; Code Base			0=4000, 1=8000, 2=8296		Important!!! Read Webpage for details
OPTROM    = 0   ; Location of EXT code		0=$E800, 1=$9000, 2=$A000	Normal is 0.
CBMROM    = 9   ; For CBM ROM specific code	0=none, 1-10 = CBM ROM #	Normal is 0.

;-- Keyboard
KEYSCAN   = 2   ; Keyboard Scanner		0=Normal,1=Business,2=DIN
KEYBOARD  = 2	; Keyboard type:		0=N-QWERTY,1=B-QWERTY,2=DIN,3=C64,4=B-SJG,5=N-SJG,6=B-QWERTZ,7=B-AZERTY,8=CBM-II (req hw mod)
REPEATOPT = 0	; Key Repeat Option		0=No (Always ON), 1=Yes
FONTSET   = 0	; Initial Screen Font		0=Text/Lower, 1=Upper/Graphics	Generally: 40xx machines=1, 8xxx machines=0

;-- Screen
REFRESH   = 3	; Screen refresh:		0/2=Euro,1=N.A.,15=PAL,16=NTSC,9/10=9",82=8296,32=32-line,35=35-line,90=90x35,99=Custom
COLUMNS   = 80	; Screen Width			40,80,90,32 columns		Special cases 32 or 90.
ROWS      = 25  ; Screen Height			25,35,16 rows			Special cases 16 or 35.

;-- Line Frequency (50/60)
HERTZ     = 50	; Line Frequency (Clock):	50=Euro, 60=N.America
IRQFIX    = 0   ; Fix Jiffy Clock?		0=No, 1=Yes			Still needs investigating.

;-- ESC Codes
ESCCODES  = 0	; Add ESC codes? 		0=No, 1=Yes			Enable when using COLOURPET or SS40.
VIDSWITCH = 0   ; Video Mode Select ESC codes?  0=No, 1=Yes			Requires ESC Codes! ESC+0 to ESC+9 to Switch CRTC parameters.

;-- EXTended Features
EXECUDESK = 0	; Add Execudesk Menu?		0=No, 1=Yes, 2=Yes/OPTROM	Note: Requires BOOT to TEXT mode!
COLOURPET = 0	; ColourPET additions?		0=No, 1=Yes			Requires ESC Codes! ESC+0 to ESC+? to set Colour (unless VIDSWITCH=1).
UPET      = 0   ; Is a Ultra-PET/Micro-PET?     0=No, 1=Yes                     For special Reboot - Andre Fachat's project

;-- AutoRUN Features
AUTORUN   = 0   ; Set for AutoRUN features	0=No, 1=Yes			Enable if you use any AUTOBOOT feature below
BYPASS    = 0   ; Check for key to bypass? 	0=No, 1=Yes			Valid when AUTORUN=1. Hold key on ROW9 to bypass.
BANNER    = 0 	; Custom Banner (power on msg)?	0=No, N=Banner# (1-21,98,99)    Valid when AUTORUN=1. Refer to docs or source. 99=custom message
WEDGE     = 0	; DOS Wedge?			0=No, 1=Yes			Valid when AUTORUN=1.
WEDGEMSG  = 0	; Show wedge message?		0=No, 1=Yes			Valid when AUTORUN=1 and WEDGE>0.
DISKBOOT  = 0	; Boot first file on disk?	0=No, 1=Yes			Valid when AUTORUN=1.

;-- 40/80 Switching
SOFT40    = 0	; 40 columns on 8032s?		0=No, 1=Yes			Do NOT enable SOFT40 and SS40 at the same time!
SS40      = 0	; Software Switchable Soft-40	0=No, 1=Yes			Also set ESCCODES=1. Also if BACKARROW>0 and BACKACTION=1.
SS40MODE  = 80  ; Initial SS40 Mode		40 or 80 columns		Valid when SS40=1.
HARD4080  = 0   ; Hardware 40/80 Board?         0=No, 1=Yes			Valid when SS40=1.

;-- Misc Options
GRKMODE   = 0   ; REPEAT generates Graphic Chr	0=No, 1=Yes			For B keyboard to generate graphics symbols like N keyboard
KEYRESET  = 0	; Add keyboard reset? 		0=No, 1=Yes			Reboot machine when combination of keys are pressed
SILENT    = 0	; Disable BELL/CHIME		0=Normal, 1=Disabled		Disables BELL
BACKARROW = 0   ; SHIFT-Backarrow Hack code?	0=NO, 1=Yes, 2=Yes EXT		Enable Shift-Backarrow, and where to put the code.
BACKACTION= 0   ; Backarrow Action		0=Text/Graphic, 1=40/80		Which Backarrow Action? NOTE: 40/80 requires ESC Codes!

MOT6845   = 0   ; Is CRTC a Motorola 6845?      0=No, 1=Yes			Probably 0=No for compatibility.
INFO      = 0   ; Add proj info to code area?	0=NO, 1=Yes,2=Yes+FONT		INFO=2 shows character set at top of screen

CRUNCH    = 0   ; Remove unneeded code?		0=No, 1=Yes			Removes NOPs, filler, and unreachable code.
BUGFIX    = 0   ; Correct Known bugs?		0=No, 1=Yes			Fix known bugs
NOFILL    = 0   ; Disable FILL?			0=No, 1=Yes			Lets you test assemble but will NOT generate usable code!!!!!

;-- Debugging
DEBUG 	  = 0     ; Add debugging?		0=No, 1=YES                     Inline DEBUG
IRQDEBUG  = 0     ; Add IRQ debugging?          0=No, 1=Yes                     IRQ    DEBUG
IRQMEM    = $00E0 ; Start Memory location       $0000-$FFFF			IRQ Debug Memory Start
IRQBYTES  = 23    ; How many to show?           23,47,79 depending on system    Normal: 40-col=24, 80-col=48, 8296=80 (subtract 1 for IRQ at start of line)

;-- ColourPET Options
COLOURVER = 0	; ColourPET Hardware Version	0=Beta,1=Normal/uPET		ColourRAM start: 0=$8400, 1=$8800 (use for VICE).
COLOURMODE= 0	; ColourPET Hardware Type	0=Digital, 1=Analog
COLOURPAL = 0   ; ColourPET Analog Palette      0=C128, 1=C64                   Default Analog Colour Palette.  POKE208,n to change
DEFAULTFG = 0	; ColourPET Foreground colour   0 to 15 RGBI 			0=black,1=DkGry,2=DkBlu ,3=LtBlu, 4=DkGrn, 5=Grn,   6=DkCyan,7=LtCyan
DEFAULTBG = 0	; ColourPET Background colour   0 to 15 RGBI 			8=DKred,9=LTred,10=DKpur,11=LTpur,12=DkYel,13=LtYel,14=LtGry,15=White
DEFAULTBO = 0   ; ColourPET Border colour       0 to 15 RGBI
BYPASSFG  = 0   ; ColourPET Bypass FG     	0 to 15 RGBI			Colours when AUTOSTART is bypassed.
BYPASSBG  = 0   ; ColourPET Bypass BG     	0 to 15 RGBI

;-- Set output file and include the main EDITROM.ASM

!TO "binaries/editrom-custom.bin",plain			; Generic output file with no load address
!SOURCE "editrom.asm"					; Do not modify this line!
