section .text

GLOBAL _start

_start:

    push ebp ;Armado de Stack Frame
    mov ebp, esp

    add ebp, 12 ;apunto al null previo a los argumentos
    call findUser

    mov esp, ebp
    pop ebp ;Desarmado de Stack Frame

    call exit

    findUser:
    cmp ebp, 0 ;Si encuentro 0 o null retorno
    je .endSearch

    .searchLoop:
    add ebp, 4 ;Avanzo 4 bytes
    mov eax, [ebp] ;Guardo el puntero a la cadena
    mov ebx, busqueda ;Guardo el puntero a la busqueda
    mov ecx, 5 ;Guardo la longitud de la busqueda (si coinciden esos caracteres print)

    call strcmp
    cmp eax, 0

    je .searchLoop

    mov ecx, [ebp] ; Si lo enconre, guardo en ebx el puntero para print
    add ecx, 5 ; Sumo 5 para saltear el "USER="
    call print
    .endSearch:
    ret

    strcmp:
        push ebp ;Armado de StackFrame
        mov ebp, esp

        mov esi, eax ;Puntero a la primera cadena en esi
        mov edi, ebx ;Puntero a la segunda cadena en edi

        .loop:
        mov al, [esi]
        mov bl, [edi]
        cmp al, bl
        jne .notEqual

        inc esi
        inc edi
        dec ecx
        jnz .loop
        mov eax, 1
        jmp .endFunc

        .notEqual:
        mov eax, 0
        .endFunc:
        pop ebp
        ret

    print:
        mov eax, 4
        mov ebx, 1
        mov edx, 5
        int 80h

        ret

    exit:
        mov eax, 1
        mov ebx, 0
        int 80h

    section .data
    endString db 10, 0
    busqueda db "USER=", 10

    section .bss
    cadena resb 20