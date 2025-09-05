.data
V: .word 5, 7, 13, -4, 31, -3, 6, -1, 1, 17
POS: .word 0
MAX: .word 0

.code
DADD $t1, $zero, $zero # inicializo el índice
DADD $t2, $zero, $zero # inicializo el resultado de POS
DADD $t3, $zero, $zero # inicializo el resultado de MAX
DADDI $t4, $zero, 80   # inicializo la condición de fin
J LAZO

inc_indice:
DADDI $t1, $t1, 8

LAZO:
LW $t0, V($t1) # cargo el vector
SLT $t5, $t0, $zero # v[i] < zero ?, true = $t5, false = $t5
BEQ $t5, $zero, no_es_negativo # comparamos si se cumplió la condición
DADDI $t2, $t2, 1 # sumamos +1 al registro de POS

no_es_negativo:
SLT $t5, $t3, $t0 # $t3 < $t0?, true $t5, false = $t5
BNE $t5, $zero, no_es_mejor # si la pos actual no es menor que el almacenado salta a la etiqueta
DADD $t3, $zero, $t0 # almaceno el valor en registro

no_es_menor:
DADD $t0, $t0, $t0 # multiplico sin usar DMUL
SW $t0, V($t1) # almaceno en memoria

BNE $t1, $t4, inc_indice # verifico si llegue al final

# almaceno los valores
SW $t2, POS($zero)
SW $t3, MAX($zero)

HALT