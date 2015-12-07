; PET/CBM EDIT ROM - Wedge Messages
; ================

; When the wedge is included you can set the WEDGEMSG variable to select which message
; is displayed on the screen. If WEDGEMSG=0 then all it does is erase the "SYS" text
; that was stuffed into the keyboard buffer in order to start the wedge. If WEDGEMSG > 0
; then it will also print a custom message. By including HOME or CURSOR characters you
; can overwrite the PET's normal power-up banner with anything you like.
;
; NOTES:
; - The default banner "*** COMMODORE BASIC 4.0 ***"  (27 characters wide) is located in the
;   BASIC ROM so we cannot change it, but we can clear or overwrite it.
; - Be sure to use proper cursoring so that the "READY" prompt is positioned correctly!
; - If you clear the screen you will lose the "xxxxx BYTES FREE" message.
;
; Currently the following are available:
;
; #  MODEL  MODE   DESCRIPTION
; -  -----  ----   -----------
; 0  ANY    ANY    Erases SYS only so it appears as a standard startup banner
; 1  ANY    GRAPH  Displays "WEDGE ACTIVE" below the normal banner
; 2  CPET   GRAPH  Displays "COMMODORE COLOURPET" in colour on top of banner
; 3  CPET   TEXT   Displays "ColourPET BASIC4 + Wedge" replacing banner
; 4  80COL  TEXT   Displays "Commodore EDITROM Project - Wedge/ESC/SS40" replacing banner
; 5  ANY    GRAPH  Displays "CBM BASIC 4 WITH WEDGE" replacing banner
;
;--------------------------------------------------------------------------------------------------

; Always start with erasing the SYS and READY message

		!byte $91			; <UP>
		!text "            "		; erase "SYS" message
		!byte $0D			; <CR>
		!text "            "		; erase "READY" message
		!byte $0D			; <CR>

; Custom 4032 - For GRAPHICS MODE startup screen
!if WEDGEMSG=5 {				
         	!byte $13            		; <HOME> 
         	!pet "*** CBM BASIC 4 WITH WEDGE ***"
         	!byte $0D,$0D,$0D      		; <CR><CR><CR>
}

; Custom 8032 - For TEXT MODE startup screen
!if WEDGEMSG=4 {				
         	!byte $13            		; <HOME> 
         	!pet "*** Commodore EDITROM Project - Wedge/ESC/SS40 ***"
         	!byte $0D,$0D,$0D      		; <CR><CR><CR>
}

; Custom ColourPET message courtesy Christian Dirk - For GRAPHICS MODE startup screen
!if WEDGEMSG=3 {				
         	!byte $13            		; <HOME> 
         	!byte $99            		; <GRN>
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

; Custom ColourPET message for TEXT MODE startup screen
!if WEDGEMSG=2 {
		!byte $93,$5			; <CLS><WHT>
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
		!byte $5			; <WHT>
		!pet " ***"
		!byte 11,11
		!byte $d			; <cr>
}

; Wedge-only activation message		
!if WEDGEMSG=1 {
		!byte $91,$91,$91		; <UP><UP><UP>
		!text "WEDGE ACTIVE"		; message
		!byte $0D			; <CR>
		!text "            "		; erase "READY"
		!byte $91			; <UP>
}

; No message. Erase the SYS and READY prompts.
!if WEDGEMSG=0 {
		!byte $91,$91,$91,$91		; <UP><UP><UP><UP>
}
