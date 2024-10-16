.model small 
.stack 100h
.code 


 main proc 
mov ax,7 

push ax

mov ax,8
push ax

pop ax
pop ax

main endp 
Fim: 
mov ah,4ch
int 21h
fim2:
end main 


