; ejercicio 4-A
ORG 1000H
A  DB  100
B  DB  3
RES  DW  ?
ORG 3000H
MUL:     PUSH CX
         PUSH DX
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
         POP DX
         POP CX
         RET
ORG 2000H
MOV AL, A
MOV AH, B
CALL MUL
MOV RES, AX

HLT
END