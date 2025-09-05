; Dadas dos variables A y B
; Calcular el máximo entre los dos y guardar el resultado en la variable C
; asumir que A = 4 y B = 10 para poder probar el ejercicio

.data
A: .word 4
B: .word 10
C: .word 0

.code
        ld r1, A(r0)
        ld r2, B(r0)

        slt r3, r1, r2 ; r3 = 1 sii r1 es menor que r2
        bnez r3, mayorB ; si no es igual a 0
        sd r1, C(r0) ; r1 es mayor
        j fin
mayorB: sd r2, C(r0) ; r2 es mayor

fin: halt