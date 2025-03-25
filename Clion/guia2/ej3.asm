section .text

GLOBAL _start

_start:
    mov eax, [number]
    mov ebx, location
    mov ecx, length
    call to_string
    call print
    call exit

to_string:
    add ebx, ecx
    dec ebx
    mov byte [ebx], 10  ; Pongo el salto de linea
    dec ebx
    loop:
        xor edx, edx
        div ecx
        add edx, '0'
        mov byte [ebx], dl
        dec ebx
        test eax, eax
        jnz loop

        ret

print:
    mov eax, 4
    mov ebx, 1
    mov ecx, location
    mov edx, length
    int 0x80

    ret

exit:
    mov eax, 1
    mov ebx, 0
    int 0x80


section .data

number dq 123456789
length equ 10       ; Se define arbitrariamente 10, pues el lenguaje no permite hacerlo dinámicamente


section .bss
location resb length