; IO - This part of the ROM is not visible since IO is mapped here, so we will fill it
; ==   with a decription of the editrom features and options.

!text "**CBM EDIT ROM**"
!text "["
+DATE

!text "] CODEBASE="
!IF CODEBASE=0 { !text "0" }
!IF CODEBASE=1 { !text "1" }
!IF CODEBASE=2 { !text "2" }

!IF COLOURPET = 1 {
	!text " COLOURPET-"
	!if COLOURVER=0 { !text "beta" }
	!if COLOURVER=1 { !text "release" }
}

!text " KEYBOARD="
	!if KEYBOARD=0 { !text "n-qwerty" }
	!if KEYBOARD=1 { !text "b-qwerty" }	; QWERTY layout
	!if KEYBOARD=2 { !text "din" }
	!if KEYBOARD=3 { !text "c64/vic" }
	!if KEYBOARD=4 { !text "b-sjg" }	; Modified layout - cursor keys, esc etc
	!if KEYBOARD=5 { !text "n-sjg" }	; Modified layout - @ replaced with ESC, backarrow becomes @
	!if KEYBOARD=6 { !text "b-qwertz" }	; QWERTZ layout
	!if KEYBOARD=7 { !text "b-azerty" }	; AZERTY layout
	!if KEYBOARD=8 { !text "cbm-ii" }	; CBM-II keyboard (requires hardware mod)
	!if KEYBOARD=9 { !text "n-sjg2" }	; Modified layout - backarrow replaced with ESC

!text " SCREEN="
	!if COLUMNS=40  { !text "40" }
	!if COLUMNS=80  { !text "80" }
	!if SOFT40=1    { !text " (soft40)" }
	!if SS40=1      { !text " (ss40)" }

!text " HERTZ="
	!if HERTZ=50 { !text "50" }
	!if HERTZ=60 { !text "60" }

!text " REFRESH="
	!if REFRESH=0 { !text "euro" }
	!if REFRESH=1 { !text "n.america" }
	!if REFRESH=2 { !text "pal" }
	!if REFRESH=3 { !text "ntsc" }

!text " FEATURES="
!if ESCCODES=1  { !text "esc-codes" }
!if AUTORUN=1   { !text ",autorun" }
!if BYPASS=1    { !text "+bypass" }
!if BANNER>0    { !text ",banner" }
!if WEDGE=1     { !text ",wedge" }
!if REBOOT=1    { !text ",reboot" }
!if EXECUDESK=1 { !text ",execudesk" }
!if BACKARROW=1 { !text ",backarrow" }
!if MOT6845=1   { !text ",mot6845" }
!if SILENT=1    { !text ",silent" }
!if CRUNCH=1    { !text ",crunch" }
!if DEBUG=1     { !text ",debug" }
!text ". COMMENT="
+COMMENT
!fill $E900-*,$20 
