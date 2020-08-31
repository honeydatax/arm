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
	.file	"hello.c"
#APP
	.code16gcc
	.section	.rodata
	.align	2
.LC0:
	.ascii	"hello world\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	ldr	r0, .L4
	bl	puts
	mov	r0, r0	@ nop
.L2:
	bl	getchar
	mov	r3, r0
	cmp	r3, #27
	beq	.L2
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp!, {fp, pc}
.L5:
	.align	2
.L4:
	.word	.LC0
	.size	main, .-main
	.ident	"GCC: (Raspbian 4.9.2-10+deb8u2) 4.9.2"
	.section	.note.GNU-stack,"",%progbits
