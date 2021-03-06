; PET/CBM EDIT ROM - FUTURE Keyboard Matrix Table
; ================   CBM-II Keyboard - North American (Standard) Layout
; 
; Notes: 00 = Shift , 10 = Repeat, +80 = Unshiftable , FF   = No Key
;        KP = Keypad, S- = Shift , GR- = Graphic Code, NONE = No Key
;        CTRL- = CTRL+key , SHC- = Shift-CTRL+key, A- = Accent
;
; !!! above notes may not apply !!!
;
; This is a placeholder file. It contains RAW data from CBM-II KERNAL Keyboard Tables.
; This must be edited to conform to re-written keyboard scanner routine (future).

;---------- Normal (no modifiers) Table

KEYBOARD_NORMAL

;     C0  C1  C2  C3  C4  C5  C6  C7    COL0   COL1   COL2   COL3   COL4   COL5   COL6   COL7   NOTES 
;     === === === === === === === ===   ====== ====== ====== ====== ====== ====== ====== ====== =====
!BYTE $E0,$1B,$09,$FF,$00,$01	;LINE 0: F1, ESCAPE, TAB, NULL, SHIFT, CONTROL
!BYTE $E1,$31,$51,$41,$5A,$FF	;LINE 1: F2, 1, Q, A, Z, NULL
!BYTE $E2,$32,$57,$53,$58,$43	;LINE 2: F3, 2, W, S, X, C
!BYTE $E3,$33,$45,$44,$46,$56	;LINE 3: F4, 3, E, D, F, V
!BYTE $E4,$34,$52,$54,$47,$42	;LINE 4: F5, 4, R, T, G, B
!BYTE $E5,$35,$36,$59,$48,$4E	;LINE 5: F6, 5, 6, Y, H, N
!BYTE $E6,$37,$55,$4A,$4D,$20	;LINE 6: F7, 7, U, J, M, SPACE
!BYTE $E7,$38,$49,$4B,$2C,$2E	;LINE 7: F8, 8, I, K, "," , .
!BYTE $E8,$39,$4F,$4C,$3B,$2F	;LINE 8: F9, 9, O, L, ;, /
!BYTE $E9,$30,$2D,$50,$5B,$27	;LINE 9: F10, 0, -, P, [, '
!BYTE $11,$3D,$5F,$5D,$0D,$DE	;LINE 10: DOWN CURSOR, =, _, ], RETURN, PI
!BYTE $91,$9D,$1D,$14,$02,$FF	;LINE 11: UP CUR, LT CUR, RT CUR, DEL, CMDR, NULL
!BYTE $13,$3F,$37,$34,$31,$30	;LINE 12: HOME, ?, 7, 4, 1, 0
!BYTE $12,$04,$38,$35,$32,$2E	;LINE 13: RVS ON, CANCEL, 8, 5, 2, DECIMAL POINT
!BYTE $8E,$2A,$39,$36,$33,$30	;LINE 14: GRAPHIC, MULT, 9, 6, 3, 00
!BYTE $03,$2F,$2D,$2B,$0D,$FF	;LINE 15: STOP, DIV, SUBTR, ADD, ENTER, NULL

;---------- KEYBOARD TABLE - SHIFT ONLY & TEXT MODE

SHFTTB

;     C0  C1  C2  C3  C4  C5  C6  C7    COL0   COL1   COL2   COL3   COL4   COL5   COL6   COL7   NOTES 
;     === === === === === === === ===   ====== ====== ====== ====== ====== ====== ====== ====== =====
!BYTE $EA,$1B,$89,$FF,$00,$01	;LINE 0: F11, SHT ESC, TAB TOGGLE, NULL, SHIFT, CTL
!BYTE $EB,$21,$D1,$C1,$DA,$FF	;LINE 1: F12, !, Q, A, Z, NULL
!BYTE $EC,$40,$D7,$D3,$D8,$C3	;LINE 2: F13, @, W, S, X, C
!BYTE $ED,$23,$C5,$C4,$C6,$D6	;LINE 3: F14, #, E, D, F, V
!BYTE $EE,$24,$D2,$D4,$C7,$C2	;LINE 4: F15, $, R, T, G, B
!BYTE $EF,$25,$5E,$D9,$C8,$CE	;LINE 5: F16, %, ^, Y, H, N
!BYTE $F0,$26,$D5,$CA,$CD,$A0	;LINE 6: F17, &, U, J, M, SHIFTED SPACE
!BYTE $F1,$2A,$C9,$CB,$3C,$3E	;LINE 7: F18, *, I, K, <, >
!BYTE $F2,$28,$CF,$CC,$3A,$3F	;LINE 8: F19, (, O, L, :, ?
!BYTE $F3,$29,$2D,$D0,$5B,$22	;LINE 9: F20, ), -, P, [, "
!BYTE $11,$2B,$5C,$5D,$8D,$DE	;LINE 10: DOWN CURSOR, +, POUND SIGN, ], SHT RETURN, PI
!BYTE $91,$9D,$1D,$94,$82,$FF	;LINE 11: UP CURSOR,LEFT CURSOR,RIGHT CURSOR, INS, CMDR, NULL
!BYTE $93,$3F,$37,$34,$31,$30	;LINE 12: CLEAR/HOME, ?, 7, 4, 1, 0
!BYTE $92,$84,$38,$35,$32,$2E	;LINE 13: RVS OFF, SHFT CANCEL, 8, 5, 2, DECIMAL POINT
!BYTE $0E,$2A,$39,$36,$33,$30	;LINE 14: TEXT, MULT, 9, 6, 3, 00
!BYTE $83,$2F,$2D,$2B,$8D,$FF	;LINE 15: RUN, DIV, SUBTR, ADD, ENTER, NULL

;---------- KEYBOARD TABLE - SHIFT ONLY & GRAPHIC MODE

SHFTGR

;     C0  C1  C2  C3  C4  C5  C6  C7    COL0   COL1   COL2   COL3   COL4   COL5   COL6   COL7   NOTES 
;     === === === === === === === ===   ====== ====== ====== ====== ====== ====== ====== ====== =====
!BYTE $EA,$1B,$89,$FF,$00,$01	;LINE 0: F11, SHT ESC, TAB TOGGLE, NULL, SHIFT, CTL
!BYTE $EB,$21,$D1,$C1,$DA,$FF	;LINE 1: F12, !, GR, GR, GR, NULL
!BYTE $EC,$40,$D7,$D3,$D8,$C0	;LINE 2: F13, @, GR, GR, GR, GR
!BYTE $ED,$23,$C5,$C4,$C6,$C3	;LINE 3: F14, #, GR, GR, GR, GR
!BYTE $EE,$24,$D2,$D4,$C7,$C2	;LINE 4: F15, $, GR, GR, GR, GR
!BYTE $EF,$25,$5E,$D9,$C8,$DD	;LINE 5: F16, %, ^, GR, GR, GR
!BYTE $F0,$26,$D5,$CA,$CD,$A0	;LINE 6: F17, &, GR, GR, GR, SHIFTED SPACE
!BYTE $F1,$2A,$C9,$CB,$3C,$3E	;LINE 7: F18, *, GR, GR, <, >
!BYTE $F2,$28,$CF,$D6,$3A,$3F	;LINE 8: F19, (, GR, GR, :, ?
!BYTE $F3,$29,$2D,$D0,$5B,$22	;LINE 9: F20, ), -, GR, [, "
!BYTE $11,$2B,$5C,$5D,$8D,$DE	;LINE 10: DOWN CURSOR, +, POUND, ], SHIFTED RETURN, PI
!BYTE $91,$9D,$1A,$94,$82,$FF	;LINE 11: UP CURSOR,LEFT CURSOR,RIGHT CURSOR, INS, CMDR, NULL
!BYTE $93,$3F,$37,$34,$31,$30	;LINE 12: CLEAR/HOME, ?, 7, 4, 1, 0
!BYTE $92,$04,$38,$35,$32,$2E	;LINE 13: RVS OFF, SHIFT CANCEL, 8, 5, 2, DP
!BYTE $0E,$2A,$39,$36,$33,$30	;LINE 14: TEXT, MULT, 9, 6, 3, 00
!BYTE $83,$2F,$2D,$2B,$8D,$FF	;LINE 15: RUN, DIV, SUBTR, ADD, ENTER, NULL

;---------- KEYBOARD TABLE... CONTROL CHARACTERS, ANY MODE

CTLTBL

;     C0  C1  C2  C3  C4  C5  C6  C7    COL0   COL1   COL2   COL3   COL4   COL5   COL6   COL7   NOTES 
;     === === === === === === === ===   ====== ====== ====== ====== ====== ====== ====== ====== =====
!BYTE $FF,$FF,$FF,$FF,$FF,$FF	;LINE 0: NULL,NULL,NULL,NULL,NULL
!BYTE $FF,$A1,$11,$01,$1A,$FF	;LINE 1: NULL,GR,Q,A,Z,NULL
!BYTE $FF,$A2,$17,$13,$18,$03	;LINE 2: NULL,GR,W,S,X,C
!BYTE $FF,$A3,$05,$04,$06,$16	;LINE 3: NULL,GR,E,D,F,V
!BYTE $FF,$A4,$12,$14,$07,$02	;LINE 4: NULL,GR,R,T,G,B
!BYTE $FF,$A5,$A7,$19,$08,$0E	;LINE 5: NULL,GR,GR,Y,H,N
!BYTE $FF,$BE,$15,$0A,$0D,$FF	;LINE 6: NULL,GR,U,J,M,NULL
!BYTE $FF,$BB,$09,$0B,$CE,$FF	;LINE 7: NULL,GR,I,K,GR,NULL
!BYTE $FF,$BF,$0F,$0C,$DC,$FF	;LINE 8: NULL,GR,O,L,GR,NULL
!BYTE $FF,$AC,$BC,$10,$CC,$A8	;LINE 9: NULL,GR,GR,P,GR,GR
!BYTE $FF,$A9,$DF,$BA,$FF,$A6	;LINE 10: NULL,GR,GR,GR,NULL,GR
!BYTE $FF,$FF,$FF,$FF,$FF,$FF	;LINE 11: NULL,NULL,NULL,NULL,NULL,NULL
!BYTE $FF,$B7,$B4,$B1,$B0,$AD	;LINE 12: NULL,GR,GR,GR,GR,GR
!BYTE $FF,$B8,$B5,$B2,$AE,$BD	;LINE 13: NULL,GR,GR,GR,GR,GR
!BYTE $FF,$B9,$B6,$B3,$DB,$FF	;LINE 14: NULL,GR,GR,GR,GR,NULL
!BYTE $FF,$AF,$AA,$AB,$FF,$FF	;LINE 15: NULL,GR,GR,GR,NULL,NULL
