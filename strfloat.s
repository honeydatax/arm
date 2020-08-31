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
	.file	"strfloat.c"
	.text
	.align	2
	.global	strsfloat
	.type	strsfloat, %function
strsfloat:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #52
	str	r0, [fp, #-40]
	fsts	s0, [fp, #-44]
	ldr	r3, [fp, #-44]	@ float
	str	r3, [fp, #-8]	@ float
	ldr	r3, [fp, #-44]	@ float
	str	r3, [fp, #-24]	@ float
	mov	r3, #0
	strb	r3, [fp, #-25]
	mov	r3, #0
	str	r3, [fp, #-12]
	mov	r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-44]	@ float
	str	r3, [fp, #-32]	@ float
	ldr	r3, .L8+8
	str	r3, [fp, #-20]	@ float
	mov	r3, #0
	str	r3, [fp, #-36]	@ float
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	mov	r2, #43
	strb	r2, [r3]
	flds	s15, [fp, #-32]
	fcmpezs	s15
	fmstat
	bpl	.L2
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	mov	r2, #45
	strb	r2, [r3]
	flds	s14, .L8
	flds	s15, [fp, #-8]
	fsubs	s15, s14, s15
	fsts	s15, [fp, #-8]
.L2:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L4
.L6:
	ldr	r3, [fp, #-8]	@ float
	str	r3, [fp, #-24]	@ float
	flds	s14, [fp, #-8]
	flds	s15, [fp, #-20]
	fdivs	s15, s14, s15
	fsts	s15, [fp, #-36]
	ldr	r3, [fp, #-12]
	cmp	r3, #3
	bne	.L5
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	mov	r2, #46
	strb	r2, [r3]
.L5:
	flds	s15, [fp, #-36]
	ftouizs	s15, s15
	fsts	s15, [fp, #-48]	@ int
	ldrb	r3, [fp, #-48]
	strb	r3, [fp, #-25]
	ldrb	r3, [fp, #-25]	@ zero_extendqisi2
	fmsr	s15, r3	@ int
	fsitos	s14, s15
	flds	s15, [fp, #-20]
	fmuls	s15, s14, s15
	flds	s14, [fp, #-24]
	fsubs	s15, s14, s15
	fsts	s15, [fp, #-8]
	ldrb	r3, [fp, #-25]
	add	r3, r3, #48
	strb	r3, [fp, #-25]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-40]
	add	r3, r3, r2
	ldrb	r2, [fp, #-25]
	strb	r2, [r3]
	flds	s15, [fp, #-20]
	flds	s14, .L8+4
	fdivs	s15, s15, s14
	fsts	s15, [fp, #-20]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L4:
	ldr	r3, [fp, #-12]
	cmp	r3, #4
	ble	.L6
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-40]
	add	r3, r3, r2
	mov	r2, #0
	strb	r2, [r3]
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L9:
	.align	2
.L8:
	.word	0
	.word	1092616192
	.word	1120403456
	.size	strsfloat, .-strsfloat
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	ldr	r3, .L12
	str	r3, [fp, #-8]	@ float
	sub	r3, fp, #24
	mov	r0, r3
	flds	s0, [fp, #-8]
	bl	strsfloat
	sub	r3, fp, #24
	mov	r0, r3
	bl	puts
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, pc}
.L13:
	.align	2
.L12:
	.word	1123477094
	.size	main, .-main
	.ident	"GCC: (Raspbian 4.9.2-10+deb8u2) 4.9.2"
	.section	.note.GNU-stack,"",%progbits
