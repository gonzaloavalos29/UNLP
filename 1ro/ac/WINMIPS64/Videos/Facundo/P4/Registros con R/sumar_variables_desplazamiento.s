; Definir 2 variables, A y B, con valores 4 y 5 respectivamente
; Definir una variable, C, sin un valor
; Cargar los valores A y B en registros, sumar los valores
; y guardar el resultado en C
; Utilizar un desplazamiento desde A para cargar B

.data
A: .word 4 ;00h
B: .word 5 ;08h
C: .word 0 ;10h

.code
daddi r5, r0, 0 ; mov r5, 0
ld r1, A(r5) ; mov r1, A ; 00 + 00 = 00
daddi r2, r0, 8 ; mov r5, 8
ld r2, A(r5) ; mov r2, A + 8 = B

dadd r3, r1, r2
daddi r5, r0, 16
sd r3, A(r5)

HALT
