; PET/CBM Editor ROM Project - Auto-Run Dispatch
; ==========================   EDITAUTORUN.ASM
;
; This module controls auto running tasks after PET has booted. It does this by
; stuffing the keyboard buffer with a SYS command. We need to do this because
; the editrom code runs before basic and zero-page are initialized.
; The SYS command will automatically be erased.

;-------------- Autostart Dispatch
; This should assemble to the $E900,$9000, or $A000 depending on OPTROM setting.
; The SYS points to here. We check options to see what needs to Auto Run.

AUTODISPATCH
		JSR ERASE_SYS
		!IF BANNER > 0   { JSR SHOW_BANNER   }		; Display Custom Banner Message
		!IF WEDGE  > 0   { JSR INSTALL_WEDGE }		; Install DOS Wedge
		!IF EXECUDESK =2 { JSR EDESKMENU }		; Run Execudesk Menu
		!IF DISKBOOT > 0 { JSR DOBOOT }			; Do Disk Boot
		RTS

ERASE_SYS
		LDA #<ERASE_TXT			; pointer to erase text string
		LDY #>ERASE_TXT
		JSR STROUTZ			; print it
		RTS

;-------------- Wedge Prep (1st Step)
; We jump to here in the Editor ROM Init code, near the end.
; If BYPASS=1 then we check for a key on ROW0 (which is ROW9 in the keyboard table)

AUTOSTART

!IF BYPASS=1 {
		LDA PIA1_Port_A 		; Keyboard ROW select - PIA#1, Register 0
						; Upper bits: IEEE and Cassette
						; Lower bits: Keyboard ROW select
		AND #$F0			; Mask off lower 4 bits (reset keyboard scan row)
		STA PIA1_Port_A			; Keyboard ROW select - PIA#1, Register 0				CHIP
		LDA PIA1_Port_B			; Keyboard COL result							CHIP
		CMP #$FF			; Are any keys pressed?  (FF=No keys down)
		BEQ AUTO_GO			; No, so do Auto Run

!IF COLOURPET > 0 {
						; For ColourPET we can change the colours to indicate no wedge installed
		LDA #BYPASSFG			; ColourPET Foreground for Wedge Bypass
		STA COLOURFG
		LDA #BYPASSBG 			; ColourPET Background for Wedge Bypass
		STA COLOURBG
		}

		RTS				; Exit without activating wedge sys
}

;-------------- Stuff Keyboard
AUTO_GO
		LDX #9				; Length of string

AUTO_LOOP	LDA AUTO_SYS,X			; Get a key from table
		STA KEYD,X 			; put it in the Keyboard Buffer
		DEX
		BPL AUTO_LOOP			; loop until done

		LDA #9				; Length of string
		STA CharsInBuffer		; Set characters in keyboard buffer
AUTO_DONE	RTS

;-------------- TEXT to stuff into keyboard buffer

AUTO_SYS
		!IF OPTROM=0 {!text "SYS59648"}		; Autostart is located at $E900!
		!IF OPTROM=1 {!text "SYS36864"}		; Autostart is located at $9000!
		!IF OPTROM=2 {!text "SYS40960"}		; Autostart is located at $A000!
		!byte $0D,0				; <CR> and zero pad byte

;-------------- TEXT to erase SYS and READY from screen

ERASE_TXT
		!byte $91			; <UP>
		!text "            "		; erase "SYS" message
		!byte $0D			; <CR>
		!text "            "		; erase "READY" message
		!byte $0D			; <CR>
		!byte $91,$91,$91,$91		; <UP><UP><UP><UP>
		!byte 0

;============================================================================================
; DISK AUTOBOOT
;============================================================================================
; This puts the SHIFT RUN/STOP code into the keyboard buffer and the system
; will take care of the rest!

!IF DISKBOOT >0 {
DOBOOT
		LDA #$83			; SHIFT RUN/STOP
		STA KEYD			; First position of Keyboard Input Buffer
		LDA #1				; One character
		STA $9E				; Set number of characters in keyboard buffer
		RTS
}
