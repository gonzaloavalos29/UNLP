; ejercicio 1b
PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H

ORG 3000H
CONF_PIO: MOV AL, 0
          OUT CB, AL
          MOV AL, 255
          OUT CA, AL
          RET

ORG 2000H
CALL CONF_PIO
LOOP: MOV AL, 0FFH
      OUT PB, AL
      IN AL, PA
      ; PROCESO VALOR...
      CMP AL, 0
      JNZ LOOP
      INT 0

END

