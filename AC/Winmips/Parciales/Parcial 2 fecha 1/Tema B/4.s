.data
CONTROL:        .word 0x10000
DATA:           .word 0x10008
NARANJA:        .byte 255, 128, 0, 0
PARES:          .word 10, 15, 24, 12, 30, 31, 42, 21, 33, 33
.code
LD              $s0, CONTROL($0)
LD              $s1, DATA($0)
LWU             $s2, NARANJA($0)
SW              $s2, 0($s1)             # mando el color a DATA
DADDI           $sp, $sp, 0x400         # inicio SP
DADDI           $a0, $0, 5              # paso cant de pares
DADDI           $a1, $0, PARES          # paso direcc de vector
JAL             GRAFICAR
HALT

GRAFICAR:
                DADDI           $sp, $sp, -24
                SD              $a0, 0($sp)
                SD              $a1, 8($sp)
                SD              $ra, 16($sp)
                DADD            $t0, $a0, $0            # t0 = contador de loops
                DADD            $t1, $a1, $0            # t1 = direcc de vector
                DADDI           $t2, $0, 0              # posicion aux
LAZO:   
                LD      $a0, 0($t2)             # 1° valor del par en a0
                DADDI   $t2, $t2, 8
                LD      $a1, 0($t2)             # 2° valor en a1
                DADDI   $t2, $t2, 8
                JAL     DIFERENCIA
                SD      $v0, 4($s1)             # mando valor a eje x
                SD      $v0, 5($s1)             # mando valor a eje y
                DADDI   $t3, $0, 5              # debería haberlo inicializado afuera
                SD      $t3, 0($s0)
                DADDI   $t0, $t0, -1            # contador
                BNEZ    $t0, LAZO
                LD      $ra, 16($sp)
                LD      $a1, 8($sp)
                LD      $a0, 0($sp)
                DADDI   $sp, $sp, 24
                JR      $ra
                
DIFERENCIA:
                SLT     $v0, $a1, $a2
                BNEZ    $v0, menor
                DSUB    $v0, $a1, $a2
                J       VOLVER
MENOR:          DSUB    $v0, $a2, $a1
VOLVER:         JR      $ra
