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
	ldr	r2, .L4
	ldr	r1, [fp, #-8]
	mov	r0, #0
	bl	hline
	ldr	r3, [fp, #-8]
	add	r3, r3, #8
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	ldr	r2, .L4+4
	cmp	r3, r2
	ble	.L3
	bl	endX
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L5:
	.align	2
.L4:
	.word	639
	.word	478
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
	b	.L7
.L10:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L8
.L9:
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
.L8:
	ldr	r3, [fp, #-8]
	ldr	r2, .L11
	cmp	r3, r2
	ble	.L9
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L7:
	ldr	r3, [fp, #-12]
	ldr	r2, .L11+4
	cmp	r3, r2
	ble	.L10
	nop
	sub	sp, fp, #4

	pop	{fp, pc}
.L12:
	.align	2
.L11:
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
	blt	.L17
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bne	.L17
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L15
.L16:
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
.L15:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	sub	r2, r2, r3
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L16
.L17:
	nop
	sub	sp, fp, #4

	pop	{fp, pc}
