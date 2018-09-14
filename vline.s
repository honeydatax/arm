	.text
	.align	2
	.global	main
main:
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	bl	startX
	mov	r2, #0
	mov	r1, #128
	mov	r0, #200
	bl	back
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L3:
	mov	r3, #255
	str	r3, [sp, #8]
	mov	r3, #0
	str	r3, [sp, #4]
	mov	r3, #0
	str	r3, [sp]
	ldr	r3, [fp, #-8]
	ldr	r2, .L6
	ldr	r1, [fp, #-8]
	mov	r0, #0
	bl	hline
	ldr	r3, [fp, #-8]
	add	r3, r3, #8
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	ldr	r2, .L6+4
	cmp	r3, r2
	ble	.L3
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L4
.L5:
	mov	r3, #255
	str	r3, [sp, #8]
	mov	r3, #0
	str	r3, [sp, #4]
	mov	r3, #0
	str	r3, [sp]
	ldr	r3, .L6+8
	ldr	r2, [fp, #-8]
	mov	r1, #0
	ldr	r0, [fp, #-8]
	bl	vline
	ldr	r3, [fp, #-8]
	add	r3, r3, #8
	str	r3, [fp, #-8]
.L4:
	ldr	r3, [fp, #-8]
	ldr	r2, .L6+12
	cmp	r3, r2
	ble	.L5
	bl	endX
	nop
	sub	sp, fp, #4

	pop	{fp, pc}
.L7:
	.align	2
.L6:
	.word	639
	.word	478
	.word	479
	.word	638
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
	b	.L9
.L12:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L10
.L11:
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
.L10:
	ldr	r3, [fp, #-8]
	ldr	r2, .L13
	cmp	r3, r2
	ble	.L11
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L9:
	ldr	r3, [fp, #-12]
	ldr	r2, .L13+4
	cmp	r3, r2
	ble	.L12
	nop
	sub	sp, fp, #4

	pop	{fp, pc}
.L14:
	.align	2
.L13:
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
	blt	.L19
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bne	.L19
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L17
.L18:
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
.L17:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	sub	r2, r2, r3
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L18
.L19:
	nop
	sub	sp, fp, #4

	pop	{fp, pc}

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
	blt	.L24
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bne	.L24
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L22
.L23:
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
.L22:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	sub	r2, r2, r3
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L23
.L24:
	nop
	sub	sp, fp, #4

	pop	{fp, pc}
