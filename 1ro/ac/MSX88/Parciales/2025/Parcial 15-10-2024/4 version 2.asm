ID_CLK EQU 4
CONT EQU 10H
COMP EQU 11H
EOI EQU 20H
IMR EQU 21H
INT1 EQU 25H
PB EQU 31H
CB EQU 33H

ORG 1000H
MSJNRO     DB "Ingrese el nro de luz que nunca se encendio: "
GANASTE    DB "GANASTE"
PERDISTE   DB "PERDISTE"
SECUENCIA  DB 00000001B, 00000100B, 00000010B, 00001000B, 10000000B, 00100000B, 00010000B
NO_PRENDE  DB 6
NROINGRESADO DB ?
FLAG      DB 0
POSICION  DB 0

ORG 16
DIR_CLK DW RUT_CLK

ORG 3000H
RUT_CLK:
    ; Verifica si ya mostramos 7 luces
    MOV AL, POSICION
    CMP AL, 7
    JZ FIN_CLK

    ; Mostrar la luz correspondiente
    MOV BX, OFFSET SECUENCIA
    ADD BX, AX             ; AX = POSICION
    MOV AL, [BX]
    OUT PB, AL

    ; Incrementar posición
    INC POSICION

    ; Reiniciar timer
    MOV AL, 1
    OUT COMP, AL
    MOV AL, 0
    OUT CONT, AL

    JMP SALIR_INT

FIN_CLK:
    ; Apagar luces
    MOV AL, 0
    OUT PB, AL
    ; Marcar que terminó la secuencia
    MOV FLAG, 1

SALIR_INT:
    ; Despachar interrupción
    MOV AL, EOI
    OUT EOI, AL
    IRET

ORG 2000H
; --- CONFIGURACIÓN INICIAL ---
    CLI
    ; Habilitar solo timer
    MOV AL, 11111101B
    OUT IMR, AL
    ; Vector de interrupción
    MOV AL, ID_CLK
    OUT INT1, AL
    ; Modo salida PIO B
    MOV AL, 0FFH
    OUT CB, AL
    STI

; --- INICIAR TIMER ---
    MOV POSICION, 0
    MOV FLAG, 0
    MOV AL, 1
    OUT COMP, AL
    MOV AL, 0
    OUT CONT, AL

; --- ESPERAR QUE TERMINE LA SECUENCIA ---
ESPERA_FIN:
    CMP FLAG, 1
    JNZ ESPERA_FIN

; --- MOSTRAR MENSAJE E INGRESAR NÚMERO ---
    MOV BX, OFFSET MSJNRO
    MOV AL, OFFSET GANASTE - OFFSET MSJNRO
    INT 7

    MOV BX, OFFSET NROINGRESADO
    INT 6
    MOV AL, [BX]
    SUB AL, '0'            ; Convertir de ASCII a número
    CMP AL, NO_PRENDE
    JZ MOSTRAR_GANO

; --- PERDIÓ ---
    MOV BX, OFFSET PERDISTE
    MOV AL, OFFSET SECUENCIA - OFFSET PERDISTE
    INT 7
    JMP FIN

MOSTRAR_GANO:
    MOV BX, OFFSET GANASTE
    MOV AL, OFFSET PERDISTE - OFFSET GANASTE
    INT 7

FIN:
    INT 0
    END
