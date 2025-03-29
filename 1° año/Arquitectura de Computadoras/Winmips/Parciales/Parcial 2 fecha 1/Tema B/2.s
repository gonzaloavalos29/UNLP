.data
TABLA1:          .word 11,2,6,7,4,21,10,4
CANT:           .word 8
RES:            .word 0
TABLA2:         .word 0

.code
LD              $t0, CANT($zero)
DADD            $t1, $zero, $zero
DADDI           $t2, $0, 0                  ; ______________
DADD            $t3, $zero, $zero
LOOP:   LD      $t4, TABLA1($t2)
        ANDI    $t5, $t4, 1
        BEQZ    $t5, FUERA
        DADDI   $t1, $t1, 1
        SD      $t4, TABLA2($t3)
        DADDI   $t3, $t3, 8                 ; ______________
FUERA:  DADDI   $t2, $t2, 8
        DADDI   $t0, $t0, -1
        BNEZ    $t0, LOOP
        SD      $t1, RES($0)                ; ______________
        HALT