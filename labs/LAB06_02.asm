title repeat

.model Small 
.data

.code 


main proc 


mov cx, 0 ; iniciar contador 


l1:

mov ah,1 
int 21h ; 
mov dl,al 
int 21h 
cmp al,0dh
jne l1  



main endp 

mov ah,4ch 
int 21h 

end main 