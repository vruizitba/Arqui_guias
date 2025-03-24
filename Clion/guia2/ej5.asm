
section .text

GLOBAL _start

_start:

    mov [k], 4 ;valor k
    mov [value], 25 ; valor n
    mov ecx, 1 ; primer valor a imprimir
    mov edx, 0 ;contador


loop:
    call nextMult ;pone en edx el proximo multiplo
    dec [k]
    cmp [k], 0
    jne loop

    call exit;

nextMult:
    mov eax, [value]
    mov ebx, ecx
    div ebx
    inc ecx
    cmp ebx, 0
    jne nextMult
    ret

toPrint:


exit:
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

section .bss
    result resb 2
    rest resb 2
    value resb 2
    k resb 2
    buffer resb 20
