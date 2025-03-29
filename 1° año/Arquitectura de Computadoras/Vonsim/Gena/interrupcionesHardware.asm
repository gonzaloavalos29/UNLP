; ¡Bienvenido a VonSim!
; Este es un ejemplo de código que calcula los primeros
; n números de la sucesión de Fibonacci, y se guardan a
; partir de la posición 1000h de la memoria.

        EOI EQU 20H
        IMR EQU 21H
        INT0 EQU 24H

        ORG 2000H
        ; SELECCIONAR ID 10 PARA EL F10
        MOV AX, CONTAR
        MOV BX, 40
        MOV [BX], AX ; 40 = 3000H

        ; CONFIGURAR EL PIC
        CLI
        MOV AL, 11111110B
        OUT IMR, AL ; IMR = 11111110

        MOV AL, 10
        OUT INT0, AL ; INT 0 = 10
        STI

        LOOP: JMP LOOP
        
        INT 0

        ORG 3000H
        CONTAR: INC DL
          MOV AL, EOI
          OUT EOI, AL ; E01 = 20H
        IRET
        
        END
        
