; PET/CBM EDIT ROM - CRTC Setup Tables
; ================   EXPERIMENTAL! 90 Column x 35 Line, 60 Hz Line, 20?? kHz Horizontal (for 8296 internal monitor)
;
; These tables are used to program the CRTC chip to set the screen to the proper rows, columns, and timing 
;
; NOTE: This is for 8296 ONLY!!! The 8296 has additional screen RAM. These settings push the monitor to
;       it's maximum possible resolution. Because of this you loose the ability to expand the line height
;       in 'text' mode.
;
;--------- Text Mode - 90 Columns x 35 Rows, 60 Hz, 20 kHz (approximate)

CRT_CONFIG_TEXT
           !byte 52,45,45,12,40,17,35,39,0,7,0,0,16,0,0,0,0,0 

;--------- Text Mode - 90 Columns x 35 Rows, 60 Hz, 20 kHz (approximate)

CRT_CONFIG_GRAPHICS
           !byte 52,45,45,12,40,17,35,39,0,7,0,0,16,0,0,0,0,0 

