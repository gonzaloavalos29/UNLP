.data
CONTROL:            .word       0x10000
DATA:               .word       0x10008
NARANJA:            .byte       255, 128, 0, 0
PARES:              .word       10,15,24,12,30,31,42,21,33,33

.code
LD                  $s0, CONTROL($0)        # Cargo en s0 control
LD                  $s1, DATA($0)           # Cargo en s1 data
LWU                 $s2, NARANJA($0)        # cargo el color naranja en s2
SW                  $s2, 0($s1)             # guardo en data el color
DADDI               $sp, $sp, 0x400         # inicializo la pila de sp
DADDI               $a0, $zero, 5           # paso cant de pares
DADDI               $a1, $0, PARES          # paso dir de vector
JAL                 GRAFICAR                # llamo a la subrutina graficar
HALT

GRAFICAR:   DADDI   $sp, $sp, -24           # 8 + 8 + 8 = 24 -> utilizo 3 espacios en la pila (a0, a1, ra)
            SD      $a0, 0($sp)             # guardo en sp = a0
            SD      $a1, 0($sp)             # guardo en sp = a1
            SD      $ra, 0($sp)             # guardo en sp = ra
            DADD    $t0, $a0, $0            # t0 = 5
            DADD    $t1, $a1, $0            # t1 = dir de vector
            DADDI   $t2, $0, 0              # t2 = 0
LAZO:       LD      $a0, 0($t2)             # a0 = t2
            DADDI   $t2, $t2, 8             # me desplazo en la pila (16)
            LD      $a1, 0($t2)             # a1 = t2
            DADDI   $t2, $t2, 8             # me desplazo en la pila (8)
            JAL     DIFERENCIA              # llamo a DIFERENCIA
            SD      $v0, 4($s1)             # data = v0 (pos y)
            SD      $v0, 5($s1)             # data = v0 (pos x)
            DADDI   $t3, $0, 5              # t3 = 5
            SD      $t3, 0($s0)             # control = 5
            DADDI   $t0, $t0, -1            # t0 = t0 - 1
            BNEZ    $t0, LAZO               # si t0 != 0 salto a LAZO
            LD      $ra, 16($sp)            # ra = sp(16)  
            LD      $a1, 8($sp)             # a1 = sp(8)
            LD      $a0, 0($sp)             # a0 = sp(0)
            DADDI   $sp, $sp, 24            # vuelvo de la pila 3 espacios
            JR      $ra                     # vuelvo de la subrutina
DIFERENCIA: SLT     $v0, $a1, $a2           # v0 = a1 < a2 = 1
            BNEZ    $v0, MENOR              # si v0 != 0 salto a MENOR
            DSUB    $v0, $a1, $a2           # v0 = a1 - a2
            J       VOLVER                  # salto a VOLVER
MENOR:      DSUB    $v0, $a2, $a1           # v0 = a2 - a1
VOLVER:     JR      $ra