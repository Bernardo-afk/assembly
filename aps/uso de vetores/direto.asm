.model small 

.data 
vet db 5

.code 
main proc 

mov ax,@data
mov ds,ax 



mov bl, vet    ; passando offset para o registrador  bl 
add bl ,30h ; tranformar em numero 


mov ah,2 
mov dl,bl       ; imprimindo o conteudo de vet 
int 21h 

jmp fim 
main endp 

fim: 

mov ah,4ch 
int 21h 
end main 