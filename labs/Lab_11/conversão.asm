title conversão 

.model small 

move_XY macro x,y       

            push ax
            push bx
            push cx             ; push para não perder o que estava acontecendo antes 
            push dx

            mov  ah,2
            mov  dh,y                   ;     posiciona o curor na tela de texto na cordenada x,y
            mov  dl,x
            int  10h

            pop  dx
            pop  cx                 ; pop para voltar ao que estava acontecendo anteriormente 
            pop  bx
            pop  ax
endm









.data 


home db 10,13 , "Qual sera a base do primeiro numero inserido ? $"
msg1 db 10,13 , "Digite 1 - Binario $ "
msg2 db 10,13 , "Digite 2 - hexa $ "
msg3 db 10,13 , "Digite 3 - decimal $ "

home2 db 10,13 , "Digite qual base você quer que o número apareça 4"
msg4 db 10,13 , "Digite 1 - Binario $ "
msg5 db 10,13 , "Digite 2 - hexa $ "
msg6 db 10,13 , "Digite 3 - decimal $ "

Numero_convertido db 10,13, "O novo número é ; $"

Entrada_numero db 10,13, "Digite o número : $"
.code 


main proc 

mov ax,@data    ; 
mov ds,ax

    move_XY  25,0 

call chamada






chamada proc 
                        MOV      AH,0               ; limpa tela 
                        MOV      AL,3
                        INT      10H
mov ah,9
lea dx, home 
int 21h 


mov ah,9
lea dx, msg1 
int 21h 

mov ah,9
lea dx, msg2
int 21h 

mov ah,9
lea dx, msg3
int 21h 


mov ah,2            ; pula linha 
mov dl, 10
int 21h 


mov ah,1 ; pegar numero 
int 21h 
mov bl,al   ; salvar em bl 



                             MOV      AH,0
                            MOV      AL,3           ; limpar tela 
                            INT      10H
                             move_XY  25,0 



cmp bl,2   ; ver qual é o número de entrada 
je hexa
;jg decimal 
;jl binario 



; saltos para pegar a entrada 


hexa : 

lea dx,Entrada_numero
mov ah,9
int 21h 





ret 
chamada endp



















main endp 
fim: mov ah,4Ch
 int 21h 
end main 