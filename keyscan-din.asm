; PET/CBM Editor ROM Project - Keyboard Scanner - DIN Keyboards (STUB)
; ==========================   KEYSCAN-DIN.ASM
;
; Requires "extkeyscan.asm"! which requires TWO keyboard tables.
; OPTIONS: None
; This is a STUB routine that goes in the normal EDITROM location
; and then calls a the enhanced DIN keyboard code in HI EDITROM area.
;
;---------------------------------------------------------------------------------------

SCAN_KEYBOARD
           LDA #$ff
           STA Key_Image			; Key Image
           LDA CharsInBuffer
           PHA
           JSR SCAN_KEYBOARD_EXT		; EXTENDED Keyboard scanner in EXTROM
           PLA
           CMP CharsInBuffer
           BCC Be4e5
           TAX
           LDA Key_Image
           CMP #$ff
           BEQ Be4e5
           CPX XMAX
           BCS Be4dd
           STA KEYD,X
           INC ReverseFlag-1

; Check for STOP key. On DIN keyboards the STOP key is moved. Unfortunately the KERNAL
; is hard-coded and assumes the STOP key is in a specific position (standard business keyboard
; position - top row to the left of the keypad "7" key).
; This routine fools the kernal into thinking the STOP key is pressed no matter where it
; is located in the keyboard matrix.

Be4dd      CMP #3 				; <STOP> key from keyboard table
           BNE Be4e5
           LDA #$ef				; STOP flag for BASIC/Kernal?
           STA STKEY
Be4e5      RTS
