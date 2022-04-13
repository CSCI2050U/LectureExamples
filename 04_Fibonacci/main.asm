extern printf
extern scanf

global main 

section .data 

  numberPrompt db "Which Fibonacci number do you want? ", 0

  numberFormat db "%lli", 0
  n dq 0

  nth_fib dq 0

  resultMessage db "The %llith Fibonacci number is %lli.", 0ah, 0dh, 0

section .text

main:

  ; prompt the user to enter an integer (n)
  ; printf("Which Fibonacci number do you want? ");
  mov rdi, numberPrompt
  push rdx
  call printf
  pop rdx

  ; read that integer (n) from the user
  ; scanf("%lli", &n);
  ; %lli - long long int (64-bit integer)
  mov rdi, numberFormat
  mov rsi, n
  push rdx
  call scanf
  pop rdx

  ; calculate the nth Fibonacci number (nth_fib)
  ; loop to calculate each Fibonacci number consecutively

  ; n        -    - rdx
  ; count (index) - rsi
  ; previous fib  - r11
  ; current fib   - r12
  mov rdx, [n]
  mov rsi, 1
  mov r11, 0
  mov r12, 1

nextFibonacci:

  ; check if we need to exit
  cmp rsi, rdx 
  je printResult

  ; calculate the next fibonacci number
  mov r8, r12  ; save the old current fibonacci number, new previous
  add r12, r11 ; calculate the new current fibonacci number
  mov r11, r8  ; store the previous fibonacci number in the proper place

  ; increment our index/counter
  ; add rsi, 1
  inc rsi

  jmp nextFibonacci

printResult:
  ; print out a message with that Fibonacci number
  ; printf("The %llith Fibonacci number is %lli.\n", n, nth_fib);
  mov rdi, resultMessage
  mov rsi, [n]
  mov rdx, r12
  push rdx
  call printf
  pop rdx

  ret 

