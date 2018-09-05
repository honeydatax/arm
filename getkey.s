.data
msg:	.asciz	"\n%d\n"
msg1:	.asciz	"\0"
a:	.word	0


.text
.global main
.extern getchar
.extern printf

main:
	push {ip,lr}

	bl getchar
	mov r1,r0
	ldr r0,=msg
	bl printf
	pop {ip,pc}










