	.section	.rodata
	.align	2
.LC0:
	.ascii	"\012 %f + %f = %f \012\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	mov	r2, #0
	ldr	r3, .L2
	strd	r2, [fp, #-12]
	mov	r2, #0
	mov	r3, #1073741824
	strd	r2, [fp, #-20]
	bl	clear
	vldr.64	d6, [fp, #-12]
	vldr.64	d7, [fp, #-20]
	vadd.f64	d7, d6, d7
	vstr.64	d7, [sp, #8]
	ldrd	r2, [fp, #-20]
	strd	r2, [sp]
	ldrd	r2, [fp, #-12]
	ldr	r0, .L2+4
	bl	printf
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L3:
	.align	2
.L2:
	.word	1076101120
	.word	.LC0
	.size	main, .-main
	.section	.rodata
	.align	2
.LC1:
	.ascii	"\033c\000"
	.align	2
.LC2:
	.ascii	"\033[43m\000"
	.align	2
.LC3:
	.ascii	"\033[34m\000"
	.align	2
.LC4:
	.ascii	"                    \000"
	.align	2
.LC5:
	.ascii	"\033[1;1f\000"
	.text
	.align	2
	.global	clear
	.syntax unified
	.arm
	.fpu vfp
	.type	clear, %function
clear:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	ldr	r0, .L7
	bl	printf
	ldr	r0, .L7+4
	bl	printf
	ldr	r0, .L7+8
	bl	printf
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L5
.L6:
	ldr	r0, .L7+12
	bl	printf
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L5:
	ldr	r3, [fp, #-8]
	cmp	r3, #99
	ble	.L6
	ldr	r0, .L7+16
	bl	printf
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L8:
	.align	2
.L7:
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.size	clear, .-clear
