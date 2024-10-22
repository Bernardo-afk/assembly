.model small
.stack 100h

.data
    ; Defina dados se necessário.

.code
main proc 
    xor bx, bx       ; Inicializa BX em 0
    mov cl, 4        ; Número de bits a deslocar (4 bits de cada vez)

    mov ah, 1        ; Função de leitura de um caractere (int 21h)
    int 21h          ; Lê o primeiro caractere e armazena em AL

whilee:
    cmp al, 0Dh      ; Verifica se é 'Enter' (código 0Dh)
    je fim           ; Se for, vai para "fim"

    ; Verificar se é número (0-9)
    cmp al, '9'
    jg letra         ; Se for maior que '9', é letra

    ; Se for número, converte o caractere para valor numérico
    and al, 0Fh
    jmp desl

letra:
    ; Converter letra hexadecimal (A-F) para valor binário
    sub al, 37h      ; Ajusta valor para A=10, B=11, ..., F=15

desl:
    shl bx, cl       ; Desloca BX 4 bits à esquerda
    or bx, ax        ; Insere o valor de AL em BX (usar BX completo)
    
    mov ah, 1        ; Prepara para ler o próximo caractere
    int 21h          ; Lê próximo caractere
    jmp whilee       ; Volta para o loop

fim:
    ; Agora vamos exibir os 4 dígitos hexadecimais
    mov ch, 4        ; Número de dígitos a exibir
    mov cl, 4        ; Número de bits para deslocar

    mov ah, 2        ; Função de saída de caractere (int 21h)

l2: 
    mov dl, bh       ; Pega os 4 bits mais significativos (BH)
    shr dl, cl       ; Desloca 4 bits à direita para pegar o dígito correto
    
    cmp dl, 0Ah      ; Verifica se é maior ou igual a 10 (letra A)
    jae letraa       ; Se for, converte para letra
    
    add dl, 30h      ; Caso seja número (0-9), converte para ASCII
    jmp numeroo

letraa:
    add dl, 37h      ; Converte para letra (A-F)

numeroo:
    int 21h          ; Exibe o caractere
    rol bx, cl       ; Rota BX para a esquerda para o próximo dígito
    dec ch           ; Decrementa o contador de dígitos
    jnz l2           ; Se ainda há dígitos, continua o loop

    jmp fim_final    ; Vai para o fim

fim_final:
    mov ah, 4Ch      ; Terminar o programa (DOS interrupt)
    int 21h

main endp
end main
