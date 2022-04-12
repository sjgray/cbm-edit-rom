; PET/CBM EDIT ROM - Micro-PET Extensions (C)2021 Andre Fachat
; ================
; Editor-ROM extensions for the Micro-PET:
; 
; Currently only a hook into the Soft Reboot is used, to get to the Micro-PET
; Boot screen, where the actual type of PET can be selected.
;
; Some future extensions could be graphics options menu, or a speed selector

!IF REBOOT=1 {

SPEED=$e803
LOW32K=$e802
MEMMAP=$e801
VCTRL=$e800

SPI=$e808
SPIDATA=$e809

FLASH=$01

RebootUPet
		sei

		lda #0
		sta SPEED	; 1MHz to make sure not to overrun SPI
		sta MEMMAP	; all RAM (writeable)
		sta VCTRL
		sta LOW32K	

		lda #FLASH
		sta SPI
		lda #3		; SPI Flash READ
		sta SPIDATA
		lda #0
		sta SPIDATA
		sta SPIDATA
		sta SPIDATA
		lda SPIDATA	; trigger first byte

		ldx #0
loop		lda SPIDATA
		sta $ff00,x
		inx
		bne loop

		stx SPI

		JMP ($FFFC)


}


