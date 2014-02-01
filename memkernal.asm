; PET/CBM EDIT ROM - Standard Kernal calls
; ================
; These are calls from the EDIT ROM to KERNAL entry points
;---------------------------------------------------------
; Non-vectored calls (direct - caution: could change if KERNAL is changed)

CHKSTOP 	= $F335 ; Check for STOP key

;----------------- Standard KERNAL Entry Points

BASIN		= $ffcf ; read char from input channel -> A
BSOUT		= $ffd2	; Write A to stdout
GETIN		= $ffe4	; read char from keyboard buffer -> A
UDTIME		= $FFEA	; Update Time

ACPTR		= $f1c0	; input IEEE -> A
CHKIN		= $ffc6	; stdin from logical file # in X
CIOUT		= $f19e	; output A -> IEEE
CKOUT		= $ffc9	; stdout to logical file # in X
CLOSE		= $f2e0	; close file
CLSEI		= $f72f	; close and unlisten
CLRCH		= $ffcc	; reset stdio to defaults
LISTN		= $f0d5	; send LISTEN
LOAD		= $f408	; LOAD
LOADOP		= $f356	; LOAD without pointer change
FILENOTFOUND	= $f425	; FILE NOT FOUND, return to BASIC
OPEN		= $f563	; open file
OPENI		= $f4a5	; open file on IEEE device
SCNT		= $f2c1	; prepare SETT for logical file A
SECND		= $f143	; send secondary address A
SETT		= $f2cd	; set LF,DN,SA from table
TALK		= $f0d2	; send TALK
TWAIT		= $f92b	; 
UNLSN		= $f1b9	; send UNLISTEN
UNTLK		= $f1ae	; send UNTALK
RESET		= $fd16	; basic cold start
STOPEQ		= $f335	; set Z flag if stop key pressed
STOPR		= $ffe1	; return to basic if stop key pressed
