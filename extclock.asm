; PET/CBM EDIT ROM - Extended ROM Code for Jiffy Clock
; ================
; This code goes in the upper half of the 4K EDIT ROMS

;--------- Advance JIFFY Clock [$EC0E]
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

;--------- JIFFY Max [$EC48]

JIFFY_MAX
           !byte $4f,$1a,$01
