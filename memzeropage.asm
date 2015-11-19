; PET/CBM EDIT ROM - Standard Zero Page locations/variables/storage
; ================
; Descriptions are from Butterfield's memory maps from Transactor

;		--------------- Common Usage (All Codebases)
Basic_USR 	= $00		; USR Jump
USRADD 		= $01		; USR Jump
CHARAC 		= $03		; Search Character
ENDCHR 		= $04		; Scan between Quotes Flag
COUNT 		= $05		; Input buffer pointer. # of subscripts
DIMFLG 		= $06		; Default DIM flag
VALTYP 		= $07		; Type: FF=string, 00=numeric
INTFLG 		= $08		; Type: 80=integer, 00=floating point
GARBFL 		= $09		; Flag: DATA scan; List quote; memory
SUBFLG 		= $0a		; Flag: Subscript; FNX flag
INPFLG 		= $0b		; 0=input; $40=GET; $98=READ
TANSGN 		= $0c		; ATN sign/Comparison Evaluation Flag
DS_1 		= $0d		; Disk Status DS$ descriptor
DS_2 		= $0e		; Disk Status DS$ descriptor
DS_3 		= $0f		; Disk Status DS$ descriptor
IOPMPT 		= $10		; Current i/o device for prompt suppress
LINNUM 		= $11		; Integer value (for SYS, GOTO etc)
TEMPPT 		= $13		; Pointers for descriptor stack
LASTPT 		= $14	 	
TEMPST 		= $16		; Descriptor stack (temp strings)
INDEXA 		= $1f		; Utility pointer area
INDEXB 		= $21
FAC3EX 		= $23		; Product area for multiplication
FAC3M1 		= $24		
FAC3M2 		= $25
FAC3M3 		= $26
FAC3M4 		= $27
TXTTAB 		= $28		; Pointer: Start of BASIC
VARTAB 		= $2a		; Pointer: Start of Variables
ARYTAB 		= $2c		; Pointer: Start of Arrays
STREND 		= $2e		; Pointer: End of Arrays
FRETOP 		= $30		; Pointer: String Storage (moving down)
FRESPC 		= $32		; Pointer: Utility string
MEMSIZ 		= $34		; Pointer: Limit of Memory
CURLIN 		= $36		; Current BASIC line number
OLDLIN 		= $38		; Previous BASIC line number
OLDTXT 		= $3a		; Pointer: BASIC statement for CONT
DATLIN 		= $3c		; Current DATA line number
DATPTR 		= $3e		; Current DATA address
INPPTR 		= $40		; Input Vector
VARNAM 		= $42		; Current variable name
VARPTR 		= $44		; Current variable address
FORPNT 		= $46		; Variable pointer for FOR/NEXT
YSAVE 		= $48		; Y-Save; op-save; BASIC pointer save
ACCSYM 		= $4a		; Comparison symbol accumulator
FUNCPT 		= $4b		; Misc work area/pointers
DESCPT 		= $4d
GARBSS 		= $50
JUMPER 		= $51		; Jump vector for functions
FUNJMP 		= $52		
FACTPA 		= $54		; Misc numeric work area
TMPPTA 		= $55
TMPPTB 		= $57
FACTPB 		= $59
TMPVA2 		= $5a
TMPPTC 		= $5c
FAC1EX 		= $5e		; Accum#1: Exponent
FAC1M1 		= $5f		; Accum#1: Mantissa
FAC1M2 		= $60
FAC1M3 		= $61
FAC1M4 		= $62
FAC1SI 		= $63		; Accum#1: Sign
SGNFLG 		= $64		; Series evaluation constant pointer
BITS 		= $65		; Accum#1: hi-order (overflow)
FAC2EX 		= $66	
FAC2M1 		= $67
FAC2M2 		= $68
FAC2M3 		= $69
FAC2M4 		= $6a
FAC2SI 		= $6b
STRPTR		= $6c
FAC1M5 		= $6d
TMPPTD 		= $6e
CHRGET 		= $70
CHRGETX		= $73		; UNUSED
CHRGOT 		= $76
TXTPTR 		= $77
ISNUM 		= $7d
RNDX 		= $88
JIFFY_CLOCK 	= $8d
CINV 		= $90
CBINV 		= $92
NMINV 		= $94
STATUS		= $96
KEYPRESSED	= $97		; Which KEY down - $FF = no key
KEYFLAGS	= $98		; SHIFT KEY - $01 = Pressed
JIFFY_CORR	= $99		; Correction for JIFFY clock
STKEY		= $9b		; Keyswitch PIA - Stop and Reverse Flag
SVXT		= $9c		; Timing Constant for TAPE
VERCK		= $9d		; Tape mode: 0=Load, 1=Verify
CharsInBuffer 	= $9e		; Number of characters in keyboard buffer
ReverseFlag 	= $9f		; Screen Reverse Flag
C3PO 		= $a0		; IEEE Output - $FF=character pending
LastInputCol	= $a1		; End of Line for input pointer
InputRow 	= $a3		; Cursor Log: Row
InputCol 	= $a4		; Cursor Log: Column
BSOUR 		= $a5		; IEEE output buffer
Key_Image	= $a6		; Key Image
Blink		= $a7		; Cursor Flag: 0=Flash Cursor
BLNCT		= $a8		; Cursor Timing Countdown
CursorChar	= $a9		; Character Under Cursor
BlinkPhase	= $aa		; Cursor in Blink phase
SYNO		= $ab		; EOT (End of Tape) received from Tape
CRSW		= $ac		; Input from Screen or Keyboard
TEMPX		= $ad		; Save X
LDTND		= $ae		; How many open files?
DFLTN		= $af		; Input Device - Normally 0
DFLTO		= $b0		; Output CMD Device - Normally 3
PRTY		= $b1		; TAPE character parity
DPSW		= $b2		; Byte Received FLAG
SAVELA		= $b3		; Logical Address temporary save
TIMCMD		= $b4		; Tape buffer character / MLM command
MONCNT		= $b5		; Filename pointer / MLM Flag, counter
TMPZB7		= $b7
TMPZB9		= $b9
TMPZBA		= $ba
BUFPNT		= $bb
INBIT		= $bd
BITCI		= $be
RINONE		= $bf
PTR1		= $c0
PTR2		= $c1
RIDATA		= $c2
RIPRTY		= $c3
ScrPtr		= $c4		; Pointer to character screen line
CursorCol	= $c6		; Position of cursor on above line
SAL		= $c7		; Utility Pointer - Tape or Scrolling
EAL		= $c9		; Tape end address / End of current program
CMP0		= $cb		; Tape Timing Constants (ColourPET pointer to colour line)
BLNSW		= $cc		; Tape Timing Constants (ColourPET pointer to colour line)
QuoteMode	= $cd		; 0=Direct Cursor, else programmed
BITTS		= $ce		; Tape read timer 1 enabled
EOT		= $cf		; EOT recieved from TAPE
READERR		= $d0		; Read Character error
FNLEN		= $d1		; Number of characters in filename
LA		= $d2		; Current file Logical Address
SA		= $d3		; Current file Secondary Address
FA		= $d4		; Current file Device number
RigMargin	= $d5		; Window RIGHT margin
TAPE1		= $d6		; Pointer: Start of Tape Buffer
CursorRow	= $d8		; Line where cursor lives
DATAX		= $d9		; Last Key / Checksum / Misc
FNADR		= $da		; Filename pointer
INSRT		= $dc		; Number of inserts outstanding
ROPRTY		= $dd		; Write shift word / read character in
FSBLK		= $de		; Tape blocks remaining to write
MYCH		= $df		; Serial word buffer

!IF CODEBASE=0 {
;		---------------- 40-Column Only Usage (Codebase 0)
LineLinkTable   = $e0		; 40-Col Line Link Table (to $F8)

} ELSE {
;		---------------- 80-Column Only Usage (Codebase 1 or 2)
TopMargin	= $e0		; Window TOP line
BotMargin	= $e1		; Window BOTTOM line
LefMargin	= $e2		; Womdpw LEFT margin
XMAX		= $e3		; Maximum characters in input buffer
RPTFLG		= $e4		; Key REPEAT flag
KOUNT		= $e5		; Repeat countdown
DELAY		= $e6		; New key marker
CHIME		= $e7		; Chime Time
HOMECT		= $e8		; Home count
SCRIV		= $e9		; Screen Input Vector  (E9/EA)
SCROV		= $eb		; Screen Output Vector (EB/EC)
; $ED-F7 			; UNUSED
}

!IF ESCCODES = 1 {
;		---------------- These are Customized Locations
SCNWIDTH	= $f0		; Screen Mode (40 or 80)
LASTCHAR	= $f1		; Last Key Pressed
BELLMODE	= $f2		; 0=Disable, 1=Enable BELL/CHIME
EUROFLAG        = $f3		; 0=ASCII, 1=DIN
}

;		---------------- Common Usage
JIFFY6DIV5	= $f8
CAS1		= $f9		; Cassette #1 status
CAS2		= $fa		; Cassette #2 status
STAL		= $fb		; Tape start address/ MLM
MEMUSS		= $fd		; MLM / DOS pointer / Misc
