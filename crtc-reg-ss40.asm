; PET/CBM EDIT ROM - CRTC Register Tables
; ================
; For "Software Switchable Soft40" configurations. Only for 80-column machines.
; Sets the CRTC Table depending on options:
; Uses REFRESH setting to select proper config
;
;======================================
; NORMAL 4000/8000/8296/SuperPET MODELS
;======================================
; Common settings for "normal" machines (4000,8000,8296,SuperPET) with 12" monitor

;---------------------- Soft 40x25, 50 Hz, 20 kHz for 12" Internal Monitor (inverted video)
!IF REFRESH=0 {
CRT_CONFIG_TEXT2:	!byte $31,$14,$1F,$0F,$31,$00,$19,$25,$00,$09,$00,$00,$10,$00,$00,$00,$00,$00 
CRT_CONFIG_GRAPHICS2: 	!byte $31,$14,$1F,$0F,$31,$00,$19,$25,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00
}

;---------------------- Soft 40x25, 60 Hz, 20 kHz for 12" Internal Monitor (inverted video)
!IF REFRESH=1 {
CRT_CONFIG_TEXT2:	!byte $31,$14,$1f,$0f,$28,$05,$19,$21,$00,$09,$00,$00,$10,$00,$00,$00,$00,$00 
CRT_CONFIG_GRAPHICS2:	!byte $31,$14,$1f,$0f,$28,$05,$19,$21,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00
}

;---------------------- Soft 40x25, 50 Hz, 15.625 kHz (PAL)  for External Monitor (inverted video)
!IF REFRESH=2 {
CRT_CONFIG_TEXT2:	!byte $3f,$14,$28,$14,$24,$7b,$19,$20,$00,$09,$00,$00,$10,$00,$00,$00,$00,$00 
CRT_CONFIG_GRAPHICS2:	!byte $3f,$14,$28,$14,$24,$7b,$19,$20,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00
}

;---------------------- Soft 40x25, 60 Hz, 15.748 kHz (NTSC) for External Monitor (inverted video)
!IF REFRESH=3 {
CRT_CONFIG_TEXT2:	!byte $31,$14,$1f,$0f,$28,$05,$19,$21,$00,$09,$00,$00,$10,$00,$00,$00,$00,$00 
CRT_CONFIG_GRAPHICS2:	!byte $31,$14,$1f,$0f,$28,$05,$19,$21,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00
}

;---------------------- Soft 40x25, 50 Hz, 15 kHz for 9" Internal Monitor (non-inverted video)
; **** NEEDS FIXED ****
!IF REFRESH=4 {

}

;---------------------- Soft 40x25, 60 Hz, 15 kHz for 9" Internal Monitor (non-inverted video)
; **** NEEDS FIXED ****
!IF REFRESH=5 {

}

;===============
; 8296D MACHINES
;===============
; The 8296D has a different monitor than standard machines and requires slightly modified timing

;---------------------- 40x25, 50 Hz, 16.949 kHz for 12" Internal 8296D Monitor (V1)
!IF REFRESH=82 {
; **** NEEDS FIXED ****
}

;---------------------- 40x25, 50 Hz, 16.949 kHz for 12" Internal 8296D Monitor (V2)
!IF REFRESH=83 {
; **** NEEDS FIXED ****
}


;======================
; Extended/Experimental
;======================
; NOTE: Screens larger than 25 lines are for 8296 ONLY!!! The 8296 has additional screen RAM.
;       These settings push the monitor to it's maximum possible resolution. Because of this you loose
;       the ability to expand the line height in 'text' mode.

;---------------------- 40x32, 60 Hz, ?? kHz for 12" Internal Monitor (8296 ONLY!!!!)
; **** NEEDS FIXED ****
!IF REFRESH=90 {

}

;---------------------- 40x35, 60 Hz, ?? kHz for 12" Internal Monitor (8296 ONLY!!!!)
; **** NEEDS FIXED ****
!IF REFRESH=91 {

}

;---------------------- 45x35, 60 Hz, ?? kHz for 12" Internal Monitor (8296 ONLY!!!!)
; **** NEEDS FIXED ****
!IF REFRESH=92 {

}

;=======================
; CUSTOM - You Define It
;=======================

;---------------------- CUSTOM - Your parameters here!
; **** NEEDS FIXED ****
!IF REFRESH=99 {

}

