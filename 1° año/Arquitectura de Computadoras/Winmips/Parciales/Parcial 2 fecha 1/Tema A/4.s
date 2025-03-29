.data
CONTROL:    .word 0x10000
DATA:       .word 0x10008

AZUL:       .byte 0, 0, 255, 0
DATOS:      .word 35, 20, 70, 20, 1, 1, -10, 5, 20, 30, -3, 10, 12, 20

.code
DADDI   $sp, $0, 0x400
LD      $s0, CONTROL($0)
LD      $s1, DATA($0)
DADDI   $a0, $0, DATOS
LWU     $s2, AZUL($0)
SW      $s2, 0($s1)                         # envío color
DADDI   $a1, $0, 7
JAL     GRAFICAR
HALT

GRAFICAR:   DADDI       $sp, $sp, -40
            SD          $ra, 0($sp)
            SD          $s2, 8($sp)
            SD          $s3, 16($sp)
            SD          $s4, 24($sp)
            SD          $s5, 32($sp)
            DADD        $s2, $0, $a0        # dir datos
            DADD        $s3, $0, $a1        #

LOOP:       LD          $a0, 0($s2)         # 1° num(X)
            DADD        $s4, $0, $a0        # guardo x
            JAL         EN_RANGO
            BEQZ        $v0, SIG_PAR
            DADDI       $s2, $s2, 8         # sig num
            LD          $a0, 0($s2)         # 2° num(Y)
            DADD        $s5, $0, $a0        # guardo Y
            JAL         EN_RANGO
            BEQZ        $v0, SIG
            SB          $s5, 4($s1)         # envío coordenadas
            SB          $s4, 5($s1)         # envío coordenadas
            DADDI       $t0, $0, 5
            SD          $ra, 0($s0)         # pinta

SIG:        DADDI       $s2, $s2, 8         # sig num
            j           SEGUIR

SIG_PAR:    DADDI       $s2, $s2, 16        # sig par de nums
SEGUIR:     DADDI       $s3, $s3, -1        # DEC CANT
            BNEZ        $s3, LOOP
            LD          $s5, 32($sp)
            LD          $s4, 24($sp)
            LD          $s3, 16($sp)
            LD          $s2, 8($sp)
            LD          $ra, 0($sp)
            DADDI       $sp, $sp, 40
            JR          $ra