; --------- BASIC 4 ROM ROUTINES

SCROUT	= $e202	; output A to screen
RDOA	= $d754	; read hex address -> $FB,$FC
RDOB	= $d763	; read hex byte -> A
CLRSCR	= $e015	; clear screen
CRLF	= $d534	; move cursor to next line
FPOUT	= $cf8d	; write floating point
INTOUT	= $cf83	; write integer 0-65535 X=LSB,A=MSB
SCROLD	= $e021	; scroll down
SCROLU	= $e024	; scroll up
SPAC2	= $d52e	; write 2 spaces
SPACE	= $d531	; write space
STROUT	= $bb24	; X=len, STRADR=ptr
; STROUTZ	= $bb1d	; A=LSB, Y=MSB
; BASIC4 STROUTZ is broken!
WROA	= $d717	; write hex address
HEXOUT	= $d722	; write A as hex
WROB	= $d731	; write hex byte
WRTWO	= $d731	; write XA to screen

ADRFP	= $cd7f	; uint LSB=$5f, MSB=$60 -> FAC1
ASCII	= $d73a	; hex digit -> ascii hex digit
FPINT	= $cdd1	; FAC1 -> uint $61=MSB, $62=LSB
FPSTR	= $cf93	; fp -> str $0100..NUL
HEXIT	= $d78d	; hex ascii digit A -> hex digit A
INTFP	= $c4bc	; int Y=LSB, A=MSB -> FAC1
STRFP	= $c8eb	; string -> fp
RDINT	= $b8f6	; read basic text -> LINNUM

ABS	= $cd8e	; FAC1 = ABS(FAC1)
ADD	= $c9a0	; FAC1 = FAC1 + FAC2
ATN	= $d32C	; FAC1 = ATN(FAC1)
COS	= $d282	; FAC1 = COS(FAC1)
DIV	= $cc48	; FAC1 = FAC2 / FAC1
EXP	= $d184	; FAC1 = EXP(FAC1)
FAC12	= $cd45	; FAC2 := FAC1

READY	= $b3ff	; basic warm start
NEWSTT	= $b74a	; set up next statement for execution
MOVBLK	= $b357	; move block

LINKPRG	= $b4b6	; rechain lines
RSTXCLR	= $b5e9	; reset TXTPTR and perform CLR
STXTPT	= $b622	; reset TXTPTR
CLR	= $b5f0	; perform CLR
SCRTCH	= $b5d4	; perform NEW

MAINS	= $b40f	; MAIN's return addr on stack for CHRGET routine
