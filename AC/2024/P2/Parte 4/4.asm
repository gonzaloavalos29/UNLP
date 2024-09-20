PA EQU 30h
PB EQU 31h
CA EQU 32h
CB EQU 33h
 
org 1000h
luces  db 11011011b
msj db "Fin de Programa"
fin_msj db ?
msj2 db "Arquitectura de Computadoras: ACTIVADA",10
fin_msj2 db ?
 
org 3400h
ini_pio:  mov al, 0ffh
          out CA, al
          mov al, 0
          out CB, AL
          ret
 
org 3000h
A:                 in al, PA
                   cmp al, 0
                   jnz no_estan_apagadas
                   mov BX, offset MSJ
                   mov al, offset fin_msj - offset MSJ
                   int 7
                   mov al,1
                   jmp fin_a
no_estan_apagadas: mov al,0
fin_a:             ret
 
org 3100h
B:  mov al, luces
    not al
    mov luces, al
    out PB,al
    ret
 
org 3200h
C:       in al, PA
         and al, 1
         jz fin_c
         mov BX, offset msj2
         mov al, offset fin_msj2 - offset msj2
         int 7
fin_c:   ret
 
org 2000h
          call ini_pio
loop:     call A
          cmp al, 1
          jz fin
          call B
          call C
          jmp loop
fin:      int 0
end
