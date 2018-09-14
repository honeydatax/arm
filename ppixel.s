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
backa: .word	639
backb: .word	479
backred: .word 0
backgreen: .word 0
backblue: .word 0
msg: .asciz "im love marina"
a: .word	639
b: .word	478
c: .word	5000000


.text
.global main
.extern printf
.extern exit
.extern ppixel
.extern startX
.extern endX
.extern usleep

back:
	push {ip,lr}
	ldr r4,=backred
	str r0,[r4]
	
	ldr r4,=backgreen
	str r1,[r4]
	
	ldr r4,=backblue
	str r2,[r4]

	mov r10,#0
	mov r8,#0
	mov r7,#0

	ldr r11,=backa
	ldr r9,=backb
	ldr r11,[r11]
	ldr r9,[r9]
	mov r6,#1


back1:


	ldr r2,=backred
	ldr r2,[r2]
	
	ldr r3,=backgreen
	ldr r3,[r3]
	
	ldr r4,=backblue
	ldr r4,[r4]
	
	
	
	mov r0,r8
	mov r1,r7
	

	bl ppixel

	mov r6,#1
	add r8,r8,r6
	cmp r8,r11
	bne back2
	
	add r7,r7,r6
	mov r8,#0
back2:
	
	cmp r7,r9
	beq back5
	
	bne back1

back5:
	pop {ip,pc}





main:

	bl startX
	mov r0,#200
	mov r1,#128
	mov r2,#0
	
	bl back
	
exitss:
	ldr r0,=c
	ldr r0,[r0]
	bl usleep

	bl endX

	mov r0,#0
	bl exit






