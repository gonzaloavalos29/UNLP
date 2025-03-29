; ejercicio 1
org 1000h
INTENTOS     db  50
MSJINGRESAR  db  "Ingresa la palabra a adivinar: "
MSJADIVINAR  db  "Comenzá a adivinar!"
MSJGANASTE   db  "Ganaste!"
MSJPERDISTE  db  "Perdiste, el string era "
STRING       db  ?

org 1200h
STRINGEVAL  db  ?

org 2000h
          MOV BX, OFFSET MSJINGRESAR ; Mensaje Inicial
          MOV AL, OFFSET MSJADIVINAR - OFFSET MSJINGRESAR
          INT 7
          MOV DH, 0
          MOV CL, 0
          MOV BX, OFFSET STRING
INGRESO:  INT 6
          MOV AL, BYTE PTR [BX]
          INC BX
          INC CL
          CMP AL, '.'
          JNZ INGRESO
          DEC CL ; Decremento caracter de corte
          MOV BX, OFFSET MSJADIVINAR ; mensaje de adivinar
          MOV AL, OFFSET MSJGANASTE - OFFSET MSJADIVINAR
          INT 7
          MOV CH, INTENTOS ; Set de intentos y string a adivinar
          MOV AX, OFFSET STRING
VOLVER:   MOV BX, OFFSET STRINGEVAL
          INT 6
          MOV DL, BYTE PTR [BX] ; muevo car. a DL p/ evitar evaluar Mem a Mem
          MOV BX, AX
          CMP DL, BYTE PTR [BX] ; evalua car. p/ avanzar o descontar intento
          JZ SEGUIR
          DEC CH
          JNZ VOLVER
PERDISTE: MOV BX, OFFSET MSJPERDISTE ; mensaje de perdiste
          MOV AL, OFFSET STRING - OFFSET MSJPERDISTE
          ADD AL, CL
          INT 7
          JMP FIN
SEGUIR:   DEC CL ; acierto valido, sig. caracter a acertar e impresión
          MOV BX, AX
          MOV AL, 1
          INT 7
          MOV AX, BX ; Recuperar puntero a string
          INC AX
          CMP CL, 0
          JNZ VOLVER
          MOV BX, OFFSET MSJGANASTE ; Mensaje de Ganaste
          MOV AL, OFFSET MSJPERDISTE - OFFSET MSJGANASTE
          INT 7
FIN:      HLT
END