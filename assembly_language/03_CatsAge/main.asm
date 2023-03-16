extern printf
extern scanf

global main

section .text 

main:
  ; printf("Enter your age: ");
  mov rdi, agePrompt 
  mov rax, 0
  push rax
  call printf 
  pop rax

  ; scanf("%d", &age);
  mov rdi, ageFormat 
  mov rsi, age
  mov rax, 0
  push rdx ; it can be any 64-bit register
  call scanf 
  pop rdx

  ; add 5 to the age 
  mov rsi, [age]
  add rsi, 5

  ; print("In 5 years, you will be %d years old.\n", age);
  mov rdi, responseFormat
  ; rsi still has age + 5
  mov rax, 0
  push r8
  call printf 
  pop r8


exitProgram:
  ret

section .data
  agePrompt db "Enter your age: ", 0
  ageFormat db "%d", 0
  age dq 0

  responseFormat db "In 5 years, you will be %d years old.", 0ah, 0dh, 0