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
  ; loop to calculate each Fibonacci number consecutively
  ; rdx - n
  ; rax - count (index)
  ; r11 - currentFib
  ; rbx - previousFib 
  mov rdx, [n]
  mov rax, 1
  mov r11, 1  ; index 1 Fibonacci number (current)
  mov rbx, 0  ; index 0 Fibonacci number (previous)

loopStart:
  ; exit condition
  cmp rdx, rax 
  je printResult

  ; loop body

  ; calculate the new Fibonacci number, by adding the previous two
  mov rcx, r11   ; our new "previous"
  add r11, rbx   ; our new "current"
  mov rbx, rcx

  ; increment the count
  inc rax  ; rax++

  jmp loopStart


printResult:
  ; print out a message with that Fibonacci number
  ; printf("The %dth Fibonacci number is %d.\n", n, nth_fib);
  mov rdi, resultMessage
  mov rsi, [n]
  mov rdx, r11
  push rdx
  call printf
  pop rdx

  ret 

