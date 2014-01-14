; PET/CBM EDIT ROM - Extended ROM Code
; ================
; This code goes in the upper half of the 4K EDIT ROMS
; NOTE: The code from $E800-E8FF is not visible - fill with copyright or comments
;
;*=e800
;---------- Copyright Notice or Comments

	!source "copyright-4v4e.asm"
	!fill $e900-*,$ff  

;*=e900
;--------- Start of Visible Code

           !byte $16,$44,$20,$20,$07,$01	;??????????

;--------- Extended Screen Editor Jump Table
; (Does anything use this table? - not called from EDITROM itself!)

           JMP CHROUT_WITH_DIACRITICS
           JMP IS_DIACRITIC_CHAR
           JMP Screen_Input_Ext
           JMP Check_Diacritic
           JMP IS_SPECIAL_KEY
           JMP IS_VOCAL
           JMP PET_TO_ASCII			;not called? not in EDITROM.ASM
           JMP SCAN_KEYBOARD

           !fill $e924-*,$aa			; 6 bytes

;--------- Extended Keyboard Scanner and printing routines

		!source "extkeyscan.asm"
		!source "extprinting.asm"

;--------- Program CRTC				(called from EDITROM.ASM)

CRT_PROGRAM
           PHA
           JSR CLEAR_KEYFLAGS_210
           PLA
           JMP CRT_PROGRAM_OLD

;--------- Set Screen to TEXT mode		(called from EDITROM.ASM)

CRT_SET_TEXT
           LDA KEYFLAGS
           AND #%00001000 				; Bit 4 set: new char set (low ROM)
           BEQ CRT_SET_TEXT_OLD_1

;--------- Set Screen to TEXT mode NEW

CRT_SET_TEXT_NEW
           LDA KEYFLAGS
           ORA #%00001001
           STA KEYFLAGS
           LDA #<CRT_CONFIG_TEXT
           LDX #>CRT_CONFIG_TEXT
           LDY #14
           JMP CRT_PROGRAM_OLD

;--------- Set Screen to GRAPHICS mode

CRT_SET_GRAPHICS
           JSR CLEAR_KEYFLAGS_210
           AND #%00001000 				; Bit 4 set: new char set (low ROM)
           BEQ Bebef
           LDA #<CRT_CONFIG_GRAPHICS
           LDX #>CRT_CONFIG_GRAPHICS
           LDY #12
           JMP CRT_PROGRAM_OLD

Bebef      LDA #<CRT_CONFIG_GRAPHICS_OLD
           LDX #>CRT_CONFIG_GRAPHICS_OLD
           LDY #12
           JMP CRT_PROGRAM_OLD

;--------- Clear Key Flags

CLEAR_KEYFLAGS_210
           LDA KEYFLAGS
           AND #%11111000
           STA KEYFLAGS
           RTS

;--------- Set Screen to TEXT mode OLD

CRT_SET_TEXT_OLD
           LDA KEYFLAGS
           AND #%11110000
           STA KEYFLAGS

;--------- Set Screen to TEXT mode

CRT_SET_TEXT_OLD_1
           LDA #<CRT_CONFIG_TEXT_OLD
           LDX #>CRT_CONFIG_TEXT_OLD
           LDY #14
           JMP CRT_PROGRAM_OLD

;--------- Advance JIFFY Clock
; This routine was relocated to EXTROM

ADVANCE_JIFFY_CLOCK
           INC JIFFY_CORR
           LDA JIFFY_CORR
           BNE Bec16
           INC JIFFY_CORR+1
Bec16      CMP #$6f
           BNE Bec20
           LDA JIFFY_CORR+1
           CMP #2
           BEQ Bec41
Bec20      INC JIFFY_CLOCK+2
           BNE Bec2a
           INC JIFFY_CLOCK+1
           BNE Bec2a
           INC JIFFY_CLOCK
Bec2a      LDX #0
Bec2c      LDA JIFFY_CLOCK,X
           CMP JIFFY_MAX,X
           BCC Bec47
           INX
           CPX #3
           BNE Bec2c
           LDA #0
Bec3a      STA JIFFY_CLOCK-1,X
           DEX
           BNE Bec3a
           BEQ Bec47
Bec41      LDA #0
           STA JIFFY_CORR
           STA JIFFY_CORR+1
Bec47      RTS

;--------- JIFFY Max

JIFFY_MAX
           !byte $4f,$1a,$01

;--------- Extended Keyboard scanning tables

		!source "extkeytables.asm"

;--------- Keyboard Tables

!if KEYBOARD = 0 {!source "kbdx-n.asm" }
!if KEYBOARD = 1 {!source "kbdx-b.asm" }
!if KEYBOARD = 2 {!source "kbdx-din.asm" }
!if KEYBOARD = 3 {!source "kbdx-c64.asm" }
