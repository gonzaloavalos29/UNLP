ORG 1000H
MENSAJE DB "Ingrese 3 caracteres!"
FIN DB ?
CADENA DB ?

ORG 3000H
; Subrutina que imprime consigna en la pantalla
PRINT_MSG: MOV BX, OFFSET MENSAJE ; offset apunta a la dirección mensaje
MOV AL, OFFSET FIN - OFFSET MENSAJE ; AL es cantidad de caracteres a imprimir
INT 7
RET

ORG 2000H
CALL PRINT_MSG ; Imprimimos mensaje
MOV DL, 3 ; DL es cantidad de caracteres a leer
MOV BX, OFFSET CADENA ; Donde vamos a insertar lo leído
LEER: INT 6
  INC BX ; Próxima posición de memoria
  DEC DL
  JNZ LEER

; Imprimimos lo leído
MOV BX, OFFSET CADENA
MOV AL, 3 ; Cantidad de caracteres que quiero que se impriman
INT 7 
INT 0
END
