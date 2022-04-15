TEX0:
	.ascii	"reversed result:\0"
TEX1:
	.ascii	"%c\0"
	.text
	.align	2
	.global	main
main:
	stmfd	sp!, {r0, r1, fp, lr}
	ldr	r2, [r1, #4]
	mov	r0, #0
count:
	ldrb	r3, [r2, r0]
	cmp	r3, #'A'
	blt	else
	cmp	r3, #'Z'
	bgt	else
	add	r3, r3, #'a'-'A'
else:
	stmfd	sp!, {r3}
	add	r0, r0, #1
	cmp	r3, #0
	bne	count
	mov	r2, r0
	adr	r0, TEX0
	stmfd	sp!, {r2}
	bl	printf
	ldmfd	sp!, {r2}
	sub	r2, r2, #1
	ldmfd	sp!, {r1}
print:
	ldmfd	sp!, {r1}
	@mov	r1, r0
	adr	r0, TEX1
	stmfd	sp!, {r2}
	bl	printf
	ldmfd	sp!, {r2}
	sub	r2, r2, #1
	cmp	r2, #0
	bgt	print

	ldmfd	sp!, {r0, r1, fp, lr}
	bx	lr
