title repeat
.model Small 
.data
.code 


main proc 

mov cx, -1 ; iniciar contador 

mov ah,1 
l1:

int 21h 
inc cx ; incrementar contador 
cmp al,0dh

jne l1 


fim: 
mov ah,2

pl:
         mov  dl, '*'
         int  21h         ; loop imprimir '*'
         loop pl



main endp 

mov ah,4ch 
int 21h 

end main 