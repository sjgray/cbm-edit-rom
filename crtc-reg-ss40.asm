; PET/CBM Edito ROM Project - CRTC Register Tables for Software Switchable SOFT40
; =========================   CRTC-REG-SS40.ASM
;
; For "Software Switchable Soft40" configurations. Only for 80-column machines.
; Sets the CRTC Table depending on REFRESH setting.
; These are 80-column tables and should exactly match the ones in CRTC-REG-NORMAL.ASM.
; The only difference is that LABELS have "2" added at the end to distinguish them.
;
;			REG#:  0   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17
;                             ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

;---------------------- 40/80x25, 50 Hz, 20 kHz for 12" Internal Monitor (inverted video R12=$10)
!IF REFRESH=0 {
CRT_CONFIG_TEXT2	!BYTE $31,$28,$29,$0F,$27,$00,$19,$20,$00,$09,$00,$00,$10,$00,$00,$00,$00,$00 
CRT_CONFIG_GRAPHICS2	!BYTE $31,$28,$29,$0F,$31,$00,$19,$25,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00
} ; EU: 4000/8000/8296	As used in 901498-01, 901474-04, 324243-01

;---------------------- 40/80x25, 60 Hz, 20 kHz for 12" Internal Monitor (inverted video)
!IF REFRESH=1 {
CRT_CONFIG_TEXT2	!BYTE $31,$28,$29,$0F,$20,$03,$19,$1d,$00,$09,$00,$00,$10,$00,$00,$00,$00,$00 
CRT_CONFIG_GRAPHICS2	!BYTE $31,$28,$29,$0F,$28,$05,$19,$21,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00
} ; US: 4000/8000	As used in 901499-01, 901474-03

;---------------------- 40/80x25, 50 Hz, 20 kHz for 12" Internal Monitor (inverted video R12=$10)
!IF REFRESH=2 {
CRT_CONFIG_TEXT2	!BYTE $32,$28,$28,$08,$26,$02,$19,$20,$00,$09,$00,$00,$10,$00,$00,$00,$00,$00 
CRT_CONFIG_GRAPHICS2	!BYTE $32,$28,$28,$08,$30,$00,$19,$25,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00
} ; EU: Alternate	As used in 901474-04

;---------------------- 40/80x25, 50 Hz, 16.949 kHz for 12" Internal 8296D Monitor
!IF REFRESH=3 {
CRT_CONFIG_TEXT2	!BYTE $3A,$28,$2C,$08,$20,$09,$19,$1D,$00,$09,$00,$00,$10,$00,$00,$00,$00,$00
CRT_CONFIG_GRAPHICS2	!BYTE $3A,$28,$2C,$08,$29,$03,$19,$22,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00
} ; EU: 8296D		Used in 324243-03, 324243-04

;=======================
; Adapted		9" Display, NTSC, PAL etc
;=======================
;			REG#: 0   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17
;                              ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

;---------------------- 40/80x25, 50 Hz, 15 kHz for 9" Internal Monitor (non-inverted video)
!IF REFRESH=9 {
CRT_CONFIG_TEXT2	!BYTE $3F,$28,$30,$8E,$20,$00,$19,$1C,$00,$09,$00,$00,$00,$00,$00,$00,$00,$00 
CRT_CONFIG_GRAPHICS2	!BYTE $3F,$28,$30,$8E,$20,$00,$19,$1C,$00,$07,$00,$00,$00,$00,$00,$00,$00,$00 
} ; EU: 9" Monitor 	Used when CRTC board is installed in 2001 etc

;---------------------- 40/80x25, 60 Hz, 15 kHz for 9" Internal Monitor (non-inverted video)
!IF REFRESH=10 {
CRT_CONFIG_TEXT2	!BYTE $3F,$28,$30,$8E,$20,$00,$19,$1C,$00,$09,$00,$00,$00,$00,$00,$00,$00,$00 
CRT_CONFIG_GRAPHICS2	!BYTE $3F,$28,$30,$8E,$20,$00,$19,$1C,$00,$07,$00,$00,$00,$00,$00,$00,$00,$00 
} ; US: 9" Monitor	Used when CRTC board is installed in 2001 etc

;---------------------- 40/80x25, 50 Hz, 15.625 kHz (PAL)  for External Monitor (inverted video)
!IF REFRESH=15 {
CRT_CONFIG_TEXT2	!BYTE $3F,$28,$2F,$14,$24,$7b,$19,$20,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00 
CRT_CONFIG_GRAPHICS2	!BYTE $3F,$28,$2F,$14,$24,$7b,$19,$20,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00
} ; EU: PAL		For PAL Composite Video

;---------------------- 40/80x25, 60 Hz, 15.748 kHz (NTSC) for External Monitor (inverted video)
!IF REFRESH=16 {
CRT_CONFIG_TEXT2	!BYTE $3F,$28,$32,$12,$1E,$06,$19,$1C,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00 
CRT_CONFIG_GRAPHICS2	!BYTE $3F,$28,$32,$12,$1E,$06,$19,$1C,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00
} ; US: NTSC		For NTSC Composite Video or CGA/RGBI Monitor

;=======================
; DEBUG 		26-lines on screen. Just add 20 to the normal REFRESH
;=======================
; This adds an extra visible line at the bottom so that you can put DEBUG information on the screen without
; disturbing the regular display. Part of the first line will be mirrored.
; These are the same as REFRESH 0 to 3 except CRTC register 06 has been increased by one
;
; NOTE: 40-column has 24 unused bytes. 80-column has 48. 8296 has 80+.
;
;			REG#:  0   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17
;                             ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

;---------------------- 40/80x26, 50 Hz, 20 kHz for 12" Internal Monitor (inverted video R12=$10)
!IF REFRESH=20 {        ;                             vvv
CRT_CONFIG_TEXT2	!BYTE $31,$28,$29,$0F,$27,$00,$1A,$20,$00,$09,$00,$00,$10,$00,$00,$00,$00,$00 
CRT_CONFIG_GRAPHICS2	!BYTE $31,$28,$29,$0F,$31,$00,$1A,$25,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00
} ; EU: 4000/8000/8296	As used in 901498-01, 901474-04, 324243-01

;---------------------- 40/80x26, 60 Hz, 20 kHz for 12" Internal Monitor (inverted video)
!IF REFRESH=21 {
CRT_CONFIG_TEXT2	!BYTE $31,$28,$29,$0F,$20,$03,$1A,$1D,$00,$09,$00,$00,$10,$00,$00,$00,$00,$00 
CRT_CONFIG_GRAPHICS2	!BYTE $31,$28,$29,$0F,$28,$05,$1A,$21,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00
} ; US: 4000/8000	As used in 901499-01, 901474-03

;---------------------- 40/80x26, 50 Hz, 20 kHz for 12" Internal Monitor (inverted video R12=$10)
!IF REFRESH=22 {
CRT_CONFIG_TEXT2	!BYTE $32,$28,$28,$08,$26,$02,$1A,$20,$00,$09,$00,$00,$10,$00,$00,$00,$00,$00 
CRT_CONFIG_GRAPHICS2	!BYTE $32,$28,$28,$08,$30,$00,$1A,$25,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00
} ; EU: Alternate	As used in 901474-04

;---------------------- 40/80x26, 50 Hz, 16.949 kHz for 12" Internal 8296D Monitor
!IF REFRESH=23 {
CRT_CONFIG_TEXT2	!BYTE $3A,$28,$2C,$08,$20,$09,$1A,$1D,$00,$09,$00,$00,$10,$00,$00,$00,$00,$00
CRT_CONFIG_GRAPHICS2	!BYTE $3A,$28,$2C,$08,$29,$03,$1A,$22,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00
} ; EU: 8296D		Used in 324243-03, 324243-04

;======================
; Extended/Experimental
;======================
; NOTE: Screens larger than 25 lines are for 8296/8296D ONLY, which have additional screen RAM.
;       These settings push the monitor to it's maximum possible resolution. Because of this you loose
;       the ability to expand the line height in 'text' mode.
;
;			REG#:   0   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17
;                              ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

;---------------------- 40/80x32, 60 Hz, ?? kHz for 12" Internal Monitor (8296 ONLY!!!!)
!IF REFRESH=32 {
CRT_CONFIG_TEXT2	!BYTE $2F,$28,$29,$0F,$28,$07,$20,$27,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00 
CRT_CONFIG_GRAPHICS2	!BYTE $2F,$28,$29,$0F,$28,$07,$20,$27,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00 
}

;---------------------- 40/80x35, 60 Hz, ?? kHz for 12" Internal Monitor (8296 ONLY!!!!)
!IF REFRESH=35 {
CRT_CONFIG_TEXT2	!BYTE $2F,$28,$29,$0F,$28,$07,$23,$27,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00 
CRT_CONFIG_GRAPHICS2	!BYTE $2F,$28,$29,$0F,$28,$07,$23,$27,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00 
}

;---------------------- 45/90x35, 60 Hz, ?? kHz for 12" Internal Monitor (8296 ONLY!!!!)
!IF REFRESH=90 {
CRT_CONFIG_TEXT2	!BYTE $34,$2D,$2D,$0F,$28,$11,$23,$27,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00 
CRT_CONFIG_GRAPHICS2	!BYTE $34,$2D,$2D,$0F,$28,$11,$23,$27,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00 
}

;=======================
; CUSTOM - You Define It  Refresh: 99
;=======================
; Refer to CRTC documentation! Incorrect parameters could damage your screen!
;
;			REG#:   0   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17
!IF REFRESH=99 {	;      ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
CRT_CONFIG_TEXT2	!BYTE $3E,$28,$32,$12,$1E,$06,$19,$1C,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00 
CRT_CONFIG_GRAPHICS2	!BYTE $3E,$28,$32,$12,$1E,$06,$19,$1C,$00,$07,$00,$00,$10,$00,$00,$00,$00,$00
}
