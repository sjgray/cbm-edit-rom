; PET/CBM EDIT ROM - Extended Keyboard Matrix Table
; ================   German DIN
; Notes: "(KP)"=Keypad, "S-"=Shift, "Gr"=Graphic Code, NONE=No key (uses SHIFT code)

KEYBOARD_NORMAL
;					-------	-------	-------	-------	-------	-------	-------	-------
!byte $16,$00,$BE,$13,$39,$36,$33,$3C	;Ctrl V NONE	SZ	STOP	9	6	3	<
!byte $31,$2D,$15,$14,$4D,$20,$58,$00	;1 (KP)	-	Ctrl U	RIGHT	m	SPACE	x	CTRL
!byte $32,$03,$0F,$30,$2C,$4E,$56,$59	;2 (KP)	DOWN	Ctrl O 	0 (KP)	,	n	v       y
!byte $33,$00,$19,$2E,$2E,$42,$43,$00	;3	RSHIFT	Ctrl Y	. (KP)	.	b	c	LSHIFT
!byte $34,$BD,$4F,$5B,$55,$54,$45,$51	;4 (KP)	Grph-UE	o	[	u	t	e	q
!byte $5D,$50,$49,$2B,$5A,$52,$57,$09	;]	p	i	+	z	r	w	TAB
!byte $36,$BB,$4C,$0D,$4A,$47,$44,$41	;6 (KP)	Grph-OE	l	RETURN	j	g	d	a
!byte $35,$BC,$4B,$23,$48,$46,$53,$1B	;5 (KP)	Grph-OE	k	#	h	f	s	ESC
!byte $39,$00,$11,$37,$30,$37,$34,$31	;9 (KP)	NONE	HOME	7 (KP)	0	7	4	1
!byte $00,$0E,$1D,$38,$AF,$38,$35,$32	;NONE	Ctrl N	DEL	8 (KP)	ACUTE	8	5	2

;--------- Shifted Table
;					-------	-------	-------	-------	-------	-------	-------	-------
KEYBOARD_SHIFTED
!byte $96,$00,$3F,$93,$29,$26,$40,$3E	;S-CtlV LSHIFT	?	RUN	)	&	@	>
!byte $A2,$5F,$95,$94,$CD,$A0,$D8,$00	;Gr a2	UNDRLN	S-CtrlU	LEFT	M	SH-SPC	X	RUN
!byte $A3,$83,$8F,$A1,$3B,$CE,$D6,$D9	;Gr a3	UP	S-CtrlO	Gr a1	;	N	V	Y
!byte $A4,$00,$99,$DE,$3A,$C2,$C3,$00	;Gr a4	RSHIFT	S-CtrlY	PI	:	B	C	LSHIFT
!byte $A5,$DD,$CF,$5E,$D5,$D4,$C5,$D1	;Gr a5	UE	O	UP	U	T	E	Q
!byte $5C,$D0,$C9,$2A,$DA,$D2,$D7,$89	;\	P	I	*	Z	R	W	SET-TAB
!byte $A7,$DB,$CC,$8D,$CA,$C7,$C4,$C1 	;Gr a7	OE	L	S-RTRN	J	G	D	A
!byte $A6,$DC,$CB,$27,$C8,$C6,$D3,$1B	;Gr a6	OE	K	'	H	F	S	ESC
!byte $AA,$00,$91,$A8,$3D,$2F,$24,$21	;Gr aa	SHIFT	CLR	Gr a8	=	/	$	!
!byte $00,$8E,$9D,$A9,$C0,$28,$25,$22	;SHIFT	S-CtrlN	INS	Gr a9	ac-grav	(	%	"

!byte $00							;??
