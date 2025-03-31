section .text

GLOBAL _start

_start:
    mov ecx, [esp]
    jz exit

    mov esi, esp
    add esi, 4
    mov ebx, 4

toPrintArgs:
    push ecx
    mov edi, [esi + ebx]

    mov ecx, edi
    call print

    pop ecx
    add ebx, 4
    dec ecx
    jnz toPrintArgs

    call exit

print:
    mov eax, 4
    mov ebx, 1
    mov edx, 50
    int 80h

    mov eax, 4
    mov ecx, endtring
    mov ebx, 1
    mov edx, 1
    int 80h
    ret

exit:
    mov eax, 1
    xor ebx, ebx
    int 0x80

section .data

endtring db 10, 0

section .bss

