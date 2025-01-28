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
	!pet ",colorpet"
	!if COLOURVER=0 { !pet "-beta" }
}

!pet ". kbd="
	!if KEYBOARD= 0 { !pet "n" }		; QWERTY layout
	!if KEYBOARD= 1 { !pet "b" }		; QWERTY layout
	!if KEYBOARD= 2 { !pet "din" }		; German layout
	!if KEYBOARD= 3 { !pet "c64" }		; C64 or VIC layout
	!if KEYBOARD= 4 { !pet "b-sjg" }	; Modified layout - cursor keys, esc etc
	!if KEYBOARD= 5 { !pet "n-sjg" }	; Modified layout - @ replaced with ESC, backarrow becomes @
	!if KEYBOARD= 6 { !pet "b-qwertz" }	; QWERTZ layout
	!if KEYBOARD= 7 { !pet "b-azerty" }	; AZERTY layout
	!if KEYBOARD= 8 { !pet "cbm-ii" }	; CBM-II keyboard (requires hardware mod)
	!if KEYBOARD= 9 { !pet "n-sjg2" }	; Modified layout - backarrow replaced with ESC
	!if KEYBOARD=11 { !pet "ted" }		; TED Series (C16,C116,Plus/4 etc)

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
	!if REFRESH=  0 { !pet "euro" }
	!if REFRESH=  1 { !pet "n.america" }
	!if REFRESH=  2 { !pet "pal" }
	!if REFRESH=  3 { !pet "ntsc" }
	!if REFRESH=  4 { !pet "9inch" }
	!if REFRESH= 82 { !pet "8296d-v1" }
	!if REFRESH= 83 { !pet "8296d-v2" }
	!if REFRESH= 90 { !pet "8296(d)-n.a." }
	!if REFRESH= 91 { !pet "8296(d)-n.a." }
	!if REFRESH= 92 { !pet "8296(d)-n.a." }
	!if REFRESH= 99 { !pet "custom" }

!pet " features="
!if DISKBOOT=1  { !pet "diskboot" }
!if ESCCODES=1  { !pet "esc-codes" }
!if AUTORUN=1   { !pet ",autorun" }
!if BYPASS=1    { !pet "+bypass" }
!if BANNER>0    { !pet ",banner" }
!if WEDGE=1     { !pet ",wedge" }
!if KEYRESET=1  { !pet ",reboot" }
!if EXECUDESK=1 { !pet ",execudesk" }
!if BACKARROW>0 { !pet ",backarrow" }
!if MOT6845=1   { !pet ",mot6845" }
!if SILENT=1    { !pet ",silent" }
!if CRUNCH=1    { !pet ",crunch" }
!if DEBUG=1     { !pet ",debug" }
!pet ". comment="
+COMMENT
!byte 13,0
