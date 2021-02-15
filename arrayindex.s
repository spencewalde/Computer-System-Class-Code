.data
.balign 4
        string:         .asciz "%d"
        output:         .asciz "Enter desired key: "
        line:           .asciz "found at index %d"
        a:              .int 0
        arr:            .skip 40
        


.text
.global main
.extern printf
.extern scanf

main: 
        push {ip,lr}
        mov r8, #0  

loop:
        ldr r0, =string
        ldr r1, =a
        bl scanf
        ldr r1, =a
        ldr r1, [r1]
        ldr r3, =arr
        lsl r4, r8, #2
        str r1, [r3,r4]

        add r8, r8,#1
        cmp r8, #10
        bne loop
        ldr r0, =output
        bl printf

        ldr r0, =string
        ldr r1, =a
        bl scanf

        mov r8, #0
        ldr r3, =arr
        ldr r4, =a
        ldr r4, [r4]

loop2:
        ldr r1,[r3,r8,lsl #2]
        cmp r1,r4
        beq then
        add r8,r8,#1
        bl loop2
then: 
        ldr r0, =line
        mov r1,r8
        bl printf


        pop {ip,pc}


