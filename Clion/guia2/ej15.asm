section .text

GLOBAL _start

_start:
mov dword [tiempo], 5 ;5 segundos
mov dword [tiempo + 4], 0 ;0 nanosegundos

mov eax, 162 ;llamo a nanosleep
mov ebx, tiempo
mov ecx, 0
int 80h

mov eax, 1
mov ebx, 0
int 80h

section .bss

tiempo resb 8