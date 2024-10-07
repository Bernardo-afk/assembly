title ativ1


.model small 

.stack 100h




.data
msg1 db 10,13, "digite um número binário, de no máximo 16bits de entrada,  : $"

.code 


main proc 



mov ax,@data
mov ds,ax


mov ah,9
lea dx,msg1    ; ler string msg1 
int 21h 




mov ah,1
int 21h 
mov bx,ax           ; bx é o registrador de armazenamento 










 main endp 

fim : 
mov ah,4ch
int 21h 


 end main 