.model small
.stack 100h
.code


main proc

          mov  ah,1
          int  21h
          and  al, 0fh
          mov  cx,8

          xor  bl, bl
    l1:   
          shl  al,1
          jc   soma
          loop l1
    soma: 
          inc  bl
          cmp  cx, 0
          jnz  l1
          sar  bl, 1
          jc   impar
          mov  ah, 2
          mov  dl, 2
          add  dl, 30h
          int  21h
          jmp  fim
    impar:
          mov  ah, 2
          mov  dl, 1
          add  dl, 30h
          int  21h
    fim:  
          mov  ah,4ch
          int  21h
main endp
end main 