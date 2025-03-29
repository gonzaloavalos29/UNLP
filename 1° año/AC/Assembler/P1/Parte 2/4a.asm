; ejercicio 4 - a
ORG 1000H
LETRA  DB  "A"

ORG 2000H
          MOV BX, OFFSET LETRA
          MOV AL, 1
MOSTRAR:  INT 7
          CMP LETRA, 5AH
          JZ FIN
          INC LETRA
          JMP MOSTRAR
FIN:      HLT
END