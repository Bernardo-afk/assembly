.model small
.stack 100h

.data
    char_é db 'é'  ; Caractere 'é' em ISO-8859-1
    buffer db 5 dup(0)  ; buffer para armazenar a entrada do usuário
.code
main proc


mov al, 21
    or al
    ; Finaliza o programa
    mov ah, 4ch
    int 21h
main endp
end main