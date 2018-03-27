; PET/CBM EDIT ROM - CRTC Register Table Selection
; ================
; Sets the CRTC Table depending on options
; COLUMNS ---- 40 or 80 column hardware (with special cases 90 and 32)
; SOFT40 ----- Software Defined 40-column modes

!if COLUMNS=80 {
		!if REFRESH = 0 { !source "crtc-80-50hz.asm" }
		!if REFRESH = 1 { !source "crtc-80-60hz.asm" }
		!if REFRESH = 2 { !source "crtc-80-pal.asm" }
		!if REFRESH = 3 { !source "crtc-80-ntsc.asm" }
		!if REFRESH = 4 { !source "crtc-4080-9inch.asm" }
		!if REFRESH = 5 { !source "crtc-80x35-60hz.asm" } ;EXPERIMENTAL 80x35 text screen
		!if REFRESH = 9 { !source "crtc-80-custom.asm" }
}

!if COLUMNS=40 {
	!IF SOFT40=1 {
		!if REFRESH = 0 { !source "crtc-soft40-50hz.asm" }
		!if REFRESH = 1 { !source "crtc-soft40-60hz.asm" }
		!if REFRESH = 2 { !source "crtc-soft40-pal.asm" }
		!if REFRESH = 3 { !source "crtc-soft40-ntsc.asm" }
		!if REFRESH = 4 { !source "crtc-4080-9inch.asm" }
		!if REFRESH = 9 { !source "crtc-soft40-custom.asm" }

	} ELSE {
		!if REFRESH = 0 { !source "crtc-40-50hz.asm" }
		!if REFRESH = 1 { !source "crtc-40-60hz.asm" }
		!if REFRESH = 2 { !source "crtc-40-pal.asm" }
		!if REFRESH = 3 { !source "crtc-40-ntsc.asm" }
		!if REFRESH = 4 { !source "crtc-4080-9inch.asm" }
		!if REFRESH = 9 { !source "crtc-40-custom.asm" }
	}
}

!if COLUMNS=90 {
		!source "crtc-90x35-60hz.asm"  ;EXPERIMENTAL 90x35 text screen
}

!if COLUMNS=32 {
		; For Tony Ellis' 6847 Project
		; We will default the 6545 CRTC to 40 columns for now.
		!if REFRESH = 0 { !source "crtc-40-50hz.asm" }
		!if REFRESH = 1 { !source "crtc-40-60hz.asm" }
		!if REFRESH = 2 { !source "crtc-40-pal.asm" }
		!if REFRESH = 3 { !source "crtc-40-ntsc.asm" }
		!if REFRESH = 4 { !source "crtc-4080-9inch.asm" }
		!if REFRESH = 9 { !source "crtc-40-custom.asm" }
}