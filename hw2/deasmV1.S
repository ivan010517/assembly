TEX0:
	.ascii	"%-5s%-12s%-12s\n\0"
TEX1:
	.ascii	"%d\n"
TEX2:
	.ascii	"PC\0"
TEX3:
	.ascii	"condition\0"
TEX4:
	.ascii	"instruction\0"
TEX5:
	.ascii	"%-5d%-12s%-12s\n\0"
CON:
	.ascii	"EQ\0\0"
	.ascii	"NE\0\0"
	.ascii	"CS\0\0"
	.ascii	"CC\0\0"
	.ascii	"MI\0\0"
	.ascii	"PL\0\0"
	.ascii	"VS\0\0"
	.ascii	"VC\0\0"
	.ascii	"HI\0\0"
	.ascii	"LS\0\0"
	.ascii	"GE\0\0"
	.ascii	"LT\0\0"
	.ascii	"GT\0\0"
	.ascii	"LE\0\0"
	.ascii	"AL\0\0"
	.ascii	"NA\0\0"
instruct:
	.ascii	"B\0\0\0"
	.ascii	"BL\0\0"
	.ascii	"UND\0"
	.ascii	"DEF\0"
	.ascii	"LDR\0"
	.ascii	"LDRB\0\0\0\0"
@6
	.ascii	"STR\0"
	.ascii	"STRB\0\0\0\0"
@9
	.ascii	"AND\0"
	.ascii	"EOR\0"
	.ascii	"SUB\0"
	.ascii	"RSB\0"
	.ascii	"ADD\0"
	.ascii	"ADC\0"
	.ascii	"SBC\0"
	.ascii	"RSC\0"
	.ascii	"TST\0"
	.ascii	"TEQ\0"
	.ascii	"CMP\0"
	.ascii	"CMN\0"
	.ascii	"ORR\0"
	.ascii	"MOV\0"
	.ascii	"BIC\0"
	.ascii	"MVN\0"

	.text
	.align	2
	.global	main
main:

    @prologue
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4

	bl start_deasm
    @epilogue
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
begin:
	.include "test.s" 
end:

start_deasm:
	
    @prologue
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	stmfd	sp!, {r4, r5, r6, r7}
	ldr	r4, =begin	@begin
	ldr	r5, =end

	ldr	r0, =TEX0
	ldr	r1, =TEX2
	ldr	r2, =TEX3
	ldr	r3, =TEX4
	bl	printf

	mov	r6, r4
loop:
	cmp	r6, r5
	bge	exit
	sub	r1, r6, r4
	ldr	r2, [r6]
	mov	r2, r2, LSR#28
	ldr	r3, =CON
	add	r2, r3, r2, LSL#2
	ldr	r3, [r6]
	mov	r3, r3, LSL#4
	mov	r3, r3, LSR#28
	mov	r7, #8
@B
	cmp	r3, #10
	moveq	r7, #0
	beq	print
@BL
	cmp	r3, #11
	moveq	r7, #4
	beq	print
@UND
	mov	r3, r3, LSR#1
    @!=0
	cmp	r3, #1
	beq	data_processing
	cmp	r3, #2
	beq	data_movement
	cmp	r3, #3
	beq	data_movement
	cmp	r3, #0
	bne	print
    @==0
	ldr	r3, [r6]
	bic	r3, r3, #0xFFFFFF6F
	cmp	r3, #144
	beq	print
	bne	data_processing
data_movement:
	ldr	r3, [r6]
	mov	r3, r3, LSR#20
	and	r3, r3, #5
	cmp	r3, #0
	moveq	r7, #28
	cmp	r3, #1
	moveq	r7, #16
	cmp	r3, #4
	moveq	r7, #32
	cmp	r3, #5
	moveq	r7, #20
	b	print
data_processing:
	ldr	r3, [r6]
	mov	r3, r3, LSR#21
	and	r3, r3, #0xF
	add	r3, r3, #10
	mov	r7, r3, LSL#2

print:
	ldr	r0, =instruct
	add	r3, r7, r0
	ldr	r0, =TEX5
	bl	printf
	add	r6, #4
	b	loop
exit:
    @epilogue
	ldmfd	sp!, {r4, r5, r6, r7}
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
