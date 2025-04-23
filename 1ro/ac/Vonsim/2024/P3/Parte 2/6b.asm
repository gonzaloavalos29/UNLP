; 6-a) CONTEO REGRESIVO CON PAUSA. Escribir un programa que cuente de forma regresiva desde 9 hasta
; 0, mostrando el tiempo en pantalla. Luego de que termine de contar, si se presiona F10 debe comenzar
; de nuevo la cuenta desde 9 hasta 0. Además, si en algún momento se presiona la tecla F10 durante el
; conteo, el mismo debe pausarse, y reanudarse solo cuando se presiona nuevamente F10.

CONT EQU 10H
COMP EQU 11H
PIC  EQU 20H
EOI  EQU 20H
IMR  EQU 21H
INT0 EQU 24H
INT1 EQU 25H
N_F10  EQU  10
N_CLK  EQU  15

ORG 40
IP_F10  DW  RUT_F10

ORG 60
IP_CLK  DW  RUT_CLK

ORG 1000H
CONTADOR        DB  39H
PAUSA           DB  0
TERMINO_CONTEO  DB  0

ORG 3000H
RUT_CLK:  PUSH AX
          PUSH BX
          MOV BX, OFFSET CONTADOR
          MOV AL, 1
          INT 7
          CMP CONTADOR, 30H
          JNZ SIGUE
          MOV AL, 0FEH
          OUT IMR, AL
          MOV TERMINO_CONTEO, 1
SIGUE:    DEC CONTADOR
          MOV AL, 0
          OUT CONT, AL
          MOV AL, EOI
          OUT EOI, AL
          POP BX
          POP AX
          IRET

ORG 3200H
RUT_F10:      PUSH AX
              CMP TERMINO_CONTEO, 1
              JNZ NO_REPETIR
              MOV TERMINO_CONTEO, 0
              MOV CONTADOR, 39H
              MOV AL, 0
              OUT CONT, AL
              MOV AL, 0FCH
              JMP CONT_F10
              
NO_REPETIR:   CMP PAUSA, 0
              JZ PAUSAR
              MOV PAUSA, 0
              MOV AL, 0FCH
              JMP CONT_F10
PAUSAR:       MOV PAUSA, 1
              MOV AL, 0
              OUT CONT, AL
              MOV AL, 0FEH
CONT_F10:     OUT IMR, AL
              MOV AL, EOI
              OUT EOI, AL
              POP AX
              IRET

ORG 2000H
        CLI
        MOV AL, 0FCH
        OUT IMR, AL
        MOV AL, N_F10
        OUT INT0, AL
        MOV AL, N_CLK
        OUT INT1, AL
        MOV AL, 0
        OUT CONT, AL
        MOV AL, 1
        OUT COMP, AL
        STI
BUCLE:  JMP BUCLE
INT 0
END