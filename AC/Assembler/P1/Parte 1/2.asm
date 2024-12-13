; ejercicio 2
org 1000h
c  db  "G"
res  db  ?

org 2000h
mov al, 41h ; "A"
mov ah, 5ah ; "Z"
cmp c, al 
js no_es
cmp ah, c
js no_es
mov res, 0ffh
jmp fin
no_es:  mov res, 0
fin: int 0
END