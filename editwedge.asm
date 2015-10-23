; PET/CBM EDIT ROM - Wedge
; ================
;
; Based on Commodore's universal wedge taken from 8050's test/demo disk
; but rewritten and enhanced by Nils Eilers
;
; Adapted for EDIT-ROM and ACME assembler by Steve Gray.
;----------------------------------------------------------------------------------------
; Wedge commands are only available in direct mode. 
;
; #<unit number> 	- sets the default drive. Without unit number shows the current default drive.
; @$[[drive]:filename] 	- displays the disk's directory. SPACE=Pause, any other key to continue. STOP=Abort.
;				@$ displays the entire directory.
;				@$1: displays the directory of default's device drive 1 only. Do not confuse drive and device.
;				@$:N* displays all files having a "N" as the first letter in their filename.
; /filename		- Loads a program.
; ^filename		- Loads and runs a file ("^" is up arrow, NOT "carat")
; @			- Read disk status. Without any parameters reads and displays the disk drive error message channel.
; @<string>		- Sends <string> to the device's command channel. 
;				@C:newfile=existingfile	- Copy a file on the same diskette
;				@I 			- Initialize the disk drive.
;				@N:diskname		- New a disk that was already formatted
;				@N:diskname,id		- Format a diskette, giving it an index at your choice
;				@R:newname=oldname	- Rename a file
;				@S:file1[,file2 ...]	- Scratch file(s). Wild cards allowed. Status channel returns # of files scratched.
;				@UJ			- Reset drive. Status channel will return the DOS version string.
;				@V			- Validate disk
;				@D1=0			- Duplicate disk (dual drive units only). Target drive first, then source.
;------------------------------------------------------------------------------------------------------------------------------------------

!source "membasic4.asm"


;-------------- INSTALL WEDGE
; Make sure 'install_wedge' is assembled to $E900 so SYS can start it properly!

install_wedge
		lda #<resident_wedge		; patch CHRGET JMP address
		sta CHRGET+1 			; to jump into wedge
		lda #>resident_wedge
		sta CHRGET+2
		lda #$4c			; insert JMP command in CHRGET routine
		sta CHRGET

		lda #8				; init default device
		sta CHRGETX			; $73=unused byte in CHRGET

		lda #<WEDGESTRING		; write "wedge active"
		ldy #>WEDGESTRING
		jsr STROUTZ
	
		rts				; exit to BASIC

;-------------- MESSAGE

WEDGESTRING
; Always start with erasing the SYS and READY message

		!byte $91			; <UP>
		!text "            "		; erase "SYS" message
		!byte $0D			; <CR>
		!text "            "		; erase "READY" message
		!byte $0D			; <CR>

; Custom ColourPET message courtesy Christian Dirk - For GRAPHICS MODE startup screen
!if WEDGEMSG=3 {				
         	!byte $13            		; <HOME> 
         	!byte $99            		; <GRN>
         	!pet "*** "
         	!byte $1c            		; <RED>
         	!pet "co"
         	!byte $99            		; <GRN>
         	!pet "lo"
         	!byte $9a            		; <BLU>
         	!pet "ur"
         	!byte $9e            		; <YEL>
         	!pet "pet"
         	!byte $99            		; <GRN>
         	!pet " basic 4.0 + wedge ***"   ; message
         	!byte $0D,$0D,$0D      		; <CR><CR><CR>

}

; Custom ColourPET message for TEXT MODE startup screen
!if WEDGEMSG=2 {
		!byte $93,$5			; <CLS><WHT>
		!pet "*** "
		!byte $9f			; <LTCYN>
		!pet "Commodore "
		!byte $1c			; <RED>
		!pet "Co"
		!byte $99			; <GRN>
		!pet "lo"
		!byte $9a			; <BLU>
		!pet "ur"
		!byte $9e			; <YEL>
		!pet "PET"
		!byte $5			; <WHT>
		!pet " ***"
		!byte 11,11
		!byte $d			; <cr>
}

; Wedge-only activation message		
!if WEDGEMSG=1 {
		!byte $91,$91,$91		; <UP><UP><UP>
		!text "WEDGE ACTIVE"		; message
		!byte $0D			; <CR>
		!text "            "		; erase "READY"
		!byte $91			; <UP>
}

; No message. Erase the SYS and READY prompts.
!if WEDGEMSG=0 {
		!byte $91,$91,$91,$91		; <UP><UP><UP><UP>
}

		!byte 0				; end of text marker
		!byte 0				; extra 0 padding

;-------------- Keyboard Stuffer

WEDGE_PREP	LDX #9				; Length of string

WP_LOOP		LDA WEDGE_SYS,X			; Get a key from table
		STA KEYD,X 			; put it in the Keyboard Buffer
		DEX
		BPL WP_LOOP			; loop until done

		LDA #9				; Length of string
		STA CharsInBuffer		; Set characters in keyboard buffer 
		RTS

;-------------- TEXT to stuff into keyboard buffer

WEDGE_SYS	!text "SYS59648"		; Make sure WEDGE is loaded at $E900!
		!byte $0D


;-------------- Resident part of the universal DOS wedge

resident_wedge
		wedge_unit = CHRGETX		; default device, unused byte in CHRGET
		wedge_char = SAVELA		; $B3 -0 if @># else load/run char / ^

		inc TXTPTR			; increment text pointer 
		bne MAIN2
		inc TXTPTR + 1
MAIN2 

; if MAINS is stacked, CHRGET is called from direct mode. abort if not called from there

		stx wedge_char			; save X
		tsx 
		lda STACK+1,x
		cmp #<MAINS
		bne restabort
		lda STACK+2,x
		cmp #>MAINS
		bne restabort			; abort if textpointer doesn't point to $0200

		lda TXTPTR
		bne abort
		lda TXTPTR + 1
		cmp #2
		bne abort

		ldy #0				; NUL when @>#
		sty wedge_char			; else load/run character /^

testchar	lda (TXTPTR),y
		cmp #32				; skip leading spaces
		bne nospace
		inc TXTPTR
		bne testchar

nospace		cmp #$3e			; '>'
		beq command_or_status
		cmp #$40			; '@'
		beq command_or_status
		cmp #$23			; '#'
		beq default_device
		iny 
		sta wedge_char			; save load/run character
		cmp #$2f			; '/'
		beq to_prepare_fn
		cmp #$5e			; '^'
		beq to_prepare_fn
		bne abort

restabort	ldx wedge_char			; restore X
abort		jmp CHRGOT

;-------------- COMMAND OR STATUS

command_or_status
		iny 
		lda (TXTPTR),y
		beq get_status
		cmp #'$'			; '$'
		beq prepare_fn
		bne send_cmd

;-------------- SET DEVICE

default_device
		inc TXTPTR
		lda (TXTPTR),y			; Y is still 0
		bne set_device			; parameter given -> set device number

		ldx wedge_unit			; show current device number
		tya
		jsr INTOUT
		jsr CRLF
		jmp READY

set_device
		; prerequsites for RDINT: 
		; - TXTPTR $77/$78 point to first char
		; - A contains that first char
		; - Carry is cleared

		clc
		jsr RDINT			; convert string to unsigned int
		lda LINNUM			; LSB of converted number
		sta wedge_unit
		jmp READY
	
;-------------- SEND COMMAND

send_cmd	lda wedge_unit
		sta FA
		lda #$6f			; DATA SA 15
		sta SA
		jsr LISTN			; LISTEN 
		lda SA
		jsr SECND			; send secondary address

SENDCMD2	inc TXTPTR
		ldy #0			
		lda (TXTPTR),y
		beq SENDCMDDONE	
		jsr CIOUT			; send char to IEEE
		clv 
		bvc SENDCMD2			; branch always

SENDCMDDONE	jsr UNLSN
		clc
		bcc get_status

;-------------- Relative Branch forwarder

to_prepare_fn:	beq prepare_fn		

;-------------- GET STATUS

get_status	sty TXTPTR
		lda wedge_unit
		sta FA
		jsr TALK			; TALK
		lda #$6f			; DATA SA 15
		sta SA
		jsr SECND			; send secondary address

GS_NEXTCHAR	jsr ACPTR			; read byte from IEEE bus
		cmp #$0D			; last byte = CR?		
		beq GS_DONE
		jsr SCROUT			; write char to screen
		clv 
		bvc GS_NEXTCHAR			; branch always

GS_DONE		jsr SCROUT			; write char to screen
		jsr UNTLK			; UNTALK
		jmp READY

;----------------------------------------------------------------------------
;###### TODO: if we have quotes in our string, then they should handled here
;----------------------------------------------------------------------------
prepare_fn
		iny				; count filename length
		lda (TXTPTR),y
		bne prepare_fn
		dey 
		sty FNLEN			; store length
		ldx TXTPTR
		inx
		stx FNADR
		lda TXTPTR + 1
		sta FNADR + 1
		lda wedge_unit
		sta FA
		lda wedge_char			; load/run?
		bne to_loadrun			; yes

;-------------- DIRECTORY

		lda #0
		sta STATUS
		lda #$60			; DATA SA 0
		sta SA
		jsr OPENI			; open file
		jsr TALK
		lda SA
		jsr SECND

		ldy #3
list_blocks
		sty FNLEN
		jsr ACPTR
		sta MEMUSS			; store blocks LSB
		ldy STATUS
		bne to_stoplisting
		jsr ACPTR
		sta MEMUSS + 1			; store blocks MSB
		ldy STATUS
		bne to_stoplisting
		ldy FNLEN
		dey 
		bne list_blocks
		ldx MEMUSS
		lda MEMUSS + 1
		jsr INTOUT			; write #blocks to screen
		lda #' '
		bne listing			; branch always

;-------------- Relative Branch forwarder

to_loadrun:	bne loadrun
to_stoplisting:	bne stoplisting
to_list_blocks:	bne list_blocks

;-------------- Continuation of DIRECTORY

listing
		jsr SCROUT
LISTLOOP	jsr ACPTR			; read byte from IEEE
		ldx STATUS
		bne stoplisting
		cmp #0
		beq newline
		jsr SCROUT			; write filename and type
		jsr STOPEQ			; abort listing with STOP key
		beq stoplisting
		jsr GETIN			; pause listing with SPACE key
		beq LISTLOOP			; no key pressed -> continue
		cmp #32				; <space>?
		bne LISTLOOP			; only space pauses listing
listwait	jsr GETIN
		beq listwait			; wait for any key
		bne LISTLOOP			; then continue

newline		lda #$0D			; <CR>
		jsr SCROUT
		ldy #2
		bne to_list_blocks

stoplisting	jsr CLSEI			; close file with $E0, unlisten
		jsr CRLF
		pla 
		pla 
		jmp READY			; BASIC warm start

;-------------- LOAD / RUN

loadrun
		lda #0				; Clear status byte
		sta STATUS
		sta VERCK			; LOAD=0, VERIFY=1
		jsr LOADOP			; LOAD without pointer change

		lda STATUS			; Did it load?
		and #$10
		bne loaderr			; No, exit out

		lda EAL+1			; end of program MSB
		sta VARTAB+1			; start of basic variables MSB
		lda EAL				; end of program LSB
		sta VARTAB			; start of basic variables LSB

		jsr CRLF
		jsr RSTXCLR			; reset TXTPTR and perform CLR
		jsr LINKPRG			; rebuild chaining of BASIC lines

		lda wedge_char
		cmp #$2f			; if '/' then load only, omit RUN
		bne startprg			; '^' --> RUN
		jmp READY			; load only, exit with BASIC warm start

startprg	jsr STXTPT			; reset TXTPTR
		jmp NEWSTT			; RUN

loaderr		jmp FILENOTFOUND		; FILE NOT FOUND, return to basic
