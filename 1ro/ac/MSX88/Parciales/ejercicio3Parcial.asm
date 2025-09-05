PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H

ORG 3000H
INCISOA:
;Tomar el estado de las llaves, invertirlas, mandarlas a las luces
IN AL, PA ; Tomo el estado de las LLAVES
NOT AL ; INVIERTO EL ESTADO DE LO QUE HAYA EN AL
OUT PB, AL ; Mando el estado inverso de AL a las LUCES
RET

ORG 3400H
INCISOB:
; Cuando la llave del bit menos significativo esta prendida, imprimir
IN AL, PA ; Tomo el estado de las LLAVES
AND AL, 1 ; ESTADO AL = XXXX XXXX AND 0000 0001 = 0000 000X FZ = X
JNZ IMPRIMIR ; Si no se prende la Flag, FZ = 0, imprimo
JMP TERMINARB
IMPRIMIR: 
MOV BX, OFFSET MSJ
MOV AL, OFFSET FIN-OFFSET MSJ
INT 7
TERMINARB: RET

ORG 3800H
INCISOC:
; En el caso que PA = 00000000, imprimir mensaje fin y terminar el programa
IN AL, PA
CMP AL, 0
JZ MENSAJEFIN
JMP TERMINARC
MENSAJEFIN:
MOV BX, OFFSET MSJFIN
MOV AL, OFFSET FINMSJ-OFFSET MSJFIN
INT 7
MOV FLAG, 0
TERMINARC: RET

ORG 1000H
MSJ DB "Arquitectura de Computadoras"
FIN DB ?
MSJFIN DB "FIN DEL PROGRAMA"
FINMSJ DB ?
FLAG DB 1

ORG 2000H
CLI ; Deshabilita las interrupciones
; Configuro las interrupciones
; 1 = ENTRADA, 0 = SALIDA
; 1 = IN, 0 = OUT
MOV AL, 11111111B
OUT CA, AL ; Configuro CA como Entrada
MOV AL, 0
OUT CB, AL ; Configuro CB como Salida
STI ; Habilita las interrupciones
LAZO:
CALL INCISOA
CALL INCISOB
CALL INCISOC
CMP FLAG, 0
JZ TERMINARPROGRAMA
JMP LAZO
TERMINARPROGRAMA: INT 0
END