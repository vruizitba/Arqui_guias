section.text

GLOBAL _start

section .dataq
    mensaje db "h4ppy c0ding", 0
    salto_linea db 10, 0

section .bss
    buffet resb 20