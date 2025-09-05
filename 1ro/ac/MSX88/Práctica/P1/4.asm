; ejercicio 2
ORG 1000H
MENSAJE  DB  "HOLA, BUEN DIA"
FIN      DB  ?

ORG 2000H
        MOV BX, OFFSET MENSAJE
        MOV CL, OFFSET FIN - OFFSET MENSAJE
        INT 7
        MOV AL, 41H ; "A"
        MOV AH, 5AH ; "Z"
SIGO:   MOV CH, [BX]
        CMP CH, AL
        JS NO_ES
        ADD BYTE PTR [BX], 20H
NO_ES:  INC BX
        DEC CL
        JNZ SIGO

HLT
END