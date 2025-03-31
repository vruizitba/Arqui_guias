section .text
    global _start

_start:
    ; Llamar a fork
    mov eax, 2        ; Syscall fork (número 2 en 32 bits)
    int 0x80          ; Llamada al kernel

    cmp eax, 0
    je hijo           ; Si eax == 0, es el proceso hijo
    jmp padre         ; Si eax > 0, es el proceso padre

hijo:
    ; Imprimir "Soy el hijo"
    mov eax, 4        ; Syscall write
    mov ebx, 1        ; File descriptor: STDOUT
    mov ecx, mensaje_hijo
    mov edx, long_hijo
    int 0x80
    jmp salir

padre:
    ; Imprimir "Soy el padre"
    mov eax, 4        ; Syscall write
    mov ebx, 1        ; File descriptor: STDOUT
    mov ecx, mensaje_padre
    mov edx, long_padre
    int 0x80

salir:
    ; Terminar proceso con exit
    mov eax, 1        ; Syscall exit
    xor ebx, ebx      ; Código de salida 0
    int 0x80

section .data
    mensaje_hijo db "Soy el hijo", 10
    long_hijo equ $ - mensaje_hijo

    mensaje_padre db "Soy el padre", 10
    long_padre equ $ - mensaje_padre
