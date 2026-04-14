
section .data
    msg db 'Hola, '
    len equ $ - msg
    msg2 db 'Cual es su nombre?', 10
    len2 equ $ - msg2

section .bss
    input resb 100
    in_length resq 1
    temp_length resq 1
section .text
    global _start


_start:
    ;system call write, PREGUNTAR NOMBRE
    mov rax, 1
    mov rdi, 1
    mov rsi, msg2
    mov rdx, len2
    syscall
    ; system call read, LEER NOMBRE
    mov rax, 0 
    mov rdi, 0
    mov rsi, input
    mov rdx, 100
    syscall
    
    ;mov [in_length], rax
    push rax  ; GUARDAR LONGITUD NOMBRE EN PILA 
    ; system call write

    mov rax, 1
    mov rdi, 1
    mov rsi, msg 
    mov rdx, len
    ; pop rax
    ; mov rdx, rax
    syscall
    mov rax, 1
    mov rdi, 1
    mov rsi, input
    pop rdx
    ; pop rax
    ; mov rdx, rax
    syscall
   
    ; system call exit
    mov rax, 60
    xor rdi, rdi
    syscall
