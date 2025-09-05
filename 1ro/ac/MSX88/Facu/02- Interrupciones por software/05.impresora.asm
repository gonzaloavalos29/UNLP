dato EQU 40h
estado EQU 41H

ORG 1000H
str db "Milanesas"

ORG 2000H
mov cl, 9
mov bx, offset str

loop: in al, estado
      and al, 1
      jnz loop
      mov al, [bx]
      out dato, al
      inc bx
      dec cl
      jnz loop
int 0
end