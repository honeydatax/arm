	.arch armv6
	.eabi_attribute 27, 3
	.eabi_attribute 28, 1
	.fpu vfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"strslong.c"
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	strslong
	.type	strslong, %function
strslong:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	mvn	r3, #-2147483648
	str	r3, [fp, #-20]
	ldr	r3, .L5
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-20]
	and	r3, r3, r2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	and	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	mov	r2, #43
	strb	r2, [r3]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L2
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	mov	r2, #45
	strb	r2, [r3]
.L2:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L3
.L4:
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-16]
	bl	__aeabi_idiv
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	add	r3, r3, #48
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [fp, #-24]
	uxtb	r2, r2
	strb	r2, [r3]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	ldr	r1, [fp, #-16]
	bl	__aeabi_idivmod
	mov	r3, r1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	ldr	r2, .L5+4
	smull	r1, r2, r2, r3
	mov	r2, r2, asr #2
	mov	r3, r3, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L3:
	ldr	r3, [fp, #-12]
	cmp	r3, #9
	ble	.L4
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3]
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, pc}
.L6:
	.align	2
.L5:
	.word	1000000000
	.word	1717986919
	.size	strslong, .-strslong
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	ldr	r3, .L9
	str	r3, [fp, #-8]
	sub	r3, fp, #28
	mov	r0, r3
	ldr	r1, [fp, #-8]
	bl	strslong
	sub	r3, fp, #28
	mov	r0, r3
	bl	puts
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, pc}
.L10:
	.align	2
.L9:
	.word	1234567890
	.size	main, .-main
	.ident	"GCC: (Raspbian 4.9.2-10+deb8u2) 4.9.2"
	.section	.note.GNU-stack,"",%progbits
