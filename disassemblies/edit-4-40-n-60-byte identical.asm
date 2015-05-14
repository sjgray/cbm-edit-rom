;Disassembly of: edit-4-40-n-60Hz-901499-01.bin
; Do NOT EDIT! This assembles to a byte-exact copy of above
; ============
;
;----- Equates
;
usradd = $0001   ;USR Address Low Byte / High Byte
charac = $0003   ;Search Character
endchr = $0004   ;Flag: Scan for Quote at End of String
count  = $0005   ;Input Buffer Pointer / No. of Subscripts
dimflg = $0006   ;Flag: Default Array DiMension / array name initial / AND
vauyp  = $0007   ;Data Type: $FF = String
intflg = $0008   ;Data Type: $80 = Integer
garbfl = $0009   ;Flag: DATA scan/LlST quote/Garbage Coll
subflg = $000a   ;Flag: Subscript Ref / User Function Call
inpflg = $000b   ;Flag: $00 = INPUT
tansgn = $000c   ;Flag TAN sign / Comparison Result
dstat  = $000d   ;Disk Status DS$ descriptor
fnum   = $0010   ;File# of current I/O device (when non-zero suppresses INPUT prompt etc)
linnum = $0011   ;Temp: Integer Value
temppt = $0013   ;Pointer Temporary String
lastpt = $0014   ;Last Temp String Address
tempst = $0016   ;Stack for Temporary Strings
index  = $001f   ;Utility Pointer Area
txttab = $0028   ;Pointer: Start of BASIC Text
arytab = $002c   ;Pointer: Start of BASIC Arrays
strend = $002e   ;Pointer End of BASIC Arrays (+1)
fretop = $0030   ;Pointer: Bottom of String Storage
oldtxt = $003a   ;Pointer: BASIC Statement for CONT
tempf2 = $0059   ;Temporary storage for FLPT value.
time   = $008d   ;Real-Time Jiffy Clock (approx) 1/60 Sec
cinv   = $0090   ;Vector: Hardware Interrupt
cbinv  = $0092   ;Vector: BRK Instr. Interrupt
lstx   = $0097   ;Current Key Pressed: 255 = No Key
sfdx   = $0098   ;Flag: Print Shifted Chars.
ndx    = $009e   ;No. of Chars. in Keyboard Buffer (Queue)
rvs    = $009f   ;Flag: Print Reverse Chars. -1=Yes
indx   = $00a1   ;Pointer: End of Logical Line for INPUT
lxsp   = $00a3   ;Cursor Y-X Pos. at Start of INPUT
keyimg = $00a6   ;Key Image
blnsw  = $00a7   ;Cursor Blink enable: 0 = Flash Cursor
blnct  = $00a8   ;Timer: Countdown to Toggle Cursor
gdbln  = $00a9   ;Character Under Cursor
blnon  = $00aa   ;Flag: Last Cursor Blink On/Off
crsw   = $00ac   ;Flag: INPUT or GET from Keyboard
dfltn  = $00af   ;Default Input Device (0)
dflto  = $00b0   ;Default Output (CMD) Device (3)
bufp2  = $00bc   ;Pointer: Tape I/O Buffer #2
fnmidx = $00c0   ;Index to Cassette File name/Header ID for Tape write.
pnt    = $00c4   ;Pointer: Current Screen Line Address
pntr   = $00c6   ;Cursor Column on Current Line
sal    = $00c7   ;Pointer: Tape Buffer/ Screen Scrolling
qtsw   = $00cd   ;Flag: Editor in Quote Mode
bitts  = $00ce   ;Cassette Temp (64#00B4): Tape read timer flag=IRQ enabled for Timer 1
fnlen  = $00d1   ;Length of Current File Name
sa     = $00d3   ;Current Secondary Address
lnmx   = $00d5   ;Physical Screen Line Length
tape1  = $00d6   ;Pointer: Start of Tape Buffer
tblx   = $00d8   ;Current Cursor Physical Line Number
datax  = $00d9   ;Current Character to Print
fnadr  = $00da   ;Pointer: Current File Name
insrt  = $00dc   ;Flag: Insert Mode
mych   = $00df   ;Serial Word Buffer
ldtb1  = $00e0   ;Screen Line Link Table / Editor Temps (40 col)
scbot  = $00e1   ;Last line of window
sclf = $00e2   ;First column of window
xmax   = $00e3   ;Size of Keyboard Buffer
rptflg = $00e4   ;Flag: REPEAT Key Used
cas1   = $00f9   ;Tape Motor Interlock #1
cas2   = $00fa   ;Tape Motor Interlock #2
stal   = $00fb   ;I/O Start Address
memuss = $00fd   ;Tape Load Temps
keyd   = $0270   ;Keyboard Buffer Queue (FIFO)
delay4 = $03e9   ;Repeat key countdown (40col)
kount4 = $03ea   ;Delay between repeats (40col)
xmax4  = $03eb   ;Max keyboard buffer size (40 col)
chime4 = $03ec   ;Chime Time 0=off (40col)
tiadj  = $03ed   ;Counter to speed TI by 6/5 (40col)
rptflg4 = $03ee   ;Repeat Flag (40 col)
tabs   = $03ef   ;Table of 80 bits to set TABs (80col)
screen1 = $8000   ;Screen RAM page 1
screen2 = $8100   ;Screen RAM page 2
screen3 = $8200   ;Screen RAM page 3
screen4 = $8300   ;Screen RAM page 4
nofunction = $e098   ;Function Not supported
pia1_row = $e810   ;Keyboard ROW select
pia1_col = $e812   ;Keyboard COL read
pia1_13 = $e813   ;PIA#1 Register 13 (Retrace flag and interrupt
via_0 = $e840   ;VIA Register 0 (flags)
via_c = $e84c   ;VIA Register C (cb2
crtcreg = $e880   ;CRTC Register select
crtcdat = $e881   ;CRTC Data
;
    *=$e000
;
;----- Code
;
    jmp  l_e036
    jmp  l_e0a7
    jmp  l_e116
    jmp  l_e202
    jmp  l_e442
    jmp  l_e455
    jmp  l_e600
    jmp  l_e042
    jmp  l_e60f
    jmp  l_e617
    jmp  l_e61d
    jmp  l_e6ea
    jmp  l_e3d1
    jmp  l_e4bf
    jmp  l_e657
    jmp  l_e098 ;Function Not supported
    jmp  l_e098 ;Function Not supported
    jmp  l_e098 ;Function Not supported
l_e036:
    jsr  l_e683
    jsr  l_e617
    jsr  l_e654
    jsr  l_e654
l_e042:
    ldx #$18
    lda #$c0
    ldy #$83
l_e048:
    sty <ldtb1 ,x ;Screen Line Link Table / Editor Temps (40 col)
    sec
    sbc #$28
    bcs l_e050
    dey
l_e050:
    dex
    bpl l_e048
    sty $c5
    inx
    stx <rvs    ;Flag: Print Reverse Chars. -1=Yes
    stx <pnt    ;Pointer: Current Screen Line Address
    lda #$20
l_e05c:
    sta screen1,x ;Screen RAM page 1
    sta screen2,x ;Screen RAM page 2
    sta screen3,x ;Screen RAM page 3
    sta screen4,x ;Screen RAM page 4
    inx
    bne l_e05c
l_e06b:
    ldy #$00
    sty <pntr   ;Cursor Column on Current Line
    sty <tblx   ;Current Cursor Physical Line Number
l_e071:
    ldx <tblx   ;Current Cursor Physical Line Number
    lda <ldtb1 ,x ;Screen Line Link Table / Editor Temps (40 col)
    ora #$80
    sta $c5
    lda $e798,x
    sta <pnt    ;Pointer: Current Screen Line Address
    lda #$27
    sta <lnmx   ;Physical Screen Line Length
    cpx #$18
    beq l_e08e
    lda <scbot ,x ;Last line of window
    bmi l_e08e
    lda #$4f
    sta <lnmx   ;Physical Screen Line Length
l_e08e:
    lda <pntr   ;Cursor Column on Current Line
    cmp #$28
    bcc l_e098
    sbc #$28
    sta <pntr   ;Cursor Column on Current Line
l_e098:
    rts
    !byte $aa,$aa,$aa,$aa,$aa,$aa,$aa,$aa ; filler
    !byte $aa,$aa,$aa,$aa,$aa,$aa ; filler
l_e0a7:
    ldy $026f
    ldx #$00
l_e0ac:
    lda keyd  ,x ;Keyboard Buffer Queue (FIFO)
    sta $026f,x
    inx
    cpx <ndx    ;No. of Chars. in Keyboard Buffer (Queue)
    bne l_e0ac
    dec <ndx    ;No. of Chars. in Keyboard Buffer (Queue)
    tya
    cli
    rts
l_e0bc:
    jsr  l_e63c
l_e0bf:
    lda <ndx    ;No. of Chars. in Keyboard Buffer (Queue)
    sta <blnsw  ;Cursor Blink enable: 0 = Flash Cursor
    beq l_e0bf
    sei
    lda <blnon  ;Flag: Last Cursor Blink On/Off
    beq l_e0d3
    lda <gdbln  ;Character Under Cursor
    ldy #$00
    sty <blnon  ;Flag: Last Cursor Blink On/Off
    jsr  l_e606
l_e0d3:
    jsr  l_e0a7
    cmp #$83
    bne l_e0ea
    sei
    ldx #$09
    stx <ndx    ;No. of Chars. in Keyboard Buffer (Queue)
l_e0df:
    lda $e78e,x
    sta $026e,x
    dex
    bne l_e0df
    beq l_e0bf
l_e0ea:
    cmp #$0d
    bne l_e0bc
    ldy <lnmx   ;Physical Screen Line Length
    sty <crsw   ;Flag: INPUT or GET from Keyboard
l_e0f2:
    lda (<pnt   ),y ;Pointer: Current Screen Line Address
    cmp #$20
    bne l_e0fb
    dey
    bne l_e0f2
l_e0fb:
    iny
    sty <indx   ;Pointer: End of Logical Line for INPUT
    ldy #$00
    sty <pntr   ;Cursor Column on Current Line
    sty <qtsw   ;Flag: Editor in Quote Mode
    lda <lxsp   ;Cursor Y-X Pos. at Start of INPUT
    bmi l_e11e
    cmp <tblx   ;Current Cursor Physical Line Number
    bne l_e11e
    lda $a4
    sta <pntr   ;Cursor Column on Current Line
    cmp <indx   ;Pointer: End of Logical Line for INPUT
    bcc l_e11e
    bcs l_e141
l_e116:
    tya
    pha
    txa
    pha
    lda <crsw   ;Flag: INPUT or GET from Keyboard
    beq l_e0bf
l_e11e:
    ldy <pntr   ;Cursor Column on Current Line
    lda (<pnt   ),y ;Pointer: Current Screen Line Address
    sta <datax  ;Current Character to Print
    and #$3f
    asl <datax  ;Current Character to Print
    bit <datax  ;Current Character to Print
    bpl l_e12e
    ora #$80
l_e12e:
    bcc l_e134
    ldx <qtsw   ;Flag: Editor in Quote Mode
    bne l_e138
l_e134:
    bvs l_e138
    ora #$40
l_e138:
    inc <pntr   ;Cursor Column on Current Line
    jsr  l_e167
    cpy <indx   ;Pointer: End of Logical Line for INPUT
    bne l_e158
l_e141:
    lda #$00
    sta <crsw   ;Flag: INPUT or GET from Keyboard
    lda #$0d
    ldx <dfltn  ;Default Input Device (0)
    cpx #$03
    beq l_e153
    ldx <dflto  ;Default Output (CMD) Device (3)
    cpx #$03
    beq l_e156
l_e153:
    jsr  l_e202
l_e156:
    lda #$0d
l_e158:
    sta <datax  ;Current Character to Print
    pla
    tax
    pla
    tay
    lda <datax  ;Current Character to Print
    cmp #$de
    bne l_e166
    lda #$ff
l_e166:
    rts
l_e167:
    cmp #$22
    bne l_e173
    lda <qtsw   ;Flag: Editor in Quote Mode
    eor #$01
    sta <qtsw   ;Flag: Editor in Quote Mode
    lda #$22
l_e173:
    rts
l_e174:
    ora #$40
l_e176:
    ldx <rvs    ;Flag: Print Reverse Chars. -1=Yes
    beq l_e17c
l_e17a:
    ora #$80
l_e17c:
    ldx <insrt  ;Flag: Insert Mode
    beq l_e182
    dec <insrt  ;Flag: Insert Mode
l_e182:
    jsr  l_e606
    inc <pntr   ;Cursor Column on Current Line
    ldy <lnmx   ;Physical Screen Line Length
    cpy <pntr   ;Cursor Column on Current Line
    bcs l_e1a6
    ldx <tblx   ;Current Cursor Physical Line Number
    cpy #$4f
    bne l_e19f
    jsr  l_e1b3
    jsr  l_e3a9
    lda #$00
    sta <pntr   ;Cursor Column on Current Line
    beq l_e1a6
l_e19f:
    cpx #$18
    bne l_e1be
    jsr  l_e1c4
l_e1a6:
    pla
    tay
    lda <insrt  ;Flag: Insert Mode
    beq l_e1ae
    lsr <qtsw   ;Flag: Editor in Quote Mode
l_e1ae:
    pla
    tax
    pla
    cli
    rts
l_e1b3:
    cpx #$17
    bcs l_e1bd
    lda <sclf,x ;First column of window
    ora #$80
    sta <sclf,x ;First column of window
l_e1bd:
    rts
l_e1be:
    jsr  l_e1cd
    jmp  l_e1a6
l_e1c4:
    jsr  l_e3d1
    dec <lxsp   ;Cursor Y-X Pos. at Start of INPUT
    dec <tblx   ;Current Cursor Physical Line Number
    ldx <tblx   ;Current Cursor Physical Line Number
l_e1cd:
    asl <scbot ,x ;Last line of window
    lsr <scbot ,x ;Last line of window
    jsr  l_e1b3
    lda <pntr   ;Cursor Column on Current Line
    pha
    jsr  l_e071
    pla
    sta <pntr   ;Cursor Column on Current Line
    rts
l_e1de:
    ldy #$27
    ldx <tblx   ;Current Cursor Physical Line Number
    bne l_e1ea
    stx <pntr   ;Cursor Column on Current Line
    pla
    pla
    bne l_e1a6
l_e1ea:
    lda <mych  ,x ;Serial Word Buffer
    bmi l_e1f3
    dex
    lda <mych  ,x ;Serial Word Buffer
    ldy #$4f
l_e1f3:
    dex
    stx <tblx   ;Current Cursor Physical Line Number
    sta $c5
    lda $e798,x
    sta <pnt    ;Pointer: Current Screen Line Address
    sty <pntr   ;Cursor Column on Current Line
    sty <lnmx   ;Physical Screen Line Length
    rts
l_e202:
    pha
    sta <datax  ;Current Character to Print
    txa
    pha
    tya
    pha
    lda #$00
    sta <crsw   ;Flag: INPUT or GET from Keyboard
    ldy <pntr   ;Cursor Column on Current Line
    lda <datax  ;Current Character to Print
    and #$7f
    cmp #$1b
    bne l_e21a
    jmp  l_e3c6
l_e21a:
    lda <datax  ;Current Character to Print
    bpl l_e221
    jmp  l_e2d5
l_e221:
    cmp #$0d
    bne l_e228
    jmp  l_e3bf
l_e228:
    cmp #$20
    bcc l_e234
    and #$3f
    jsr  l_e167
    jmp  l_e176
l_e234:
    ldx <insrt  ;Flag: Insert Mode
    beq l_e23b
    jmp  l_e17a
l_e23b:
    cmp #$14
    bne l_e25b
    dey
    sty <pntr   ;Cursor Column on Current Line
    bpl l_e24a
    jsr  l_e1de
    jmp  l_e255
l_e24a:
    iny
    lda (<pnt   ),y ;Pointer: Current Screen Line Address
    dey
    sta (<pnt   ),y ;Pointer: Current Screen Line Address
    iny
    cpy <lnmx   ;Physical Screen Line Length
    bne l_e24a
l_e255:
    lda #$20
    sta (<pnt   ),y ;Pointer: Current Screen Line Address
    bne l_e284
l_e25b:
    ldx <qtsw   ;Flag: Editor in Quote Mode
    beq l_e262
    jmp  l_e17a
l_e262:
    cmp #$12
    bne l_e26a
    sta <rvs    ;Flag: Print Reverse Chars. -1=Yes
    beq l_e284
l_e26a:
    cmp #$13
    bne l_e271
    jsr  l_e06b
l_e271:
    cmp #$1d
    bne l_e287
    iny
    sty <pntr   ;Cursor Column on Current Line
    dey
    cpy <lnmx   ;Physical Screen Line Length
    bcc l_e284
    jsr  l_e3a9
    ldy #$00
l_e282:
    sty <pntr   ;Cursor Column on Current Line
l_e284:
    jmp  l_e1a6
l_e287:
    cmp #$11
    bne l_e29c
    clc
    tya
    adc #$28
    tay
    cmp <lnmx   ;Physical Screen Line Length
    bcc l_e282
    beq l_e282
    jsr  l_e3a9
l_e299:
    jmp  l_e1a6
l_e29c:
    cmp #$10
    bne l_e2ac
    lda #$20
    dey
l_e2a3:
    iny
    sta (<pnt   ),y ;Pointer: Current Screen Line Address
    cpy <lnmx   ;Physical Screen Line Length
    bcc l_e2a3
    bcs l_e299
l_e2ac:
    cmp #$0e
    bne l_e2b5
    jsr  l_e60f
    bmi l_e299
l_e2b5:
    cmp #$07
    bne l_e2be
    jsr  l_e657
    beq l_e299
l_e2be:
    cmp #$09
    bne l_e299
l_e2c2:
    cpy <lnmx   ;Physical Screen Line Length
    bcc l_e2cd
    ldy <lnmx   ;Physical Screen Line Length
l_e2c8:
    sty <pntr   ;Cursor Column on Current Line
    jmp  l_e1a6
l_e2cd:
    iny
    jsr  l_e588
    beq l_e2c2
    bne l_e2c8
l_e2d5:
    and #$7f
    cmp #$7f
    bne l_e2dd
    lda #$5e
l_e2dd:
    cmp #$20
    bcc l_e2e4
    jmp  l_e174
l_e2e4:
    cmp #$0d
    bne l_e2eb
    jmp  l_e3bf
l_e2eb:
    ldx <qtsw   ;Flag: Editor in Quote Mode
    bne l_e31f
    cmp #$14
    bne l_e31b
    ldy <lnmx   ;Physical Screen Line Length
    lda (<pnt   ),y ;Pointer: Current Screen Line Address
    cmp #$20
    bne l_e2ff
    cpy <pntr   ;Cursor Column on Current Line
    bne l_e306
l_e2ff:
    cpy #$4f
    beq l_e284
    jsr  l_e6ea
l_e306:
    ldy <lnmx   ;Physical Screen Line Length
l_e308:
    dey
    lda (<pnt   ),y ;Pointer: Current Screen Line Address
    iny
    sta (<pnt   ),y ;Pointer: Current Screen Line Address
    dey
    cpy <pntr   ;Cursor Column on Current Line
    bne l_e308
    lda #$20
    sta (<pnt   ),y ;Pointer: Current Screen Line Address
    inc <insrt  ;Flag: Insert Mode
    bne l_e373
l_e31b:
    ldx <insrt  ;Flag: Insert Mode
    beq l_e324
l_e31f:
    ora #$40
    jmp  l_e17a
l_e324:
    cmp #$11
    bne l_e353
    lda <pntr   ;Cursor Column on Current Line
    cmp #$28
    bcc l_e334
    sbc #$28
    sta <pntr   ;Cursor Column on Current Line
    bcs l_e373
l_e334:
    ldx <tblx   ;Current Cursor Physical Line Number
    beq l_e373
    lda <mych  ,x ;Serial Word Buffer
    bpl l_e343
    dec <tblx   ;Current Cursor Physical Line Number
    jsr  l_e071
    bcc l_e373
l_e343:
    dex
    dex
    stx <tblx   ;Current Cursor Physical Line Number
    jsr  l_e071
    lda <pntr   ;Cursor Column on Current Line
    clc
    adc #$28
    sta <pntr   ;Cursor Column on Current Line
    bne l_e373
l_e353:
    cmp #$12
    bne l_e35d
    lda #$00
    sta <rvs    ;Flag: Print Reverse Chars. -1=Yes
    beq l_e373
l_e35d:
    cmp #$1d
    bne l_e36c
    dey
    sty <pntr   ;Cursor Column on Current Line
    bpl l_e373
    jsr  l_e1de
    jmp  l_e1a6
l_e36c:
    cmp #$13
    bne l_e376
    jsr  l_e042
l_e373:
    jmp  l_e1a6
l_e376:
    cmp #$16
    bne l_e387
    lda #$20
    ldy #$00
l_e37e:
    cpy <pntr   ;Cursor Column on Current Line
    bcs l_e373
    sta (<pnt   ),y ;Pointer: Current Screen Line Address
    iny
    bne l_e37e
l_e387:
    cmp #$0e
    bne l_e390
    jsr  l_e617
    bmi l_e373
l_e390:
    cmp #$07
    bne l_e399
    jsr  l_e654
    beq l_e373
l_e399:
    cmp #$09
    bne l_e373
    jsr  l_e588
    eor tabs   ;Table of 80 bits to set TABs (80col)
    sta $03f0,x
    jmp  l_e1a6
l_e3a9:
    sec
    lsr <lxsp   ;Cursor Y-X Pos. at Start of INPUT
    ldx <tblx   ;Current Cursor Physical Line Number
l_e3ae:
    inx
    cpx #$19
    bne l_e3b6
    jsr  l_e3d1
l_e3b6:
    lda <ldtb1 ,x ;Screen Line Link Table / Editor Temps (40 col)
    bpl l_e3ae
    stx <tblx   ;Current Cursor Physical Line Number
    jmp  l_e071
l_e3bf:
    jsr  l_e3a9
    lda #$00
    sta <pntr   ;Cursor Column on Current Line
l_e3c6:
    lda #$00
    sta <insrt  ;Flag: Insert Mode
    sta <rvs    ;Flag: Print Reverse Chars. -1=Yes
    sta <qtsw   ;Flag: Editor in Quote Mode
    jmp  l_e1a6
l_e3d1:
    ldx #$19
    stx <tblx   ;Current Cursor Physical Line Number
l_e3d5:
    ldx #$ff
l_e3d7:
    inx
    lda $e798,x
    sta <pnt    ;Pointer: Current Screen Line Address
    lda <ldtb1 ,x ;Screen Line Link Table / Editor Temps (40 col)
    ora #$80
    sta $c5
    cpx #$18
    bcs l_e404
    ldy <scbot ,x ;Last line of window
    bmi l_e3ed
    and #$7f
l_e3ed:
    sta <ldtb1 ,x ;Screen Line Link Table / Editor Temps (40 col)
    tya
    ora #$80
    sta $c8
    lda $e799,x
    sta <sal    ;Pointer: Tape Buffer/ Screen Scrolling
    ldy #$27
l_e3fb:
    lda (<sal   ),y ;Pointer: Tape Buffer/ Screen Scrolling
    sta (<pnt   ),y ;Pointer: Current Screen Line Address
    dey
    bpl l_e3fb
    bmi l_e3d7
l_e404:
    sta <ldtb1 ,x ;Screen Line Link Table / Editor Temps (40 col)
    ldy #$27
    lda #$20
l_e40a:
    sta (<pnt   ),y ;Pointer: Current Screen Line Address
    dey
    bpl l_e40a
    dec <tblx   ;Current Cursor Physical Line Number
    lda <ldtb1  ;Screen Line Link Table / Editor Temps (40 col)
    bpl l_e3d5
    lda pia1_col ;Keyboard COL read
    cmp #$fe
    bne l_e427
    ldy #$00
l_e41e:
    nop
    dex
    bne l_e41e
    dey
    bne l_e41e
    sty <ndx    ;No. of Chars. in Keyboard Buffer (Queue)
l_e427:
    ldx <tblx   ;Current Cursor Physical Line Number
    rts
    tax
    tax
    tax
    tax
l_e42e:
    jsr  $ffea
    inc tiadj  ;Counter to speed TI by 6/5 (40col)
    lda tiadj  ;Counter to speed TI by 6/5 (40col)
    cmp #$06
    bne l_e458
    lda #$00
    sta tiadj  ;Counter to speed TI by 6/5 (40col)
    beq l_e42e
l_e442:
    pha
    txa
    pha
    tya
    pha
    tsx
    lda $0104,x
    and #$10
    beq l_e452
    jmp ( $0092) ;Vector: BRK Instr. Interrupt
l_e452:
    jmp ( $0090) ;Vector: Hardware Interrupt
l_e455:
    jsr  $ffea
l_e458:
    lda <blnsw  ;Cursor Blink enable: 0 = Flash Cursor
    bne l_e47b
    dec <blnct  ;Timer: Countdown to Toggle Cursor
    bne l_e47b
    lda #$14
    bit rptflg4 ;Repeat Flag (40 col)
    bpl l_e469
    lda #$02
l_e469:
    sta <blnct  ;Timer: Countdown to Toggle Cursor
    ldy <pntr   ;Cursor Column on Current Line
    lsr <blnon  ;Flag: Last Cursor Blink On/Off
    lda (<pnt   ),y ;Pointer: Current Screen Line Address
    bcs l_e477
    inc <blnon  ;Flag: Last Cursor Blink On/Off
    sta <gdbln  ;Character Under Cursor
l_e477:
    eor #$80
    sta (<pnt   ),y ;Pointer: Current Screen Line Address
l_e47b:
    ldy #$00
    lda pia1_row ;Keyboard ROW select
    and #$f0
    sta pia1_row ;Keyboard ROW select
    lda pia1_row ;Keyboard ROW select
    asl
    asl
    asl
    bpl l_e496
    sty <cas1   ;Tape Motor Interlock #1
    lda pia1_13 ;PIA#1 Register 13 (Retrace flag and interrupt
    ora #$08
    bne l_e49f
l_e496:
    lda <cas1   ;Tape Motor Interlock #1
    bne l_e4a2
    lda pia1_13 ;PIA#1 Register 13 (Retrace flag and interrupt
    and #$f7
l_e49f:
    sta pia1_13 ;PIA#1 Register 13 (Retrace flag and interrupt
l_e4a2:
    bcc l_e4ad
    sty <cas2   ;Tape Motor Interlock #2
    lda via_0 ;VIA Register 0 (flags)
    ora #$10
    bne l_e4b6
l_e4ad:
    lda <cas2   ;Tape Motor Interlock #2
    bne l_e4b9
    lda via_0 ;VIA Register 0 (flags)
    and #$ef
l_e4b6:
    sta via_0 ;VIA Register 0 (flags)
l_e4b9:
    jsr  l_e4bf
    jmp  l_e600
l_e4bf:
    ldy #$ff
    sty <keyimg ;Key Image
    iny
    sty <sfdx   ;Flag: Print Shifted Chars.
    lda rptflg4 ;Repeat Flag (40 col)
    and #$7f
    sta rptflg4 ;Repeat Flag (40 col)
    ldx #$50
l_e4d0:
    ldy #$08
    lda pia1_col ;Keyboard COL read
    cmp pia1_col ;Keyboard COL read
    bne l_e4d0
    cmp #$ff
    bne l_e4e7
    txa
    sec
    sbc #$08
    tax
    bne l_e511
    beq l_e516
l_e4e7:
    lsr
    bcs l_e50b
    pha
    lda $e73e,x
    bne l_e4f6
    lda #$01
    sta <sfdx   ;Flag: Print Shifted Chars.
    bne l_e50a
l_e4f6:
    cmp #$10
    bne l_e504
    lda rptflg4 ;Repeat Flag (40 col)
    ora #$80
    sta rptflg4 ;Repeat Flag (40 col)
    bmi l_e50a
l_e504:
    cmp #$ff
    beq l_e50a
    sta <keyimg ;Key Image
l_e50a:
    pla
l_e50b:
    dex
    beq l_e516
    dey
    bne l_e4e7
l_e511:
    inc pia1_row ;Keyboard ROW select
    bne l_e4d0
l_e516:
    lda <keyimg ;Key Image
    cmp <lstx   ;Current Key Pressed: 255 = No Key
    beq l_e523
    ldx #$10
    stx delay4 ;Repeat key countdown (40col)
    bne l_e556
l_e523:
    bit rptflg4 ;Repeat Flag (40 col)
    bmi l_e548
    bvs l_e587
    cmp #$ff
    beq l_e587
    cmp #$14
    beq l_e53e
    cmp #$20
    beq l_e53e
    cmp #$1d
    beq l_e53e
    cmp #$11
    bne l_e587
l_e53e:
    ldx delay4 ;Repeat key countdown (40col)
    beq l_e548
    dec delay4 ;Repeat key countdown (40col)
    bne l_e587
l_e548:
    dec kount4 ;Delay between repeats (40col)
    bne l_e587
    ldx #$04
    stx kount4 ;Delay between repeats (40col)
    ldx <ndx    ;No. of Chars. in Keyboard Buffer (Queue)
    bne l_e587
l_e556:
    sta <lstx   ;Current Key Pressed: 255 = No Key
    cmp #$ff
    beq l_e587
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    lsr <sfdx   ;Flag: Print Shifted Chars.
    bcc l_e57a
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ora #$80
l_e57a:
    ldx <ndx    ;No. of Chars. in Keyboard Buffer (Queue)
    cpx xmax4  ;Max keyboard buffer size (40 col)
    bcs l_e587
    sta $026f,x
    inx
    stx <ndx    ;No. of Chars. in Keyboard Buffer (Queue)
l_e587:
    rts
l_e588:
    tya
    and #$07
    tax
    lda $e7dc,x
    sta tabs   ;Table of 80 bits to set TABs (80col)
    tya
    lsr
    lsr
    lsr
    tax
    lda $03f0,x
    bit tabs   ;Table of 80 bits to set TABs (80col)
    rts
    !byte $aa,$aa,$aa,$aa,$aa,$aa,$aa,$aa ; filler
    !byte $aa,$aa,$aa,$aa,$aa,$aa,$aa,$aa ; filler
    !byte $aa,$aa,$aa,$aa,$aa,$aa,$aa,$aa ; filler
    !byte $aa,$aa,$aa,$aa,$aa,$aa,$aa,$aa ; filler
    !byte $aa,$aa,$aa,$aa,$aa,$aa,$aa,$aa ; filler
    !byte $aa,$aa,$aa,$aa,$aa,$aa,$aa,$aa ; filler
    !byte $aa,$aa,$aa,$aa,$aa,$aa,$aa,$aa ; filler
    !byte $aa,$aa,$aa,$aa,$aa,$aa,$aa,$aa ; filler
    !byte $aa,$aa,$aa,$aa,$aa,$aa,$aa,$aa ; filler
    !byte $aa,$aa,$aa,$aa,$aa,$aa,$aa,$aa ; filler
    !byte $aa,$aa,$aa,$aa,$aa,$aa,$aa,$aa ; filler
    !byte $aa,$aa,$aa,$aa,$aa,$aa,$aa,$aa ; filler
    !byte $aa,$aa ; filler
l_e600:
    pla
    tay
    pla
    tax
    pla
    rti
l_e606:
    ldy <pntr   ;Cursor Column on Current Line
    sta (<pnt   ),y ;Pointer: Current Screen Line Address
    lda #$02
    sta <blnct  ;Timer: Countdown to Toggle Cursor
    rts
l_e60f:
    lda #$b1
    ldx #$e7
    ldy #$0e
    bne l_e61d
l_e617:
    lda #$c3
    ldx #$e7
    ldy #$0c
l_e61d:
    sta <sal    ;Pointer: Tape Buffer/ Screen Scrolling
    stx $c8
    lda via_c ;VIA Register C (cb2
    and #$f0
    sta <fnlen  ;Length of Current File Name
    tya
    ora <fnlen  ;Length of Current File Name
    sta via_c ;VIA Register C (cb2
    ldy #$11
l_e630:
    lda (<sal   ),y ;Pointer: Tape Buffer/ Screen Scrolling
    sty crtcreg ;CRTC Register select
    sta crtcdat ;CRTC Data
    dey
    bpl l_e630
    rts
l_e63c:
    jsr  l_e202
    tax
    lda <lnmx   ;Physical Screen Line Length
    sec
    sbc <pntr   ;Cursor Column on Current Line
    cmp #$05
    bne l_e682
    txa
    cmp #$1d
    beq l_e654
    and #$7f
    cmp #$20
    bcc l_e682
l_e654:
    jsr  l_e657
l_e657:
    ldy chime4 ;Chime Time 0=off (40col)
    beq l_e682
    lda #$10
    sta $e84b
    lda #$0f
    sta $e84a
    ldx #$07
l_e668:
    lda $e7d4,x
    sta $e848
    lda chime4 ;Chime Time 0=off (40col)
l_e671:
    dey
    bne l_e671
    sec
    sbc #$01
    bne l_e671
    dex
    bne l_e668
    stx $e84a
    stx $e84b
l_e682:
    rts
l_e683:
    lda #$7f
    sta $e84e
    ldx #$6d
    lda #$00
l_e68c:
    sta <time  ,x ;Real-Time Jiffy Clock (approx) 1/60 Sec
    dex
    bpl l_e68c
    ldx #$0a
l_e693:
    sta $03f0,x
    dex
    bpl l_e693
    sta rptflg4 ;Repeat Flag (40 col)
    lda #$55
    sta <cinv   ;Vector: Hardware Interrupt
    lda #$e4
    sta $91
    lda #$03
    sta <dflto  ;Default Output (CMD) Device (3)
    lda #$0f
    sta pia1_row ;Keyboard ROW select
    asl
    sta via_0 ;VIA Register 0 (flags)
    sta $e842
    stx $e822
    stx $e845
    lda #$3d
    sta pia1_13 ;PIA#1 Register 13 (Retrace flag and interrupt
    bit pia1_col ;Keyboard COL read
    lda #$3c
    sta $e821
    sta $e823
    sta $e811
    stx $e822
    lda #$0c
    sta via_c ;VIA Register C (cb2
    sta <blnct  ;Timer: Countdown to Toggle Cursor
    sta <blnsw  ;Cursor Blink enable: 0 = Flash Cursor
    lda #$09
    sta xmax4  ;Max keyboard buffer size (40 col)
    lda #$10
    sta chime4 ;Chime Time 0=off (40col)
    sta delay4 ;Repeat key countdown (40col)
    sta kount4 ;Delay between repeats (40col)
    rts
l_e6ea:
    ldx <tblx   ;Current Cursor Physical Line Number
    inx
    cpx #$18
    beq l_e724
    bcc l_e6f6
    jmp  l_e1c4
l_e6f6:
    ldx #$17
l_e6f8:
    lda <scbot ,x ;Last line of window
    ora #$80
    sta $c8
    ldy <ldtb1 ,x ;Screen Line Link Table / Editor Temps (40 col)
    bmi l_e704
    and #$7f
l_e704:
    sta <scbot ,x ;Last line of window
    tya
    ora #$80
    sta $c5
    ldy #$27
    lda $e799,x
    sta <sal    ;Pointer: Tape Buffer/ Screen Scrolling
    lda $e798,x
    sta <pnt    ;Pointer: Current Screen Line Address
l_e717:
    lda (<pnt   ),y ;Pointer: Current Screen Line Address
    sta (<sal   ),y ;Pointer: Tape Buffer/ Screen Scrolling
    dey
    bpl l_e717
    dex
    cpx <tblx   ;Current Cursor Physical Line Number
    bne l_e6f8
    inx
l_e724:
    lda <ldtb1 ,x ;Screen Line Link Table / Editor Temps (40 col)
    ora #$80
    sta $c5
    and #$7f
    sta <ldtb1 ,x ;Screen Line Link Table / Editor Temps (40 col)
    lda $e798,x
    sta <pnt    ;Pointer: Current Screen Line Address
    ldy #$27
    lda #$20
l_e737:
    sta (<pnt   ),y ;Pointer: Current Screen Line Address
    dey
    bpl l_e737
    jmp  l_e071
    !byte $3d,$2e,$10,$03,$3c,$20,$5b,$12 ; keyboard decode table - graphic keyboard
    !byte $2d,$30,$00,$3e,$ff,$5d,$40,$00 ; keyboard decode table - graphic keyboard
    !byte $2b,$32,$ff,$3f,$2c,$4e,$56,$58 ; keyboard decode table - graphic keyboard
    !byte $33,$31,$0d,$3b,$4d,$42,$43,$5a ; keyboard decode table - graphic keyboard
    !byte $2a,$35,$ff,$3a,$4b,$48,$46,$53 ; keyboard decode table - graphic keyboard
    !byte $36,$34,$ff,$4c,$4a,$47,$44,$41 ; keyboard decode table - graphic keyboard
    !byte $2f,$38,$ff,$50,$49,$59,$52,$57 ; keyboard decode table - graphic keyboard
    !byte $39,$37,$5e,$4f,$55,$54,$45,$51 ; keyboard decode table - graphic keyboard
    !byte $14,$11,$09,$29,$5c,$27,$24,$22 ; keyboard decode table - graphic keyboard
    !byte $1d,$13,$5f,$28,$26,$25,$23,$21 ; keyboard decode table - graphic keyboard
    !byte $44,$cc,$22,$2a,$0d,$52,$55,$4e ; SHIFT-RUN keystrokes for buffer
    !byte $0d ; SHIFT-RUN keystrokes for buffer
    !byte $00,$28,$50,$78,$a0,$c8,$f0,$18 ; screen address - lo
    !byte $40,$68,$90,$b8,$e0,$08,$30,$58 ; screen address - lo
    !byte $80,$a8,$d0,$f8,$20,$48,$70,$98 ; screen address - lo
    !byte $c0 ; screen address - lo
    !byte $31,$28,$29,$0f,$20,$03,$19,$1d ; CRTC register data -  40 COL TEXT mode
    !byte $00,$09,$00,$00,$10,$00,$00,$00 ; CRTC register data -  40 COL TEXT mode
    !byte $00,$00 ; CRTC register data -  40 COL TEXT mode
    !byte $31,$28,$29,$0f,$28,$05,$19,$21 ; CRTC register data -  40 COL GRAPHICS mode
    !byte $00,$07,$00,$00,$10,$00,$00,$00 ; CRTC register data -  40 COL GRAPHICS mode
    !byte $00,$00 ; CRTC register data -  40 COL GRAPHICS mode
    !byte $0e,$1e,$3e,$7e,$3e,$1e,$0e ; bell chime values
    !byte $80,$40,$20,$10,$08,$04,$02,$01 ; BIT table
    !byte $bb,$aa,$aa,$aa,$aa,$aa,$aa,$aa ; filler
    !byte $aa,$aa,$aa,$aa,$aa,$aa,$aa,$aa ; filler
    !byte $aa,$aa,$aa,$aa,$aa,$aa,$aa,$aa ; filler
    !byte $aa,$aa,$aa,$aa ; filler
