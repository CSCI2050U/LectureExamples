extern printf
extern scanf

global main 

section .data 

  numberPrompt db "Which Fibonacci number do you want? ", 0

  numberFormat db "%d", 0
  n dd 0

  nth_fib dd 0

  resultMessage db "The %dth Fibonacci number is %d.", 0ah, 0dh, 0

section .text

main:

  ; prompt the user to enter an integer (n)
  ; printf("Which Fibonacci number do you want? ");
  mov rdi, numberPrompt
  push rdx
  call printf
  pop rdx

  ; read that integer (n) from the user
  ; scanf("%d", &n);
  mov rdi, numberFormat
  mov rsi, n
  push rdx
  call scanf
  pop rdx

  ; calculate the nth Fibonacci number (nth_fib)
  ; TODO: loop to calculate each Fibonacci number consecutively

  ; print out a message with that Fibonacci number
  ; printf("The %dth Fibonacci number is %d.\n", n, nth_fib);
  mov rdi, resultMessage
  mov rsi, [n]
  mov rdx, [nth_fib]
  push rdx
  call printf
  pop rdx

  ret 

