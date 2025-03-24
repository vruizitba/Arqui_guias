section.text

GLOBAL _start

_start:
    mov ecx, 0
    call loop

    mov ecx, cadena
    mov edx, longitud
    call print

    call exit

loop:
    mov AL, [cadena + ecx]
    cmp AL, 10 ; comparto con /n
    jne checkMin
    ret

checkMin:
    cmp AL, "a"
    jae checkMax
    inc ecx
    call loop
    ret

checkMax:
    cmp AL, "z"
    jbe modify
    inc ecx
    call loop
    ret

modify:
    sub byte[cadena + ecx], 32
    inc ecx
    call loop
    ret

print:
    mov ebx, 1
    mov eax, 4
    int 80h
    ret

exit:
    mov eax, 1
    mov ebx, 0
    int 80h

section .data
    cadena db "h4ppy c0ding", 10
    longitud equ $-cadena
