section .text
GLOBAL _start
extern toString
extern print
extern exit

_start:

    mov eax, 1234
    mov ebx, reserva
    call toString

    call print

    mov ebx, 0
    call exit


section .bss

reserva resb 10