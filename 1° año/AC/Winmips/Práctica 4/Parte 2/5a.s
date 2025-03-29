.data
X:          .byte 45
Y:          .byte 0
color:      .byte 255, 0, 0, 0
CONTROL:    .word32 0x10000
DATA:       .word32 0x10008

.code
LWU         $s0, CONTROL($zero)         # configura CONTROL
LWU         $s1, DATA($zero)            # configura DATA

LWU         $t0, color($zero)           # carga en $t0 COLOR
SW          $t0, 0($s1)                 # manda a DATA $t0, (COLOR)
LBU         $t1, Y($zero)               # _____________
LBU         $t2, X($zero)               # carga en $t2 la coordenada X
DADDI       $t4, $zero, 50
DADDI       $t5, $zero, 5
LOOP:
SB          $t1, 4($s1)                 # almaceno lo que hay en $t1 en DATA(Y)
SB          $t2, 5($s1)                 # almaceno lo que hay en $t2 en DATA(X) ____________
DADDI       $t3, $zero, 5               # funcion 5
SD          $t3, 0($s0)                 # mando a control 5
DADDI       $t2, $t2, 1                 # a la coordenada X le suma 1
BNE         $t4, $t2, LOOP              # si no $t2 != 50 salta
DADDI       $t2, $zero, 45              # hago que vuelva a la coordenada X = 45 ___________
DADDI       $t1, $t1, 1                 
BNE         $t5, $t1, LOOP

HALT