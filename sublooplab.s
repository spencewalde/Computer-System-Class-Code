.data 
    string:      .asciz "%d %d"
    output:      .asciz "%d\n"
    a:           .int 0
    b:           .int 0

    .text
    .global main
    .extern printf
    .extern scanf

main:
	    push {lr}

	    ldr r0, =string @@loads the string
        ldr r1, =a      @@loads a into r1   
        ldr r2, =b      @@loads b into r2
        bl scanf        @@scans for input from keyboard


        ldr r1, =a      @@ adds first scanned value into r1
        ldr r1, [r1]    @@ adds actual value of a

        ldr r2, =b      @@ adds second value entered 
        ldr r2, [r2]    @@ add actual value of b

        cmp r1, r2      @@ compares and flags r1, r2
        @@ r5 always greater value  @@ r6 always the smaller value
        movge r5, r1   @@ move r1 into r5 if r1 is greater than r2
        movge r6, r2   @@ move r2 into r6 if r1 is greater than r2

        movle r5, r2   @@ move r2 into r5 if r1 is less than r2
        movle r6, r1   @@ move r1 into r6 if r1 is less than r2

_loop:
    
	ldr r0, =output	@r0 holds format string for printf
    mov r1, r5
	bl printf
    sub r5, r5, #1
    cmp r5, r6
	bge _loop

_exit:
	pop {lr}
	bx lr




