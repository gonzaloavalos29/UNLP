.data
V: .word 0

.code
DADDI $t0, $zero, 1     # $t0
DADD  $t1, $zero, $zero # t1 indice
LW    $t2, V($zero)     # t2 vector
DADDI $t3, $zero, 10    # t3 contador

loop:
SW    $t0, V($t1)
DADDI $t1, $t1, 8  # aumento el indice
DADDI $t3, $t3, -1 # decremento el contador
DADDI $t0, $t0, 2  # aumento en 2 el valor
BNE   $t3, $zero, loop
HALT 