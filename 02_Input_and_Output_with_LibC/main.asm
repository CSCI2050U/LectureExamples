extern printf
extern scanf
; extern exit

global main

section .text 

main:
  ; printf("Enter your cat's name: ");
  mov rdi, namePrompt
  mov rax, 0 ; unnecessary, but this is where the return value will go
  mov rbx, 0 ; unnecessary, but if it makes you feel better :)
  push rbx
  call printf
  pop rbx

  ; scanf("%s", lennyName);
  mov rdi, nameFormatString
  mov rsi, lennyName
  mov rax, 0
  mov rbx, 0
  push rbx
  call scanf
  pop rbx

  ; printf("Enter your cat's age: ");
  mov rdi, agePrompt
  mov rax, 0
  mov rbx, 0
  push rbx
  call printf
  pop rbx

  ; scanf("%d", lennyAge);
  mov rdi, ageFormatString
  mov rsi, lennyAge ; do not use [], since scanf wants the address (pass by reference)
  mov rax, 0
  mov rbx, 0
  push rbx
  call scanf
  pop rbx

  ; printf("My cat %s is %d year(s) old.\n", lennyName, lennyAge);
  mov rdi, formatString
  mov rsi, lennyName
  mov rdx, [lennyAge]
  mov rax, 0
  mov rbx, 0
  push rbx
  call printf
  pop rbx

  ; exit(0)
  ; mov rax, 0
  ; call exit

  ret

section .data
  namePrompt db "Enter your cat's name: ", 0
  nameFormatString db "%s", 0

  agePrompt db "Enter your cat's age: ", 0
  ageFormatString db "%d", 0

  formatString db "My cat %s is %d year(s) old.", 0ah, 0dh, 0

section .bss
  lennyName resb 51
  lennyAge resq 1