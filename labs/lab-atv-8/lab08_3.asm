.MODEL SMALL
.STACK 100h
.CODE
START:
    XOR BX, BX        ; Inicializa BX com 0

ReadChar:
    MOV AH, 01h       ; Ler caractere do teclado
    INT 21h           ; Chama interrupção
    CMP AL, 0Dh       ; Verifica se é Enter (CR - 0Dh)
    JE EndProgram     ; Se for Enter, finaliza o programa

    CMP AL, '9'       ; Verifica se é um dígito 0-9
    JG IsAlpha        ; Se for maior que 9, verifica se é A-F
    SUB AL, '0'       ; Converte dígito 0-9 para valor numérico
    JMP ConvertDone   ; Pula para o fim da conversão

IsAlpha:
    SUB AL, 'A'-10    ; Converte letra A-F para valor numérico

ConvertDone:
    SHL BX, 4         ; Desloca BX 4 bits à esquerda
    OR BX, AX         ; Insere o valor convertido nos 4 bits inferiores
    JMP ReadChar      ; Repete para o próximo caractere

EndProgram:
    MOV AH, 4Ch       ; Função para encerrar o programa
    INT 21h           ; Interrupção para sair
END START
