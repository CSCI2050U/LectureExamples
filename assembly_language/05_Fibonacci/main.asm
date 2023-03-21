extern printf
extern scanf

global main 

section .data 
  nPrompt db "Enter an n value: ", 0
  nFormat db "%d", 0 ; "%lli", 0
  n dq 0
  resultFormat db "The %dth Fibonacci number is %d.", 0ah, 0dh, 0
  result dq 0

section .text

main:

  ; printf("Enter an n value: ");
  mov rdi, nPrompt
  mov rax, 0
  push r9
  call printf
  pop r9

  ; scanf("%d", &n);
  mov rdi, nFormat 
  mov rsi, n
  mov rax, 0
  push r9 
  call scanf 
  pop r9

  ; calculate the nth Fibonacci number

  ; TODO: Write this code

  ; printf("The %dth Fibonacci number is %d.\n", n, result);
  mov rdi, resultFormat
  mov rsi, [n]
  mov rdx, [result]
  mov rax, 0
  push r9 
  call printf 
  pop r9

  ; exit the program
  ret 

