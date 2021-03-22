extern printf
extern exit

global main

; .text means code
section .text

  main:
    ; printf("bob");
    mov  rdi, message
    mov  rax, 0
    push rbx
    call printf
    pop  rbx

    ; exit(0)
    mov  rax, 0
    call exit

section .data
  message db "bob", 0ah, 0ah, 0

