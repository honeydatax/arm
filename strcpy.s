.data
msg:	.asciz	"\nim love marina\n"
msg1:	.asciz	"..............................................................."
a:	.word	0


.text
.global main
.extern strcpy
.extern printf

main:
	push {ip,lr}
	ldr r0,=msg1
	ldr r1,=msg

	bl strcpy
	ldr r0,=msg1
	bl printf

	pop {ip,pc}










