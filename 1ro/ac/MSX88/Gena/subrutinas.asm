; ¡Bienvenido a VonSim!
; Este es un ejemplo de código que calcula los primeros
; n números de la sucesión de Fibonacci, y se guardan a
; partir de la posición 1000h de la memoria.
        org 1000h
        NUM1 DW 5
        NUM2 DW 3
        RES DW 0

        org 3000h
        MUL: MOV BX, SP ; BX = SP
; TOMO VALOR DE NUM2 EN AX
             ADD BX, 2  ; POSICIONO EN DIR DE NUM2
             MOV AX, [BX] ; POSICIONO EN DIR DE NUM2
             MOV DX, BX  ; BACKUP DE BX
             MOV BX, AX ; BX Dir de NUM2
             MOV AX, [BX] ; AX - NUM2
             MOV BX, DX ; RECUPERO PUNTERO DE LA PILA
; MULTIPLICAR
        LOOP: ADD CX, BX
              DEC AX
              JNZ LOOP
        RET

; MANDAMOS LOS PARÁMETROS
        org 2000h
        MOV AX, OFFSET NUM1
        PUSH AX

        MOV AX, OFFSET NUM2
        PUSH AX

        CALL MUL
        MOV RES, CX
        POP AX
        POP BX
        hlt
        end
