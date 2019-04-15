; PET/CBM EDIT ROM - CRTC Register Table Selection for Software Selectable 40-column mode
; ================
; Included when 'SS40=1'
; REFRESH is the selected screen configuration

!if REFRESH =  0 { !source "crtc-ss40-50hz.asm" }
!if REFRESH =  1 { !source "crtc-ss40-60hz.asm" }
!if REFRESH =  2 { !source "crtc-ss40-pal.asm" }
!if REFRESH =  3 { !source "crtc-ss40-ntsc.asm" }
;							 TODO - create options 4 to 6
!if REFRESH =  7 { !source "crtc-ss40-50hz.asm" }	;TODO - Create proper 8296D file
!if REFRESH =  8 { !source "crtc-ss40-60hz.asm" }	;TODO - Create proper 8296D file
!if REFRESH = 99 { !source "crtc-ss40-custom.asm" }	;User must edit this file!