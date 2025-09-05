; Definir un vector de 3 números V
; Calcular la suma de los números del vector, sin utilizar saltos
; Guardar el resultado en una variable C
; Asumir que V tiene los elementos 2, 4, 9 para probar el programa

.data
V: .word 2, 4, 9
C: .word 0

.code
daddi r3, r0, 0 ; resultado

daddi r5, r0, 0
ld r1, V(r5)
dadd r2, r2, r1 ; r2 = r2 + r1 = 0 + 2

daddi r5, r5, 8
ld r1, V(r5)
dadd r2, r2, r1 ; r2 = r2 + r1 = 2 + 4

dadd r5, r5, 8
ld r1, V(r5)
dadd r2, r2, r1 ; r2 = r2 + r1 = 6 + 9 = 15

sd r2, C(r0)

halt