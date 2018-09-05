.data
msg:	.asciz	"\n%d\n"
msg1:	.asciz	"\0"
a:	.word	2


.text
.global main
.extern sleep


main:
	push {ip,lr}
	ldr r0,=a
	ldr r0,[r0]
	bl sleep
	pop {ip,pc}










