.model small
.stack 100h

.data
msg1 db 10,13, "Digite o multiplicando $"
msg2 db 10,13, "Digite o multiplicador $"
resultado db 10,13, "resultado: $"

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Input multiplicand
    mov ah, 9
    lea dx, msg1
    int 21h

    mov ah, 1
    int 21h                 ; input character
    mov al, al
    sub al, 30h            ; convert to number

    ; Input multiplier
    mov ah, 9
    lea dx, msg2
    int 21h

    mov ah, 1
    int 21h                 ; input character
    mov cl, al
    sub cl, 30h            ; convert to number

    ; Initialize result to 0
    xor al, al

    ; Multiply using a loop
l1:
    add al, al
    dec cl
    jnz l1      

    ; Display result
    mov ah, 9
    lea dx, resultado
    int 21h

    add al, 30h      ; convert to ASCII
    mov ah, 2
    mov dl, al
    int 21h

fim:
    ; Exit program
    mov ah, 4ch
    int 21h

main endp
end main