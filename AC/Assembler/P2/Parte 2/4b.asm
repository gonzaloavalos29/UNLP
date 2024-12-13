PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H

ORG 1000H ; Memoria de datos
MSJ  DB  "ORGANIZACION Y ARQUITECTURA DE COMPUTADORAS"
FIN  DB  ?

ORG 3000H
INI_PIO:  MOV AL, 0FDH ; strobe salida (0) y busy entrada (1)
          OUT CA, AL
          MOV AL, 0  ; puerto de datos todo salida
          OUT CB, AL
          RET

ORG 3100H
POLL:  IN AL, PA
       AND AL, 1
       JNZ POLL
       RET

ORG 3200H
STROBE0:  IN AL, PA ; Envío 0
          AND AL, 0FDH
          OUT PA, AL
          RET

ORG 3300H
STROBE1:  IN AL, PA ; Envío 1
          OR AL, 02H
          OUT PA, AL
          RET

ORG 3500H
IMPRIMIR_CARACTER:  PUSH AX
                    CALL POLL
                    POP AX
                    OUT PB, AL
                    CALL STROBE1
                    CALL STROBE0
                    RET
ORG 2000H ; PROG PRINCIPAL
CALL  INI_PIO
CALL  STROBE0
MOV BX, OFFSET MSJ
MOV CL, OFFSET FIN - OFFSET MSJ
LAZO:  MOV AL, [BX]
CALL IMPRIMIR_CARACTER
INC BX
DEC CL
JNZ LAZO

INT 0
END