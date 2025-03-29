; 7) IMPRESIÓN CON HANDSHAKE MEDIANTE INTERRUPCIONES
; A) Escribir un programa que imprima "UNIVERSIDAD NACIONAL DE LA PLATA" en la impresora a través del 
; HAND-SHAKE. El envío de los caracteres se realiza por interrupciones emitidas desde el HAND-SHAKE
; cada vez que detecta que la impresora se desocupa.
IMR  EQU  21H
EOI  EQU  20H
INT2  EQU  26H
HAND  EQU  40H
ESTADO  EQU  41H
DATO  EQU  40H
N_HND  EQU  10

ORG 40
DW  RUT_HND

ORG 1000H
MSJ  DB  "UNIVERSIDAD NACIONAL DE LA PLATA"
FIN  DB  ?

ORG 3000H
RUT_HND:  PUSH AX
          MOV AL, [BX]
          OUT DATO, AL
          INC BX
          DEC CL
          JNZ FINAL
          MOV AL, 0FFH
          OUT IMR, AL
FINAL:    MOV AL, EOI
          OUT EOI, AL
          POP AX
          IRET

ORG 2000H
MOV BX, OFFSET MSJ
MOV CL, OFFSET FIN - OFFSET MSJ
CLI
MOV AL, 0FBH
OUT IMR, AL
MOV AL, N_HND
OUT INT2, AL
MOV AL, 80H
OUT ESTADO, AL
STI
LAZO:  CMP CL, 0
       JNZ LAZO
       IN AL, ESTADO
       AND AL, 7FH ; 1111 1110
       OUT ESTADO, AL
INT 0
END