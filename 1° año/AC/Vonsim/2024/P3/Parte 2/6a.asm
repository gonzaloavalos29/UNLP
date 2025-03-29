; 6-a) CONTEO REGRESIVO. Escribir un programa que implemente un conteo regresivo a partir de
; un valor (de 1 a 9) ingresado desde el teclado. El conteo debe comenzar al presionarse la tecla
; F10. El tiempo transcurrido debe mostrarse en pantalla, actualizándose el valor cada segundo.
; Por ejemplo, si se ingresa el valor 7, cuando se aprieta F10 debe mostrarse en pantalla
; "7 6 5 4 3 2 1 0" en los 7 segundos siguientes.

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
CONTADOR  DB  39H
FINAL  DB  0

ORG 3000H
RUT_CLK:  PUSH AX
          PUSH BX
          MOV BX, OFFSET CONTADOR
          MOV AL, 1
          INT 7
          CMP CONTADOR, 30H
          JNZ SIGUE
          MOV AL, 0FFH
          OUT IMR, AL
          MOV FINAL, 1
SIGUE:    DEC CONTADOR
          MOV AL, 0
          OUT CONT, AL
          MOV AL, EOI
          OUT EOI, AL
          POP BX
          POP AX
          IRET

ORG 3200H
RUT_F10:  PUSH AX
          MOV AL, 0FDH
          OUT IMR, AL
          MOV AL, 0
          OUT CONT, AL
          MOV AL, 1
          OUT COMP, AL
          MOV AL, EOI
          OUT EOI, AL
          POP AX
          IRET

ORG 3400H
LEE_NUMERO:  MOV BX, OFFSET CONTADOR
REPITE:      INT 6
             MOV AL, CONTADOR
             CMP AL, 30H
             JS REPITE
             CMP AL, 39H
             JNS REPITE
             RET

ORG 2000H
        CALL LEE_NUMERO
        CLI
        MOV AL, 0FEH
        OUT IMR, AL
        MOV AL, N_F10
        OUT INT0, AL
        MOV AL, N_CLK
        OUT INT1, AL
        STI
BUCLE:  CMP FINAL, 0
        JZ BUCLE
INT 0
END