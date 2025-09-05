PB EQU 31H
CB EQU 33H

org 2000h
  ; configuración de CB
mov al, 00h; 0000 0000
out CB, al

; prender luces
mov al, 0f0h; 1111 0000
out PB, al

INT 0
end