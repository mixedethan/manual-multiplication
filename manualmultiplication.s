.section .data
input_x_prompt : .asciz "Please enter x: "
input_y_prompt : .asciz "Please enter y: "
input_spec : .asciz "%d"
result : .asciz "x*y = %d\n"

.section .text
.global main

main:

    #by ethan wilson 10/6/2023

    #allocate 24 bytes for x,y, and the result
    sub sp, sp, 24

    #print message and reading in the x input from the user
    ldr x0, =input_x_prompt
    bl printf
    ldr x0, =input_spec
    add x1, sp, #8
    bl scanf

    #print message and reading in the y input from the user
    ldr x0, =input_y_prompt
    bl printf
    ldr x0, =input_spec
    add x1, sp, #12
    bl scanf

    #Check if y is negative, if so jump to make xy positive function
    ldr w20, [sp, #12]
    cmp w20, #0
    blt make_x_y_positive

    #X21 is result
    #X22 is the counter fo rloop

    #intitalize the loop variables, loads in x and sets register 21 & 22 to zero
    ldr w19, [sp, #8]
    mov w21, wzr
    mov w22, wzr

#beginning for multiplication for loop
multiply_loop:
    cmp w22, w20
    #if the counter is >= y, exit the loop
    bge end_loop
    add w21, w21, w19
    add w22, w22, #1
    b multiply_loop

#flips both xy values and puts them back onto stack
make_x_y_positive:
    ldr w19, [sp, #8]
    neg w19, w19
    str w19, [sp, #8]
    neg w20, w20
    str w20, [sp, #12]
    b multiply_loop

#end of loop and prints out the result
end_loop:
    ldr x0, =result
    mov x1, x21
    bl printf

exit:
    mov x0, 0
    mov x8, 93
    svc 0
    #deallocates memory
    add sp, sp, 24
    ret
