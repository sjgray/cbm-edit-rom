; PET/CBM Editor ROM Project - Update Screen Pointer
; ==========================   EXTSCREENPTR.ASM
;
; Calculate screen pointer (ScrPtr) for printing to screen, scrolling etc.
; This routine is a replacement for the screen address table and is hardcoded to 80 columns.
; Called from EDITROMEXT.ASM
; TODO: Change to support 40 or 80, or REPLACE with old table!

Update_ScrPtr
		TXA
		LDX #<ScrPtr
Be6dc		PHA
		STA Basic_USR,X
		LDA #>ScrPtr
		STA USRADD,X
		TYA
		PHA
		LDA Basic_USR,X
		LDY #2
		JSR Shift_ZPX_Left_Y 			; Row * 4
		JSR Add_ZPX_AY 				; Row * 5
		LDY #4
		JSR Shift_ZPX_Left_Y 			; Row * 80
		LDY #$80
		JSR Add_ZPX_AY 				; $8000 + Row * 80 + Col
		PLA
		TAY
		PLA
		TAX
		RTS

Shift_ZPX_Left_Y
		ASL Basic_USR,X
		ROL USRADD,X
		DEY
		BNE Shift_ZPX_Left_Y
		RTS

Add_ZPX_AY
		ADC Basic_USR,X
		STA Basic_USR,X
		TYA
		ADC USRADD,X
		STA USRADD,X
		RTS
