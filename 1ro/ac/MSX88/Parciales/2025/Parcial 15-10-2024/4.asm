ID_CLK EQU 4
CONT EQU 10H
COMP EQU 11H
EOI EQU 20H
IMR EQU 21H
INT1 EQU 25H
PB EQU 31H
CB EQU 33H

ORG 1000H
MSJNRO DB "Ingrese el nro de luz que nunca se encendio: "
GANASTE DB "GANASTE"
SECUENCIA DB 00000001B, 00000100B, 00000010B, 00001000B, 10000000B, 00100000B, 00010000B
NO_PRENDE DB 6
NROINGRESADO DB ?
FLAG DB 0

ORG 16
DIR_CLK DW RUT_CLK

ORG 3000H
RUT_CLK:   CMP CL, 0
           JZ FIN
           MOV AL, [BX]
           OUT PB, AL
           INC BX
           DEC CL
FIN:       MOV AL, 11111111B
           OUT IMR, AL
           MOV AL, 0
           OUT CONT, AL
           MOV AL, 20H
           OUT EOI, AL
           IRET

ORG 2000H
            MOV BX, OFFSET SECUENCIA
            MOV AL, OFFSET NO_PRENDE - OFFSET SECUENCIA
            CLI
            MOV AL, 11111101B
            OUT IMR, AL
            MOV AL, 0
            OUT CONT, AL
            MOV AL, 1
            OUT COMP, AL
            MOV AL, ID_CLK
            OUT INT1, AL
            STI
            MOV FLAG, 0
ESPERA_FIN: CMP FLAG, 1
            JNZ ESPERA_FIN
    
            MOV BX, OFFSET MSJNRO
            MOV AL, OFFSET GANASTE - OFFSET MSJNRO
            INT 7
            MOV BX, OFFSET NROINGRESADO
            INT 6
            MOV AL, [BX]
            CMP AL, NO_PRENDE
            JZ GANA
            JMP TERMINAR
    GANA:   MOV BX, OFFSET GANASTE
            MOV AL, OFFSET SECUENCIA - OFFSET GANASTE
            INT 7
TERMINAR:   INT 0
            END
