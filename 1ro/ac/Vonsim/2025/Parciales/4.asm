ID_TIMER EQU 10
EOI EQU 30H
IMR EQU 31H
PB EQU 21H
CB EQU 23H
INT1 EQU 25H
CONT EQU 10H
COMP EQU 11H

ORG 1000H
MSJ_NRO   DB "Ingrese el nro de luz que nunca se encendio: ", 0
GANASTE   DB "GANASTE", 0
PERDISTE  DB "PERDISTE", 0
SECUENCIA DB 00000001B, 00000100B, 00000010B, 00001000B, 10000000B, 00100000B, 00010000B
NO_PRENDE DB 6
RESPUESTA DB ?
FLAG      DB 0

; Vector de interrupciones
ORG 40H
DW RUT_TIMER

; Rutina del timer
ORG 3000H
RUT_TIMER:
    MOV AL, 0
    OUT CONT, AL          ; Apagar el timer
    MOV AL, 20H
    OUT EOI, AL
    MOV FLAG, 1
    IRET

; Subrutina para esperar 1 segundo
ORG 3100H
ESPERAR_SEG:
    MOV FLAG, 0
    MOV AL, 8
    OUT COMP, AL          ; Valor para 1 segundo
    MOV AL, 0
    OUT CONT, AL          ; Iniciar timer
ESPERAR_LOOP:
    CMP FLAG, 1
    JNZ ESPERAR_LOOP
    RET

; Programa principal
ORG 2000H
CLI
MOV AL, 0FDH             ; Habilitar solo interrupción de timer
OUT IMR, AL
MOV AL, ID_TIMER
OUT INT1, AL
MOV AL, 0
OUT CONT, AL
MOV AL, 8
OUT COMP, AL
STI

; Apagar todas las luces
MOV AL, 0
OUT PB, AL

; Mostrar la secuencia de luces (7 luces, 1 por segundo)
MOV BX, OFFSET SECUENCIA
MOV CL, 7
MOSTRAR_LUZ:
    MOV AL, [BX]
    OUT PB, AL
    CALL ESPERAR_SEG
    INC BX
    DEC CL
    JNZ MOSTRAR_LUZ

; Apagar luces
MOV AL, 0
OUT PB, AL

; Mostrar mensaje
MOV BX, OFFSET MSJ_NRO
MOV AL, 40
INT 7

; Leer número del usuario
MOV BX, OFFSET RESPUESTA
INT 6

; Convertir ASCII a número
MOV AL, RESPUESTA
SUB AL, '0'
MOV RESPUESTA, AL

; Comparar con la luz que no prendió
MOV AL, NO_PRENDE
CMP AL, RESPUESTA
JNZ PERDIO

; Ganó
MOV BX, OFFSET GANASTE
MOV AL, 10
INT 7
JMP FIN

PERDIO:
MOV BX, OFFSET PERDISTE
MOV AL, 10
INT 7

FIN:
INT 0
END
