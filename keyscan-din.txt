; PET/CBM EDIT ROM - Keyboard Scanner - DIN Stub for lower ROM
; ================
; Requires "extkeyscan.asm"
; TODO: Remame labels? OLD?

OLD_SCAN_KEYBOARD
           LDA #$ff
           STA Key_Image			; Key Image
           LDA CharsInBuffer
           PHA
           JSR SCAN_KEYBOARD			; EXTENDED Keyboard scanner in EXTROM
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
Be4dd      CMP #3 				; <STOP>
           BNE Be4e5
           LDA #$ef
           STA STKEY
Be4e5      RTS
