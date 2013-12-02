; PET/CBM EDIT ROM - AUTOBOOT - Code from Autoboot edit rom
; ================
; Simple disassembly. Needs to be analyed.

; Appears to be made by a company called "Cyberia, Inc" 2330 Lincoln Way, IOWA
;
; This ROM stuffs a "SYS59279<CR>" ($E78F) into the keyboard buffer which causes it to
; run additional code that loads the "*" file from device 8 then runs it.
; Currently it is not clear to me, why it was done this way.
; Why not stuff "<SHIFT/RUN>" ($83) into the buffer?
;
;---------------- Editor Jump Table
$E000: 4C EF E1  JMP  L_E1EF	;modified to point to new routine

;---------------- TEXT to stuff into KEYBOARD BUFFER
;
$E039:           .BYT 53,59,53,35,39,32,37,39 ;string "SYS59279"
$E041:           .BYT 0D ;string "SYS59279"

;--------------- Autoboot - stuff keyboard buffer using table at $E039 (9 bytes)
L_E1EF:
$E1EF: 20 4B E0  JSR  L_E04B			;Do Normal Init
$E1F2: A2 09     LDX #$09
L_E1F4:
$E1F4: BD 39 E0  LDA $E039,X
$E1F7: 9D 6F 02  STA KEYBUF,X 			;Keyboard Input Buffer
$E1FA: CA        DEX
$E1FB: 10 F7     BPL L_E1F4
$E1FD: A9 09     LDA #$09
$E1FF: 85 9E     STA $9E
$E201: 60        RTS
;--------------- end of autoboot mod

;---------------- This is the code that is executed for AUTOBOOT
;
L_E78F:
$E78F: A5 8E     LDA $8E        		;jiffy clock (second byte)
$E791: F0 FC     BEQ L_E78F     		; delay loop
$E793: A9 33     LDA #$33       		;$B433 - this address contains $2A "*"
$E795: 85 DA     STA $DA 				;filename pointer
$E797: A9 B4     LDA #$B4
$E799: 85 DB     STA $DB 				;filename pointer
$E79B: A9 01     LDA #$01       		; length=1
$E79D: 85 D1     STA $D1 				;#characters in filename
$E79F: A9 00     LDA #$00
$E7A1: 85 78     STA $78 				;basic pointer
$E7A3: A9 08     LDA #$08       		; device 8	
$E7A5: 85 D4     STA $D4				;current file device#
$E7A7: A9 01     LDA #$01
$E7A9: 85 54     STA $54				;misc work area

;--------------- start of loop
L_E7AB:
$E7AB: A9 00     LDA #$00
$E7AD: 85 9D     STA $9D				;work area
$E7AF: 85 96     STA $<STATUS			;IO status
$E7B1: A9 60     LDA #$60	
$E7B3: 85 D3     STA $D3				;current file secondary address
$E7B5: 20 A5 F4  JSR  $F4A5			;open close parameters
$E7B8: 20 D2 F0  JSR  $F0D2			;send talk/listen
$E7BB: A5 D3     LDA $D3				;current file secondary address
$E7BD: 20 43 F1  JSR  $F143			;send byte and clear ATN
$E7C0: 20 C0 F1  JSR  $F1C0     		;input byte from IEEE
$E7C3: 85 FB     STA $FB        		;temp pointer
$E7C5: A5 96     LDA $<STATUS 			;IO status
$E7C7: F0 1C     BEQ L_E7E5			;skip ahead
$E7C9: C6 54     DEC $54				;misc work area
$E7CB: 10 03     BPL L_E7D0			;skip ahead
$E7CD: 4C FF B3  JMP  $B3FF 			;warm start wait for basic command

L_E7D0:
$E7D0: 20 D5 F0  JSR  $F0D5     		;send talk/listen
$E7D3: A9 6F     LDA #$6F
$E7D5: 85 D3     STA $D3				;Current file secondary address
$E7D7: 20 43 F1  JSR  $F143			;write timeout/device not present
$E7DA: A9 49     LDA #$49
$E7DC: 20 9E F1  JSR  $F19E			;input byte IEEE
$E7DF: 20 B9 F1  JSR  $F1B9			;input byte IEEE
$E7E2: 4C AB E7  JMP  L_E7AB			;loop back
L_E7E5:
$E7E5: 20 87 F3  JSR  $F387			;Perform LOAD
$E7E8: A5 78     LDA $78				;inside CHRGET
$E7EA: D0 0B     BNE L_E7F7			;skip ahead
$E7EC: A5 C9     LDA $C9				;get end of program
$E7EE: 85 2A     STA $2A				;copy to start of variables
$E7F0: A5 CA     LDA $CA				;get end of program
$E7F2: 85 2B     STA $2B				;copy to start of variables
$E7F4: 20 E9 B5  JSR  $B5E9			;perform CLR
L_E7F7:
$E7F7: 20 22 B6  JSR  $B622			;Reset BASIC execution to start
$E7FA: 20 0B B6  JSR  $B60B			;Perform CLR
$E7FD: 4C 4A B7  JMP  $B74A			;
