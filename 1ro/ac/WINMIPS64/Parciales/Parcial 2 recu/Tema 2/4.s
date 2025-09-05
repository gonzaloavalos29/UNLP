.data
CONTROL:        .word 0x10000
DATA:           .word 0x10008
PUNTO:            .ascii "."
CADENA:         .asciiz " "
SIMBOLO:        .asciiz "#"

.text
LD              $s0, CONTROL($0)
LD              $s1, DATA($0)
LD              $s3, PUNTO($s0)
DADDI           $a0, $0, CADENA
JAL             LEER
DADDI           $a0, $0, CADENA
JAL             CAMBIAR
SD              $v0, 0($s1)
DADDI           $t4, $0, 4
SD              $t4, 0($s0)
HALT

LEER:
                DADD            $t0, $0, $a0
                DADDI           $t1, $0, 9
LOOP:           SD      $t1, 0($s0)
                LBU     $t2, 0($s1)
                SB      $t2, 0($t0)
                BEQ     $t2, $s3, TERMINA
                DADDI   $t0, $t0, 1
                J       LOOP
TERMINA:
                JR      $ra

CAMBIAR:        
                DADDI   $sp, $sp, 16
                SD      $ra, 0($sp)
                SD      $a0, 8($sp)
                DADD    $v0, $0, $a0
                LB      $s4, SIMBOLO($0)        ; cargar el símbolo '#' en $s4
POLL:           LBU     $a0, 0($v0)
                BEQZ    $a0, FINAL              
                JAL     ES_VOCAL
                BEQZ    $v0, NO_CAMBIES
                SB      $s4, 0($v0)             ; reemplazar el caracter con el símbolo '#'
NO_CAMBIES:     DADDI   $v0, $v0, 1
                J       POLL
FINAL:          LD      $a0, 8($sp)
                LD      $ra, 0($sp)
                DADDI   $sp, $sp, 16
                JR      $ra