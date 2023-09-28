; ¡Bienvenido a VonSim!
; Este es un ejemplo de código que calcula los primeros
; n números de la sucesión de Fibonacci, y se guardan a
; partir de la posición 1000h de la memoria.

        ORG 1000H
        CAR_FIN DB "."
        CAR_A DB "a"
        CANT_A DB 0
        CAR DB ?
        

        ORG 2000H
        MOV BX, OFFSET CAR
        LOOP: INT 6
        MOV AL, [BX]
        CMP AL, CAR_FIN
        JZ FIN
        CMP AL, CAR_A
        JNZ LOOP
        INC CANT_A
        JMP LOOP
        FIN: INT 0
        END
        
