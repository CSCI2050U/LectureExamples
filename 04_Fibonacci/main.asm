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

  ; n             - rdx
  ; count (index) - rax
  ; lastFib       - r11
  ; previousFib   - rbx
  mov rdx, [n]  ; n (which fibonacci number do we want)
  mov rax, 1    ; count (index)
  mov r11, 1    ; newest fibonacci number
  mov rbx, 0    ; older fibonacci number

loopStart:
  cmp rax, rdx      ; while (count != n)
  je printTheResult ; skip over the body of the loop

  ; calculate some fibs
  mov rcx, r11      ; remember the previous fibonacci number 
  add r11, rbx      ; r11 += rbx
  mov rbx, rcx      ; rbx = temp

  add rax, 1        ; count++

  jmp loopStart

  ; index: 0, 1, 2, 3, 4, 5, 6,  7,  8
  ; fib:   0, 1, 1, 2, 3, 5, 8, 13, 21

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
  n dq 0             ; int n = 0;

  resultFormat db "The result is %d.", 0ah, 0dh, 0
