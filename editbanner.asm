; PET/CBM Editor ROM Project - Display Custom Banner
; ==========================   EDITBANNER.ASM
;
; You can display a custom banner message when the machine is turned on. This could be a simple
; welcome message, or a completely new message. By including CLS, HOME or CURSOR characters you
; can overwrite the PET's normal power-up banner with anything you like.
;
; NOTES:
; - The default banner "*** COMMODORE BASIC 4.0 ***"  (27 characters wide) is located in the
;   BASIC ROM so we cannot change it, but we can clear or overwrite it.
; - Be sure to use proper cursor controls so that the "READY" prompt is positioned correctly!
; - If you clear the screen you will lose the "xxxxx BYTES FREE" message.
; - For ColourPET, if you set the initial FG and BG colours to be the same then the PET banner
;   will be invisible. Be sure to set the colour before printing your custom message.

;-------------- Display the Banner

SHOW_BANNER
		lda #<BANNER_TXT		; pointer to BANNER text string
		ldy #>BANNER_TXT
		jsr STROUTZ			; print it
		rts

;-------------- Include the Banner text

BANNER_TXT
!SOURCE "banner.asm"
