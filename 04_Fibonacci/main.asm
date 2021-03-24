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
  mov rsi, n
  mov rax, 0
  push rcx
  call scanf
  pop rcx

  ; n           - rdx
  ; count       - rax
  ; lastFib     - r11
  ; previousFib - rbx
  mov rdx, [n]
  mov r11, 1
  mov rbx, 0
  mov rax, 1

  cmp rax, rdx
  je printTheResult ; skip over the body of the loop

  mov rdi, promptFormat
  mov rsi, prompt
  mov rax, 0
  push rbx
  call printf
  pop rbx

printTheResult:
  ; printf("The result is %d.\n", r11);
  mov rdi, resultFormat
  mov rsi, r11
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
  n dq 8             ; int n = 0;

  resultFormat db "The result is %d.", 0ah, 0dh, 0
