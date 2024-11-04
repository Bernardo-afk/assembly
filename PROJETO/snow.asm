.model small
.stack 100h

.data
    msg1 db 'Bem-vindo ao jogo de Batalha Naval!', 13, 10, '$'
    msg2 db 'O tabuleiro e 20x20, com as embarcações já posicionadas aleatoriamente.', 13, 10, '$'
    msg3 db 'Digite a linha (0-19) e a coluna (0-19) separadas por espaço:', 13, 10, '$'
    msg4 db 'Voce acertou!', 13, 10, '$'
    msg5 db 'Voce errou!', 13, 10, '$'
    msg6 db 'Fim do jogo!', 13, 10, '$'
    msg7 db 'O computador venceu!', 13, 10, '$'
    msg8 db 'Voce venceu!', 13, 10, '$'

    tabuleiro db 400 dup(0)  ; Tabuleiro do jogo 20x20
    lin db ?
    col db ?
    acertos db 0 ; Contador de acertos do jogador

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Mostrar mensagem de boas-vindas
    mov ah, 9
    lea dx, msg1
    int 21h

    ; Mostrar mensagem de instruções
    mov ah, 9
    lea dx, msg2
    int 21h

    ; Inicializar o tabuleiro com embarcações aleatórias
    call inicializar_tabuleiro

    ; Loop principal do jogo
    mov cx, 100  ; Número máximo de tentativas
    mov bx, 0    ; Contador de turnos

loop_jogo:
    inc bx

    ; Mostrar mensagem para o jogador digitar coordenadas
    mov ah, 9
    lea dx, msg3
    int 21h

    ; Ler coordenadas do jogador
    mov ah, 1
    int 21h
    sub al, '0'
    mov lin, al

    mov ah, 1
    int 21h
    sub al, '0'
    mov col, al

    ; Verificar se a coordenada é válida
    cmp lin, 20
    jge invalido
    cmp col, 20
    jge invalido

    ; Verificar se o jogador acertou
    mov al, tabuleiro[lin*20 + col]
    cmp al, 1
    je acertou

    ; Se não acertou, mostrar mensagem de erro
    mov ah, 9
    lea dx, msg5
    int 21h
    jmp loop_jogo

acertou:
    ; Incrementar contador de acertos
    inc acertos

    ; Mostrar mensagem de acerto
    mov ah, 9
    lea dx, msg4
    int 21h

    ; Verificar se o jogador venceu
    cmp acertos, 20
    jge venceu

    ; Voltar ao loop principal
    jmp loop_jogo

invalido:
    ; Mostrar mensagem de coordenada inválida
    mov ah, 9
    lea dx, msg3
    int 21h
    jmp loop_jogo

venceu:
    ; Mostrar mensagem de vitória
    mov ah, 9
    lea dx, msg8
    int 21h

    ; Fim do jogo
    jmp fim_jogo

fim_jogo:
    ; Mostrar mensagem de fim do jogo
    mov ah, 9
    lea dx, msg6
    int 21h

    ; Mostrar mensagem de vitória ou derrota
    cmp acertos, 20
    jge venceu
    mov ah, 9
    lea dx, msg7
    int 21h

    ; Fim do programa
    mov ah, 4ch
    int 21h

main endp

; Procedimento para inicializar o tabuleiro com embarcações aleatórias
inicializar_tabuleiro proc
    ; Inicializar o tabuleiro com zeros
    mov cx, 400
    mov bx, offset tabuleiro
    mov al, 0
    rep stosb

    ; Posicionar embarcações aleatórias no tabuleiro
    ; (essa parte do código está omitida para brevidade)

    ret
inicializar_tabuleiro endp

end main