EOI  EQU 20H
IMR  EQU 21H
INT0 EQU 24H
N_F10 EQU 15

ORG 60
IP_F10  DW  RUT_F10

ORG 1000H
TEXTO  DB  "VAMOS LAS INTERRUPCIONES!"
FIN_TEXTO  DB  ?

ORG 3000H
RUT_F10:  PUSH AX
          PUSH BX
          MOV BX, OFFSET TEXTO
          MOV AL, OFFSET FIN_TEXTO - OFFSET TEXTO
          INT 7
          MOV AL, EOI
          OUT EOI, AL
          POP BX
          POP AX
          IRET

ORG 2000H
CLI
MOV AL, 0FEH
OUT IMR, AL
MOV AL, N_F10
OUT INT0, AL
MOV DX, 0
STI
LAZO:  JMP LAZO
INT 0
END