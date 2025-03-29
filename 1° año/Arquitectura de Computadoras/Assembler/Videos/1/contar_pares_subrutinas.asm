ORG 1000H
VEC  DB  5, 1, 4, 3, 1, 12, 20, 5, 1, 6
CANT_PARES  DB  ?

ORG 3000H
ESPAR: AND AH, 01H
       JZ PAR
       MOV CL, 00H
       JMP FIN
PAR:   MOV CL, 0FFH
FIN:   RET

ORG 2500H
CONTAR_PARES:  MOV DL, 0
LOOP:          CMP CH, 0
               JZ FIN2
               MOV AH, [BX]
               CALL ESPAR
               CMP CL, 0FFH
               JNZ SEGUIR
               INC DL ; CONTAR
SEGUIR:        INC BX
               DEC CH
               JMP LOOP
FIN2:          RET

ORG 2000H
MOV BX, OFFSET VEC ; DIR. VEC
MOV CH, 10 ; CANT. ELEMENTOS
CALL CONTAR_PARES
MOV CANT_PARES, DL ; RESULTADO

INT 0
END