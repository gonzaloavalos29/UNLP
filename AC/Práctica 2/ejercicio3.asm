;3) Escribir un programa que muestre en pantalla las letras del abecedario, sin espacios, 
;intercalando mayúsculas y minúsculas (AaBb…), sin incluir texto en la memoria de datos
;del programa. Tener en cuenta que el código de “A” es 41H, el de “a” es 61H y
;que el resto de los códigos son correlativos según el abecedario. 

ORG 1000H
MAY DB 41H ; "A"
MIN DB 61H ; "a"
           ; La letra "Z" (mayúscula) tiene el código 5A

ORG 2000H
MOV AL, 2 ; Se imprime en pantalla de a 2 caracteres
MOV BX, OFFSET MAY ; a partir de la dirección de MAY
PROX: INT 7 ; 
INC MIN ; Paso al siguiente caracter
INC MAY ; Paso al siguiente caracter
CMP MAY, 5BH ; Comparo con el caracter siguiente al "Z", que es el último válido
JNZ PROX ; Si aún no procesamos "Z" pasamos al siguiente caracter
INT 0
END