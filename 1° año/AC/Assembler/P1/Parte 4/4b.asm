; ejercicio 4-B
ORG 1000H
A    DB  2
B    DB  3
RES  DW  ?
ORG 3000H
MUL:     PUSH CX
         PUSH DX
         PUSH DX
         MOV BX, SP
         ADD BX, 10
         MOV BX, [BX]
         MOV AL, [BX]
         MOV BX, SP
         ADD BX, 8
         MOV BX, [BX]
         MOV AH, [BX]
         CMP AL, 0
         JZ VOLVER
         CMP AH, 0
         JZ VOLVER
         MOV CH, 0
         MOV CL, AL
         MOV DX, 0
LOOP:    ADD DX, CX
         DEC AH
         JNZ LOOP
VOLVER:  MOV AX, DX
         
ORG 2000H
MOV BX, OFFSET A
PUSH BX
MOV BX, OFFSET B
PUSH BX
CALL MUL
POP BX
POP BX
MOV RES, AX

HLT
END