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

  ; scanf("%d", &number);
  mov rdi, numberFormatString
  mov rsi, number
  mov rax, 0
  mov rbx, 0
  push rbx
  call scanf
  pop rbx

  ; determine if the number is odd or even
  mov rax, [number]
  mov rdx, 0
  mov rbx, 2
  idiv rbx    ; divide rdx:rax by rbx (2), put the result in rax and the remainder in rdx

  ; check if rdx is equal to zero
  cmp rdx, 0
  jne oddNumber

  ; if (the number is even)
  ;   printf("The number %d is an even number.\n", number);
  ; else
  ;   printf("The number %d is an odd number.\n", number);

evenNumber:
  mov rdi, evenNumberString
  mov rsi, [number]
  mov rax, 0
  mov rbx, 0
  push rbx
  call printf
  pop rbx

  jmp exitProgram

oddNumber:
  mov rdi, oddNumberString
  mov rsi, [number]
  mov rax, 0
  mov rbx, 0
  push rbx
  call printf
  pop rbx

exitProgram:
  ret

section .data
  numberPrompt db "Enter a number: ", 0
  numberFormatString db "%lli", 0    ; Note:  use %d for smaller integers, but %lli works for 64-bit!
  number dq 0

  evenNumberString db "The number %lli is an even number.", 0ah, 0dh, 0
  oddNumberString db "The number %lli is an odd number.", 0ah, 0dh, 0
  