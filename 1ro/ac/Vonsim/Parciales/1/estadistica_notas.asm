; Ejercicio 2
ORG 1000H
MSJ_PRO   DB  "El promedio de las notas es: "
PROMEDIO  DB  ?
PORCEN    DB  ?
APROBADOS DB  ?
VECTOR    DB  ?

ORG 3000H
CANT_APROBADOS: PUSH AX ; resguardo valor 
                PUSH BX ; resguardo valor
                PUSH CX ; resguardo valor
                MOV DL, 0 ; cant. de aprobados
LOOP:           MOV AL, [BX]
                CMP AL, 4
                JS SALTO
                INC DL
SALTO:          INC BX
                DEC CL
                JNZ LOOP
                POP CX
                POP BX
                POP AX
                RET
; la subrutina DIV realiza: DX/CX
; se retorna el COCIENTE en BX y el RESTO en AX
ORG 3200H
DIV:  PUSH AX
      PUSH DX
      MOV AX, 0 ; inicializo el resto en 0
      MOV BX, 0 ; inicializo el cociente de la división
      CMP CX, 0 ; CX tiene num B
      JZ FIN
      CMP DX, 0 ; DX tiene num A
      JZ FIN
OTRO: SUB DX, CX
      JS RES ; si es negativo, voy a calcular el resto
      INC BX ; sumo al cociente, es resultado de la DIV
      JMP OTRO
RES:  ADD CX, DX ; sumo de vuelta CX para determinar el resto
      MOV AX, CX ; devuelvo el resto en AX
FIN:  POP DX
      POP CX
      RET
; la subrutina MUL realiza: DX + AX
; se retorna el RESULTADO en DX
ORG 3300H
MUL:    PUSH CX ; resguardo valor
        CMP AX, 0
        JZ SALIR
        CMP DX, 0
        JZ SALIR
        MOV CX, 0
VUELVO: ADD CX, AX
        DEC DX
        JNZ VUELVO
        MOV DX, CX ; en DX tengo el resultado de la multiplicación
SALIR:  POP CX
        RET
; la subrutina realiza: (DX * 100) / CX y lo retorna en BX
ORG 3500H
PORCENTAJE:  PUSH CX
             PUSH DX
             MOV AX, 100 ; para llamar a MUL
             CALL MUL
             CALL DIV
             POP DX
             POP CX
             RET

ORG 2000H
MOV DX, 0 ; inicializo para ir sumando los elementos del vector
MOV CX, 0 ; inicializo en 0 para llevar la cantidad de elementos
MOV AX, 0 ; en AL voy a manejar cada caracter leído
MOV BX, OFFSET VECTOR
LAZO:  INT 6
       MOV AL, [BX]
       CMP AL, '.' ; comparo elem. ingresado con '.'
       JZ SUB1
       SUB AL, 30H
       MOV [BX], AL
       ADD DX, AX ; lleva la suma para el promedio
       INC CX ; cuenta cant elemento del vector
       INC BX ; prox dir. para el sig. elemento
       JMP LAZO
SUB1:  CALL DIV ; hago DX/CX
       ADD BL, 30H ; promedio: 1 byte, lo paso a caracter
       MOV PROMEDIO, BL
       MOV BX, OFFSET MSJ_PRO
       MOV AL, OFFSET PORCEN - OFFSET MSJ_PRO
       INT 7 ; informo promedio
       MOV BX, OFFSET VECTOR ; BX = dir. comienzo vector
       CALL CANT_APROBADOS
       MOV APROBADOS, DL
       CALL PORCENTAJE ; DX = cant aprobados, CX = cant elementos
       MOV PORCEN, BL
HLT
END
