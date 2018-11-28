; PET/CBM EDIT ROM - Extended Character Set selection patch
; ================

;*********************************************************************************************************
;** Select Character Set [E54E]
;*********************************************************************************************************

SELECT_CHAR_SET	CMP #1				; <$81> - Switch to new character set
		BNE Be557
Be552		JSR CRT_SET_TEXT_NEW
		BMI Be5a7

Be557		CMP #2
		BEQ Be552
		BNE Be59b

;*********************************************************************************************************
;** Process Control B [E55D]
;*********************************************************************************************************

ProcControl_B	CMP #1
		BNE PCB1
		JSR CLEAR_KEYFLAGS_210
		JMP IRQ_EPILOG

PCB1		CMP #2 				; <$82> - Switch to old (PET) char set
		BNE ProcControl_C
		JSR CRT_SET_TEXT_OLD
		BMI Be5a7
