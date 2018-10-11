; INFO - This generates a text string containing info about the project properties
;        and variable settings. This can be included in the code area and if ESCCODES=1
;        can be printed using ESC-BACKARROW.

!pet "["
+DATE

!pet "] codebase="
!IF CODEBASE=0 { !pet "0" }
!IF CODEBASE=1 { !pet "1" }
!IF CODEBASE=2 { !pet "2" }

!IF COLOURPET = 1 {
	!pet " COLOURPET-"
	!if COLOURVER=0 { !pet "beta" }
	!if COLOURVER=1 { !pet "release" }
}

!pet " keyboard="
	!if KEYBOARD=0 { !pet "n-qwerty" }
	!if KEYBOARD=1 { !pet "b-qwerty" }	; QWERTY layout
	!if KEYBOARD=2 { !pet "din" }
	!if KEYBOARD=3 { !pet "c64/vic" }
	!if KEYBOARD=4 { !pet "b-sjg" }	; Modified layout - cursor keys, esc etc
	!if KEYBOARD=5 { !pet "n-sjg" }	; Modified layout - @ replaced with ESC, backarrow becomes @
	!if KEYBOARD=6 { !pet "b-qwertz" }	; QWERTZ layout
	!if KEYBOARD=7 { !pet "b-azerty" }	; AZERTY layout
	!if KEYBOARD=8 { !pet "cbm-ii" }	; CBM-II keyboard (requires hardware mod)
	!if KEYBOARD=9 { !pet "n-sjg2" }	; Modified layout - backarrow replaced with ESC

!pet " screen="
	!if COLUMNS=32  { !pet "32" }
	!if COLUMNS=40  { !pet "40" }
	!if COLUMNS=80  { !pet "80" }
	!if COLUMNS=90  { !pet "90" }
	!if ROWS=16     { !pet "x16" }
	!if ROWS=25     { !pet "x25" }
	!if ROWS=32     { !pet "x32" }
	!if ROWS=35     { !pet "x35" }
	!if SOFT40=1    { !pet " (soft40)" }
	!if SS40=1      {
		!pet " ("
		!if HARD4080=1  { !pet "hs" } else { !pet "ss" }
		!if SS40MODE=40 { !pet "40)" }
		!if SS40MODE=80 { !pet "80)" }
	}

!pet " hertz="
	!if HERTZ=50 { !pet "50" }
	!if HERTZ=60 { !pet "60" }

!pet " refresh="
	!if REFRESH= 0 { !pet "euro" }
	!if REFRESH= 1 { !pet "n.america" }
	!if REFRESH= 2 { !pet "pal" }
	!if REFRESH= 3 { !pet "ntsc" }
	!if REFRESH= 4 { !pet "9inch" }
	!if REFRESH= 5 { !pet "8296-35line" }
	!if REFRESH= 6 { !pet "8296-32line" }
	!if REFRESH= 7 { !pet "8296d-euro" }
	!if REFRESH= 8 { !pet "8296d-n.america" }
	!if REFRESH=99 { !pet "custom" }

!pet " features="
!if ESCCODES=1  { !pet "esc-codes" }
!if AUTORUN=1   { !pet ",autorun" }
!if BYPASS=1    { !pet "+bypass" }
!if BANNER>0    { !pet ",banner" }
!if WEDGE=1     { !pet ",wedge" }
!if REBOOT=1    { !pet ",reboot" }
!if EXECUDESK=1 { !pet ",execudesk" }
!if BACKARROW>0 { !pet ",backarrow" }
!if MOT6845=1   { !pet ",mot6845" }
!if SILENT=1    { !pet ",silent" }
!if CRUNCH=1    { !pet ",crunch" }
!if DEBUG=1     { !pet ",debug" }
!pet ". comment="
+COMMENT
!byte 13,0
