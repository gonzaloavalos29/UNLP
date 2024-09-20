PA EQU 30h
PB EQU 31h
CA EQU 32h
CB EQU 33h
 
org 1000h
clave  db 11011011b
org 3000h
ini_pio:  mov al, 0ffh
          out CA, al
          mov al, 0
          out CB, AL
          ret
 
org 2000h
 
          call ini_pio
loop:     in al, PA
          cmp al, clave
          jz fin
          xor al, clave
          not al
          out PB, al
          jmp loop
fin:      int 0
END
        
