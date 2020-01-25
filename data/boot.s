	BOOT_LOAD	equ	0x7C00
	ORG	BOOT_LOAD
%include	"modules/macros.s"
entry:
	jmp	ipl
	times	90- ($ - $$) db 0x90
ipl:
	cli
	mov	ax, 0x0000
	mov	ds, ax
	mov	es, ax
	mov	ss, ax
	mov	sp, BOOT_LOAD
	sti
	mov	[BOOT.DRIVE], dl
	;処理開始
	clm	puts, .s0
	clm	main
	clm	puts, .s1
	;処理終了
	jmp	$
.s0	db	"Booting ...", 0x0A, 0x0D, 0
.s1	db	"Main finished", 0x0A, 0x0D, 0
ALIGN	2, db 0
BOOT:
.DRIVE:	dw 0
%include	"modules/putc.s"
%include	"modules/puts.s"
%include	"modules/reboot.s"
%include	"main.s"
	times	510 - ($ - $$) db 0x00
	db	0x55, 0xAA
