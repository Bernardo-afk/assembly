.MODEL SMALL
.STACK 100h
.DATA
    vet DB 'aeioubbbbbbbbbbbbbbb' ; vetor de caracteres (tamanho 20)
    vogal DB 'AEIOUaeiou'         ; vogais maiúsculas e minúsculas (10 vogais)
    msg DB 'Numero de vogais: $'
    contagem DB ?                 ; variável para armazenar a contagem de vogais

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Chama a função de contagem de vogais
    CALL calc

    ; Imprime a mensagem
    MOV DX, OFFSET msg
    MOV AH, 09h
    INT 21h

    ; Converte o valor de contagem para caractere ASCII
    MOV AL, contagem
    ADD AL, '0'           ; Converte contagem para ASCII
    MOV DL, AL
    MOV AH, 02h
    INT 21h               ; Imprime a contagem

    ; Termina o programa
    MOV AH, 4Ch
    INT 21h
MAIN ENDP

; Procedimento para contar vogais no vetor `vet`
calc PROC
    MOV CX, 20            ; Contador para 20 caracteres de `vet`
    XOR DI, DI            ; Índice para o vetor `vet`
    XOR BL, BL            ; Contador de vogais

LOOP_VET:
    MOV AL, vet[DI]       ; Carrega o caractere atual de `vet` em AL
    MOV SI, OFFSET vogal  ; Aponta para o início do array `vogal`
    MOV DX, 10            ; Número de vogais para verificar

LOOP_VOGAL:
    CMP AL, [SI]          ; Compara o caractere atual com cada vogal
    JE INC_VOGAL          ; Se for igual, incrementa a contagem
    INC SI                ; Passa para a próxima vogal
    DEC DX
    JNZ LOOP_VOGAL        ; Repete para as 10 vogais

NEXT_CHAR:
    INC DI                ; Avança para o próximo caractere em `vet`
    LOOP LOOP_VET         ; Repete para os 20 caracteres de `vet`
    JMP FIM

INC_VOGAL:
    INC BL                ; Incrementa o contador de vogais
    JMP NEXT_CHAR         ; Continua para o próximo caractere em `vet`

FIM:
    MOV contagem, BL      ; Armazena a contagem de vogais em `contagem`
    RET
calc ENDP
END MAIN
