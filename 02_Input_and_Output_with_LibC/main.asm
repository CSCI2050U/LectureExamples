extern printf
extern scanf
extern exit

global main

section .text 

main:
  ; printf("Enter your cat's name: ");
  mov rdi, namePrompt
  push rbx
  call printf
  pop rbx

  ; scanf("%s", name);
  mov rdi, nameFormat 
  mov rsi, name
  push rcx ; this can be any 64-bit register
  call scanf
  pop rcx

  ; printf("Enter your cat's age: ");
  mov rdi, agePrompt
  push rbx
  call printf
  pop rbx

  ; scanf("%d", &age);
  mov rdi, ageFormat 
  mov rsi, age
  push rbx
  call scanf
  pop rbx

  ; printf("My cat (%s) is %d year old.\n");
  mov rdi, message
  mov rsi, name
  mov rdx, [age]
  push rbx
  call printf
  pop rbx

  ; exit(0);
;   mov rax, 0 ; Note: this does not follow the System V ABI (rax for argument, and no stack alignment)
;   call exit

  ret

section .data
  namePrompt db "Enter your cat's name: ", 0
  nameFormat db "%s", 0

  agePrompt db "Enter your cat's age: ", 0
  ageFormat db "%d", 0

  message db "My cat (%s) is %d year(s) old.", 0ah, 0dh, 0

section .bss
  name resb 51 
  age resq 1