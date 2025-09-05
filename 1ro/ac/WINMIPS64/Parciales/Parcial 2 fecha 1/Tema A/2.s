.data
valor:  .word 5

.code
LD      $t1, valor($0) ; 1
DADD    $t2, $t3, $t4  ; 4
DMUL    $t5, $t6, $t7  ; 7
SD      $t8, valor($0) ; 1
; 13 CPI
HALT