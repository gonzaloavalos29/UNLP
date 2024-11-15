; Definir un vector de 3 numeros V
; Calcular la suma de los números del vector, sin utilizar saltos
; Guardar el resultado en una variable C
; Asumir que V tiene los elementos 2, 4, 9 para probar el programa

.data
V: .word 2, 4, 9
C: .word 0

.code
daddi r5, r0, 0
ld r1, V(r5)

daddi