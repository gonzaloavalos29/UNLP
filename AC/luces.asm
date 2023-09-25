; ¡Bienvenido a VonSim!
; Este es un ejemplo de código que calcula los primeros
; n números de la sucesión de Fibonacci, y se guardan a
; partir de la posición 1000h de la memoria.
        org 2000h

        MOV AL, 11111111B
        OUT 32H, AL

        MOV AL, 00000000b
        OUT 33H, AL

        LOOP: IN AL, 30H

          OUT 31H, AL
          JMP LOOP

        INT 0
        HLT
        END
        
