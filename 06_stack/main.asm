extern printf
extern scanf

global main 

section .text 

add5:
  ; long add5(long a, long b, long c, long d, long e) {...}
  ; sum = add5(1, 2, 3, 4, 5)

  mov rax, [rsp + 8]  ; 1
  add rax, [rsp + 16] ; 2
  add rax, [rsp + 24] ; 3
  add rax, [rsp + 32] ; 4
  add rax, [rsp + 40] ; 5

  ret 40  ; mov rip, [rsp]

main:

; 5, 4, 3, 2, 1, <rip>

  mov rax, 5
  push rax

  mov rax, 4
  push rax

  mov rax, 3
  push rax

  mov rax, 2
  push rax

  mov rax, 1
  push rax

  call add5  ; push rip  - then -  jmp add5

  mov rdi, resultString
  mov rsi, rax 
  push rbx 
  call printf
  pop rbx 
  
  ret 

section .data 
  resultString db "The sum 1+2+3+4+5 is %d.", 0ah, 0dh, 0