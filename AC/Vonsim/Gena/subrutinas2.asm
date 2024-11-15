; ¡Bienvenido a VonSim!
; Este es un ejemplo de código que calcula los primeros
; n números de la sucesión de Fibonacci, y se guardan a
; partir de la posición 1000h de la memoria.
        org 1000h
        NUM1 DW 5
        NUM2 DW 3
        
        org 3000h
; // INTERCAMBIA DOS PARÁMETROS PASADOS POR REFERENCIA A TRAVÉS DE LA PILA
        SWAP: MOV BX, SP
        ; TOMAR DIR NUM1
        ADD BX, 4
        MOV AX, [BX]
        
        ; TOMAR DIR NUM2
        SUB BX, 2
        MOV CX, [BX]
        
        ; TOMAR VALOR NUM1
        MOV BX, AX ; BX = DIR NUM1
        MOV AX, [BX] ; AX = NUM1!
        MOV DX, BX ; GUARDAMOS DIR NUM1
        
        ; TOMAR VALOR NUM2
        MOV BX, CX ; BX = DIR NUM2
        MOV CX, [BX] ; CX = NUM2
        
        ; INSERTAR VALOR NUM1 DIR DE NUM2
        MOV WORD PTR [BX], AX ; DIR NUM2 -> NUM1
        
        ; INSERTAR VALOR NUM2 DIR DE NUM1
        MOV BX, DX ; BX = DIR NUM1
        MOV WORD PTR [BX], CX ; DIR NUM1 -> NUM2

; MANDAMOS LOS PARÁMETROS
        org 2000h
        MOV AX, OFFSET NUM1
        PUSH AX

        MOV AX, OFFSET NUM2
        PUSH AX

        CALL SWAP
        hlt
        end
