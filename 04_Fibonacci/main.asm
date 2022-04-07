extern printf
extern scanf

global main 

section .data 
  numberPrompt db "Which Fibonacci number do you want? ", 0

  numberFormat db "%d", 0
  n dq 0

  nth_fib dq 0

  resultMessage db "The %dth Fibonacci number is %d", 0ah, 0dh, 0

section .text

main:

  ; prompt the user to enter a number
  ; printf("Which Fibonacci number do you want? ");
  mov rdi, numberPrompt
  push rbx 
  call printf
  pop rbx

  ; read the user's response, as an integer (n)
  ; scanf("%d", &n);
  mov rdi, numberFormat
  mov rsi, n
  push rbx 
  call scanf 
  pop rbx

  ; calculate the nth Fibonacci number, one at a time (by adding previous two)
  ; TODO: implement a loop!

printResult:
  ; print the nth Fibonacci number
  ; printf("The %dth Fibonacci number is %d", n, nth_fib);
  mov rdi, resultMessage
  mov rsi, [n]
  mov rdx, [nth_fib]
  push rbx 
  call printf 
  pop rbx

  ret 

