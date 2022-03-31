extern printf

global main

section .text

main:
    ; printf("Hello, world!\n");
    mov rdi, greeting 
    mov rax, 0
    push rax
    call printf
    pop rax

    ret

section .data

    greeting db "Hello, world!", 0ah, 0dh, 0