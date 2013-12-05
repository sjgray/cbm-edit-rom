; PET/CBM EDIT ROM - Extended Keyboard Scanner from 324243-04 ROM
; ================   (called from EDITROM.ASM)
;
; This routine requires two keyboard matrix tables (NORMAL and SHIFTED)
;
; CAUTION! Uses unused 80 column SCREEN RAM to store results of each row scan!!!!!
;          This code WILL NOT WORK on 40 column machines!!!!

SCAN_KEYBOARD
           LDA PIA1_Port_A 			; Keyboard row select
           AND #%11110000  			; Select row 0
           STA PIA1_Port_A 			; Keyboard row select
           LDA KEYFLAGS
           ORA #%11000000  			; no <shift> and no <ctrl>
           STA KEYFLAGS
           LDA RPTFLG
           PHA
           LDX #$4f 					; 80 keys to check
           LDY #$ff
           STY KEYPRESSED
           INY 						; Y = Keyboard row = 0
Be93c      LDA KBD_MATRIX,Y			; KBD_MATRIX located in SCREEN_RAM!!!!!
           ORA ModifierKeys,Y			; (table located in EDITROM.ASM)
           EOR #$ff
           STA RPTFLG 				; 1: pressed & not modifier
Be946      LDA PIA1_Port_B 			; Keyboard row
           STA KBD_MATRIX,Y			; KBD_MATRIX located in SCREEN_RAM!!!!!
           CMP PIA1_Port_B 			; Keyboard row
           BNE Be946
           ORA RPTFLG 				; Remove bouncing
           STY RPTFLG 				; Save Y
           LDY #8 					; Test the 8 keys of the row
SCLOOP_Y   LSR  					; check next key
           BCS Be979 					; 1 -> not pressed
           PHA 						; Save row
           LDA #%01111111 				; <shift> pressed
           CPX #$19 					; Right Shift
           BEQ Be974
           CPX #$1f 					; Left Shift
           BEQ Be974
           LDA #%10111111 				; <ctrl> pressed
           CPX #15 					; <RVS = CTRL>
           BEQ Be974
           LDA #$ff
           CMP KEYPRESSED
           BEQ Be972
           TAX
Be972      STX KEYPRESSED
Be974      AND KEYFLAGS
           STA KEYFLAGS
           PLA 						; Restore row
Be979      DEX 						; Next key
           BMI Be987
           DEY 						; Next column
           BNE SCLOOP_Y
           INC PIA1_Port_A 			; Keyboard row select
           LDY RPTFLG 				; Restore Y = row
           INY
           BNE Be93c 					; Branch always
Be987      PLA 						; Finished scan of keyboard matrix
           STA RPTFLG 				; Restore repeat flag
           LDX KEYPRESSED
           BMI SC_Nokey
           LDA #$15
           STA DELAY
           JSR GETPETSCII
           BVS Be9f2 					; Branch if <STOP>
           LDX CharsInBuffer
           CPX XMAX
           BCC Be9df
           BCS Be9e4
SC_Nokey   LDY #10
           JSR ModifyerActive
           BNE Be9ba
           DEY
           TYA
           BIT KEYFLAGS
           BVS Be9b1 					; Branch if not <ctrl>
           BPL Be9af 					; Branch if <shift>
           LSR
Be9af      AND #%10010010
Be9b1      JSR StoreKey
           LDY #$16
Be9b6      DEY
           STY DELAY
           RTS

Be9ba      LDX TABSTOPS-1,Y
Be9bd      DEX
           LSR
           BCC Be9bd
           JSR Je9ff
           BNE Be9f6
           LDY DELAY
           BNE Be9b6
           DEC KOUNT
           BNE Be9f6
           LDA #4
           STA KOUNT
           JSR GETPETSCII
           BVS Be9f2 					; Branch if <STOP>
           CMP Key_Image
           BNE Be9b1
           LDX CharsInBuffer
           BNE Be9e4
Be9df      STA KEYD,X
           INC CharsInBuffer
Be9e4      CMP #3 ; <STOP>
           BNE Be9ea
           LDY #%11101111 				; Set STOP flag
Be9ea      CMP #$e0
           BCC StoreKey
           LDY #%11111110

;--------- Store Key

StoreKey
           STY STKEY
Be9f2      STA Key_Image
           STA KEYPRESSED
Be9f6      RTS


;--------- Modifier Active

ModifyerActive
           LDA KBD_MATRIX-1,Y			;KBD_MATRIX is located in SCREEN_RAM!!!!!!!!!!!!!!!
           ORA ModifierKeys-1,Y			;(table located in EDITROM.ASM)
           EOR #$ff

;--------- ?

Je9ff
           BNE Bea04
           DEY
           BNE ModifyerActive
Bea04      RTS

;--------- Get PETSCII   (Local to EDITROMEXT)

GETPETSCII
           LDA KEYBOARD_NORMAL,X		; Get key code from NORMAL table
           BIT KEYFLAGS
           BMI Bea0f
           LDA KEYBOARD_SHIFTED,X		; Get key code from SHIFTED table
Bea0f      TAY
           BVS Bea20
           AND #$7f
           CMP #$41 					; 'A'
           BCC Bea25
           CMP #$5b 					; '['
           BCS Bea25
           TYA
           AND #$bf
           TAY
Bea20      CPX #$11					; WAS '#15' ????? ; <STOP>
           BEQ Bea25
           CLV
Bea25      TYA
           RTS

