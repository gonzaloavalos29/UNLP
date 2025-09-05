.code
DADDI $t2, $0, 15      # $t2 = 15
DADD  $t9, $0, $0      # $t9 = 0
LAZO:  DADDI $t2, $t2, -3  # $t2 = $t2 - 3
        SLTI $t8, $t2, 12   # $t0 = ($t2 < 12) ? 1 : 0
        BEQZ $t8, LAZO      # Si $t8 == 0, salta a LAZO
        DADD $t9, $t9, $t2  # $t9 = $t9 + $t2
        HALT