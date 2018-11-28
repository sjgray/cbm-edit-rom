; PET/CBM EDIT ROM - Extended ROM Code for CRTC Screen configuration
; ================
; This code goes in the upper half of the 4K EDIT ROMS

;*********************************************************************************************************
;** Program CRTC	[$EBC2]			(called from EDITROM.ASM)
;*********************************************************************************************************

CRT_PROGRAM_EXT
           PHA
           JSR CLEAR_KEYFLAGS_210
           PLA
           JMP CRT_PROGRAM

;*********************************************************************************************************
;** Set Screen to TEXT mode [$EBCA]	(called from EDITROM.ASM)
;*********************************************************************************************************

CRT_SET_TEXT_EXT
           LDA KEYFLAGS
           AND #%00001000 				; Bit 4 set: new char set (low ROM)
           BEQ CRT_SET_TEXT_OLD_1

;*********************************************************************************************************
;** Set Screen to TEXT mode NEW [$EBD0]
;*********************************************************************************************************

CRT_SET_TEXT_NEW
           LDA KEYFLAGS
           ORA #%00001001
           STA KEYFLAGS
           LDA #<CRT_CONFIG_TEXT
           LDX #>CRT_CONFIG_TEXT
           LDY #14
           JMP CRT_PROGRAM

;*********************************************************************************************************
;** Set Screen to GRAPHICS mode [$EBDF]
;*********************************************************************************************************

CRT_SET_GRAPHICS_EXT
           JSR CLEAR_KEYFLAGS_210
           AND #%00001000 				; Bit 4 set: new char set (low ROM)
           BEQ CRT_OLD
           LDA #<CRT_CONFIG_GRAPHICS
           LDX #>CRT_CONFIG_GRAPHICS
           LDY #12
           JMP CRT_PROGRAM

CRT_OLD    LDA #<CRT_CONFIG_GRAPHICS_OLD
           LDX #>CRT_CONFIG_GRAPHICS_OLD
           LDY #12
           JMP CRT_PROGRAM

;*********************************************************************************************************
;** Clear Key Flags [$EBF8]
;*********************************************************************************************************

CLEAR_KEYFLAGS_210
           LDA KEYFLAGS
           AND #%11111000
           STA KEYFLAGS
           RTS

;*********************************************************************************************************
;** Set Screen to TEXT mode OLD [$EBFF]
;*********************************************************************************************************

CRT_SET_TEXT_OLD
           LDA KEYFLAGS
           AND #%11110000
           STA KEYFLAGS

;*********************************************************************************************************
;** Set Screen to TEXT mode [$EC05]
;*********************************************************************************************************

CRT_SET_TEXT_OLD_1
           LDA #<CRT_CONFIG_TEXT_OLD
           LDX #>CRT_CONFIG_TEXT_OLD
           LDY #14
           JMP CRT_PROGRAM
