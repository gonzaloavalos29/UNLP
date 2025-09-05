.data
CONTROL:            .word 0x10000
DATA:               .word 0x10008
X:                  .byte 5
Y:                  .byte 5
color:              .byte 255, 0, 0, 0
pesos:              .byte 27, 21, 35, 38, 35, 43, 28, 31, 37, 28, 34, 25

.code
LD                  $s6, CONTROL($0)
LD                  $s7, DATA($0)               ; # __________
DADDI               $t1, $0, 12
DADD                $t2, $0, $0
LWU                 $s2, color($0)
LB                  $s1, X($0)
LB                  $s0, Y($0)                  ; # __________
DADDI               $t0, $0, 5
LOOP:               LB $t3, pesos($t2)
                    SW $s2, 0($s7)              ; # __________
                    SB $s0, 4($s7)
BARRA:              SB $s1, 5($s7)
                    SD $t0, 0($s6)
                    DADDI $t3, $t3, -1          ; # __________
                    DADDI $s1, $s1, 1
                    BNEZ $t3, BARRA
                    DADDI $s0, $s0, 1
                    DADDI $t2, $t2, 1
                    DADDI $t1, $t1, -1
                    BNEZ $t1, LOOP              ; # __________
                    HALT