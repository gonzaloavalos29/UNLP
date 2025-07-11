DATO EQU 40H
ESTADO EQU 41H

ORG 1000H
MENSAJE DB "El Handshake la rompe"
FIN DB ?

ORG 2000H
; Configuro el Handshake para el polling
IN AL, ESTADO ; tomo estado actual
AND AL, 07FH ; 7FH = 01111111
OUT ESTADO, AL ; ESTADO = 0XXXXXXX

; Recorremos el mensaje y le enviamos caracter
; a caracter hacia impresora
MOV BX, OFFSET MENSAJE ; Para recorrer el mensaje
POLL: IN AL, ESTADO ; Tomo el estado actual
  AND AL, 1 ; Chequeo el primer bit
  JNZ POLL ; Mientras sea 1 sigo en el loop
  MOV AL, [BX] ; Tomo el caracter
  OUT DATO, AL ; Lo envío al registro de datos
  INC BX ; Avanzo a la siguiente posición
  CMP BX, OFFSET FIN ; Chequeo si llegué al final
  JNZ POLL
INT 0
END
