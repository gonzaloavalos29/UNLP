PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H


ORG 1000H
FLAG DB 0
CHAR DB ?

ORG 3000H
SUB1: IN AL, 30H
MOV CHAR, AL
MOV BX, OFFSET CHAR
MOV AL, 1
INT 7

SUB2: IN AL, PA
AND AL, 10000000B
JZ VOLVER1
IN AL, PB
NOT AL
OUT PB, AL
VOLVER1: RET

SUB3: IN AL, 30H
CMP AL, 0
JNZ VOLVER2
MOV AL, 0
OUT PB, AL
MOV FLAG, 1
VOLVER2: RET

ORG 2000H
MOV AL, 0FFH ; 1111 1111 B
OUT CA, AL
MOV AL, 0
OUT CB, AL
LOOP:
CALL SUB1
CALL SUB2
CALL SUB3
CMP FLAG, 1
JNZ LOOP

INT 0
END