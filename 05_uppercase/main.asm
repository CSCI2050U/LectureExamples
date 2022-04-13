extern printf
extern scanf

global main

section .text

main:

  ; prompt the user to enter a string (message)
  ; printf("Enter a message: ");
  mov rdi, messagePrompt
  push rbx
  call printf
  pop rbx

  ; read in that string from the user
  ; scanf("%s", message);
  mov rdi, messageFormat
  mov rsi, message 
  push rbx
  call scanf
  pop rbx

  ; convert that string to uppercase
  ; convert character by character, in a loop

  ; initialization
  mov rsi, message

nextCharacter:
  mov al, [rsi]

  ; check if we need to exit the loop
  cmp al, 0
  je printResult

  ; check if the character is before the start of the lowercase alphabet (a)
  cmp al, 97
  jl skipChar

  ; check if the character is after the end of the lowercase alphabet (z)
  cmp al, 122
  jg skipChar

  ; convert one character to uppercase
  sub al, 32
  mov [rsi], al

skipChar:
  ; increment
  add rsi, 1  ; increment by the array element type size
  ; inc rsi  

  jmp nextCharacter

printResult:
  ; print the converted message
  ; printf("The message in uppercase is %s\n", message);
  mov rdi, resultFormat
  mov rsi, message 
  push rbx
  call printf 
  pop rbx

  ret

section .data
  messagePrompt db "Enter a message: ", 0

  messageFormat db "%s", 0

  resultFormat db "The message in uppercase is %s", 0ah, 0dh, 0

section .bss
  message resb 51
