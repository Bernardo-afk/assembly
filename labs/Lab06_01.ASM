title While_conta
.model Small 
.data
     msg1 db 10,13, "digite caracteres : $"

.code

main proc

          mov  ax,@data
          mov  ds,ax

          mov  ah, 9
          lea  dx, msg1     ; ler msg
          int  21h

          mov  cx,0         ; Iniciar loop em 0

     l1:  
          mov  ah, 1        ; pedir entrada de caractere
          int  21h
          cmp  al, 0dh      ; Comparador CR  ( ler até entrada = cr)
          je   fim

          inc  cx           ; Incrementar o contador
          jmp  l1

     fim: 
          mov  ah, 2        ; saida de dados  para pl
     Pl:  
          mov  dl, '*'
          int  21h          ; loop imprimir '*'
          loop Pl

main endp

          mov  ah, 4ch
          int  21h

end main 
