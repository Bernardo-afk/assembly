.model small
.data
;; prograna que vai ler a diagonal principal de uma matriz 4x4 tamanho db 

mat db 1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1


.code



main proc



mov ax,@data 
mov ds,ax

call calc 



mov ah,4ch
int 21h


calc proc 



xor ax, ax 

lea si, mat 
mov cx,4

p1: 

mov dl,[si]
add dl,30h
mov ah, 2  
int 21h 

add si,5

loop p1


ret
calc endp 




main endp
end main 