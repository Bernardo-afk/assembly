.model small

.data
    msg  db 10,13, "Ola $"

.code

main proc


         mov ax,@data
         mov ds,ax


         mov ah,9
         lea dx,msg
         int 21h
         jmp Fim

main endp
    Fim: 
         mov ah,4ch
         int 21h

end main 
