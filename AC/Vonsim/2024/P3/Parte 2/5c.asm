EOI EQU 20H
IMR EQU 21H
INT1 EQU 25H

CONT EQU 10H
COMP EQU 11H

N_TIMER EQU 20

ORG 80
IP_F10  DW  RUT_TIMER

ORG 1000H
TEXTO  DB  "VAMOS LAS INTERRUPCIONES!"
SALTO  DB  10
FIN  DB  ?
CANT  DB  0

ORG 3000H
RUT_TIMER:  PUSH AX
            PUSH BX
            MOV BX, OFFSET TEXTO
            MOV AL, OFFSET FIN - OFFSET TEXTO
            INT 7
            INC CANT
            CMP CANT, 1
            JNZ SIGUE
            MOV AL, 0FFH
            OUT IMR, AL
SIGUE:      MOV AL, EOI
            OUT EOI, AL
            MOV AL, 0
            OUT CONT, AL
            POP BX
            POP AX
            IRET

ORG 2000H
        CLI
        MOV AL, 0FDH
        OUT IMR, AL
        MOV AL, N_TIMER
        OUT INT1, AL
        MOV AL, 10
        OUT COMP, AL
        MOV AL, 0
        OUT CONT, AL
        STI
LAZO:   CMP CANT, 1
        JNZ LAZO

INT 0
END