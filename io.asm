; PET/CBM Editor ROM Project - Generates custom IO Area ($E800-E8FF) contents
; ==========================   IO.ASM
;
; This part of the ROM is not visible since IO is mapped here, so we will fill it
; with a decription of the editrom features and options.
; Files IO.ASM and INFO.ASM should contain the same info except for the encoding.
; This code use !TEXT so that it will appear normal for ASCII systems (ie: Windows, Mac)
;*********************************************************************************************************

!TEXT "**CBM EDIT ROM**"
!TEXT "["
+DATE

!TEXT "] CODEBASE="
!IF CODEBASE=0 { !TEXT "0" }
!IF CODEBASE=1 { !TEXT "1" }
!IF CODEBASE=2 { !TEXT "2" }

!IF COLOURPET = 1 {
	!TEXT " COLOURPET-"
	!IF COLOURVER=0 { !TEXT "beta" }
}

!TEXT " KEYBOARD="
	!IF KEYBOARD= 0 { !TEXT "n-qwerty" }
	!IF KEYBOARD= 1 { !TEXT "b-qwerty" }	; QWERTY layout
	!IF KEYBOARD= 2 { !TEXT "din" }
	!IF KEYBOARD= 3 { !TEXT "c64/vic" }
	!IF KEYBOARD= 4 { !TEXT "b-sjg" }	; Modified layout - cursor keys, esc etc
	!IF KEYBOARD= 5 { !TEXT "n-sjg" }	; Modified layout - @ replaced with ESC, backarrow becomes @
	!IF KEYBOARD= 6 { !TEXT "b-qwertz" }	; QWERTZ layout
	!IF KEYBOARD= 7 { !TEXT "b-azerty" }	; AZERTY layout
	!IF KEYBOARD= 8 { !TEXT "cbm-ii" }	; CBM-II keyboard (requires hardware mod)
	!IF KEYBOARD= 9 { !TEXT "n-sjg2" }	; Modified layout - backarrow replaced with ESC
	!IF KEYBOARD=11 { !TEXT "ted" }		; TED series (C16,C116,Plus/4 etc)

!TEXT " SCREEN="
	!IF COLUMNS=32  { !TEXT "32" }
	!IF COLUMNS=40  { !TEXT "40" }
	!IF COLUMNS=80  { !TEXT "80" }
	!IF COLUMNS=90  { !TEXT "90" }
	!IF ROWS=16     { !TEXT "x16" }
	!IF ROWS=25     { !TEXT "x25" }
	!IF ROWS=32     { !TEXT "x32" }
	!IF ROWS=35     { !TEXT "x35" }
	!IF SOFT40=1    { !TEXT " (soft40)" }
	!IF SS40=1      {
		!TEXT " ("
		!IF HARD4080=1  { !TEXT "hs" } else { !TEXT "ss" }
		!IF SS40MODE=40 { !TEXT "40)" }
		!IF SS40MODE=80 { !TEXT "80)" }
	}

!TEXT " HERTZ="
	!IF HERTZ=50 { !TEXT "50" }
	!IF HERTZ=60 { !TEXT "60" }

!TEXT " REFRESH="
!IF REFRESH=  0 { !TEXT "euro1" }
!IF REFRESH=  1 { !TEXT "n.america" }
!IF REFRESH=  2 { !TEXT "euro2" }
!IF REFRESH=  3 { !TEXT "euro8296d" }
!IF REFRESH=  9 { !TEXT "9inch" }
!IF REFRESH= 10 { !TEXT "9inch-inv" }
!IF REFRESH= 15 { !TEXT "pal" }
!IF REFRESH= 16 { !TEXT "ntsc" }
!IF REFRESH= 20 { !TEXT "debug-euro1" }
!IF REFRESH= 21 { !TEXT "debug-n.america" }
!IF REFRESH= 22 { !TEXT "debug-euro2" }
!IF REFRESH= 23 { !TEXT "debug-euro8296d" }
!IF REFRESH= 32 { !TEXT "exp-80x32" }
!IF REFRESH= 32 { !TEXT "exp-80x35" }
!IF REFRESH= 90 { !TEXT "exp-90x35" }
!IF REFRESH= 99 { !TEXT "custom" }

!TEXT " FEATURES:"
!IF DEBUG=1     { !TEXT " debug" }
!IF AUTORUN=1   { !TEXT " autorun" }
!IF BYPASS=1    { !TEXT "+bypass" }
!IF BANNER>0    { !TEXT " banner" }
!IF WEDGE=1     { !TEXT " wedge" }
!IF DISKBOOT=1  { !TEXT " diskboot"}
!IF EXECUDESK=1 { !TEXT " execudesk" }
!IF ESCCODES=1  { !TEXT " esc-codes" }
!IF KEYRESET=1  { !TEXT " keyreset" }
!IF BACKARROW>0 { !TEXT " backarrow" }
!IF SILENT=1    { !TEXT " silent" }
!IF CRUNCH=1    { !TEXT " crunch" }
!IF MOT6845=1   { !TEXT " mot6845" }

!TEXT ". COMMENT="
+COMMENT
