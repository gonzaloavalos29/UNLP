.data
A:              .word 2
B:              .word 4
C:              .word 0

.code
LD                  $t0, A($zero)
LD                  $t1, B($zero)
DADDI               $t2, $zero, 0
BUCLE:  DADD        $t2, $t2, $t1       ; 1 RAW
        DADDI       $t0, $t0, -1
        BNEZ        $0, BUCLE
        DADDI       $t2, $t2, -1       
        SD          $t2, C($zero)          ; 1 RAW
        HALT