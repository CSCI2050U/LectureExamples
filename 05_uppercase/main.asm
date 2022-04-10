extern printf
extern scanf

global main

section .text

  main:
    ; prompt the user to enter a message
    ; printf("Enter a message: ");
    mov rdi, messagePrompt
    push rbx 
    call printf 
    pop rbx

    ; read in the message
    ; scanf("%s", message);
    mov rdi, messageFormat
    mov rsi, message
    push rbx 
    call scanf 
    pop rbx

    ; convert the message to uppercase
    ; char *ptr = message;
    ; while ((*ptr) != 0) {
    ;    (*ptr) -= 32;
    ; }

    mov rsi, message

nextChar:
    ; al - lowest 8 bits of the rax (current character)
    mov al, [rsi]

    ; exit condition
    cmp al, 0
    je printResult

    ; verify that it is a lowercase character
    ; if (((*ptr) <= 122) && ((*ptr) >= 97)) {
    ; }
    cmp al, 97
    jl skipUppercase

    cmp al, 122
    jg skipUppercase

    ; convert this character to uppercase
    ; subtract 32
    sub al, 32

    ; store the new character
    mov [rsi], al

skipUppercase:
    inc rsi
    jmp nextChar

printResult:
    ; print the result message
    ; printf("The uppercase message is %s\n", message);
    mov rdi, resultMessage
    mov rsi, message
    push rbx 
    call printf 
    pop rbx

section .data
  messagePrompt db "Enter a message: ", 0

  messageFormat db "%s", 0

  resultMessage db "The uppercase message is %s", 0ah, 0dh, 0

section .bss
  message resb 51
