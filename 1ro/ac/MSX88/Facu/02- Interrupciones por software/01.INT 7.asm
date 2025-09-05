; ¡Bienvenido a VonSim!
; Este es un ejemplo de código que calcula los primeros
; n números de la sucesión de Fibonacci, y se guardan a
; partir de la posición 1000h de la memoria.
org 1000h
car_fin db "."
car_a db "a"
cant_a db 0
car db ?
org 2000h
  mov bx, offset car
loop: int 6
  mov al, [bx]
  cmp al, car_fin
  jz fin
  cmp al, car_a
  jnz loop
  inc cant_a
  jmp loop
fin: mov al, offset car - offset cant_a
  mov bx, offset cant_a
  int 7
int 0
  end