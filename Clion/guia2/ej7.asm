section .text

GLOBAL _start

_start:

    mov ebx, 4 ;offset
    mov eax, [arr]
    mov ecx, 5 ;cantidad de elementos del arreglo
    dec ecx

    compare_arr:
        mov edx, [arr + ebx]
        cmp edx, eax
        jl update_minus
        move_on:
        add ebx, 4
        dec ecx
        jnz compare_arr


    end:
        mov ebx, location
        mov ecx, lenght
        call to_string
        call print
        call exit


    update_minus:
        mov eax, edx
        jmp move_on

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
offset equ 4

arr dd 60, 20, 5, 40, 50

section .bss

location resb lenght

