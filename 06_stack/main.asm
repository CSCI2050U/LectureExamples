extern printf
extern scanf
extern exit

global main

section .text

main:
  ; printf("Enter a message: ");
  mov rdi, prompt
  mov rax, 0
  push rax
  call printf
  pop rax

  ; scanf("%s", message);
  mov rdi, inputFormat
  mov rsi, message
  mov rax, 0
  push rax
  call scanf
  pop rax

  ; convert to uppercase
  ; uppercase(message);
  mov rdi, message
  push rax
  call uppercase
  pop rax

printTheResult:
  ; printf("The result is %s.\n", message);
  mov rdi, resultFormat
  mov rsi, message
  mov rax, 0
  push rbx
  call printf
  pop rbx

  ; exit(0)
  mov rax, 0
  ret ; return 0
  ; call exit


section .data

  prompt db "Enter a message: ", 0
  inputFormat db "%s", 0
  resultFormat db "The result is %s.", 0ah, 0dh, 0

