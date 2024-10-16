TITLE INVERTE_VETOR
.model small
.stack 100h
.data
    MSG1 db 10,13,"Insira os valores do vetor (1 por vez e de 0 a 9) $"
    MSG2 DB 10,13,"O vetor inserido foi: $"
    MSG3 db 10,13,"O vetor invertido eh: $"
    vetor db 7 DUP(?)
.code
    main proc
        
    mov ax,@data
    mov ds,ax ;Libera acesso ao data

    ;xor cx,cx ;Limpa cx
    ;mov cx,7 ;Inicializa cx com o tamanho do vetor

    xor si,si

    pegaVetor:
        
        mov ah,9
        lea dx,MSG1 ;Imprime a mensagem 1
        int 21h

        mov ah,1
        int 21h ;Pega o caracter digitado em salva em AL

        mov vetor[si],al ;Passa o caracter lido para o vetor
        inc si ;Passa para a próxima posição do vetor

        cmp si,6
        jbe pegaVetor ;Roda até a ultima posição do vetor

    mov ah,4ch
    int 21h

    main endp
    end main