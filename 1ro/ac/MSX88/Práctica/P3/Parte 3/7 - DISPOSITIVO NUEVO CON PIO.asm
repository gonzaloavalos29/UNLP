PB EQU 31H
CB EQU 33H

EOI EQU 20H
IMR EQU 21H
INT0 EQU 24H
INT1 EQU 25H

CONT EQU 10H
COMP EQU 11H

N_CLK EQU 10
N_F10 EQU 15

ORG 40
DW RUT_CLK

ORG 60
DW RUT_F10

ORG 1000H
CADENA DB "HOLA!"
FIN_CADENA DB ?
TIEMPO DB 0
TERMINAR DB 0

ORG 3000H
RUT_F10: PUSH AX
         MOV TERMINAR, 1
         MOV AL, EOI
         OUT EOI, AL
         POP AX
         IRET

ORG 3200H
RUT_CLK: PUSH AX
         MOV TIEMPO, 1
         MOV AL, 0
         OUT CONT, AL
         MOV AL, EOI
         OUT EOI, AL
         POP AX
         IRET

ORG 3400H
ESPERAR: CLI
         MOV AL, 0FCH ; 1111 1100
         OUT IMR, AL
         MOV AL, 0
         OUT CONT, AL
         MOV TIEMPO, 0
         STI
LOOP:    CMP TERMINAR, 1
         JZ SALIR
         CMP TIEMPO, 1
         JNZ LOOP
SALIR:   CLI
         MOV AL, 0FEH
         OUT IMR, AL
         STI
         RET
ORG 2000H
          CLI
          MOV AL, 0FCH
          OUT IMR, AL
          MOV AL, N_F10
          OUT INT0, AL
          MOV AL, N_CLK
          OUT INT1, AL
          MOV AL, 0
          OUT CONT, AL
          MOV AL, 5
          OUT COMP, AL
          MOV AL, 0
          OUT CB, AL
          STI
          MOV BX, OFFSET CADENA
          MOV CL, OFFSET FIN_CADENA - OFFSET CADENA
SIGUE:     CMP TERMINAR, 1
           JZ FINALIZAR
           MOV AL, [BX]
           OUT PB, AL
           CALL ESPERAR
           INC BX
           DEC CL
           JNZ SIGUE
FINALIZAR: MOV AL, 0FFH
           OUT IMR, AL
           

INT 0
END