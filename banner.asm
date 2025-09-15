; PET/CBM Editor ROM Project - Custom Banner (Power-on) Messages
; ==========================   BANNER.ASM
;
; You can display a custom banner message when the machine is turned on. This could be a simple
; welcome message, or a completely new message. By including CLS, HOME or CURSOR characters you
; can overwrite the PET's normal power-up banner with anything you like.
;
; NOTES:
; - The default banner "*** COMMODORE BASIC 4.0 ***"  (27 characters wide) is located in the
;   BASIC ROM so we cannot change it, but we can clear or overwrite it.
; - Be sure to use proper cursoring so that the "READY" prompt is positioned correctly!
; - If you clear the screen you will lose the "xxxxx BYTES FREE" message.
; - For ColourPET, if you set the initial FG and BG colours to be the same then the PET banner
;   will be invisible. Be sure to set the colour before printing your custom message.
;
; Currently the following are available:
;
; ##  MODEL  MODE   TYPE MESSAGE / DESCRIPTION                   40                                      80
; --  -----  ----   ---- "---------!---------!---------!---------!---------!---------!---------!---------!"
;  1  CPET   GRAPH  OVER "COMMODORE COLOURPET"
;  2  CPET   TEXT   OVER "ColourPET BASIC4 + Wedge"
;  3  80COL  TEXT   OVER "Commodore EDITROM Project - Wedge/ESC/SS40"
;  4  ANY    GRAPH  OVER "CBM BASIC 4 WITH WEDGE"
;  5  CPET   GRAPH  FULL C65-like screen with colour bars
;  6  80COL  ANY    OVER "*** commodore basic 4.0 with wedge/esc/ss40"
;  7  80COL  ANY    OVER "*** commodore basic 4.0 with wedge,esc,reboot,40/80 switcher"
;  8  8296   ANY    OVER "*** commodore 8296 basic 4.0 with wedge,esc,reboot,80x35 screen"
;  9  8296   ANY    OVER "*** commodore 8296 basic 4.0 with wedge,esc,reboot,extended screen"
; 10  80COL  ANY    OVER "*** commodore basic 4.0 with wedge,esc,reboot,ss40, execudesk"
; 11  80COL  ANY    OVER "*** commodore basic 4.0 with enhanced editor and wedge"
; 12  40COL  ANY    OVER "*** cbm basic 4 plus editor+wedge ***"
; 13  8296D  ANY    OVER "*** commodore 8296 basic 4.0 with wedge,reboot, backarrow ***"
; 14  8296D  ANY    OVER "*** commodore 8296 basic 4.0 with custom editor rom ***"
; 15  8296D  ANY    OVER "*** commodore 8296d basic 4.0 with custom editor rom ***"
; 16  80COL  ANY    OVER "*** commodore basic 4.0 with custom editor rom ***"
; 17  40COL  ANY    OVER "*** cbm basic 4 custom editrom ***"
; 18  40COL  ANY    OVER "*** commodore basic 4.0 *** hard40/80,n"
; 19  40COL  ANY    OVER "*** commodore basic 4.0 *** disk boot"
; 20  40COL  ANY    OVER "*** commodore basic 4.0 *** sjg-edit"
; 21  80COL  ANY    OVER "*** commodore basic 4.0 *** + wedge/esc/backarrow/ss40"
; 22  80COL  ANY    OVER "*** commodore basic 4.0 *** + wedge,esc,backarrow,hs40/80"
; 65  40COL  CPET   OVER For Mega65 MegaPET
; 98  ANY    ANY    ADD  Show DATE and COMMENT for debug purposes
; 99  CUSTOM ...    ...  Your own banner text
;
; TYPE: FULL = Replaces all, OVER = Overwrites part, ADD = Adds additional text
;
;-----------------------------------------------
; CUSTOM BANNER
;-----------------------------------------------
!IF BANNER=99 {
		!byte $13
;Screen columns:      44444444444444444444444444v44444444444448888888888888888888888888888888888888888
		!pet "*** commodore basic 4.0 *** hard40/80,n",$0D
		!pet "waltermixx edition!"
		!byte $0D      			; <CR><CR><CR>
}

;-----------------------------------------------
; DEBUG BANNER
;-----------------------------------------------

!IF BANNER=98 {	!pet "date: "
		+DATE
		!byte $0D
		!pet "comment: "
		+COMMENT
		!byte $0D
}

;-----------------------------------------------
; Mega65 MegaPET 40 column C65-like startup screen with colour bars
; TIP: Set foreground and background colour to <BLUE> to hide initial banner message
;-----------------------------------------------
!IF BANNER=65 {
		!byte $5,$1F,$93,142		; <WHT><BLUE><CLS><GRAPHICS>

		!byte 28,18			; <RED><RVS>
		!pet "              "
		!byte $92,$E9,5			; <OFF><DIAG-BLOCK><WHT>
		!pet "    the mega65 megapet"

		!byte 13,129,18			; <CR><MAGENTA><RVS>
		!pet "           "
		!byte $92,$E9,13		; <OFF><DIAG-BLOCK><WHT>

		!byte 158,18			; <YELLOW><RVS>
		!pet "        "
		!byte $92,$E9,5			; <OFF><DIAG-BLOCK><WHT>
		!pet "     colourpet by steve gray"

		!byte 13,30,18			; <CR><GREEN><RVS>
		!pet "     "
		!byte $92,$E9,5			; <OFF><DIAG-BLOCK><WHT>
		!pet "        megapet core by rhialto"
		!byte 13			; <CR>

		;-- line 2
		!byte 154,18			; <LT BLUE><RVS>
		!pet "   "			; bar
		!byte $92,$E9,13		; <OFF><diag block><CR>

		;-- line 3
		!byte 156,18			; <PUR><RVS>
		!pet " "                    	; bar
		!byte $92,$E9,$5		; <OFF><diag block><WHT>
		!pet "      cbm basic 4  31743 bytes free"
		!byte 13

		;-- line 5,6
		!byte 13
		!IF KEYBOARD= 0 { !pet "n" }		; QWERTY layout
		!IF KEYBOARD= 1 { !pet "b" }		; QWERTY layout
		!IF KEYBOARD= 2 { !pet "din" }		; German layout
		!IF KEYBOARD= 3 { !pet "c64" }		; C64 or VIC layout
		!IF KEYBOARD= 4 { !pet "b-sjg" }	; Modified layout - cursor keys, esc etc
		!IF KEYBOARD= 5 { !pet "n-sjg" }	; Modified layout - @ replaced with ESC, backarrow becomes @
		!IF KEYBOARD= 6 { !pet "b-qwertz" }	; QWERTZ layout
		!IF KEYBOARD= 7 { !pet "b-azerty" }	; AZERTY layout
		!IF KEYBOARD= 8 { !pet "cbm-ii" }	; CBM-II keyboard (requires hardware mod)
		!IF KEYBOARD= 9 { !pet "n-sjg2" }	; Modified layout - backarrow replaced with ESC
		!IF KEYBOARD=11 { !pet "ted" }		; TED Series (C16,C116,Plus/4 etc)

		!pet " keyboard"
		!IF WEDGE > 0 { !PET " and wedge" }
		!byte $0D
}

!IF BANNER=22 {	!byte $13
		!pet "*** commodore basic 4.0 *** + wedge,esc,backarrow,hs40/80"
		!byte $0D,$0D,$0D      		; <CR><CR><CR>
}

!IF BANNER=21 {	!byte $13
		!pet "*** commodore basic 4.0 *** + wedge/esc/backarrow/ss40"
		!byte $0D,$0D,$0D      		; <CR><CR><CR>
}


!IF BANNER=20 {	!byte $13
		!pet "*** commodore basic 4.0 *** sjg-edit"
		!byte $0D,$0D,$0D      		; <CR><CR><CR>
}

!IF BANNER=19 {	!byte $13
		!pet "*** commodore basic 4.0 *** disk boot"
		!byte $0D,$0D,$0D      		; <CR><CR><CR>
}

!IF BANNER=18 {	!byte $13
		!pet "*** commodore basic 4.0 *** hard40/80,n"
		!byte $0D,$0D,$0D      		; <CR><CR><CR>
}

!IF BANNER=17 { !byte $13            		; <HOME>
         	!pet "*** cbm basic 4 with custom editrom ***"
         	!byte $0D,$0D,$0D      		; <CR><CR><CR>
}

!IF BANNER=16 { !byte $13            		; <HOME>
         	!pet "*** commodore basic 4.0 with custom editor rom ***"
         	!byte $0D,$0D,$0D      		; <CR><CR><CR>
}

!IF BANNER=15 { !byte $13            		; <HOME>
         	!pet "*** commodore 8296d basic 4.0 with custom editor rom ***"
         	!byte $0D,$0D,$0D      		; <CR><CR><CR>
}

!IF BANNER=14 { !byte $13            		; <HOME>
         	!pet "*** commodore 8296 basic 4.0 with custom editor rom ***"
         	!byte $0D,$0D,$0D      		; <CR><CR><CR>
}

!IF BANNER=13 { !byte $13            		; <HOME>
         	!pet "*** commodore 8296d basic 4.0 with wedge,reboot,din ***"
         	!byte $0D,$0D,$0D      		; <CR><CR><CR>
}

!IF BANNER=12 {	!byte $13            		; <HOME>
         	!pet "*** cbm basic 4 plus editor+wedge ***"
         	!byte $0D,$0D,$0D      		; <CR><CR><CR>
}

!IF BANNER=11 {	!byte $13            		; <HOME>
         	!pet "*** commodore basic 4.0 with enhanced editor and wedge ***"
         	!byte $0D,$0D,$0D      		; <CR><CR><CR>
}

!IF BANNER=10 {	!byte $13            		; <HOME>
         	!pet "*** commodore basic 4.0 with wedge,esc,reboot,ss40, execudesk ***"
         	!byte $0D,$0D,$0D      		; <CR><CR><CR>
}

!IF BANNER=9 {	!byte $13            		; <HOME>
         	!pet "*** commodore 8296 basic 4.0 with wedge,esc,reboot,extended screen ***"
         	!byte $0D,$0D,$0D      		; <CR><CR><CR>
}

!IF BANNER=8 {	!byte $13            		; <HOME>
         	!pet "*** commodore 8296 basic 4.0 with wedge,esc,reboot,80x35 screen ***"
         	!byte $0D,$0D,$0D      		; <CR><CR><CR>
}

!IF BANNER=7 {	!byte $13            		; <HOME>
         	!pet "*** commodore basic 4.0 with wedge,esc,reboot,40/80 switcher ***"
         	!byte $0D,$0D,$0D      		; <CR><CR><CR>
}

!IF BANNER=6 {	!byte $13            		; <HOME>
         	!pet "*** commodore basic 4.0 with wedge/esc/ss40 ***"
         	!byte $0D,$0D,$0D      		; <CR><CR><CR>
}

;-----------------------------------------------
; Custom ColourPET-40 C65-like startup screen with colour bars
; TIP: Set foreground and background colour to <BLUE> to hide initial banner message
;-----------------------------------------------
!IF BANNER=5 {
		!byte $5,$1F,$93,142		; <WHT><BLUE><CLS><GRAPHICS>

		;-- line 1
		!byte $1C,$12			;<RED><RVS>
		!pet "         "		; bar
		!byte $92,$E9,$5		; <OFF><diag block><WHT>

!IF UPET=1 {
		!pet "  the ultra-pet prototype"
} ELSE {
		!pet "  the commodore colourpet"
}

		!byte $0D			; <CR>

		;-- line 2
		!byte $96,$12			; <LT RED><RVS>
		!pet "       "			; bar
		!byte $92,$E9,$0D		; <OFF><diag block><CR>

		;-- line 3
		!byte $9E,$12			; <YEL><RVS>
		!pet "     "                    ; bar
		!byte $92,$E9,$5		; <OFF><diag block><WHT>

!IF UPET=1 {
		!pet "      by andre fachat"
} ELSE {
		!pet "      (c) steve j. gray"
}

		!byte $0D			; <CR>

		;-- line 4
		!byte $99,$12			; <LT GRN><RVS>
		!pet "   "			; bar
		!byte $92,$E9,$5		; <OFF><diag block><WHT>
		!pet "        basic 4.0  31743 bytes free"
		!byte $0D

		;-- line 5,6
		!byte $0D
		!pet "mod keyboard and wedge"
		!byte $0D
}

;-----------------------------------------------
; Custom 4032 - For GRAPHICS MODE startup screen
;-----------------------------------------------

!IF BANNER=4 {	!byte $13            		; <HOME>
         	!pet "*** CBM BASIC 4 WITH WEDGE ***"
         	!byte $0D,$0D,$0D      		; <CR><CR><CR>
}

;-----------------------------------------------
; Custom 8032 - For TEXT MODE startup screen
;-----------------------------------------------

!IF BANNER=3 {	!byte $13            		; <HOME>
         	!pet "*** Commodore EDITROM Project - Wedge/ESC/SS40 ***"
         	!byte $0D,$0D,$0D      		; <CR><CR><CR>
}

;-----------------------------------------------
; Custom ColourPET message courtesy Christian Dirks - For GRAPHICS MODE startup screen
;-----------------------------------------------

!IF BANNER=2 {	!byte $13,$99          		; <HOME><GRN>
         	!pet "*** "
         	!byte $1c            		; <RED>
         	!pet "co"
         	!byte $99            		; <GRN>
         	!pet "lo"
         	!byte $9a            		; <BLU>
         	!pet "ur"
         	!byte $9e            		; <YEL>
         	!pet "pet"
         	!byte $99            		; <GRN>
         	!pet " basic 4.0 + wedge ***"   ; message
         	!byte $0D,$0D,$0D      		; <CR><CR><CR>
}

;-----------------------------------------------
; Custom ColourPET message for TEXT MODE startup screen
;-----------------------------------------------

!IF BANNER=1 {	!byte $93,$5			; <CLS><WHT>
		!pet "*** "
		!byte $9f			; <LTCYN>
		!pet "Commodore "
		!byte $1c			; <RED>
		!pet "Co"
		!byte $99			; <GRN>
		!pet "lo"
		!byte $9a			; <BLU>
		!pet "ur"
		!byte $9e			; <YEL>
		!pet "PET"
		!byte $05			; <WHT>
		!pet " ***"
		!byte 11,11
		!byte $0D			; <cr>
}

;-----------------------------------------------
; Unspecified values
;-----------------------------------------------

		!byte 0,0			; Zeros must end string.
