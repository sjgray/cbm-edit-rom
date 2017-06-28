; PET/CBM EDIT ROM - CRTC Setup Tables
; ================   xx Column x 25 Lines, xx Hz Line, xxkHz Horizonal (for ??? monitor)
;
; These tables are used to program the CRTC chip to set the screen to the proper rows, columns, and timing 

;--------- Text Mode - 40 Column, 50 Hz, 20 kHz

CRT_CONFIG_TEXT
    		!byte $31	;  Horizontal Total = 43
		!byte $28	;  Horizontal Displayed = 40
		!byte $29	;  Horizontal Sync Position = 41
		!byte $0f	;  Horizontal Sync Width = 15
		!byte $27	;* Vertical Total = 39
		!byte $00	;  Vertical Total Adjust = 0
		!byte $19	;  Vertical Displayed = 25
		!byte $20	;* Vertical Sync Position = 32
    		!byte $00	;  Interlace Mode and Skew = 0 (Always 0)
		!byte $09	;* Maximum Raster Address = 9  Character ROW Height (0-31). Text mode=9
		!byte $00	;  Cursor Start Raster = 0 (Not used)
		!byte $00	;  Cursor End Raster = 0 (Not used)
		!byte $10	;  Display Start Address = 16 (High)	Low 4 bit=0, so HI=0, LO = 0, = $0000
		!byte $00	;  Display Start Address = 0  (Low)     ($0000 is start of video ram as seen by CRTC)
		!byte $00	;  Cursor Address-High = 0 (Not used)
		!byte $00	;  Cursor Address-Low  = 0 (Not used)
    		!byte $00	;  Light Pen Address-High = 0
		!byte $00 	;  Light Pen Address-Low  = 0

;--------- Graphics Mode - 40 Column, 50 Hz, 20 kHz

CRT_CONFIG_GRAPHICS
    		!byte $31	;  Horizontal Total = 43
		!byte $28	;  Horizontal Displayed = 40
		!byte $29	;  Horizontal Sync Position = 41
		!byte $0f	;  Horizontal Sync Width = 15
		!byte $31	;* Vertical Total = 49 
		!byte $00	;  Vertical Total Adjust = 0
		!byte $19	;  Vertical Displayed = 25
		!byte $25	;* Vertical Sync Position = 37
    		!byte $00	;  Interlace Mode and Skew =0 (Always 0)
		!byte $07	;* Maximum Raster Address = 7  Character ROW Height (0-31). Graphics mode=7
		!byte $00	;  Cursor Start Raster = 0 (Not used)
		!byte $00	;  Cursor End Raster = 0   (Not used)
		!byte $10	;  Display Start Address-High = 16 	
		!byte $00	;  Display Start Address-Low  = 0
		!byte $00	;  Cursor Address-High = 0 (Not used)
		!byte $00	;  Cursor Address-Low  = 0 (Not used)
    		!byte $00	;  Light Pen Address-High = 0
		!byte $00 	;  Light Pen Address-Low  = 0

;--------- This is a template for making new CRTC configuration files
;
; The MC6845 or MOS6545 CRTC (Cathode Ray Tube Controller) chip is a programmable video address generator.
; It has many registers, that determine the video configuration and timing that when combined generate the
; video display you see. The PET/CBM machines use tables of 18 bytes.
;
; The following are the registers and their functions:
;
; REG#  DESCRIPTION			NOTES
; ----  -----------			-----
; 0	Horizontal Total		>40
; 1	Horizontal Displayed		Always 40 in standard 40 or 80 column machines due to the way memory is configured
; 2	Horizontal Sync Position
; 3	Horizontal Sync Width
; 4	Vertical Total			39 or 49
; 5	Vertical Total Adjust
; 6	Vertical Displayed		Always 25 for PET/CBM
; 7	Vertical Sync Position
; 8	Interlace Mode and Skew		Always 0. Some variations allow interlace mode
; 9	Maximum Raster Address		7 (for Graphics Mode) or 9 (for Text Mode) - One less than actual # of rasters.
; 10	Cursor Start Raster		Not used in PET/CBM
; 11	Cursor End Raster		Not used in PET/CBM
; 12	Display Start Address-High	Only lower 4-bits are used. Upper 4-bits control additional features.	
; 13	Display Start Address-Low	
; 14	Cursor Address (High)		Not used in PET/CBM
; 15	Cursor Address (Low)		Not used in PET/CBM
; 16	Light Pen Address (High)	Read for Light Pen position 
; 17	Light Pen Address (Low)		Read for Light Pen position 
;
; REMOVE THIS SECTION WHEN YOU ADD A NEW CONFIGURATION FILE!
