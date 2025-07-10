; TIMER QUE SE REINICIA CADA 5 SEGUNDOS
EOI EQU 20H
IMR EQU 21H
INT1 EQU 25H ; TIMER

CONT EQU 10H
COMP EQU 11H

ORG 1000H
mensaje db "No debo programar en Assembly"
nuevalinea db 13
fin db ?

ORG 3000H
manejador: mov al, 0
  out cont, al

  ; ejecuta cada 5 segundos
  mov bx, offset mensaje
  mov al, offset fin - offset mensaje
  int 7

  mov al, 20h
  out eoi, al
  iret

ORG 32 ; 8 * 4 = 32
dir_manejador dw 3000H

ORG 2000H
CLI
; Configuración PIC
MOV AL, 0FDH ; 1111 1101 ; TIMER ACTIVADO
OUT IMR, AL ; ACTIVO INTERRUPCIÓN, SE LO MANDO AL IMR

MOV AL, 8 ; id de interrupción
OUT INT1, AL ; INT0 -> F10, INT1 -> TIMER

; Configuración TIMER
MOV AL, 5
OUT COMP, AL

MOV AL, 0
OUT CONT, AL

STI

LOOP: JMP LOOP
INT 0



END