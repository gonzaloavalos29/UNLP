; Definir 2 variables, A y B, con valores 4 y 5 respectivamente
; Definir una variable, C, sin un valor
; Cargar los valores de A y B en registros, sumar los valores
; y guardar el resultado en C

.data
A: .word 4
B: .word 5
C: .word 0

.code
ld r1, A(r0) ; mov r1, A
ld r2, B(r0) ; mov r2, B
dadd r3, r1, r2
sd r3, C(r0)
halt