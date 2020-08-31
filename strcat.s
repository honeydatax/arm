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
	.file	"strcat.c"
	.text
	.align	2
	.global	strslen
	.type	strslen, %function
strslen:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L3:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	strslen, .-strslen
	.align	2
	.global	strcat
	.type	strcat, %function
strcat:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-16]
	bl	strslen
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	str	r3, [fp, #-12]
	b	.L6
.L7:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	ldr	r1, [fp, #-20]
	add	r2, r1, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L6:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L7
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	ldr	r1, [fp, #-20]
	add	r2, r1, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r3]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, pc}
	.size	strcat, .-strcat
	.section	.rodata
	.align	2
.LC1:
	.ascii	"world\012\000"
	.align	2
.LC0:
	.ascii	"hello \000"
	.space	43
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #56
	ldr	r2, .L11
	sub	r3, fp, #60
	ldmia	r2, {r0, r1}
	str	r0, [r3]
	add	r3, r3, #4
	strh	r1, [r3]	@ movhi
	add	r3, r3, #2
	mov	r2, r1, lsr #16
	strb	r2, [r3]
	sub	r3, fp, #53
	mov	r2, #43
	mov	r0, r3
	mov	r1, #0
	bl	memset
	ldr	r3, .L11+4
	str	r3, [fp, #-8]
	sub	r3, fp, #60
	mov	r0, r3
	ldr	r1, [fp, #-8]
	bl	strcat
	sub	r3, fp, #60
	mov	r0, r3
	bl	puts
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, pc}
.L12:
	.align	2
.L11:
	.word	.LC0
	.word	.LC1
	.size	main, .-main
	.ident	"GCC: (Raspbian 4.9.2-10+deb8u2) 4.9.2"
	.section	.note.GNU-stack,"",%progbits
