.data
tabla1:         .word 10, 14, 23
tabla2:         .word 0, 0, 0

.code
DADDI           $t0, $0, 0
DADDI           $t1, $t0, 3
LOOP:   LD      $t2, tabla1($t0)
        DADDI   $t2, $t2, 1
        SD      $t2, tabla2($t0)
        DADDI   $t0, $t0, 8
        DADDI   $t1, $t1, -1
        BNEZ    $t1, LOOP
        HALT