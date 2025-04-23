.data
V: .word 5, 2, 6
RES: .word 0

.code
DADD $t1, $zero, $zero # inicializo el índice en 0
DADDI $t3, $zero, 24   # uso $t3 para comparar si llegué a la tercer posición (pos * 8 = 24, 24 es mi condición de fin, 2 bytes más que el final del vector)

loop:
LW $t0, V($t1) # cargo la dirección del vector
DADD $t4, $t4, $t0 # sumo la pos del vector a $t4
DADDI $t1, $t1, 8 # avanzo en el índice
BNE $t1, $t3, loop # si llegué a 16 termino
SW $t4, RES($zero) # almaceno el resultado
HALT