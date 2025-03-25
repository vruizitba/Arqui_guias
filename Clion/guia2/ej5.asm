
section .text

GLOBAL _start

_start:

    mov word [k], 4 ;valor k
    mov word [value], 25 ; valor n
    mov word [result], 0 ; primer valor a imprimir

loop:
    call nextMult
    call print
    dec word [k]
    cmp word [k], 0
    jne loop

    call exit;

nextMult:
    mov ax, [result]
    add ax, [value]
    mov [result], ax
    ret

print:
    mov ax, [result]
    lea edi, [buffer]
    call num_to_str

    mov eax, 4
    mov ebx, 1
    lea ecx, [buffer]
    mov edx, 20
    int 80h

    ret


exit:
    mov eax, 1
    mov ebx, 0
    int 80h

    ret

num_to_str:
    add edi, 20
    mov byte [edi], 10

convertir:
    dec edi
    xor edx, edx
    mov bx, 10
    div bx
    add dl, "0"
    mov [edi], dl

    cmp eax, 0
    jne convertir

    ret

section .bss
    result resb 2
    value resb 2
    k resb 2
    buffer resb 20
