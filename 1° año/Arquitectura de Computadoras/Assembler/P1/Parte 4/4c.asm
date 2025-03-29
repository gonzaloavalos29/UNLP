; ejercicio 4-C
ORG 1000H
A    DB  100
B    DB  3
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
VOLVER:  MOV RES, DX
         MOV AX, OFFSET RES ; en AX queda la dir. de donde está el resultado
         POP DX
         POP CX
         RET
         
ORG 2000H
MOV AL, A
MOV AH, B
CALL MUL

HLT
END