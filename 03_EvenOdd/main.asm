extern printf
extern scanf
; extern exit

global main

section .text 

main:
  ; printf("Enter a number: ");
  mov rdi, numberPrompt
  mov rax, 0 ; unnecessary, but this is where the return value will go
  mov rbx, 0 ; unnecessary, but if it makes you feel better :)
  push rbx
  call printf
  pop rbx

  ; scanf("%d", number);
  mov rdi, numberFormatString
  mov rsi, number
  mov rax, 0
  mov rbx, 0
  push rbx
  call scanf
  pop rbx

  ; determine if the number is odd or even

  ; if (the number is even)
  ;   printf("The number %d is an even number.\n", number);
  ; else
  ;   printf("The number %d is an odd number.\n", number);

  mov rdi, evenNumberString
  mov rsi, [number]
  mov rax, 0
  mov rbx, 0
  push rbx
  call printf
  pop rbx

  ret

section .data
  numberPrompt db "Enter a number: ", 0
  numberFormatString db "%d", 0
  number dq 0

  evenNumberString db "The number %d is an even number.", 0ah, 0dh, 0
