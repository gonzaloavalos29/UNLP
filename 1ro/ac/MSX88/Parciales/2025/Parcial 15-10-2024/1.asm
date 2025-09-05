; 1. El siguiente programa utiliza la pila para pasar un parámetro. ¿Qué valor queda almacenado en DL y DH?
org 1200h
num db 11, 12, 13, 14, 15

org 3500h
rut: mov bx, sp ; BX = SP (puntero al valor de la pila, en este caso dirección de "num")
      add bx, 2 ; Sumamos 2 a BX para ajustar la dirección y que apunte al valor guardado en la pila
      mov bx, [bx] ; BX = [BX], lo que significa que BX ahora tiene el valor guardado en la pila, es decir, **1200h**
      add bx, 4          ; Avanzamos 4 bytes (BX ahora apunta a "13", que es el tercer valor en num)
      mov dl, [bx]       ; DL = 13, que es el valor en la dirección de BX
      sub bx, 2          ; Retrocedemos 2 bytes (BX ahora apunta a "12")
      mov dh, [bx]       ; DH = 12, que es el valor en la dirección de BX
      ret                ; Retorno de la subrutina

org 2000h
mov bx, offset num
push bx
call rut
end

; respuesta: dl = ______
;            dh = ______
