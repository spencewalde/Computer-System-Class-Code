.data
.balign	4
	input:	.asciz "%d"
	output: .asciz "(a + b)= %d\n"
	a:	.int	0	@ r10
	b:	.int	0	@ r11
	e:	.int	0	@ r12
.text
.global main
.extern printf
.extern scanf


sumFunc:
	push	{ip, lr}
	push	{r10, r11, r12}
	mov	r10, r6
	//ldr r11, [r7] mov	r11, r7
	add	r12, r11, r10
	ldr	r10, =e
	str	r12, [r10]
	pop	{r10, r11, r12}
	pop	{ip, pc}

main:
	push	{ip, lr}

	ldr	r1, =a @get a
	ldr	r0, =input
	bl	scanf
	ldr	r6, =a
	@@ldr	r6, [r6]

	ldr	r1, =b @get b
	ldr	r0, =input
	bl	scanf
	ldr	r7, =b 
	@@ldr	r7, [r7] 

	bl	sumFunc

    @ print
	ldr	r0, =output
	ldr	r1, =e @get b
	ldr	r1, [r1]
	bl	printf
	pop	{ip, pc}

