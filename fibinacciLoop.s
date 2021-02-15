
.data
string:     .asciz "%d, "

.text
.global main
.extern printf
main:

    push {ip, lr}

    ldr r0, =string
    mov r1, #1
    bl printf

    ldr r0, =string
    mov r1, #1
    bl printf

    mov r8, #3
    mov r1, #1    @@ move 1 to r1
    mov r7, #1    @@ move 1 to r7


_loop:
    push {r7}       @@ push r7 = 2
    ldr r0, =string 
    add r1, r1 ,r7  @@ add r1=1 + r7=2 ===3
    mov r7, r1      @@ move sum r1=3 to r7
    bl printf       @@ print r1
    mov r1, r7      @@ move r7=3 to r1
    pop {r7}        @@ restore original r7=2

    push {r1}       @@ push r1 = 3
    ldr r0, =string 
    add r1, r1 ,r7  @@ add r1=3 + r7=2 ===5
    mov r7, r1      @@ move sum r1=5 to r7
    bl printf       @@ print r1
    pop {r1}        @@ restore original r1=3

    subs r8, r8, #1
    bpl _loop

end:
     pop {ip,pc}
     bx lr
    
    
