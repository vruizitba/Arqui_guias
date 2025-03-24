
section .text
GLOBAL _start

_start:
    mov eax, 5
    mov ecx, 0 ; valor de retorno
    mov ebx, 1 ;entero inicial

loop:
    add ecx, ebx
    inc ebx
    cmp ebx, eax
    jbe loop

    mov [suma], ecx

    mov eax, [suma]
    lea edi, [buffer]
    call num_to_str

    ;imprimir el mensaje

    mov eax, 4
    mov ebx, 1
    lea ecx, [mensaje]
    mov edx, 6
    int 80h

    ;imprimir la suma

    mov eax, 4
    mov ebx, 1
    lea ecx, [buffer]
    mov edx, 20
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h

num_to_str:
    add edi, 20
    mov byte [edi], 0

convertir:
    dec edi
    xor edx, edx
    mov ebx, 10
    div ebx
    add dl, "0"
    mov [edi], dl

    cmp eax, 0
    jne convertir

    ret


section .data
    mensaje db "Suma: ", 0

section .bss
    suma resd 1
    buffer resb 20