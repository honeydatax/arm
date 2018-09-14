	.text
	.align	2
	.global	main

main:
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	bl	startX
	mov	r2, #0
	mov	r1, #128
	mov	r0, #200
	bl	back
	mov	r3, #255
	str	r3, [sp, #8]
	mov	r3, #0
	str	r3, [sp, #4]
	mov	r3, #0
	str	r3, [sp]
	ldr	r3, .L2
	ldr	r2, .L2+4
	mov	r1, #50
	mov	r0, #50
	bl	rect
	bl	endX
	nop
	sub	sp, fp, #4

	pop	{fp, pc}
.L3:
	.align	2
.L2:
	.word	430
	.word	590

	.align	2
	.global	back

back:
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L5
.L8:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L6
.L7:
	ldr	r3, [fp, #-24]
	str	r3, [sp]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	ppixel
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L6:
	ldr	r3, [fp, #-8]
	ldr	r2, .L9
	cmp	r3, r2
	ble	.L7
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L5:
	ldr	r3, [fp, #-12]
	ldr	r2, .L9+4
	cmp	r3, r2
	ble	.L8
	nop
	sub	sp, fp, #4

	pop	{fp, pc}
.L10:
	.align	2
.L9:
	.word	638
	.word	478
	.align	2
	.global	hline

hline:
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	blt	.L15
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bne	.L15
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L13
.L14:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r0, r2, r3
	ldr	r3, [fp, #12]
	str	r3, [sp]
	ldr	r3, [fp, #8]
	ldr	r2, [fp, #4]
	ldr	r1, [fp, #-20]
	bl	ppixel
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L13:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	sub	r2, r2, r3
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L14
.L15:
	nop
	sub	sp, fp, #4

	pop	{fp, pc}
	.size	hline, .-hline
	.align	2
	.global	vline

vline:
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	blt	.L20
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bne	.L20
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L18
.L19:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r1, r2, r3
	ldr	r3, [fp, #12]
	str	r3, [sp]
	ldr	r3, [fp, #8]
	ldr	r2, [fp, #4]
	ldr	r0, [fp, #-16]
	bl	ppixel
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L18:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	sub	r2, r2, r3
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L19
.L20:
	nop
	sub	sp, fp, #4

	pop	{fp, pc}

	.align	2
	.global	rect

rect:
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	blt	.L25
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bgt	.L25
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L23
.L24:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r1, r2, r3
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r2, r2, r3
	ldr	r3, [fp, #12]
	str	r3, [sp, #8]
	ldr	r3, [fp, #8]
	str	r3, [sp, #4]
	ldr	r3, [fp, #4]
	str	r3, [sp]
	mov	r3, r2
	ldr	r2, [fp, #-24]
	ldr	r0, [fp, #-16]
	bl	hline
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L23:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	sub	r2, r2, r3
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L24
.L25:
	nop
	sub	sp, fp, #4

	pop	{fp, pc}
