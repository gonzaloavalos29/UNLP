; PROGRAMA QUE SALUDA
EOI EQU 20H
IMR EQU 21H
INT1 EQU 25H
CONT EQU 10H
COMP EQU 11H

ORG 1000H
MSJ  DB  "HOLA"
FLAG  DB  0
ORG 80
DIR_ATENDER  DW  3100H
ORG 3100H
ATENDER:  MOV BX, OFFSET MSJ
          MOV AL, 5
          INT 7
          MOV FLAG, 1
          MOV AL, 20H
          OUT EOI, AL
          IRET
ORG 2000H
      CLI ; Configuración PIC
      MOV AL, 0FDH ; 1111 1101
      OUT IMR, AL
      MOV AL, 20 ; id de la interrupción
      OUT INT1, AL ; Configuración TIMER
      MOV AL, 0
      OUT CONT, AL
      MOV AL, 10
      OUT COMP, AL
      STI
LOOP: CMP FLAG, 1
      JNZ LOOP
INT 0
END