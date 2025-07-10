; Definir un vector de 5 números V
; Calcular la suma de los números del vector, utilizando saltos
; Guardar el resultado en una variable C
; Asumir que V tiene los elementos 2, -10, 512, 8, 16 para probar el programa

.data
V: .word 2, 4, 9
C: .word 0

.code
        daddi r2, r0, 0 ; resultado
        daddi r1, r0, 3 ; # elementos del vector

        daddi r5, r0, 0 ; desplazamiento
loop:   ld r1, V(r5)
        dadd r2, r2, r1 ; r2 = r2 + r1 = 0 + 2
        daddi r5, r5, 8
        daddi r3, r3, -1 ; r3 = r3 - 1; dec r3
        bnez r3, loop
sd r2, C(r0)

halt