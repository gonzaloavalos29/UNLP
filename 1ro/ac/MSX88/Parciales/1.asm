ORG 3000H
ES_DIGITO:  MOV  DH, 8 ; ES FALSO -> NO ES DIGITO
;  COMPARO SI AL ES UN DIGITO O NO
CMP AL, '0' ; PREGUNTO SI EL CARACTER ENTRE "0" Y "9"
JS FIN
CMP AL, '9'+1 ; PREGUNTO SI EL CARACTER ES 9 O MENOR.
JNS FIN
MOV DH, 1
FIN: RET

ORG 1000H
CAD  DB  "z9!y8-5"
FIN  DB  ?

ORG 2000H
MOV BX, OFFSET CAD
MOV AL, [BX] ; ME QUEDO EN EL CARACTER QUE APUNTA BX
CALL ES_DIGITO

INT 0
END