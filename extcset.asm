; PET/CBM EDIT ROM - Extended Character Set selection patch
; ================


SELECT_CHAR_SET
		CMP #1
		BNE Be557
Be552		JSR CRT_SET_TEXT_NEW
		BMI Be5a7
Be557		CMP #2
		BEQ Be552
		BNE Be59b

;**************

ProcControl_B
		CMP #1
		BNE Be567
		JSR CLEAR_KEYFLAGS_210
		JMP IRQ_EPILOG

Be567		CMP #2 				; <$82> - Switch to old (PET) char set
		BNE ProcControl_C
		JSR CRT_SET_TEXT_OLD
		BMI Be5a7
