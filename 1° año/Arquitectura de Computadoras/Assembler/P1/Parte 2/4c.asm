; ejercicio 4c
ORG 1000H
LETRA  DB  "0"
ENTER  DB  10
ORG 2000H
          MOV AL, 1
MOSTRAR:  MOV BX, OFFSET LETRA
          INT 7
          MOV BX, OFFSET ENTER
          INT 7
          CMP LETRA, 39H ; "9"
          JZ FIN
          INC LETRA
          JMP MOSTRAR
FIN:      HLT
END