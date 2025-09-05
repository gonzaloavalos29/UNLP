.data
CONTROL:    .word 0x10000
DATA:       .word 0x10008
RESULTADO:  .word 0

.code
LW      $s0, CONTROL($zero)     # configuramos s0 y s1
LW      $s1, DATA($zero)

DADDI   $t0, $zero, 8           # guardamos 8 en la direccion de control
SD      $t0, 0($s0)             # para leer numeros

LD      $t1, 0($s1)             # cargo en t1 el numero leido

DADD    $t1, $t1, $t2           # almaceno en t1 el segundo numero leido
SD      $t1, RESULTADO($zero)   # almaceno en variable

HALT