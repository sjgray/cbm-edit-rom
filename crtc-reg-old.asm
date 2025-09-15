; PET/CBM Editor ROM Project - ** OLD ** CRTC Setup Tables - For CODEBASE 2
; ==========================   CRT-REG-OLD.ASM
;
; Note: The 8296D has a different monitor than normal 80-column PETs
; These tables are used to program the CRTC chip to set the screen to the proper rows, columns, and timing

;-------------- 80x25, 50 Hz, 20 kHz, Internal 8296 monitor
!IF CBMROM=0 {
CRT_CONFIG_TEXT_OLD	!BYTE $31,$28,$29,$0F,$27,$00,$19,$20,$00,$09,$00,$00,$30,$00,$00,$00,$00,$00
CRT_CONFIG_GRAPHICS_OLD	!BYTE $31,$28,$29,$0F,$31,$00,$19,$25,$00,$07,$00,$00,$30,$00,$00,$00,$00,$00
} ; 			Used in: 324243-02b-c2

!IF CBMROM=6 { ;
CRT_CONFIG_TEXT_OLD	!BYTE $BE,$28,$29,$0F,$27,$00,$19,$20,$00,$09,$00,$00,$30,$00,$00,$00,$00,$00
CRT_CONFIG_GRAPHICS_OLD	!BYTE $31,$28,$29,$0F,$31,$00,$19,$25,$00,$07,$00,$00,$30,$00,$00,$00,$00,$00
}

;-------------- 80x25, 50 Hz, 20 kHz, Internal 8296 monitor
!IF CBMROM=7 {
CRT_CONFIG_TEXT_OLD	!BYTE $31,$28,$29,$0F,$27,$00,$19,$20,$00,$09,$00,$00,$30,$00,$00,$00,$00,$00
CRT_CONFIG_GRAPHICS_OLD	!BYTE $31,$28,$29,$0F,$31,$00,$19,$25,$00,$07,$00,$00,$30,$00,$00,$00,$00,$00
} ;			Used in: 324243-01

;-------------- 80x25, 50 Hz, 20 kHz, Internal 8296 monitor
!IF CBMROM=8 {
CRT_CONFIG_TEXT_OLD    	!byte $3A,$28,$2C,$08,$20,$09,$19,$1D,$00,$09,$00,$00,$30,$00,$00,$00,$00,$00
CRT_CONFIG_GRAPHICS_OLD	!byte $3A,$28,$2C,$08,$29,$03,$19,$22,$00,$07,$00,$00,$30,$00,$00,$00,$00,$00
}; 			Used in: 324243-03

;-------------- 80x25, 50 Hz, 20 kHz, Internal 8296D monitor
!IF CBMROM=9 {
CRT_CONFIG_TEXT_OLD	!byte $3A,$28,$2C,$08,$20,$09,$19,$1D,$00,$09,$00,$00,$30,$00,$00,$00,$00,$00
CRT_CONFIG_GRAPHICS_OLD	!byte $3A,$28,$2C,$08,$29,$03,$19,$22,$00,$07,$00,$00,$30,$00,$00,$00,$00,$00
} ; 			Used in: 324243-04

;-------------- 80x25, 50 Hz, 20 kHz, Internal 8296D monitor
!IF CBMROM=10 {
CRT_CONFIG_TEXT_OLD	!BYTE $31,$28,$29,$0F,$27,$00,$19,$20,$00,$09,$00,$00,$30,$00,$00,$00,$00,$00
CRT_CONFIG_GRAPHICS_OLD	!BYTE $31,$28,$29,$0F,$31,$00,$19,$25,$00,$07,$00,$00,$30,$00,$00,$00,$00,$00
} ; 			Used in: 324728-02
