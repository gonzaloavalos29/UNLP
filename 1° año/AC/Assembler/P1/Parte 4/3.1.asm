; ejercicio 3-1
ORG 1000H
MENSAJE  DB  "hola, buen dia"
LETRA  DB  "a"
CANT  DB  ?

ORG 3000H
CONTAR_CAR:  MOV CL, 0
SIGO:        MOV CH, [BX]
             CMP CH, AH
             JNZ SALTAR
             INC CL
SALTAR:      INC BX
             DEC AL
             JNZ SIGO
             RET

ORG 2000H
MOV BX, OFFSET MENSAJE
MOV AL, OFFSET LETRA - OFFSET MENSAJE
MOV AH, LETRA
CALL CONTAR_CAR
MOV CANT, CL

HLT
END