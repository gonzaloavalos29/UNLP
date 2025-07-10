PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H

ORG 1000H
str db "Milanesas"

ORG 3000H
conf_pio: mov al, 01h
          out CA, al
          ; configuro CB
          mov al, 00h
          out CB, al
          ret

ORG 3100H
strobe0: in al, PA
         and al, 0FDH
         out PA, al
         ret
         

ORG 3300H
; consulta de estado
poll: in al, PA
      and al, 1
      jnz poll
      ret

ORG 3200H
strobe1: in al, PA
         or al, 02h
         out PA, al
         ret

ORG 2000H
call conf_pio
mov bx, offset str
mov cl, 9
call strobe0
loop: call poll
      mov al, [bx]
      out PB, al
      call strobe1
      call strobe0
      inc bx
      dec cl
      jnz loop
int 0
end