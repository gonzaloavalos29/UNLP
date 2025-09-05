; ¡Bienvenido a VonSim!
; Este es un ejemplo de código que calcula los primeros
; n números de la sucesión de Fibonacci, y se guardan a
; partir de la posición 1000h de la memoria.
        org 1000h
        NUM1 DW 5
        NUM2 DW 3
        RES DW ?

        org 3000h
        MUL: MOV BX, SP ; BX = SP

        ; TOMO VALOR NUM2 EN AX
        ADD BX, 2 ; Posiciono en DIR de NUM2
        MOV AX, [BX] ; AX = Dir de NUM2
        MOV DX, BX ; Backup de BX
        MOV BX, AX ; BX = Dir de NUM2
        MOV AX, [BX] ; AX = NUM2
        MOV BX, DX ; Recupero puntero de pila
        
        ; TOMO VALOR NUM1 EN DX
        ADD BX, 2
        MOV DX, [BX] ; DX = DIR NUM1 (1000H)
        MOV BX, DX ; BX = DIR NUM1 (1000H)
        MOV DX, [BX] ; DX = NUM1
        ; Multiplicar
        LOOP: ADD CX, DX
            DEC AX
            JNZ LOOP
        RET

        ORG 2000h
        ; Inicializamos AX y BX
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
        
