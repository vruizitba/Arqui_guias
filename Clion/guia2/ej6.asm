
section .text

GLOBAL _start

_start:
    mov word [value], 8 ;numero n donde sera el factorial
    mov ebx, [value]
    mov word [toReturn], 1 ;valor de retorno
    mov word [nextMult], 1

factorial:
   call multiplicacion
   inc word [nextMult]
   dec ebx
   jnz factorial

print:

    mov eax, 4
    mov ebx, 1
    lea ecx, [buffer]
    mov edx, 20
    int 80h

exit:
    mov eax, 1
    mov ebx, 0
    int 80h

multiplicacion:
    pusha
    mov ebx, [toReturn]
    mov eax, [toReturn]
    mov edx, [nextMult]
    loop:
        add ebx, edx
        dec eax
        jnz loop

    mov word [toReturn], ebx

    popa

    ret

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

toReturn resb 2
value resb 2
nextMult resb 2
buffer resb 20