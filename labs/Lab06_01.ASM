title While_conta
.model Small 


.data 

.code 



main proc 

    mov cx,0 ; Iniciar loop em 0 

read_loop:
    mov ah, 01h
    int 21h
    cmp al, 0dh ; CR character
    je end_loop

    inc cx ; increment loop counter
    jmp read_loop

end_loop:
    mov ah, 02h
print_loop:
    mov dl, '*'
    int 21h
    loop print_loop




main endp 

mov ah, 4ch 
int 21h

end main 
