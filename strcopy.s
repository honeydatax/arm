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
	.file	"strcopy.c"
	.text
	.align	2
	.global	strcopy
	.type	strcopy, %function
strcopy:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L3:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	ldr	r1, [fp, #-20]
	add	r2, r1, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	ldr	r1, [fp, #-20]
	add	r2, r1, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r3]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	strcopy, .-strcopy
	.section	.rodata
	.align	2
.LC0:
	.ascii	"hello world\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 1032
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #1024
	sub	sp, sp, #8
	ldr	r3, .L7
	str	r3, [fp, #-8]
	sub	r3, fp, #1024
	sub	r3, r3, #4
	sub	r3, r3, #4
	mov	r0, r3
	ldr	r1, [fp, #-8]
	bl	strcopy
	sub	r3, fp, #1024
	sub	r3, r3, #4
	sub	r3, r3, #4
	mov	r0, r3
	bl	puts
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, pc}
.L8:
	.align	2
.L7:
	.word	.LC0
	.size	main, .-main
	.ident	"GCC: (Raspbian 4.9.2-10+deb8u2) 4.9.2"
	.section	.note.GNU-stack,"",%progbits
