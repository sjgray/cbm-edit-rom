; PET/CBM Editor ROM Project - Generate Info for IO or Extended ROM Code for Tab Stop Table
; ==========================   INFO.ASM
;
; INFO - This generates a text string containing info about the project properties
;        and variable settings. This can be included in the code area and if ESCCODES=1
;        can be printed using ESC-BACKARROW.
;
; Files IO.ASM and INFO.ASM should contain the same info except for the encoding.
; This code use !PET so that it will appear normal on the PET when printed.
;*********************************************************************************************************

!PET "["
+DATE

!PET "] codebase="
!IF CODEBASE=0 { !PET "0" }
!IF CODEBASE=1 { !PET "1" }
!IF CODEBASE=2 { !PET "2" }

!IF COLOURPET = 1 {
	!PET " colourpet"
	!IF COLOURVER=0 { !PET "-beta" }
}

!PET " kbd="
	!IF KEYBOARD= 0 { !PET "n-qwerty" }	; QWERTY layout
	!IF KEYBOARD= 1 { !PET "b-qwerty" }	; QWERTY layout
	!IF KEYBOARD= 2 { !PET "din" }		; German layout
	!IF KEYBOARD= 3 { !PET "c64/vic" }	; C64 or VIC layout
	!IF KEYBOARD= 4 { !PET "b-sjg" }	; Modified layout - cursor keys, esc etc
	!IF KEYBOARD= 5 { !PET "n-sjg" }	; Modified layout - @ replaced with ESC, backarrow becomes @
	!IF KEYBOARD= 6 { !PET "b-qwertz" }	; QWERTZ layout
	!IF KEYBOARD= 7 { !PET "b-azerty" }	; AZERTY layout
	!IF KEYBOARD= 8 { !PET "cbm-ii" }	; CBM-II keyboard (requires hardware mod)
	!IF KEYBOARD= 9 { !PET "n-sjg2" }	; Modified layout - backarrow replaced with ESC
	!IF KEYBOARD=11 { !PET "ted" }		; TED Series (C16,C116,Plus/4 etc)

!PET " screen="
	!IF COLUMNS=32  { !PET "32" }
	!IF COLUMNS=40  { !PET "40" }
	!IF COLUMNS=80  { !PET "80" }
	!IF COLUMNS=90  { !PET "90" }
	!IF ROWS=16     { !PET "x16" }
	!IF ROWS=25     { !PET "x25" }
	!IF ROWS=32     { !PET "x32" }
	!IF ROWS=35     { !PET "x35" }
	!IF SOFT40=1    { !PET " (soft40)" }
	!IF SS40=1      {
		!PET " ("
		!IF HARD4080=1  { !PET "hs" } else { !PET "ss" }
		!IF SS40MODE=40 { !PET "40)" }
		!IF SS40MODE=80 { !PET "80)" }
	}

!PET " hertz="
	!IF HERTZ=50 { !PET "50" }
	!IF HERTZ=60 { !PET "60" }

!PET " refresh="
	!IF REFRESH=  0 { !PET "euro1" }
	!IF REFRESH=  1 { !PET "n.america" }
	!IF REFRESH=  2 { !PET "euro2" }
	!IF REFRESH=  3 { !PET "euro8296d" }
	!IF REFRESH=  9 { !PET "9inch" }
	!IF REFRESH= 10 { !PET "9inch-inv" }
	!IF REFRESH= 15 { !PET "pal" }
	!IF REFRESH= 16 { !PET "ntsc" }
	!IF REFRESH= 20 { !PET "debug-euro1" }
	!IF REFRESH= 21 { !PET "debug-n.america" }
	!IF REFRESH= 22 { !PET "debug-euro2" }
	!IF REFRESH= 23 { !PET "debug-euro9296d" }
	!IF REFRESH= 32 { !PET "exp-80x32" }
	!IF REFRESH= 32 { !PET "exp-80x35" }
	!IF REFRESH= 90 { !PET "exp-90x35" }
	!IF REFRESH= 99 { !PET "custom" }

!PET " features:"
!IF DEBUG=1     { !PET " debug" }
!IF AUTORUN=1   { !PET " autorun" }
!IF BYPASS=1    { !PET "+bypass" }
!IF BANNER>0    { !PET " banner" }
!IF WEDGE=1     { !PET " wedge" }
!IF DISKBOOT=1  { !PET " diskboot" }
!IF EXECUDESK=1 { !PET " execudesk" }
!IF ESCCODES=1  { !PET " esc-codes" }
!IF KEYRESET=1  { !PET " keyreset" }
!IF BACKARROW>0 { !PET " backarrow" }
!IF SILENT=1    { !PET " silent" }
!IF CRUNCH=1    { !PET " crunch" }
!IF MOT6845=1   { !PET " mot6845" }

!PET ". comment="
+COMMENT
!BYTE 13,0
