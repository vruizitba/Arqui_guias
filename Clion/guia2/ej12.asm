section .text

GLOBAL _start

_start:

    push ebp ;Armado del Stack Frame
    mov ebp, esp

    mov ecx, comienzo
    call print

    call recorrerStack

    mov esp, ebp
    pop ebp

    call exit

    recorrerStack:
    mov eax, 0 ;Contador
    mov ebp, esp ;Usamos el ebp

    .ciclo:

        mov ebx, location
        mov ecx, 10
        call toString
        call print

        add eax, 4 ;Avanzamos en el contador
        sub ebp, 4 ;Avanzamos en el stack

        mov ebx, [ebp] ;Veo el sgm fault
        jmp .ciclo

    toString:
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

    comienzo db "Iniciando el recorrido del stack", 10, 0
    lenght equ 10

    section .bss

    location resb lenght
