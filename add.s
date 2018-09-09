.data
clear1: .asciz "%c[%dm"
clear2: .asciz "\007\033c"
clear3: .asciz "                                        "
clear4: .word	0
clear5: .word	1
clear6: .word	50
gotoxy1: .asciz "%c[%d;%df"
gotoxy2: .word	0
gotoxy3: .word	1
msg: .asciz "\n %d + %d = %d\n\n"
a: .word	1234
b: .word	4321
c: .word	24


.text
.global main
.extern printf
.extern exit

clear:
	push {ip,lr}

	ldr r10,=clear4
	str r0,[r10]

	ldr r10,=clear5
	str r1,[r10]


	ldr r0,=clear2
	bl printf

	ldr r10,=clear5
	ldr r2,[r10]
	mov r0,#30
	add r2,r2,r0
	mov r1,#27
	ldr r0,=clear1
	bl printf

	ldr r10,=clear4
	ldr r2,[r10]
	mov r0,#40
	add r2,r2,r0
	mov r1,#27
	ldr r0,=clear1
	bl printf

	mov r0,#0
	ldr r1,=clear4
	str r0,[r1]

	mov r0,#1
	ldr r1,=clear5
	str r0,[r1]

	mov r0,#50
	ldr r1,=clear6
	str r0,[r1]


clear0:
	ldr r0,=clear3
	bl printf
	ldr r0,=clear6
	ldr r3,[r0]
	ldr r0,=clear4
	ldr r1,[r0]
	ldr r0,=clear5
	ldr r4,[r0]
	add r1,r1,r4
	ldr r0,=clear4
	str r1,[r0]
	cmp r1,r3
	bne clear0

	pop {ip,pc}

gotoxy:
	push {ip,lr}

	mov r2,r0
	mov r3,r1
	mov r1,#27
	ldr r0,=gotoxy1
	bl printf
	pop {ip,pc}

addic:
	push {ip,lr}
	add r0,r0,r1
	pop {ip,pc}


main:

	mov r0,#3
	mov r1,#4
	bl clear


	mov r0,#1
	mov r1,#1
	bl gotoxy


	ldr r0, =a
	ldr r0,[r0]
	ldr r1, =b
	ldr r1,[r1]
	bl addic
	mov r3,r0
	ldr r1, =a
	ldr r1,[r1]
	ldr r2, =b
	ldr r2,[r2]
	ldr r0,=msg
	bl printf






	mov r0,#0
	bl exit










