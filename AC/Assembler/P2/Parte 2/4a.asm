PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H

ORG 1000H ; Memoria de datos
CHAR DB "A"

ORG 3000H
INI_PIO: MOV AL, 0FDH ; Strobe salida (0), busy entrada (1)
         OUT CA, AL
         MOV AL, 0 ; Puerto de datos todo salida
         OUT CB, AL
         ret
ORG 3100H
POLL:  IN AL, PA
       AND AL, 1
       JNZ POLL
       RET

ORG 3200H
FLANCO_ASCENDENTE:  IN AL, PA ; Primero envío 0 y luego 1
                    AND AL, 0FDH
                    OUT PA, AL
                    IN AL, PA
                    OR AL, 02H
                    OUT PA, AL
                    RET

ORG 3300H
IMPRIMIR_CARACTER: PUSH AX
                   CALL POLL
                   POP AX
                   OUT PB, AL
                   CALL FLANCO_ASCENDENTE
                   RET

ORG 2000H ; Prog principal
CALL INI_PIO
MOV AL, CHAR
CALL IMPRIMIR_CARACTER

INT 0
END