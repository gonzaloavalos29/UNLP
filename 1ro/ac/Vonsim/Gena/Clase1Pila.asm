; ¡Bienvenido a VonSim!
; Este es un ejemplo de código que calcula los primeros
; n números de la sucesión de Fibonacci, y se guardan a
; partir de la posición 1000h de la memoria.
        org 1000h
        NUM1 DW 5
        NUM2 DW 3
        RES DW ?

        ORG 2000h
        ; Mandamos los parámetros a la pila por referencia
        MOV AX, OFFSET NUM1
        PUSH AX

        MOV AX, OFFSET NUM2
        PUSH AX

        CALL MUL
        MOV RES, CX
        POP AX
        POP BX
        HLT
        END
        
