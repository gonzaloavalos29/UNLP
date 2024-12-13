; ejercicio 4 - b
ORG 1000H
LETRA  DB  "0"

ORG 2000H
          MOV BX, OFFSET LETRA
          MOV AL, 1
MOSTRAR:  INT 7
          CMP LETRA, 39H ; "9"
          JZ FIN
          INC LETRA
          JMP MOSTRAR
FIN:      HLT
END