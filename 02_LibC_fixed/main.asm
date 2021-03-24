extern printf
extern scanf
extern exit

global main

section .text

main:
  ; this is the following C program:

  ; int number = 0;
  ; printf("Enter a number: ");
  ; scanf("%d", &number);
  ; number = number * number;
  ; printf("The result is %d.\n", number);

  ; printf("%s", "Enter a number: ");
  ; arguments:  
  ;   rdi - first argument
  ;   rsi - second argument
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

  ; number = number * number;
  mov rax, [number]
  imul rax   ; signed numbers (use mul for unsigned)

  ; printf("The result is %d.\n", number);
  mov rdi, resultFormat
  mov rsi, rax
  mov rax, 0
  push rbx
  call printf
  pop rbx

  ; exit(0)
  mov rax, 0
  call exit

section .data
  promptFormat db "%s", 0
  prompt db "Enter a number: ", 0

  inputFormat db "%d", 0
  number dq 0             ; int number = 0;

  resultFormat db "The result is %d.", 0ah, 0dh, 0
