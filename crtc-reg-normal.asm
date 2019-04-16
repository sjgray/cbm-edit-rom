; PET/CBM EDIT ROM - CRTC Register Tables
; ================
; For "normal" configurations (ie: for single main screen)
; Sets the CRTC Table depending on options:
; COLUMNS = 32,40,64,80,90
;
;======================================
; NORMAL 4000/8000/8296/SuperPET MODELS
;======================================
; Common settings for "normal" machines (4000,8000,8296,SuperPET) with 12" monitor
; NOTE: The 8296D uses a different monitor than the 8296 and requires a different register table (see below)

;---------------------- 40/80x25, 50 Hz, 20 kHz for 12" Internal Monitor (inverted video)
!IF REFRESH=0 {
CRT_CONFIG_TEXT:	!byte $31,$28,$29,$0f,$27,$00,$19,$20,$00,$09,$00,$00,$10,$00,$00,$00,$00,$00 
CRT_CONFIG_GRAPHICS:	!byte $31,$28,$29,$0f,$31,$00,$19,$25,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00
}

;---------------------- 40/80x25, 60 Hz, 20 kHz for 12" Internal Monitor (inverted video)
!IF REFRESH=1 {
CRT_CONFIG_TEXT:	!byte $31,$28,$29,$0f,$20,$03,$19,$1d,$00,$09,$00,$00,$10,$00,$00,$00,$00,$00 
CRT_CONFIG_GRAPHICS:	!byte $31,$28,$29,$0f,$28,$05,$19,$21,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00
}

;---------------------- 40/80x25, 50 Hz, 15.625 kHz (PAL)  for External Monitor (inverted video)
!IF REFRESH=2 {
CRT_CONFIG_TEXT:	!byte $3f,$28,$2f,$14,$24,$7b,$19,$20,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00 
CRT_CONFIG_GRAPHICS:	!byte $3f,$28,$2f,$14,$24,$7b,$19,$20,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00
}

;---------------------- 40/80x25, 60 Hz, 15.748 kHz (NTSC) for External Monitor (inverted video)
!IF REFRESH=3 {
CRT_CONFIG_TEXT:	!byte $3f,$28,$32,$12,$1e,$06,$19,$1C,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00 
CRT_CONFIG_GRAPHICS:	!byte $3f,$28,$32,$12,$1e,$06,$19,$1C,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00
}

;---------------------- 40/80x25, 50 Hz, 15 kHz for 9" Internal Monitor (non-inverted video)
!IF REFRESH=4 {
CRT_CONFIG_TEXT:	!byte $3F,$28,$30,$8E,$20,$00,$19,$1C,$00,$09,$00,$00,$00,$00,$00,$00,$00,$00 
CRT_CONFIG_GRAPHICS:	!byte $3F,$28,$30,$8E,$20,$00,$19,$1C,$00,$07,$00,$00,$00,$00,$00,$00,$00,$00 
}

;---------------------- 40/80x25, 60 Hz, 15 kHz for 9" Internal Monitor (non-inverted video)
!IF REFRESH=5 {
CRT_CONFIG_TEXT:	!byte $3F,$28,$30,$8E,$20,$00,$19,$1C,$00,$09,$00,$00,$00,$00,$00,$00,$00,$00 
CRT_CONFIG_GRAPHICS:	!byte $3F,$28,$30,$8E,$20,$00,$19,$1C,$00,$07,$00,$00,$00,$00,$00,$00,$00,$00 
}

;===============
; 8296D MACHINES
;===============
; The 8296D has a different monitor than standard machines and requires slightly modified timing

;---------------------- 40/80x25, 50 Hz, 16.949 kHz for 12" Internal 8296D Monitor (V1)
!IF REFRESH=82 {
CRT_CONFIG_TEXT:	!byte $3A,$28,$2C,$08,$20,$09,$19,$1D,$00,$09,$00,$00,$10,$00,$00,$00,$00,$00
CRT_CONFIG_GRAPHICS:	!byte $3A,$28,$2C,$08,$29,$03,$19,$22,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00
}

;---------------------- 40/80x25, 50 Hz, 16.949 kHz for 12" Internal 8296D Monitor (V2)
!IF REFRESH=83 {
CRT_CONFIG_TEXT:	!byte $32,$28,$28,$08,$26,$02,$19,$20,$00,$09,$00,$00,$10,$00,$00,$00,$00,$00
CRT_CONFIG_GRAPHICS:	!byte $32,$28,$28,$08,$30,$00,$19,$25,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00
}


;======================
; Extended/Experimental
;======================
; NOTE: Screens larger than 25 lines are for 8296 ONLY!!! The 8296 has additional screen RAM.
;       These settings push the monitor to it's maximum possible resolution. Because of this you loose
;       the ability to expand the line height in 'text' mode.

;---------------------- 40/80x32, 60 Hz, ?? kHz for 12" Internal Monitor (8296 ONLY!!!!)
!IF REFRESH=90 {
CRT_CONFIG_TEXT:	!byte 47,40,41,15,40,7,32,39,0,7,0,0,16,0,0,0,0,0 
CRT_CONFIG_GRAPHICS:	!byte 47,40,41,15,40,7,32,39,0,7,0,0,16,0,0,0,0,0 
}

;---------------------- 40/80x35, 60 Hz, ?? kHz for 12" Internal Monitor (8296 ONLY!!!!)
!IF REFRESH=91 {
CRT_CONFIG_TEXT:	!byte 47,40,41,15,40,7,35,39,0,7,0,0,16,0,0,0,0,0 
CRT_CONFIG_GRAPHICS:	!byte 47,40,41,15,40,7,35,39,0,7,0,0,16,0,0,0,0,0 
}

;---------------------- 45/90x35, 60 Hz, ?? kHz for 12" Internal Monitor (8296 ONLY!!!!)
!IF REFRESH=92 {
CRT_CONFIG_TEXT:	!byte 52,45,45,12,40,17,35,39,0,7,0,0,16,0,0,0,0,0 
CRT_CONFIG_GRAPHICS:	!byte 52,45,45,12,40,17,35,39,0,7,0,0,16,0,0,0,0,0 
}

;=======================
; CUSTOM - You Define It
;=======================

;---------------------- CUSTOM - Your parameters here!
!IF REFRESH=99 {
CRT_CONFIG_TEXT:	!byte $3e,$28,$32,$12,$1e,$06,$19,$1C,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00 
CRT_CONFIG_GRAPHICS:	!byte $3e,$28,$32,$12,$1e,$06,$19,$1C,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00
}

