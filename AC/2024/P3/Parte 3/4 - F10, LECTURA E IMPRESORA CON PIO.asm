PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H

EOI EQU 20H
IMR EQU 21H
INT0 EQU 24H
N_F10 EQU 10

ORG 40
DW RUT_F10

ORG 1000H
MSJ_EMPEZAR DB "PRESIONE F10 PARA COMENZAR"
FIN_MSJ_EMPEZAR DB ?
EMPEZAR DB 0
MENSAJE DB ?

ORG 3000H
CONFIG_PIO: MOV AL, 0FDH ; 1111 1101
            OUT CA, AL
            MOV AL, 0
            OUT CB, AL
            ; INICIALIZO STROBE EN 0
            IN AL, PA
            AND AL, 0FDH
            OUT PA, AL
            RET

ORG 3200H
RUT_F10: PUSH AX
         MOV EMPEZAR, 1
         MOV AL, EOI
         OUT EOI, AL
         POP AX
         IRET
ORG 3400H
LEER_CADENA: INT 6
             INC BX
             DEC CL
             JNZ LEER_CADENA
             RET

ORG 3600H
IMPRIMIR: MOV BX, SP
          ADD BX, 2
          MOV CL, [BX]
          ADD BX, 2
          MOV BX, [BX]

    POLL: IN AL, PA
          AND AL, 1 ; 1000 0000
          JNZ POLL
    
          MOV AL, [BX]
          OUT PB, AL
    
          ; MANDAR FLANCO ASCENDENTE DE STROBE
          IN AL, PA
          OR AL, 2
          OUT PA, AL
          ; STROBE EN 0
          IN AL, PA
          AND AL, 0FDH
          OUT PA, AL
    
          INC BX
          DEC CL
          JNZ POLL
          RET

ORG 2000H
MOV BX, OFFSET MSJ_EMPEZAR
MOV AL, OFFSET FIN_MSJ_EMPEZAR - OFFSET MSJ_EMPEZAR
INT 7
CLI
MOV AL, 0FEH
OUT IMR, AL
MOV AL, N_F10
OUT INT0, AL
STI
ESPERA: CMP EMPEZAR, 0
        JZ ESPERA

        CALL CONFIG_PIO

        MOV BX, OFFSET MENSAJE
        MOV CL, 10
        CALL LEER_CADENA

        MOV BX, OFFSET MENSAJE
        PUSH BX
        MOV CL, 10
        PUSH CX
        CALL IMPRIMIR
        POP CX
        POP AX

INT 0
END