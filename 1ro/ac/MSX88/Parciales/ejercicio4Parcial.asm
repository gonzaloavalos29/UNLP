EOI EQU 20H ; End of Interruption
IMR EQU 21H ; Registro de enmascaramiento de interrupciones
INT0 EQU 24H ; Tecla F10
PB EQU 31H ; Puerto PB
CB EQU 33H ; Configuración PB
ID_F10 EQU 10 ; ID * 4 = 40 -> ORG 40

ORG 40
DW FINALIZAR ; Dirección de la subrutina de interrupción

ORG 3000H ; Subrutina de interrupción
FINALIZAR:
MOV FLAG, 0 ; Cambio el estado de la flag porque apreté F10
MOV AL, 20H ; Muevo 20h al registro AL
OUT EOI, AL ; Aviso que terminé de interrumpir
IRET ; Instrucción de retorno de interrupciones

ORG 3500H
ENVIAR: 
MOV AL, 0 ; 0 ANTES DE ENVIAR EL DATO
OUT PB, AL ; Mando el 0
MOV AL, [BX] ; Mando el caracter a AL
OUT PB, AL ; Mando el dato a PB
INC BX ; Paso al siguiente caracter
CMP BX, OFFSET FIN ; Pregunto si llegué al final
JZ TERMINE ; Si llegué al final -> termino
JMP RETORNAR ; Salgo de la subrutina
TERMINE: MOV FLAG, 0 ; Cambio el estado de la FLAG porque terminé
RETORNAR: RET

ORG 1000H
CADENA DB "CLASES DE APOYO SAN LF 2023"
FIN DB ?
FLAG DB 1

ORG 2000H
CLI ; Desactivo temporalmente las interrupciones
; Configuro las interrupciones
MOV AL, 0FEH ; 1111 1110B
OUT IMR, AL ; Mando la configuración al IMR
MOV AL, 0 ; Voy a recibir datos en PB
OUT CB, AL ; Mando la configuración a CB
MOV AL, ID_F10
OUT INT0, AL
STI ; Vuelvo a activarlas

MOV BX, OFFSET CADENA ; BX = 1000H
LAZO:
CMP FLAG, 0 ; Mi FLAG empieza en 1, si toco F10 termina el programa
JZ TERMINARTODO
CALL ENVIAR
JMP LAZO

TERMINARTODO: INT 0
END