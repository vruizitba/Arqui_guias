section .text

GLOBAL _start

_start:
    mov ebp, esp
    mov eax, [ebp]
    dec eax    

    mov ebx, location
    mov ecx, lenght
    call to_string
    call print
    call exit
    
to_string:
    add ebx, ecx
    dec ebx
    mov byte [ebx], 10 ;salto de linea
    dec ebx
    loop:
        xor edx, edx
        push ecx
        mov ecx, 10
        div ecx
        pop ecx
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
    mov edx, lenght
    int 80h

    ret

exit:
    mov eax, 1
    mov ebx, 0
    int 80h




section .data

lenght equ 10

section .bss

location resb lenght
