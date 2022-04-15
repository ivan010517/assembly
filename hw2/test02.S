func:
	and	r0, r1, r2
	eor	r0, r1, r2
	sub	r0, r1, r2
	rsb	r0, r1, r2
	add	r0, r1, r2
	adc	r0, r1, r2
	sbc	r0, r1, r2
	rsc	r0, r1, r2
	tst	r0, r1
	teq	r0, r1
	cmp	r0, r1
	cmn	r0, r1
	orr	r0, r1, r2
	mov	r0, r1
	bic	r0, r1, r2
	mvn	r0, r1

	b	func	
	bl	func

	ldr	r0, [r1]
	ldrb	r0, [r1]	
	str	r0, [r1]
	strb	r0, [r1]

	ldrh	r0, [r1]
	stmfd	r0, {r1}
	ldmfd	r0, {r1}

	mul	r0, r1, r2

	beq	func	
	bne	func	
	bcs	func	
	bcc	func	
	bmi	func	
	bpl	func	
	bvs	func	
	bvc	func	
	bhi	func	
	bls	func	
	bge	func	
	blt	func	
	bgt	func	
	ble	func	
	bal	func	
