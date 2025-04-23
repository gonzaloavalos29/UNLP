IMR EQU 21H
EOI EQU 20H
INT0 EQU 24H
N_F10 EQU 10H

ORG 40
DW RUT_F10

ORG 1000H
FINALIZADO DB 0
NUM DB ?

ORG 3200H
RUT_F10: PUSH AX
         MOV FINALIZADO, 1
         MOV AL, 0FFH
         OUT IMR, AL
         MOV AL, EOI
         OUT EOI, AL
         POP AX
         IRET

ORG 2000H
         CLI
         MOV AL, 0FEH ; 1111 1110
         OUT IMR, AL
         MOV AL, N_F10
         OUT INT0, AL
         STI
         MOV DL, '0'
LOOP:    CMP FINALIZADO, 1
         JZ ELEGIDO
         INC DL
         CMP DL, '9'
         JNZ LOOP
         MOV DL, '0'
         JMP LOOP
ELEGIDO: MOV BX, OFFSET NUM
         MOV [BX], DL
         MOV AL, 1
         INT 7
INT 0
END