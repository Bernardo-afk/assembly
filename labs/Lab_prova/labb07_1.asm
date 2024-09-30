title p1
.model SMALL 
.stack 100h
.data

msg1 db 10,13, "Digite o Digite o dividendo: $"
msg2 db 10,13 ,"Digite o divisor: $"
msg3 db 10,13 ,"Quociente: $"
msg4 db 10,13 ,"Resto: $"

.code 

main proc 


mov ax,@data
mov ds,ax


mov ah,9
lea dx,msg1   ; mostrar string do dividendo
int 21h

mov ah,1   ; pedir caractere 
int 21h 
mov dx, ax 

mov ah,9 
lea dx,msg2   ; mostrar string divisor
int 21h 

mov ah,1   ; pedir caractere 
int 21h 
mov bx, ax 




mov cx,0

l1:

sub dx,bx           ; subtrações 
inc cx              ; incrementar o contador 
jz fim 
cmp dx,31h     ; comparar para saltar se for = 1 
je fim 
loop l1



fim: 
mov ah,9
lea dx,msg3
int 21h

mov ah,2 
mov ax,dx
int 21h

jmp final



main endp 

final: 
mov ah,4ch
int 21h

end main 