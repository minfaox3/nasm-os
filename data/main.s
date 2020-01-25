main:
.10S:
	jmp	.10P
.10L:
	clm	puts, .s5
	mov	ah, 0x10
	int	0x16
	cmp	al, 'q'
	je	.10Q
	jmp	.10E
.10E:
	cmp	al, 0x0D
	je	.10M
	jmp	.10F
.10M:
	clm	puts, .s6
	clm	puts, .s1
	clm	puts, .s1
	jmp	.10L
.10F:
	cmp	al, 0x1B
	je	.10R
	jmp	.10Z
.10R:
	clm	puts, .s0
	clm	reboot
.10Q:
	clm	putc, 'Q'
	clm	puts, .s1
	ret
.10Z:
	clm	puts, .s1
	jmp	.10L
.10P:
	clm	puts, .s2
	clm	puts, .s3
	clm	puts, .s4
	jmp	.10L
.s0:	db "ESC", 0
.s1:	db 0x0A, 0x0D, 0
.s2:	db "Print RETURN to press RETURN", 0x0A, 0x0D, 0
.s3:	db "Quit main to press Q", 0x0A, 0x0D, 0
.s4:	db "Reboot to press ESC", 0x0A, 0x0D, 0
.s5:	db ">>", 0
.s6:	db "RETURN", 0
