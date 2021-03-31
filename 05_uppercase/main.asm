extern printf
extern scanf
extern exit

global main

section .text

uppercase:
  
  ; loop over each character in 'message'
  ;   change that character to uppercase (ASCII math)
  ;   go to next character
  ; until we encounter a null terminator (character == 0)

  mov rsi, rdi
  mov bl, 'a'
  mov bh, 'z'

nextChar:
  mov al, [rsi]

  cmp al, 0       ; check for null terminator
  je endOfString  ; if null, return

  ; check to ensure that it is a lowercase letter
  cmp al, bl      ; is it before 'a'?
  jl skipCharacter

  cmp al, bh      ; is it after 'z'?
  jg skipCharacter

  ; change to uppercase
  sub al, 32
  mov [rsi], al

skipCharacter:
  inc rsi
  jmp nextChar

endOfString:
  ret 

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

  another_message db "This is a string that already has UPPERCASE letters.", 0

section .bss 

  ; limit of 100 characters, declared here uninitialized
  message resb 100