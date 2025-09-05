PB EQU 31H
CB EQU 33H

org 1000h
digito db ?
cero db "0"

org 2000h
; configuración de CB
mov al, 00h; 0000 0000
out CB, al

; leer dígito
mov bx, offset digito
int 6
mov cl, [bx]

; restar ascii
; del 0 ("3" -> 3)
sub cl, cero

; rotar izq 
; cl veces
mov al, 1
loop: cmp cl, 0
      jz mandar
      add al, al
      dec cl
      jmp loop
; prender la luz
mandar: out pb, al
INT 0
end