*=$0401
;
; ---- Code
;
;
L_0401:
0401:           !BYTE $01,$04,$0D,$04,$0A,$00,$9E,$28 ;BASIC - SYS1039
0409:           !BYTE $31,$30,$33,$39,$29,$00     ;BASIC - SYS1039
 
; Copy to screen memory
040F: 00        BRK                               
0410: 00        BRK                               
0411: A9 3E     LDA #$3E                          
0413: 85 01     STA USRADD                         ;USR Address Low Byte / High Byte
0415: A9 04     LDA #$04                          
0417: 85 02     STA $02                           
0419: A9 10     LDA #$10                          
041B: 85 C0     STA PTR1                           ;Tape Pass 1 Error Log
041D: A9 84     LDA #$84                          
041F: 85 C1     STA PTR2                           ;Tape Pass 2 Error Log
0421: A0 00     LDY #$00                          
;
L_0423:
0423: B1 01     LDA (USRADD),Y                     ;USR Address Low Byte / High Byte
0425: 91 C0     STA (PTR1),Y                       ;Tape Pass 1 Error Log
0427: E6 01     INC USRADD                         ;USR Address Low Byte / High Byte
0429: D0 02     BNE L_042D                        
042B: E6 02     INC $02                           
;
L_042D:
042D: E6 C0     INC PTR1                           ;Tape Pass 1 Error Log
042F: D0 F2     BNE L_0423                        
0431: E6 C1     INC PTR2                           ;Tape Pass 2 Error Log
0433: A5 C1     LDA PTR2                           ;Tape Pass 2 Error Log
0435: C9 88     CMP #$88                          
0437: D0 EA     BNE L_0423                        
0439: 4C 54 84  JMP $8454                         
043C:           !BYTE $E6,$4C                     ;unknown
 
;
L_043E:
043E:           !BYTE $54,$84,$31,$14,$1F,$0F,$31,$00 ;crtc-registers
0446:           !BYTE $19,$25,$00,$07,$00,$00,$10,$00 ;crtc-registers
044E:           !BYTE $00,$00,$00                 ;crtc-registers
 
;
L_0451:
0451:           !BYTE $00,$00,$28,$50,$78,$A0,$C8,$F0 ;unknown
0459:           !BYTE $18,$40,$68,$90,$B8,$E0,$08,$30 ;unknown
0461:           !BYTE $58,$80,$A8,$D0,$F8,$20,$48,$70 ;unknown
0469:           !BYTE $98,$C0,$20,$57,$49,$4E,$44,$4F ;unknown
0471:           !BYTE $57,$20,$38,$30,$20,$43,$4F,$4C ;unknown
0479:           !BYTE $55,$4D,$4E,$20,$56,$45,$52,$20 ;unknown
0481:           !BYTE $31,$2E,$30                 ;unknown
 
0484: 78        SEI                               
0485: A9 70     LDA #$70                          
0487: A2 84     LDX #$84                          
0489: 85 EB     STA SCNV2                          ;Print to screen vector (from E009)
048B: 86 EC     STX $EC                           
048D: 86 A7     STX BLNSW                          ;Cursor Blink enable: 0 = Flash Cursor
048F: 58        CLI                               
0490: 20 76 84  JSR $8476                         
0493: A2 00     LDX #$00                          
0495: 86 E2     STX SCLF                           ;First column of window
0497: 86 A7     STX BLNSW                          ;Cursor Blink enable: 0 = Flash Cursor
0499: 20 82 E0  JSR $E082                         
049C: 4C 49 87  JMP $8749                         
049F: E0 20     CPX #$20                          
04A1: 50 85     BVC L_0428                        
04A3: 4C 9D E1  JMP $E19D                         
04A6: A0 83     LDY #$83                          
04A8: A2 18     LDX #$18                          
;
L_04AA:
04AA: 98        TYA                               
04AB: 9D 3B 84  STA $843B,X                       
04AE: E0 14     CPX #$14                          
04B0: F0 08     BEQ L_04BA                        
04B2: E0 0D     CPX #$0D                          
04B4: F0 04     BEQ L_04BA                        
04B6: E0 07     CPX #$07                          
04B8: D0 01     BNE L_04BB                        
;
L_04BA:
04BA: 88        DEY                               
;
L_04BB:
04BB: CA        DEX                               
04BC: 10 EC     BPL L_04AA                        
04BE: E8        INX                               
04BF: 86 9F     STX RVS                            ;Flag: Print Reverse Chars. -1=Yes
04C1: 86 C4     STX PNT                            ;Pointer: Current Screen Line Address
04C3: A9 20     LDA #$20                          
;
L_04C5:
04C5: 9D 00 80  STA SCREEN1,X                      ;screen page 1 (40 col)
04C8: 9D 00 81  STA SCREEN2,X                      ;screen page 2 (40 col)
04CB: 9D 00 82  STA SCREEN3,X                      ;screen page 3 (40 col)
04CE: 9D 00 83  STA SCREEN4,X                      ;screen page 4 (40 col)
04D1: CA        DEX                               
04D2: D0 F1     BNE L_04C5                        
04D4: A0 00     LDY #$00                          
04D6: 84 C6     STY PNTR                           ;Cursor Column on Current Line
04D8: 84 D8     STY TBLX                           ;Current Cursor Physical Line Number
04DA: A6 D8     LDX TBLX                           ;Current Cursor Physical Line Number
04DC: BD 3B 84  LDA $843B,X                       
04DF: 09 80     ORA #$80                          
04E1: 85 C5     STA $C5                           
04E3: BD 22 84  LDA $8422,X                       
04E6: 85 C4     STA PNT                            ;Pointer: Current Screen Line Address
04E8: A9 27     LDA #$27                          
04EA: 85 D5     STA LNMX                           ;Physical Screen Line Length
04EC: E0 18     CPX #$18                          
04EE: F0 09     BEQ L_04F9                        
04F0: BD 3C 84  LDA $843C,X                       
04F3: 30 04     BMI L_04F9                        
04F5: A9 4F     LDA #$4F                          
04F7: 85 D5     STA LNMX                           ;Physical Screen Line Length
;
L_04F9:
04F9: A5 C6     LDA PNTR                           ;Cursor Column on Current Line
04FB: C9 28     CMP #$28                          
04FD: 90 04     BCC L_0503                        
04FF: E9 28     SBC #$28                          
0501: 85 C6     STA PNTR                           ;Cursor Column on Current Line
;
L_0503:
0503: 60        RTS                               
;
0504: 09 40     ORA #$40                          
0506: A6 9F     LDX RVS                            ;Flag: Print Reverse Chars. -1=Yes
0508: F0 02     BEQ L_050C                        
050A: 09 80     ORA #$80                          
;
L_050C:
050C: A6 DC     LDX INSRT                          ;Flag: Insert Mode
050E: F0 02     BEQ L_0512                        
0510: C6 DC     DEC INSRT                          ;Flag: Insert Mode
;
L_0512:
0512: 20 06 E6  JSR $E606                         
0515: E6 C6     INC PNTR                           ;Cursor Column on Current Line
0517: A4 D5     LDY LNMX                           ;Physical Screen Line Length
0519: C4 C6     CPY PNTR                           ;Cursor Column on Current Line
051B: B0 10     BCS L_052D                        
051D: A6 D8     LDX TBLX                           ;Current Cursor Physical Line Number
051F: C0 4F     CPY #$4F                          
0521: D0 0B     BNE L_052E                        
0523: 20 1E 85  JSR $851E                         
0526: 20 68 86  JSR $8668                         
0529: A9 00     LDA #$00                          
052B: 85 C6     STA PNTR                           ;Cursor Column on Current Line
;
L_052D:
052D: 60        RTS                               
;
;
L_052E:
052E: E0 18     CPX #$18                          
0530: D0 09     BNE L_053B                        
0532: 20 8C 86  JSR $868C                         
0535: C6 A3     DEC LXSP                           ;Cursor Y-X Pos. at Start of INPUT
0537: C6 D8     DEC TBLX                           ;Current Cursor Physical Line Number
0539: A6 D8     LDX TBLX                           ;Current Cursor Physical Line Number
;
L_053B:
053B: 1E 3C 84  ASL $843C,X                       
053E: 5E 3C 84  LSR $843C,X                       
0541: 20 1E 85  JSR $851E                         
0544: A5 C6     LDA PNTR                           ;Cursor Column on Current Line
0546: 48        PHA                               
0547: 20 AA 84  JSR $84AA                         
054A: 68        PLA                               
054B: 85 C6     STA PNTR                           ;Cursor Column on Current Line
054D: 60        RTS                               
;
054E: E0 17     CPX #$17                          
0550: B0 08     BCS L_055A                        
0552: BD 3D 84  LDA $843D,X                       
0555: 09 80     ORA #$80                          
0557: 9D 3D 84  STA $843D,X                       
;
L_055A:
055A: 60        RTS                               
;
055B: A0 27     LDY #$27                          
055D: A6 D8     LDX TBLX                           ;Current Cursor Physical Line Number
055F: D0 05     BNE L_0566                        
0561: 86 C6     STX PNTR                           ;Cursor Column on Current Line
0563: 68        PLA                               
0564: 68        PLA                               
0565: 60        RTS                               
;
;
L_0566:
0566: BD 3A 84  LDA $843A,X                       
0569: 30 06     BMI L_0571                        
056B: CA        DEX                               
056C: BD 3A 84  LDA $843A,X                       
056F: A0 4F     LDY #$4F                          
;
L_0571:
0571: CA        DEX                               
0572: 86 D8     STX TBLX                           ;Current Cursor Physical Line Number
0574: 85 C5     STA $C5                           
0576: BD 22 84  LDA $8422,X                       
0579: 85 C4     STA PNT                            ;Pointer: Current Screen Line Address
057B: 84 C6     STY PNTR                           ;Cursor Column on Current Line
057D: 84 D5     STY LNMX                           ;Physical Screen Line Length
057F: 60        RTS                               
;
0580: A9 00     LDA #$00                          
0582: 85 AC     STA CRSW                           ;Flag: INPUT or GET from Keyboard
0584: A5 D9     LDA DATAX                          ;Current Character to Print
0586: 29 7F     AND #$7F                          
0588: C9 1B     CMP #$1B                          
058A: D0 05     BNE L_0591                        
058C: 68        PLA                               
058D: 68        PLA                               
058E: 4C BD E3  JMP $E3BD                         
;
L_0591:
0591: A4 C6     LDY PNTR                           ;Cursor Column on Current Line
0593: A5 D9     LDA DATAX                          ;Current Character to Print
0595: 30 6A     BMI L_0601                        
0597: C9 0D     CMP #$0D                          
0599: D0 03     BNE L_059E                        
059B: 4C 7F 86  JMP $867F                         
;
L_059E:
059E: C9 20     CMP #$20                          
05A0: 90 08     BCC L_05AA                        
05A2: 29 3F     AND #$3F                          
05A4: 20 6A E1  JSR $E16A                         
05A7: 4C D6 84  JMP $84D6                         
;
L_05AA:
05AA: A6 DC     LDX INSRT                          ;Flag: Insert Mode
05AC: F0 03     BEQ L_05B1                        
05AE: 4C DA 84  JMP $84DA                         
;
L_05B1:
05B1: C9 14     CMP #$14                          
05B3: D0 12     BNE L_05C7                        
05B5: 88        DEY                               
05B6: 84 C6     STY PNTR                           ;Cursor Column on Current Line
05B8: 10 08     BPL L_05C2                        
05BA: 20 2B 85  JSR $852B                         
05BD: 68        PLA                               
05BE: 68        PLA                               
05BF: 4C 5C E2  JMP $E25C                         
;
L_05C2:
05C2: 68        PLA                               
05C3: 68        PLA                               
05C4: 4C 51 E2  JMP $E251                         
;
L_05C7:
05C7: A6 CD     LDX QTSW                           ;Flag: Editor in Quote Mode
05C9: F0 03     BEQ L_05CE                        
05CB: 4C DA 84  JMP $84DA                         
;
L_05CE:
05CE: C9 12     CMP #$12                          
05D0: D0 03     BNE L_05D5                        
05D2: 85 9F     STA RVS                            ;Flag: Print Reverse Chars. -1=Yes
05D4: 60        RTS                               
;
;
L_05D5:
05D5: C9 13     CMP #$13                          
05D7: D0 03     BNE L_05DC                        
05D9: 4C A4 84  JMP $84A4                         
;
L_05DC:
05DC: C9 1D     CMP #$1D                          
05DE: D0 10     BNE L_05F0                        
05E0: C8        INY                               
05E1: 84 C6     STY PNTR                           ;Cursor Column on Current Line
05E3: 88        DEY                               
05E4: C4 D5     CPY LNMX                           ;Physical Screen Line Length
05E6: 90 07     BCC L_05EF                        
05E8: 20 68 86  JSR $8668                         
05EB: A9 00     LDA #$00                          
;
L_05ED:
05ED: 85 C6     STA PNTR                           ;Cursor Column on Current Line
;
L_05EF:
05EF: 60        RTS                               
;
;
L_05F0:
05F0: C9 11     CMP #$11                          
05F2: D0 FB     BNE L_05EF                        
05F4: 18        CLC                               
05F5: 98        TYA                               
05F6: 69 28     ADC #$28                          
05F8: C5 D5     CMP LNMX                           ;Physical Screen Line Length
05FA: 90 F1     BCC L_05ED                        
05FC: F0 EF     BEQ L_05ED                        
05FE: 4C 68 86  JMP $8668                         
;
L_0601:
0601: 29 7F     AND #$7F                          
0603: C9 7F     CMP #$7F                          
0605: D0 02     BNE L_0609                        
0607: A9 5E     LDA #$5E                          
;
L_0609:
0609: C9 20     CMP #$20                          
060B: 90 03     BCC L_0610                        
060D: 4C D4 84  JMP $84D4                         
;
L_0610:
0610: C9 0D     CMP #$0D                          
0612: D0 03     BNE L_0617                        
0614: 4C 7F 86  JMP $867F                         
;
L_0617:
0617: A6 CD     LDX QTSW                           ;Flag: Editor in Quote Mode
0619: D0 2F     BNE L_064A                        
061B: C9 14     CMP #$14                          
061D: D0 27     BNE L_0646                        
061F: A4 D5     LDY LNMX                           ;Physical Screen Line Length
0621: B1 C4     LDA (PNT),Y                        ;Pointer: Current Screen Line Address
0623: C9 20     CMP #$20                          
0625: D0 04     BNE L_062B                        
0627: C4 C6     CPY PNTR                           ;Cursor Column on Current Line
0629: D0 07     BNE L_0632                        
;
L_062B:
062B: C0 4F     CPY #$4F                          
062D: F0 16     BEQ L_0645                        
062F: 20 EE 86  JSR $86EE                         
;
L_0632:
0632: A4 D5     LDY LNMX                           ;Physical Screen Line Length
;
L_0634:
0634: 88        DEY                               
0635: B1 C4     LDA (PNT),Y                        ;Pointer: Current Screen Line Address
0637: C8        INY                               
0638: 91 C4     STA (PNT),Y                        ;Pointer: Current Screen Line Address
063A: 88        DEY                               
063B: C4 C6     CPY PNTR                           ;Cursor Column on Current Line
063D: D0 F5     BNE L_0634                        
063F: A9 20     LDA #$20                          
0641: 91 C4     STA (PNT),Y                        ;Pointer: Current Screen Line Address
0643: E6 DC     INC INSRT                          ;Flag: Insert Mode
;
L_0645:
0645: 60        RTS                               
;
;
L_0646:
0646: A6 DC     LDX INSRT                          ;Flag: Insert Mode
0648: F0 05     BEQ L_064F                        
;
L_064A:
064A: 09 40     ORA #$40                          
064C: 4C DA 84  JMP $84DA                         
;
L_064F:
064F: C9 11     CMP #$11                          
0651: D0 2A     BNE L_067D                        
0653: A5 C6     LDA PNTR                           ;Cursor Column on Current Line
0655: C9 28     CMP #$28                          
0657: 90 05     BCC L_065E                        
0659: E9 28     SBC #$28                          
065B: 85 C6     STA PNTR                           ;Cursor Column on Current Line
;
L_065D:
065D: 60        RTS                               
;
;
L_065E:
065E: A6 D8     LDX TBLX                           ;Current Cursor Physical Line Number
0660: F0 FB     BEQ L_065D                        
0662: BD 3A 84  LDA $843A,X                       
0665: 10 07     BPL L_066E                        
0667: C6 D8     DEC TBLX                           ;Current Cursor Physical Line Number
0669: 20 AA 84  JSR $84AA                         
066C: 90 EF     BCC L_065D                        
;
L_066E:
066E: CA        DEX                               
066F: CA        DEX                               
0670: 86 D8     STX TBLX                           ;Current Cursor Physical Line Number
0672: 20 AA 84  JSR $84AA                         
0675: A5 C6     LDA PNTR                           ;Cursor Column on Current Line
0677: 18        CLC                               
0678: 69 28     ADC #$28                          
067A: 85 C6     STA PNTR                           ;Cursor Column on Current Line
;
L_067C:
067C: 60        RTS                               
;
;
L_067D:
067D: C9 12     CMP #$12                          
067F: D0 04     BNE L_0685                        
0681: A9 00     LDA #$00                          
0683: 85 9F     STA RVS                            ;Flag: Print Reverse Chars. -1=Yes
;
L_0685:
0685: C9 1D     CMP #$1D                          
0687: D0 08     BNE L_0691                        
0689: 88        DEY                               
068A: 84 C6     STY PNTR                           ;Cursor Column on Current Line
068C: 10 EE     BPL L_067C                        
068E: 20 2B 85  JSR $852B                         
;
L_0691:
0691: C9 13     CMP #$13                          
0693: D0 E7     BNE L_067C                        
0695: 4C 76 84  JMP $8476                         
0698: 38        SEC                               
0699: 46 A3     LSR LXSP                           ;Cursor Y-X Pos. at Start of INPUT
069B: A6 D8     LDX TBLX                           ;Current Cursor Physical Line Number
;
L_069D:
069D: E8        INX                               
069E: E0 19     CPX #$19                          
06A0: D0 03     BNE L_06A5                        
06A2: 20 8C 86  JSR $868C                         
;
L_06A5:
06A5: BD 3B 84  LDA $843B,X                       
06A8: 10 F3     BPL L_069D                        
06AA: 86 D8     STX TBLX                           ;Current Cursor Physical Line Number
06AC: 4C AA 84  JMP $84AA                         
06AF: A9 00     LDA #$00                          
06B1: 85 C6     STA PNTR                           ;Cursor Column on Current Line
06B3: 85 9F     STA RVS                            ;Flag: Print Reverse Chars. -1=Yes
06B5: 85 CD     STA QTSW                           ;Flag: Editor in Quote Mode
06B7: 85 DC     STA INSRT                          ;Flag: Insert Mode
06B9: 4C 68 86  JMP $8668                         
06BC: A0 00     LDY #$00                          
06BE: 84 C4     STY PNT                            ;Pointer: Current Screen Line Address
06C0: A9 80     LDA #$80                          
06C2: 85 C8     STA $C8                           
06C4: 85 C5     STA $C5                           
06C6: A9 28     LDA #$28                          
06C8: 2C 3C 84  BIT $843C                         
06CB: 30 02     BMI L_06CF                        
06CD: A9 50     LDA #$50                          
;
L_06CF:
06CF: 85 C7     STA SAL                            ;Pointer: Tape Buffer/ Screen Scrolling
;
L_06D1:
06D1: B1 C7     LDA (SAL),Y                        ;Pointer: Tape Buffer/ Screen Scrolling
06D3: 91 C4     STA (PNT),Y                        ;Pointer: Current Screen Line Address
06D5: C8        INY                               
06D6: D0 F9     BNE L_06D1                        
06D8: E6 C8     INC $C8                           
06DA: E6 C5     INC $C5                           
06DC: A9 84     LDA #$84                          
06DE: C5 C8     CMP $C8                           
06E0: D0 EF     BNE L_06D1                        
06E2: A9 E8     LDA #$E8                          
06E4: 85 C4     STA PNT                            ;Pointer: Current Screen Line Address
06E6: C6 C5     DEC $C5                           
06E8: A9 20     LDA #$20                          
;
L_06EA:
06EA: C6 C4     DEC PNT                            ;Pointer: Current Screen Line Address
06EC: C6 C7     DEC SAL                            ;Pointer: Tape Buffer/ Screen Scrolling
06EE: 91 C4     STA (PNT),Y                        ;Pointer: Current Screen Line Address
06F0: D0 F8     BNE L_06EA                        
06F2: A2 19     LDX #$19                          
06F4: 86 D8     STX TBLX                           ;Current Cursor Physical Line Number
;
L_06F6:
06F6: A2 00     LDX #$00                          
06F8: C6 D8     DEC TBLX                           ;Current Cursor Physical Line Number
;
L_06FA:
06FA: BD 3B 84  LDA $843B,X                       
06FD: 29 7F     AND #$7F                          
06FF: BC 3C 84  LDY $843C,X                       
0702: 10 02     BPL L_0706                        
0704: 09 80     ORA #$80                          
;
L_0706:
0706: 9D 3B 84  STA $843B,X                       
0709: E8        INX                               
070A: E0 19     CPX #$19                          
070C: D0 EC     BNE L_06FA                        
070E: A9 83     LDA #$83                          
0710: 8D 53 84  STA $8453                         
0713: AD 3B 84  LDA $843B                         
0716: 10 DE     BPL L_06F6                        
0718: 20 0B E4  JSR $E40B                         
071B: A6 D8     LDX TBLX                           ;Current Cursor Physical Line Number
071D: 60        RTS                               
;
071E: A6 D8     LDX TBLX                           ;Current Cursor Physical Line Number
0720: E8        INX                               
0721: E0 18     CPX #$18                          
0723: F0 36     BEQ L_075B                        
0725: 90 03     BCC L_072A                        
0727: 4C 02 85  JMP $8502                         
;
L_072A:
072A: A2 17     LDX #$17                          
;
L_072C:
072C: BD 3C 84  LDA $843C,X                       
072F: 09 80     ORA #$80                          
0731: 85 C8     STA $C8                           
0733: BC 3B 84  LDY $843B,X                       
0736: 30 02     BMI L_073A                        
0738: 29 7F     AND #$7F                          
;
L_073A:
073A: 9D 3C 84  STA $843C,X                       
073D: 98        TYA                               
073E: 09 80     ORA #$80                          
0740: 85 C5     STA $C5                           
0742: A0 27     LDY #$27                          
0744: BD 23 84  LDA $8423,X                       
0747: 85 C7     STA SAL                            ;Pointer: Tape Buffer/ Screen Scrolling
0749: BD 22 84  LDA $8422,X                       
074C: 85 C4     STA PNT                            ;Pointer: Current Screen Line Address
;
L_074E:
074E: B1 C4     LDA (PNT),Y                        ;Pointer: Current Screen Line Address
0750: 91 C7     STA (SAL),Y                        ;Pointer: Tape Buffer/ Screen Scrolling
0752: 88        DEY                               
0753: 10 F9     BPL L_074E                        
0755: CA        DEX                               
0756: E4 D8     CPX TBLX                           ;Current Cursor Physical Line Number
0758: D0 D2     BNE L_072C                        
075A: E8        INX                               
;
L_075B:
075B: BD 3B 84  LDA $843B,X                       
075E: 09 80     ORA #$80                          
0760: 85 C5     STA $C5                           
0762: 29 7F     AND #$7F                          
0764: 9D 3B 84  STA $843B,X                       
0767: BD 22 84  LDA $8422,X                       
076A: 85 C4     STA PNT                            ;Pointer: Current Screen Line Address
076C: A0 27     LDY #$27                          
076E: A9 20     LDA #$20                          
;
L_0770:
0770: 91 C4     STA (PNT),Y                        ;Pointer: Current Screen Line Address
0772: 88        DEY                               
0773: 10 FB     BPL L_0770                        
0775: 58        CLI                               
0776: 4C AA 84  JMP $84AA                         
0779: A0 01     LDY #$01                          
077B: 8C 80 E8  STY CRTREG00                       ;CRTC; $E880 Controller Register Select
077E: A9 14     LDA #$14                          
0780: 8D 81 E8  STA CRTREG01                       ;CRTC; $E881 Controller Data
0783: C8        INY                               
0784: 8C 80 E8  STY CRTREG00                       ;CRTC; $E880 Controller Register Select
0787: AD 3E E7  LDA $E73E                         
078A: 38        SEC                               
078B: E9 0A     SBC #$0A                          
078D: 8D 81 E8  STA CRTREG01                       ;CRTC; $E881 Controller Data
0790: 60        RTS                               
;
