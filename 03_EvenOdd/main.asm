extern printf
extern scanf

global main

section .text 

main:

  ; print a prompt asking for a number
  ; printf("Enter a number: ");
  mov rdi, numberPrompt
  push rdx
  call printf
  pop rdx

  ; read in that number
  ; scanf("%lli", &number);
  mov rdi, numberFormat
  mov rsi, number 
  push rdx
  call scanf
  pop rdx

  ; check if that number is even or odd
  ; if (number%2 == 0)
  ; idiv rdx:rax / rcx, result -> rax, remainder -> rdx
  mov rdx, 0
  mov rax, [number]
  mov rcx, 2
  idiv rcx     ; "int" division (vs. "uint" - div rcx)
  ; rdx contains either 0 or 1

  ; if/else
  cmp rdx, 0
  je printEven

  ; print the odd message
  ; printf("%lli is an odd number.\n", number);
  mov rdi, oddMessage
  mov rsi, [number]
  push rdx
  call printf
  pop rdx

  jmp exitProgram

printEven:
  ; print a message indicating even or odd
  ; printf("%lli is an even number.\n", number);
  mov rdi, evenMessage
  mov rsi, [number]
  push rdx
  call printf
  pop rdx

exitProgram:
  ret

section .data
  numberPrompt db "Enter a number: ", 0

  numberFormat db "%lli", 0 ; %lli - this is the type code for long ints (64-bit)
  number dq 0

  evenMessage db "%lli is an even number.", 0ah, 0dh, 0
  oddMessage db "%lli is an odd number.", 0ah, 0dh, 0
  
  