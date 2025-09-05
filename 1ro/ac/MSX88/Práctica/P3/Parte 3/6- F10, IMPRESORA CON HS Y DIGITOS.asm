EOI EQU 20H
IMR EQU 21H
INT0 EQU 24H

EST EQU 41H
DATO EQU 40H

N_F10 EQU 10

ORG 40
IP_F10 DW RUT_F10

ORG 1000H
CONTADOR DB 39H
SEGUIR_ESPERANDO DB 0
MSJ_INGRESO DB "INGRESE UN NUMERO DEL 1 AL 9: "
FIN_MSJ DB ?

ORG 3200H
RUT_F10: PUSH AX
         MOV SEGUIR_ESPERANDO, 0
         MOV AL, EOI
         OUT EOI, AL
         POP AX
         IRET

ORG 3000H
LEE_DIGITO: MOV BX, OFFSET MSJ_INGRESO
            MOV AL, OFFSET FIN_MSJ - OFFSET MSJ_INGRESO
            INT 7
            MOV BX, OFFSET CONTADOR
REPITE:     INT 6
            MOV DL, CONTADOR
            CMP DL, 31H
            JS REPITE
            CMP DL, 39H
            JNS REPITE
            RET

ORG 3100H
DESCENDER: MOV BX, SP
           ADD BX, 2
           MOV DL, [BX]
POLL:      IN AL, EST
           AND AL, 1
           JNZ POLL
           MOV AL, DL
           OUT DATO, AL
           INC BX
           DEC CL
           CMP DL, 2FH
           JNZ POLL
           RET

ORG 2000H
          IN AL, EST
          AND AL, 7FH
          OUT EST, AL
          CALL LEE_DIGITO
          CLI
          MOV AL, 0FEH
          OUT IMR, AL
          MOV AL, N_F10
          OUT INT0, AL
          STI
          MOV SEGUIR_ESPERANDO, 1
ESPERA:   CMP SEGUIR_ESPERANDO, 1
          JZ ESPERA
          PUSH DX
          CALL DESCENDER
          POP DX

INT 0
END