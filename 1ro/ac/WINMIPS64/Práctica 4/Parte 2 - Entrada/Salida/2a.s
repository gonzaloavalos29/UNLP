# EJERCICIO 2-A

.data
texto:          .asciiz             "Ingrese clave de 4 car. "
permitir:       .asciiz             "Clave correcta: acceso permitido"
denegada:       .asciiz             "Clave incorrecta"
clave:          .asciiz             "1234"
CONTROL:        .word               0x10000
DATA:           .word               0x10008
ingreso:        .asciiz             ""

.code
LD              $t0, CONTROL($zero)
LD              $t1, DATA($zero)
DADDI           $t2, $zero, 4
SD              $t2, 0($t1)
DADDI           $t2, $zero, 4
SD              $t2, 0($t0)
DADDI           $t3, $zero, ingreso
DADDI           $t4, $zero, 9
LOOP:
        SD      $t4, 0($t1)
        LBU     $t5, 0($t1)
        SB      $t5, 
        
