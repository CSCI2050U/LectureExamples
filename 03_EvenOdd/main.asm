extern printf
extern scanf
extern exit

global main

section .text

main:
  ; printf("%s", "Enter a number: ");
  mov rdi, promptFormat
  mov rsi, prompt
  mov rax, 0
  push rbx
  call printf
  pop rbx

  ; scanf("%d", &number);
  mov rdi, inputFormat
  mov rsi, number
  mov rax, 0
  push rcx
  call scanf
  pop rcx

  ; divide the number by 2
  mov rax, [number]
  mov rdx, 0
  mov rbx, 2
  idiv rbx
  ; rax - quotient
  ; rdx - remainder

  ; check if the remainder is 0 (if so, even)
  cmp rdx, 0
  jne oddNumber

  ; printf("The number %d is even.\n", number);
  mov rdi, evenMessage
  mov rsi, [number]
  mov rax, 0
  push rbx
  call printf
  pop rbx
  jmp endOfProgram

oddNumber:
  ; printf("The number %d is odd.\n", number);
  mov rdi, oddMessage
  mov rsi, [number]
  mov rax, 0
  push rbx
  call printf
  pop rbx

endOfProgram:
  ; exit(0)
  mov rax, 0
  call exit

section .data
  promptFormat db "%s", 0
  prompt db "Enter a number: ", 0

  inputFormat db "%d", 0
  number dq 0             ; int number = 0;

  evenMessage db "The number %d is even.", 0ah, 0dh, 0
  oddMessage db "The number %d is odd.", 0ah, 0dh, 0
