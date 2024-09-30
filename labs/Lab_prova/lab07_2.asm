.title p2
.model small 
.stack 100h

.data

msg1 db 10,13, "Digite o multiplicando"
msg2 db 10,13, "Digite o multiplicador"




.code 

main proc 



mov ax,@data
mov ds,ax           

mov ah,9
lea dx, msg1
int 21h 

mov ah,2 
int 21h                 ; entrada de caractere 
sub al , 30h            ; 
mov bl, al      



main endp

final:

mov ah,4ch
int 21h

end main 