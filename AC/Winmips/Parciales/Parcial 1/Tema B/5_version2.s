.data  
CANT:       word 10
CONTROL:    .word 0x10000
DATA:       .word 0x10008
NARANJA:    .byte 255, 128, 0, 0
PARES:      .word 10, 15, 24, 12, 30, 31, 42, 21, 33, 33

.code
DADDI               $sp, $0, 0x400
LD                  $a0, CANT($0)
DADDI               $a1, $0, PARES
JAL GRAFICAR
HALT

GRAFICAR:   DADDI   $sp, $sp, -40
            SD      $ra, 0($sp)
            SD      $s0, 8($sp)
            SD      $s1, 16($sp)
            SD      $s6, 24($sp)
            SD      $s7, 32($sp)
            LWU     $s6, CONTROL($0)
            LWU     $s7, DATA($0)
            DADD    $s0, $0, $a0
            DADD    $s1, $0, $a1

SIGUE:      LD      $a1, 0($s0)
            LD      $a2, 8($s0)
            DADDI   $s0, $s0, 16
            DADDI   $s1, $s1, -2
            JAL     DIFERENCIA
            LWU     $t1, NARANJA($0)
            SW      $t1, 0($s7)
            SB      $v0, 4($s7)
            SB      $v0, 5($s7)
            DADDI   $t2, $0, 5
            SD      $t2, 0($s6)             ; muestro
            LD      $ra, 0($sp)
            LD      $s0, 8($sp)
            LD      $s1, 16($sp)
            LD      $s6, 24($sp)
            LD      $s7, 32($sp)
            DADDI   $sp, $sp, 40
            JR      $ra

DIFERENCIA: DADDI   $v0, $0, 0
            DADDI   $sp, $sp, -40
            SD      $ra, 0($sp)
            SLT     $t0, $a1, $a2
            BNEZ    $t0, RESTA
            DSUB    $t1, $a1, $a2
            J       FIN

RESTA:      DSUB    $t1, $a2, $a1
FIN:        SD      $v0, 0($t1)
            LD      $ra, $sp
            DADDI   $sp, $sp, 40
            JR      $ra