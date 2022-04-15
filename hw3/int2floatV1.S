	.text
	.global main
	.extern printf
main:
    @prologue
	stmfd	sp!, {r4-r8, fp, lr}
	add	fp, sp, #4
    @main
       	ldr	r1, [r1, #4]
	ldrb	r0, [r1]
	mov	r2, #0
	mov	r3, #10
	cmp	r0, #'N'
	beq	Negtive
Positive:
	add	r1, r1, #1
	sub	r0, r0, #'0'
	mul	r2, r3, r2
	add	r2, r2, r0
	ldrb	r0, [r1]
	cmp	r0, #0
	bne	Positive
	b	Positive2binary
Negtive:
	add	r1, r1, #1
	ldrb	r0, [r1]
	cmp	r0, #0
    @if
	rsbeq	r2, r2, #0
	beq	Negtive2binary
    @else
	sub	r0, r0, #'0'
	mul	r2, r3, r2
	add	r2, r2, r0
	b	Negtive
Positive2binary:
	mov	r0, #0
	str	r0, [sp, #-4]! 
    Positive2binary_loop:
	mov	r1, r2, LSR r0
	and	r1, r1, #1
	add	r1, r1, #'0'
	strb	r1, [sp, #-1]! 
	add	r0, r0, #1
	cmp	r0, #32
	bne	Positive2binary_loop
	mov	r1, r2
	mov	r2, sp
	b	Positive2float
Negtive2binary:
	mov	r0, #0
	str	r0, [sp, #-4]! 
    Negtive2binary_loop:
	rsb	r1, r2, #0
	mov	r1, r1, LSR r0
	and	r1, r1, #1
	add	r1, r1, #'0'
	strb	r1, [sp, #-1]! 
	add	r0, r0, #1
	cmp	r0, #32
	bne	Negtive2binary_loop
	mov	r1, r2
	mov	r2, sp
	b	Negtive2float

Positive2float:
	mov	r4, sp
	mov	r5, #0
	str	r5, [sp, #-4]!
	mov	r5, #9
    Positive2float_loop:
	ldrb	r3, [r4, r5]
	cmp	r3, #'0'
	bne	else
    if:
	strb	r3, [sp, #-1]! 
	add	r5, r5, #1
	b	Positive2float_loop
    else:
	mov	r3, #'0'
	strb	r3, [sp, #-1]! 
	@add	r5, r5, #1
	mov	r6, #31
    Positive2float_loop2:
	ldrb	r3, [r4, r6]
	strb	r3, [sp, #-1]! 
	sub	r6, r6, #1
	cmp	r6, r5
	bne	Positive2float_loop2
	mov	r3, #'x'
	rsb	r5, r5, #31
	add	r5, r5, #127
	mov	r0, #0
    Positive2float_loop3:
	mov	r4, r5, LSR r0
	and	r4, r4, #1
	add	r4, r4, #'0'
	strb	r4, [sp, #-1]! 
	add	r0, r0, #1
	cmp	r0, #8
	bne	Positive2float_loop3
	mov	r3, #'0'
	strb	r3, [sp, #-1]! 
	
	b	Print
	
	  
Negtive2float:
	mov	r4, sp
	mov	r5, #0
	str	r5, [sp, #-4]!
	mov	r5, #9
    Negtive2float_loop:
	ldrb	r3, [r4, r5]
	cmp	r3, #'0'
	bne	else1
    if1:
	strb	r3, [sp, #-1]! 
	add	r5, r5, #1
	b	Negtive2float_loop
    else1:
	mov	r3, #'0'
	strb	r3, [sp, #-1]! 
	@add	r5, r5, #1
	mov	r6, #31
    Negtive2float_loop2:
	ldrb	r3, [r4, r6]
	strb	r3, [sp, #-1]! 
	sub	r6, r6, #1
	cmp	r6, r5
	bne	Negtive2float_loop2
	mov	r3, #'x'
	rsb	r5, r5, #31
	add	r5, r5, #127
	mov	r0, #0
    Negtive2float_loop3:
	mov	r4, r5, LSR r0
	and	r4, r4, #1
	add	r4, r4, #'0'
	strb	r4, [sp, #-1]! 
	add	r0, r0, #1
	cmp	r0, #8
	bne	Negtive2float_loop3
	mov	r3, #'1'
	strb	r3, [sp, #-1]! 
	
	b	Print
Print:
	mov	r2, sp
	ldr 	r0, =string
        bl 	printf
	@add	sp, sp, #36
	add	sp, sp, #36
	
    @epilogue
	sub	sp, fp, #4
	ldmfd	sp!, {r4-r8, fp, lr}
	bx	lr

.data
string:
	.asciz"%d is coded by %s.\0"