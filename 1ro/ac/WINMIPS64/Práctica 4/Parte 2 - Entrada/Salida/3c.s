.data
CONTROL:        .word 0x10000
DATA:           .word 0x10008
RESULTADO:      .word 0

.code
LW $s0, CONTROL($zero)          # configuramos s0 y s1
LW $s1, DATA($zero)

DADDI $t0, $zero, 8             # guardo 8 en la dirección de control
SD    $t0, 0($s0)               # para leer numeros

LD $t1, 0($s1)                  # cargo en t1 el numero leido

loop:
DADDI $t0, $zero, 9             # guardo 9 en la direccion de control
SD    $t0, 0($s0)               # para leer un caracter

LBU $t3, 0($s1)                 # cargo en t3 el caracter leido

DADDI $t0, $zero, 8             # guardamos 8 en la direccion de control
SD    $t0, 0($s0)               # para leer numeros

LD    $t2, 0($s1)               # cargo en t2 el segundo numero leido

# suma
DADDI       $t4, $zero, 43
BEQ         $t3, $t4, suma

# resta
DADDI       $t4, $zero, 45
BEQ         $t3, $t4, resta

# multiplicacion
DADDI       $t4, $zero, 42
BEQ         $t3, $t4, multiplicacion

# division
DADDI       $t4, $zero, 47
BEQ         $t3, $t4, division

j fin 

suma:
DADD        $t1, $t1, $t2
j imprimir

resta:
DSUB        $t1, $t1, $t2
j imprimir

multiplicacion:
DMUL        $t1, $t1, $t2
j imprimir

division:
DDIV        $t1, $t1, $t2
j imprimir

imprimir:
SD          $t1, RESULTADO($zero)

DADDI       $t0, $zero, 7       # limpio la pantalla
SD          $t0, 0($s1)

DADDI       $t0, $zero, 2       # imprimo el resultado
SD          $t0, 0($s1)

j loop

fin:
HALT