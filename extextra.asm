; PET/CBM EDIT ROM - Extended ROM Extraneous code
; ================
;
; This code doesn't seem to be used in 324243-04 ROM.
; Likely they were just left in from a previous ROM

;************* CRTC Chip Register Setup Tables (EXTENDED ROM)

!if COLUMNS = 80 {
	!if REFRESH = 0 { !source "crtc-80-50hz-old.asm" }
	!if REFRESH = 1 { !source "crtc-80-60hz-old.asm" }
}

!if COLUMNS = 40 {
	!if SOFT40 = 1 {
		!if REFRESH = 0 { !source "crtc-soft40-50hz-old.asm" }
		!if REFRESH = 1 { !source "crtc-soft40-60hz-old.asm" }
	} ELSE {
		!if REFRESH = 0 { !source "crtc-40-50hz-old.asm" }
		!if REFRESH = 1 { !source "crtc-40-60hz-old.asm" }
		!if REFRESH = 2 { !source "crtc-40-pal-old.asm" }
		!if REFRESH = 3 { !source "crtc-40-ntsc-old.asm" }
	}
}	
