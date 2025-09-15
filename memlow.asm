; PET/CBM Editor ROM Project - Standard Low Mem locations/variables/storage
; ==========================   MEMLOW.ASM

;------------------------ Common Usage

STACK 			= $0100	;Processor Stack
BUF 			= $0200	;MLM work area; Input buffer
LAT 			= $0251	;File Logical Address Table
FAT 			= $025b	;File Device Number Table
SAT 			= $0265	;File Secondary Address Table
KEYD 			= $026f	;Keyboard input buffer
TAPEB1 			= $027a	;TAPE#1 input buffer
TAPEB2                  = $033a ;TAPE#2 input buffer (to $03F9)

;------------------------ Shared with TAPE#2 buffer

NextTab 		= $033a	;DOS character pointer
DOS_Drive_1 		= $033b	;DOS drive 1 flag
DOS_Drive_2 		= $033c	;DOS drive 2 flag
DOS_Length 		= $033d	;DOS length/write flag
DOS_Syntax 		= $033e	;DOS syntax flags
DOS_Id 			= $033f	;DOS disk ID
DOS_Command_Length 	= $0341	;DOS command string count
DOS_Filename 		= $0342	;DOS filename buffer
DOS_Command_Buffer 	= $0353	;DOS command string buffer (to $0380)
;			  $0381-03e8 ???

;------------------------ 40-Column Usage

!IF CODEBASE = 0 {
DELAY			= $03e9 ;Repeat Key countdown delay 	(40 col)
KOUNT			= $03ea ;Delay between repeats 		(40 col)
XMAX			= $03eb ;Max keyboard buffer size 	(40 col)
CHIME			= $03ec ;Chime Time 0=off 		(40 col)
JIFFY6DIV5		= $03ed ;TI clock adjust (speed by 6/5) (40 col) Was: TIADJ
RPTFLG			= $03ee ;Repeat Flag                    (40 col)
TAB_SET			= $03ef ;TAB-STOP table			(40 col)
}

;------------------------ Common Usage

TABS_SET 		= $03ee	;80 column TAB stop table ($03ee-03f7) ** Should this be $03ef ???? **
;			  $03f8 ???
; 			  $03f9 ???

;------------------------ End of TAPE#2 bufer

Reset_Vector 		= $03fa	;Monitor extension vector
Reset_Param 		= $03fc	;IEEE timeout defeat; $FF=disable
;			  $03fd ???
;			  $03fe ???
;			  $03ff ???

;------------------------ BASIC Program Area

;			  $0400-7FFF - BASIC program storage
