; ejercicio 1
org 1000h
mensaje  db  "Hola, buen día"
letra    db  "a"
cant     db  ?

org 2000h
      mov al, letra
      mov ch, 0
      mov cl, offset letra - offset mensaje
      mov bx, offset mensaje
sigo: mov ah, [bx]
      cmp ah, al
      jnz saltar
      inc ch
saltar: inc bx
        dec cl
        jnz sigo
        mov cant, ch
int 0
END