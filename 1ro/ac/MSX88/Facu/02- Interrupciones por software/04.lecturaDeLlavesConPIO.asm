PA EQU 30H
CA EQU 32H

org 1000h
clave db 6FH
msj db "Correcto"

org 2000h
mov al, 0FFh
out CA, al

loop: in al, PA
      cmp clave, al
      jnz loop
; mensaje
mov bx, offset msj
mov al, 8
int 7
int 0
end