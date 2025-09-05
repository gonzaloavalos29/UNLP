EOI EQU 20H
IMR EQU 21H
INT0 EQU 24H
INT1 EQU 25H
INT2 EQU 26H
HAND_DATO EQU 40H
HAND_ESTADO EQU 41H
ID_HAND EQU 9

ORG 1000H
MENSAJE DB "El HANDSHAKE la rompe"
FIN DB ?

ORG 3000H
; Recorremos el mensaje y lo enviamos caracter a caracter hacia la impresora
IMPRIMIR: PUSH AX ; Salvo AX por las dudas
          MOV AL, [BX] ; Tomo el caracter
          OUT HAND_DATO, AL ; Lo envío al registro de datos
          INC BX ; Avanzo a la siguiente posición
          ; Aviso al PIC y vuelvo
          MOV AL, 20H
          OUT EOI, AL
          POP AX ; Recupero lo que había en AX
          IRET
; Configuro el vector de interrupciones. ID = 9
ORG 32
IP_HAND DW IMPRIMIR

ORG 2000H
; Configuro PIC
CLI
  MOV AL, 11111011B ; Solo HANDSHAKE habilitado
  OUT IMR, AL
  MOV AL, 9
  OUT INT2, AL ; Mando el ID seleccionado al registro INT2
STI
MOV BX, OFFSET MENSAJE ; Para recorrer el mensaje
; Configuro el Handshake para interrupción
IN AL, HAND_ESTADO ; Tomo el estado actual
OR AL, 80H ; 80H = 10000000
OUT HAND_ESTADO, AL ; Estado = 1xxxxxxx
; Continuamos con el programa principal
POLL: CMP BX, OFFSET FIN ; Chequeo si llegué al final
      JNZ POLL
; Desactivo Handshake por interrupción
IN AL, HAND_ESTADO ; Tomo estado actual
AND AL, 07FH ; 7FH = 01111111
OUT HAND_ESTADO, AL ; Estado = 0XXXXXXX
INT 0
END
