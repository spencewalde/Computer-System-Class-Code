.data
.balign 4
        string:     .asciz "f =(g + h) - (i+j)=%d\n"
        g:          .int 0
        h:          .int 0
        i:          .int 0
        j;          .int 0

.text
.global main
.extern printf

main:
     ldr r0, =g
     ldr r0,[r0]
     ldr r1, =h
     ldr r1,[r1]
     ldr r2, =i
     ldr r2,[r2]
     ldr r3, =j
     ldr r3,[r3]

     add r0,r1,r0
     add r2,r2,r3

     sub r1,r0,r2
     ldr r0, =string
     bl printf




