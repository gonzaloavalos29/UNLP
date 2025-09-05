; ejercicio 2
org 1000h
C  db  "G" ; tiene una letra mayúscula
RES db ?

org 2000h
mov al, C
add al, 20h ; distancia entre may. y min.
mov c, al

HLT
END