/*text defines where instructions will start

.data defines --where data part is and where instructions are

.global main  -- define main is globaly availible to entire program

main:  --starting point 

instructions
mov r0, #65
mov r7, #1

SWI 0 --- software interupt 

execute program 
as -o asmtut.o asmtut.s  -- 
ld -o asmtut asmtut.o
./asmtut ; echo $? --echo $? outputs some data 

@@@@ combines multiple files together into one executable file
nano asmtut.s -- opens editor of specific program
nano asmtut2.s

.global main2
main2:

move r0,#65
bal _part2

nano asmtut3.s

.global main3

main3:

move r7, #1

swi 0 

ls

as -o asmtut2.o asmtut2.s  -- 
as -o asmtut3.o asmtut3.s  -- 

ld -o asmtut4
@@@@@compiles multiple files into one (incomplete)




@@@@@@@@@@@@ makefile @@@@@@@@@@@@@
nano makefile

//target -- name of file you want to generate
//prereq -- anything that needs to exist for us to create target file
if it doesnt exist create in the file below
target: prerequisite
  ^         ^
asmtut: asmtut.o 
        ld -o asmtut asmtut.o -- needs the tab (called a recipe)
asmtut.o: asmtut.s
        as -o asmtut.o asmtut.s -- needs the tab
clean:                     ---allow us to use clean command with makefile 
        rm *.o asmtut                to remove extra files

/////////////program close


make  -- automatically compile 
output:
as -o asmtut.o asmtut.s
ld -o asmtut asmtu.o

./asmtut ; echo $?
output:
65

@@@@@@will create .o files
@@@ to clean these

make clean
@ output will have no .o files for file name


//////////////



REGISTERS

ARM IS 32 BIT CPU
1 WORD IS EQUAL TO 32 BITS

0-12 ALWAYS availible

13 IS A POINT TO ACTIVE STACK 
14 IS THE LINK REGISTER 
15 PROGRAM COUNTER -- STORE ADDRESS OF NEXT INSTURTION TO EXECUTE 


@@@@@@@@@@Hello world ///takes in 5 characters and prints them   @@@@@@@
.global _main
main:
    mov r7,#3
    mov r0,#0
    mov r2,#10
    ldr r1, =message
    swi 0

_write
    mov r7,#4
    mov r0,#1
    mov r2,#5
    ldr r1, =message
    swi 0

end: 
    mov r7,#1
    swi 0

.data
message: 
    .ascii " "

//////////


@@@@@@@   add values @@@@@

<instruction> <dest> , <operand>, <operand>

add r0 , r1, r2

.global main

main:

    mov r1, #0x14
    add r0, r1, #0x14
    mov r7, #1
    swi 0

@@@@@@ subtract @@@@

.global main

main:

    mov r1, #0x14
    add r0, r1, #0x14
    mov r7, #1
    swi 0

@@@@@@@ multiply @@@@@@@@

.global main

main:

    mov r1, #0x14
    mov r2, #0xa
    mul r0, r1, r2
    mov r7, #1
    swi 0

@@@@@@@@ multiple with accumlate @@@@ -- multiply first two register and add to last

.global main

main:

    mov r1, #0x14
    mov r2, #0xa
    mov r3, #ox5
    mla r1, r2, r3
    mov r7, #1
    swi 0


----------------BRANCHING--------------

r15 program COUNTER -- store address of next instruction 

--skip around in the application
.global main

main:

    mov r0, #0x14
    b other 
    mov r0, #0xb

other: 
    mov r7,#1
    swi 0



-----------CPSR------------

store information of the program like operation results


.global main


main:

    mov r1, #5
    mov r2, #10
    cmp r1, r2
    beq vals_equal
    bgt rl_gt


r1_lt:
    mov r0,#2
    b end

rl_gt:
    mov r0, #3
    b end

vals_equal:
    mov r0, #1
    b end

end:
    mov r7, #1
    swi 0




    













*/


