section .text
GLOBAL _start

_start:
    mov edx, [esp]     ; Cargar argc
    test edx, edx      ; Verificar si argc es 0
    jz exit

    mov esi, esp
    add esi, 4         ; Apuntar a argv[0]

toPrintArgs:
    mov ecx, [esi]     ; Obtener dirección del argumento actual
    test ecx, ecx
    jz exit            ; Si es NULL, salir

    call print         ; Llamar a la función de impresión

    add esi, 4         ; Pasar al siguiente argumento
    dec edx            ; Reducir contador de argumentos
    jnz toPrintArgs    ; Si quedan argumentos, continuar

    call exit

print:
    push edx           ; Guardar edx (lo modificaremos)
    push ecx           ; Guardar ecx (dirección del string)

    ; Calcular la longitud del string
    mov edi, ecx       ; Copiar la dirección del string en edi
    xor eax, eax       ; Limpiar eax

find_length:
    cmp byte [edi], 0  ; Verificar si es el fin de la cadena
    jz length_found
    inc edi
    inc eax
    jmp find_length

length_found:
    mov edx, eax       ; Longitud en edx
    pop ecx            ; Restaurar ecx (dirección del string)

    ; Llamar a sys_write (imprimir string)
    mov eax, 4
    mov ebx, 1
    int 0x80

    ; Imprimir un salto de línea
    mov eax, 4
    mov ecx, endstring
    mov edx, 1
    int 0x80

    pop edx            ; Restaurar edx
    ret

exit:
    mov eax, 1
    xor ebx, ebx
    int 0x80

section .data
endstring db 10  ; Salto de línea


