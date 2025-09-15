; PET/CBM Editor ROM Project - Keyboard Scanner - C64/VIC Keyboards
; ==========================   KEYSCAN-C64.ASM
;
; VIC20 routines originally Provided by Edilbert Kirk. Adapted from/to PET by Andre Fachat
;
; NOTE:	C64 tables were removed in favour of VIC tables
;	This code is too big for normal EDITROM space and must be relocated to EXT space!
;----------------------------------------------------------------------------------------

                     ; Vic 20 keyboard matrix layout
                     ;       c7   c6   c5   c4   c3   c2   c1   c0
                     ;   +------------------------------------------------
                     ; r7|   F7   F5   F3   F1   DN  RGT  RET  DEL
                     ; r6|    /   UP    =  RSH HOME    ;    *    £
                     ; r5|    ,    @    :    .    -    L    P    +
                     ; r4|    0    O    K    M    N    J    I    9
                     ; r3|    8    U    H    B    V    G    Y    7
                     ; r2|    6    T    F    C    X    D    R    5
                     ; r1|    4    E    S    Z  LSH    A    W    3
                     ; r0|    2    Q  CBM   SP  RUN  CTL  LFT    1

; Note: for the PET keyboard scan routine, the table needs to be transposed.

; KEYFLAGS
;
; This flag signals which of the SHIFT, CTRL, or C= keys are currently
; being pressed.

; A value of $01 signifies that one of the SHIFT keys is being pressed,
; a $02 shows that the C= key is down, and $04 means that the CTRL key
; is being pressed. If more than one key is held down, these values will
; be added e.g $03 indicates that SHIFT and C= are both held down.

; Pressing the SHIFT and C= keys at the same time will toggle the
; character set that is presently being used between the uppercase/
; graphics set, and the lowercase/uppercase set.

; While this changes the appearance of all of the characters on the
; screen at once it has nothing whatever to do with the keyboard shift
; tables and should not be confused with the printing of SHIFTed
; characters, which affects only one character at a time.

; KEYFLAGS           ; keyboard shift/control flag
                     ; bit   key(s) 1 = down
                     ; ---   ---------------
                     ; 7-3   unused
                     ;  2   CTRL
                     ;  1   C=
                     ;  0   SHIFT



SCAN_KEYBOARD
                LDY #$FF                ; No Key
                STY Key_Image           ; Key Image
                INY
                STY KEYFLAGS            ; Flag: Print Shifted Chars.
                LDA RPTFLG              ; Flag: REPEAT Key Used, $80 = Repeat, $40 = disable
                AND #$7F
                STA RPTFLG              ; Flag: REPEAT Key Used, $80 = Repeat, $40 = disable

                LDX #$3f                ; 64 bytes in table. X is used as offset into the table

SCAN_ROW
                LDY #$08                ; Number of Columns to check = 8 (normal keyboards)

                LDA PIA1_Port_B         ; Keyboard COL result
                CMP PIA1_Port_B         ; Keyboard COL result
                BNE SCAN_ROW            ; Debounce

SCAN_COL        LSR                     ; Shift the value right
                BCS SCAN_NEXT2          ; If the bit was "1" then key is NOT down. Skip

;-------------- We have a key press. Look it up in the keyboard matrix

                PHA                     ; Save for later
                LDA KBD_NORMAL,X        ; Read Keyboard Matrix (X is offset)
                CMP #$05                ; 1=shift, 2=CBM, 3=STOP, 4=CTRL
                BCS SCAN_NOSH           ; Is it SHIFT key? No, skip
                CMP #$03                ; STOP key?
                BEQ SCAN_NOSH           ; yes, normal handling

;-------------- special keys Detected

                ORA KEYFLAGS            ; Bitmap: 1=SHIFT, 2=CBM, 4=CTRL
                STA KEYFLAGS
                BNE SCAN_NEXT           ; No, skip (KBD_NORMAL has no $00, so jump always)

;-------------- Non-SHIFT key

SCAN_NOSH
;SCAN_NOSH       CMP #$10                ; Is it REPEAT?
;                BNE SCAN_NORPT          ; No, skip
;
;g-------------- REPEAT key
;
;                LDA RPTFLG              ; Flag: REPEAT Key Used, $80 = Repeat, $40 = disable
;                ORA #$80
;                STA RPTFLG              ; Flag: REPEAT Key Used, $80 = Repeat, $40 = disable
;                BMI SCAN_NEXT

SCAN_NORPT      CMP #$FF                ; Is it "no key"?
                BEQ SCAN_NEXT           ; Yes, skip

;-------------- Normal key

                STX Key_Image           ; Store the key index in the table

SCAN_NEXT       PLA                     ; Restore value from keyboard scan for next loop
SCAN_NEXT2      DEX                     ; Decrement keyboard table offset
                BMI SCAN_GOT            ; If $ff we have completed the entire matrix...Process Key Image

                DEY                     ; Next COLUMN
                BNE SCAN_COL            ; Go back up for next column bit

;-------------- Completed all bits in ROW, Increment ROW

                INC PIA1_Port_A         ; Next Keyboard ROW
                BNE SCAN_ROW            ; Always. (counting down XR ends loop)

;-------------- Process shift/cbm/ctrl keys

SCAN_GOT
                LDA Key_Image
                CMP #$ff
                BEQ DECODE_DONE
                LDY KEYFLAGS
                CLC
                ADC KBD_Decode_Pointer,Y ; Load base address for keytable (as offset to KBD_NORMAL)
                TAX
                ; could do LDA KBD_Page_Indicator,Y:BNE NOT_KBD_NORMAL to change which base to use for index in X
                LDA KBD_NORMAL,x

!IF ESCCODES=1 { JMP EUROSWAP }
SCAN_NORM2

;-------------- Process Key Image

DECODE_DONE     STA Key_Image           ; Key Image
                CMP KEYPRESSED          ; Current Key Pressed: 255 = No Key
                BEQ SCAN_PRESS          ; If key is the same then it's being held down

                LDX #$10
                STX DELAY               ; Repeat Delay Counter
                BNE SCAN_REC            ; always

SCAN_PRESS      TAY                     ; save from repeat processing
                BIT RPTFLG              ; Check Repeat Flag: $80 = Repeat, $40 = disable
                BMI SCAN_DELAY2
                BVS SCAN_OUT            ; Exit
                CMP #$FF                ; No key?
                BEQ SCAN_OUT            ; Exit
                AND #$7f                ; Mask out SHIFT for comparison
                CMP #$14		; DELETE/INSERT (keycode in unshifted table)
                BEQ SCAN_DELAY
                CMP #$20		; SPACE
                BEQ SCAN_DELAY
                CMP #$1D		; RIGHT/LEFT
                BEQ SCAN_DELAY
                CMP #$11		; DOWN/UP
                BNE SCAN_OUT            ; Exit

SCAN_DELAY      LDX DELAY               ; Repeat Delay Counter
                BEQ SCAN_DELAY2
                DEC DELAY               ; Repeat Delay Counter
                BNE SCAN_OUT            ; Exit

SCAN_DELAY2     DEC KOUNT               ; Repeat Speed Counter
                BNE SCAN_OUT            ; Exit
                LDX #$04
                STX KOUNT               ; Repeat Speed Counter
                LDX CharsInBuffer       ; No. of Chars. in Keyboard Buffer (Queue)
                DEX                     ; One less
                BPL SCAN_OUT            ; Exit
                TYA                     ; restore char for fall-through

SCAN_REC        STA KEYPRESSED          ; Current Key Pressed: 255 = No Key
                CMP #$FF                ; No Key?
                BEQ SCAN_OUT            ; Yes, exit

;-------------- Handle keyboard buffer

                LDX CharsInBuffer       ; No. of Chars. in Keyboard Buffer (Queue)
                CPX XMAX                ; Size of Keyboard Buffer
                BCS SCAN_OUT            ; Exit if buffer full
                STA KEYD,X              ; Put the key into the buffer

!IF BACKARROW=0 {                       ; only triggers on normal key, not Shift/CBM
                INX                     ; Increment character count
                STX CharsInBuffer       ; No. of Chars. in Keyboard Buffer (Queue)
} ELSE {
                JSR TestBackArrow       ; Patch/Hack to use SHIFT-BACKARROW as screen mode toggle (text/graphic)
}

!IF KEYBOARD != 1 {
;               Compensate for STOP key not in standard position
                CMP #3                  ; Is keycode "3" (STOP key)?
                BNE SCAN_OUT
                LDA #$EF                ; fool kernal into thinking STOP is pressed
                STA STKEY               ; store it
}
SCAN_OUT        RTS

;; ==================
;KBD_Decode_Pointer
;; ==================
;
;                ; for any of the 8 combinations of shift, ctrl, and cbm
;                ; using an offset from the KBD_NORMAL table
;
                !BYTE $00   	                ; unshifted
                !BYTE KBD_SHIFTED-KBD_NORMAL    ; shifted
                !BYTE KBD_CBMKEY-KBD_NORMAL     ; CBM
                !BYTE KBD_CBMSHIFT-KBD_NORMAL   ; CBM+Shift
                !BYTE KBD_CONTROL-KBD_NORMAL    ; Ctrl
                !BYTE KBD_CTRLSHIFT-KBD_NORMAL  ; Ctrl+Shift
                !BYTE KBD_CTRLCBM-KBD_NORMAL    ; Ctrl+CBM
                !BYTE KBD_CTRLCBMSHIFT-KBD_NORMAL ; Ctrl+shift+CBM (ctrl table)
;
;********** Vic 20 keyboard matrix layout
;
;      c7   c6   c5   c4   c3   c2   c1   c0
;   +---------------------------------------
; r7|  F7   F5   F3   F1   DN  RGT  RET  DEL
; r6|   /   UP    =  RSH HOME    ;    *    £
; r5|   ,    @    :    .    -    L    P    +
; r4|   0    O    K    M    N    J    I    9
; r3|   8    U    H    B    V    G    Y    7
; r2|   6    T    F    C    X    D    R    5
; r1|   4    E    S    Z  LSH    A    W    3
; r0|   2    Q  CBM   SP  RUN  CTL  LFT    1
;   +----------------------------------------

; NOTE: I've seen this before, and this shows how messed up things are...
; The ROWS and COLS are reversed and INVERTED. C0 should be R7, C1 should be R6

;--------------------------------------------------
; see keyboard-tables3.asm for the actual mappings
;--------------------------------------------------
