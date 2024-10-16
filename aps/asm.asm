.model small
.stack 100h
.data
    vet db 5,4,3 dup(2,3 dup(2),1) ; Definindo o vetor

.code
main proc
    mov ax, @data
    mov ds, ax

    xor si, si             ; SI será o índice para percorrer o vetor
    mov cx, 16             ; CX será o contador do loop (tamanho do vetor)
      lea bx,vet
l1:
    mov al, [vet + si]      ; Carrega o valor do vetor em AL           ; Converte para o equivalente em ASCII
    mov ah, 2          ; Função para mostrar caractere na tela (INT 21h)
    int 21h

    inc si                  ; Avança para o próximo valor do vetor
    loop l1                 ; Decrementa CX e repete o loop enquanto CX != 0

fim:
    mov ah, 4Ch             ; Função para terminar o programa
    int 21h
main endp

end main
