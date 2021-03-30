; PET/CBM EDIT ROM - C64/VIC Keyboard scanning routines
; ===================
; VIC20 routines originally Provided by Edilbert Kirk
; Adapted from/to PET by Andre Fachat
;
; NOTE: C64 tables were removed in favour of VIC tables
;--------------------------------------------------------------

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



; The correspondence between the key pressed and the number stored 
; now stored temporarily in Key_Image is as follows:

; $00   1      $10   unused $20   [SPC]  $30   Q
; $01   3      $11   A      $21   Z      $31   E
; $02   5      $12   D      $22   C      $32   T
; $03   7      $13   G      $23   B      $33   U
; $04   9      $14   J      $24   M      $34   O
; $05   +      $15   L      $25   .      $35   @
; $06   [PND]  $16   ;      $26   unused $36   [U ARROW]
; $07   [DEL]  $17   [RIGHT]$27   [F1]   $37   [F5]   
; $08   [<-]   $18   [STOP] $28   unused $38   2
; $09   W      $19   unused $29   S      $39   4
; $0A   R      $1A   X      $2A   F      $3A   6
; $0B   Y      $1B   V      $2B   H      $3B   8
; $0C   I      $1C   N      $2C   K      $3C   0
; $0D   P      $1D   ,      $2D   :      $3D   -
; $0E   *      $1E   /      $2E   =      $3E   [HOME]
; $0F   [RET]  $1F   [DOWN] $2F   [F3]   $3F   [F7]

; The addresses of the tables are:

;   KBD_NORMAL          ; unshifted
;   KBD_SHIFTED         ; shifted
;   KBD_CBMKEY          ; commodore
;   KBD_CONTROL         ; control

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

                LDX #$40                ; 64 bytes in table. X is used as offset into the table

SCAN_ROW
                LDY #$08                ; Number of Columns to check = 8 (normal keyboards)

                LDA PIA1_Port_B         ; Keyboard COL result
                CMP PIA1_Port_B         ; Keyboard COL result
                BNE SCAN_ROW            ; Debounce

SCAN_COL        LSR                     ; Shift the value right
                BCS SCAN_NEXT2          ; If the bit was "1" then key is NOT down. Skip

;-------------- We have a key press. Look it up in the keyboard matrix

                PHA                     ; Save for later
                LDA KBD_NORMAL-1,X      ; Read Keyboard Matrix (X is offset)
                CMP #$05                ; 1=shift, 2=CBM, 3=STOP, 4=CTRL
                BCS SCAN_NOSH           ; Is it SHIFT key? No, skip
                CMP #$03                ; STOP key?
                BEQ SCAN_NOSH           ; yes, normal handling

;-------------- special keys Detected

                ORA KEYFLAGS            ; Bitmap: 1=SHIFT, 2=CBM, 4=CTRL
                STA KEYFLAGS
                BNE SCAN_NEXT           ; No, skip

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
                BEQ SCAN_GOT            ; If 0 we have completed the entire matrix...Process Key Image

                DEY                     ; Next COLUMN
                BNE SCAN_COL            ; Go back up for next column bit

;-------------- Completed all bits in ROW, Increment ROW

                INC PIA1_Port_A         ; Next Keyboard ROW
                BNE SCAN_ROW            ; More? Yes, loop back

;-------------- Process shift/cbm/ctrl keys

SCAN_GOT
                LDA KEYFLAGS
;                ASL                     ; clears Carry
                CLC                      ; note: remove if ASL is used
                TAY
                LDA KBD_Decode_Pointer,y
                ADC Key_Image            ; add index in table to ptr
                TAX
;                LDA KBD_Decode_Pointer+1,y
;                BEQ DECODE_PAGE0
                LDA KBD_NORMAL,x
;                BNE DECODE_DONE
;DECODE_PAGE0    LDA KBD_NORMAL+$0100,x

;-------------- Process Key Image

DECODE_DONE     STA Key_Image           ; Key Image
                CMP KEYPRESSED          ; Current Key Pressed: 255 = No Key
                BEQ SCAN_PRESS          ; If key is the same then it's being held down

                LDX #$10
                STX DELAY               ; Repeat Delay Counter
                BNE SCAN_REC

SCAN_PRESS      BIT RPTFLG              ; Check Repeat Flag: $80 = Repeat, $40 = disable
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

SCAN_REC        STA KEYPRESSED          ; Current Key Pressed: 255 = No Key
                CMP #$FF                ; No Key?
                BEQ SCAN_OUT            ; Yes, exit

                TAX
                PHP
                AND #$7F                ; Mask off upper bit (non-shiftable flag in key matrix byte)
                PLP

;-------------- Handle keyboard buffer

                LDX CharsInBuffer       ; No. of Chars. in Keyboard Buffer (Queue)
                CPX XMAX                ; Size of Keyboard Buffer
                BCS SCAN_OUT            ; Exit if buffer full
                STA KEYD,X              ; Put the key into the buffer
!IF BACKARROW=0 {
                INX                     ; Increment character count
                STX CharsInBuffer       ; No. of Chars. in Keyboard Buffer (Queue)
} ELSE {
                JSR TestBackArrow       ; Patch/Hack to use SHIFT-BACKARROW as screen mode toggle (text/graphic)
}

!if KEYBOARD != 1 {
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


