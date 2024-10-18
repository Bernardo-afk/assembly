.model samll 


.data 

b db 10,13, "digite um número binario "

.code 

manin proc 

mova x,@data
mov ds,ax


mov ah,9 
lea dx,b
int 21h 

mov ah,