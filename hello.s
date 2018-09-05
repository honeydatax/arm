.data
msg: .asciz "\nim love marina\n"

.text
.global main
.extern printf

main:
	push {ip,lr}
	ldr r0,=msg
	bl printf
	pop {ip,pc}
