EOI EQU 20h
IMR EQU 21h
INT1 EQU 25h
CONT EQU 10H
COMP EQU 11H

org 48
rut dw clk

org 1000h
car db "x"
car_leido db ?
flag db 0

org 3000h 
clk:  
int 6
cmp cl, [bx]
JNZ fin
inc flag
mov al, 0ffh
out EOI, al
fin:
mov al, 0
out CONT, al 
mov al, 20h
out EOI, al 
iret

org 2000h 
cli
mov al, 0fdh 
out IMR, al
mov al, 12
out INT1, al 
mov al, 8 
out COMP, al 
mov al, 0
out CONT, al
mov bx, offset car_leido
mov cl, car
sti
loop: cmp flag, 1 
jnz loop
int 0
end