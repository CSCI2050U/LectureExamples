extern printf
extern scanf
extern exit

global main

section .text

add5:
  mov rax, [rsp+8]   ; 5
  add rax, [rsp+16]  ; 4
  add rax, [rsp+24]  ; 3
  add rax, [rsp+32]  ; 2
  add rax, [rsp+40]  ; 1

  ret 40   ; mov rip, [rsp]

main:

  mov rax, 1
  push rax      ; push 1 onto the stack
  mov rax, 2
  push rax      ; push 2 onto the stack
  mov rax, 3
  push rax      ; push 3 onto the stack
  mov rax, 4
  push rax      ; push 4 onto the stack
  mov rax, 5
  push rax      ; push 5 onto the stack

  call add5

  ; the sum is in rax


  ; printf("The sum is %d.\n", sum);
  mov rdi, resultFormat
  mov rsi, rax
  mov rax, 0
  push rbx
  call printf
  pop rbx

  ; exit(0)
  mov rax, 0
  ret ; return 0
  ; call exit


section .data

  resultFormat db "The sum is %d.", 0ah, 0dh, 0

