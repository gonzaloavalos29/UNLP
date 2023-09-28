; ¡Bienvenido a VonSim!
; Este es un ejemplo de código que calcula los primeros
; n números de la sucesión de Fibonacci, y se guardan a
; partir de la posición 1000h de la memoria.

        ORG 1000H
        CAD1 DB "HOLA!"
        CAD2 DB "OLO!"
        FIN DB ?

        ORG 2000H
        MOV BX, OFFSET CAD1
        MOV AL, OFFSET CAD2 - OFFSET CAD1
        INT 7
        MOV BX, OFFSET CAD2
        MOV AL, OFFSET FIN - OFFSET CAD2
        INT 7
        INT 0
        END
        
