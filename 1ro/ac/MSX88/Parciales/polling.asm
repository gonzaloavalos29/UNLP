; Configuración del HANDSHAKE (Interrupciones) (Código)

; Declaro constantes
EOI EQU 20H
IMR EQU 21H
INT2 EQU 26H
ESTADO EQU 41H
DATO EQU 40H
ID_RUTH EQU 10

ORG 40
DIR_RHI DW IMPRIMIR ; Dirección_Ruta_Handshake_Interrupción = 3000H (IMPRIMIR está en la 3000H)

ORG 1000H
MENSAJE DB "Arquitectura de Computadoras 2023"
FIN DB ?

ORG 3000H
IMPRIMIR: ; IMPRIMIR esta en la dirección 3000H
MOV AL, [BX] ; Muevo el caracter a imprimir al registro AL
OUT DATO, AL ; Muevo a DATO el caracter a imprimir
INC BX ; Paso a la siguiente posición
MOV AL, 20H ; Le mando al registro AL el 20H
OUT EOI, AL ; Se lo mando a EOI para avisarle que termine de interrumpir
IRET ; Vuelvo de la subrutina de interrupción

ORG 2000H

CLI ; Desactivo temporalmente las interrupciones
MOV AL, 11111011B ; Habilito la interrupción HANDSHAKE en el IMR
OUT IMR, AL ; Configuro el IMR para interrupción HANDSHAKE
MOV AL, ID_RUTH ; Muevo al registro AL 10, que va a ser la ID que se va a multiplicar en la interrupción (IDx4 = ORG IDx4 (10x4 = ORG 40))
OUT INT2, AL ; Le paso el 10 del registro AL a la interrupción para que sepa a donde tiene que ir cuando mande un pedido de interrupción
STI ; Habilito las interrupciones

MOV BX, OFFSET MENSAJE ; Mando a BX la cadena de caracteres
IN AL, ESTADO ; Tomo el estado
OR AL, 10000000B ; Deshabilito el handshake por interrupciones
OUT ESTADO, AL ; Mando la configuración al ESTADO desde el registro AL 
POLL: CMP BX, OFFSET FIN ; Consulto si llegue al final
JNZ POLL ; Si no llegue al final, vuelvo a preguntar si llegue al final
IN AL, ESTADO ; Cuando llegue al final, tomo el ESTADO y lo mando al registro AL
AND AL, 01111111B ; Deshabilito el estado Handshake por interrupciones
OUT ESTADO, AL ; Mando la configuración al estado
INT 0 ; Termino
END
