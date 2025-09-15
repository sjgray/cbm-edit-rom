; PET/CBM Editor ROM Project - CRTC Register Table Selection
; ==========================   CRTC-TABLES.ASM
;
; Sets the CRTC Table depending on options
; COLUMNS ---- 40 or 80 column hardware (with special cases 90 and 32)
; SOFT40 ----- Software Defined 40-column modes
;
;=====================================================================================

!IF COLUMNS=40 {
	!IF SOFT40=0 { !SOURCE "crtc-reg-normal.asm" }
	!IF SOFT40=1 { !SOURCE "crtc-reg-soft40.asm" }
} ELSE {
	!SOURCE "crtc-reg-normal.asm"
}