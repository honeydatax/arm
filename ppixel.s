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




main:

	bl startX
	mov r10,#0
	mov r8,#0
	mov r7,#30

	ldr r11,=a
	ldr r9,=b
	ldr r11,[r11]
	ldr r9,[r9]
	mov r6,#1


for1:
	mov r0,r8
	mov r1,r7
	mov r2,#200
	mov r3,#128
	mov r4,#0

	bl ppixel

	add r8,r8,r6
	cmp r8,r11
	bne for2
	
	add r7,r7,r6
	mov r8,#0
for2:
	
	cmp r7,r9
	beq exitss
	
	bne for1

exitss:
	ldr r0,=c
	ldr r0,[r0]
	bl usleep

	bl endX

	mov r0,#0
	bl exit










