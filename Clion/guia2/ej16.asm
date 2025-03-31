section .text

GLOBAL _start

_start:
    push ebp
    mov ebp, esp

    mov ecx, initMsg
    call print

    mov eax, 3
    mov ebx, 0
    mov ecx, buffer ;Direccion donde se guardara el ingerso
    mov edx, 256 ;Long max de lectura
    int 80h

    mov ebx, buffer
    call strlen


    //y aca deberia hacer el resto





section .data

initMsg db "Ingrese la palabra: ", 10

section .bss

buffer resb 256
cadena resb 20