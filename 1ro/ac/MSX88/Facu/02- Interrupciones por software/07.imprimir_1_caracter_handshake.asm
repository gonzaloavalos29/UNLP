EOI EQU 20h
IMR EQU 21h
DATO EQU 40h


org 1000h
char db "a"

org 3000h
; mandar char
imp: mov al, char
     out DATO, al
     ; desac ints
     mov al, 0ffh
     out IMR, al
     ; volver
     mov al, 20h
     out EOI, al
     iret

int 0
end