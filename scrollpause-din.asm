; PET/CBM Editor ROM Project - Scroll Pause/Resume Control - DIN
; ==========================   SCROLLPAUSE-DIN.ASM
;
; This code looks very different from older ROMS

           LDA STKEY					; Key Scan value
           LDX #$ff					;
           LDY #0
           CMP #$a0
           BNE Be41b

Be40b      CPX STKEY					; Key Scan value
           BNE Be40b					; Loop when key still pressed

Be40f      LDA STKEY					; Key Scan value
           ASL
           CMP #$40 					; '@'
           BEQ Be41f

           JSR CHKSTOP					; Check if STOP key pressed
           BNE Be40f

Be41b      CMP #$20 					; Is it a <SPACE>?
           BNE Be427					; No, exit

Be41f      DEX						; Yes, do delay
           BNE Be41f					; Loop back
           DEY
           BNE Be41f					; Loop back

           STY CharsInBuffer				; Clear buffer
Be427      RTS
