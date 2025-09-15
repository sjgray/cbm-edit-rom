; PET/CBM Editor ROM Project - Standard Chip Registers and Screen Ram
; ==========================   MEMCHIPS.ASM

;--------------------------- Screen RAM $8000-$8FFF

SCREEN_RAM = $8000					; 40 Col = $8000-83FF, 80 Col = $8000-87FF

!IF COLUMNS = 80 { KBD_MATRIX = $87d0 }			; Used with Extended DIN ROM keyboard scanning routine
!IF COLUMNS = 40 { KBD_MATRIX = $83e8 }			; First unused byte in SCREEN_RAM


;--------------------------- PIA #1 - 6520 Chip

PIA1_Port_A = $e810					; Keyboard ROW select
PIA1_Cont_A = $e811
PIA1_Port_B = $e812					; Keyboard COLUMN read
PIA1_Cont_B = $e813

;--------------------------- PIA #2 - 6520 Chip

PIA2_Port_A = $e820
PIA2_Cont_A = $e821
PIA2_Port_B = $e822
PIA2_Cont_B = $e823

;--------------------------- VIA - 6522 Chip

VIA_Port_B = $e840					; IEEE, Screen Retrace, Cassette motor
VIA_Port_A = $e841					; Parallel Port (User Port) with handshaking
VIA_DDR_B = $e842					; Data Direction Register for PORT B
VIA_DDR_A = $e843					; Data Direction Register for PORT A
VIA_Timer_1_Lo = $e844				; Timer 1
VIA_Timer_1_Hi = $e845
VIA_Timer_1_Latch_Lo = $e846			; Timer 1 Latch
VIA_Timer_1_Latch_Hi = $e847
VIA_Timer_2_Lo = $e848				; Timer 2
VIA_Timer_2_Hi = $e849
VIA_Shift = $e84a					; Shift Register
VIA_ACR = $e84b						; Shift Register Control
VIA_PCR = $e84c
VIA_IFR = $e84d
VIA_IER = $e84e
VIA_Port_A_no_HS = $e84f				; Parallel Port, no handshaking

;--------------------------- CTRC - 6545 CRT Controller

CRT_Address = $e880					; Register Select Port
CRT_Status = $e881					; Register DATA port
