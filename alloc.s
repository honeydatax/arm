.data
msg:	.asciz	"\nim love marina\n"
msg1:	.asciz	"..............................................................."
a:	.word	0
b:	.word	500


.text
.global main
.extern strcpy
.extern printf
.extern malloc
.extern free

main:
	push {ip,lr}
	ldr r1,=b
	ldr r0,[r1]

	bl malloc
	ldr r2,=a
	str r0,[r2]	

	ldr r1,=msg
	bl strcpy

	ldr r1,=a
	ldr r0,[r1]
	bl printf

	ldr r1,=a
	ldr r0,[r1]

	bl free


	pop {ip,pc}










