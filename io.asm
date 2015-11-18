; IO - This part of the ROM is not visible since IO is mapped here, so we will fill it
; ==   with a decription of the editrom features and options.

!text "** CBM EDIT ROM PROJECT ** Codebase="

!IF CODEBASE=0 { !text "0" }
!IF CODEBASE=1 { !text "1" }
!IF CODEBASE=2 { !text "2" }

!IF COLOURPET = 1 {
	!text ",COLOURPET 2015-11-17 "
	!text ", Hardware="
		!if COLOURVER=0 { !text "BETA" }
		!if COLOURVER=1 { !text "RELEASE" }
}

!text ", Keyboard="
	!if KEYBOARD=0 { !text "N" }
	!if KEYBOARD=1 { !text "B" }		; QWERTY layout
	!if KEYBOARD=2 { !text "DIN" }
	!if KEYBOARD=3 { !text "C64/VIC" }
	!if KEYBOARD=4 { !text "B-SJG" }	; Modified layout - cursor keys, esc etc
	!if KEYBOARD=5 { !text "N-SJG" }	; Modified layout - @ replaced with ESC
	!if KEYBOARD=6 { !text "BZ" }		; QWERTZ layout
	!if KEYBOARD=7 { !text "CBM-II" }	; CBM-II keyboard (requires hardware mod)

!text ", Screen Width="
	!if COLUMNS=40  { !text "40" }
	!if COLUMNS=80  { !text "80" }
	!if SOFT40=1    { !text " (SOFT 40)" }
	!if SS40=1      { !text " (Switchable 40)" }

!text ", Hertz="
	!if HERTZ=50 { !text "50" }
	!if HERTZ=60 { !text "60" }

!text ", Refresh="
	!if REFRESH=0 { !text "EURO" }
	!if REFRESH=1 { !text "N.AMERICA" }
	!if REFRESH=2 { !text "PAL" }
	!if REFRESH=3 { !text "NTSC" }

!text ", ESC Codes="
	!if ESCCODES=0 { !text "NO" }
	!if ESCCODES=1 { !text "YES" }

!text ", Wedge="
	!if WEDGE=0 { !text "NO" }
	!if WEDGE=1 { !text "YES" }

!text ", Reboot="
	!if REBOOT=0 { !text "NO" }
	!if REBOOT=1 { !text "YES" }

!if EXECUDESK=1 { !text ", Execudesk=YES" }

!fill $E900-*,$00 
