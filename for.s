.data
msg: .asciz "\n%d\n"
a: .word	0
b: .word	1
c: .word	10

.text
.global main
.extern printf

main:
	push {ip,lr}
	ldr r0,=c
	ldr r3,[r0]
	ldr r0,=a
	ldr r1,[r0]
	ldr r0,=b
	ldr r4,[r0]

for1:
	ldr r0,=a
	ldr r1,[r0]
	ldr r0,=msg
	bl printf
	ldr r0,=c
	ldr r3,[r0]
	ldr r0,=a
	ldr r1,[r0]
	ldr r0,=b
	ldr r4,[r0]
	add r1,r1,r4
	ldr r0,=a
	str r1,[r0]
	cmp r1,r3
	bne for1
	pop {ip,pc}










