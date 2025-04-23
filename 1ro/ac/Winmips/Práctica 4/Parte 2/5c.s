.data 
X:          .byte 0
Y:          .byte 0
color:      .byte 255, 255, 0, 0
CONTROL:    .word32 0x10000
DATA:       .word32 0x10008

.code
LWU         $s0, CONTROL($zero)             # configura CONTROL
LWU         $s1, DATA($zero)                # configura DATA

LWU         $t0, color($zero)               # carga en $t0 COLOR
SW          $t0, 0($s1)                     # manda a DATA $t0, (COLOR)

LBU         $t1, Y($zero)                   # carga en $t1 la coordenada Y _______________
LBU         $t2, X($zero)                   # carga en $t2 la coordenada X
DADDI       $t4, $zero, 50                  # se usa para comparar el fin
DADDI       $t5, $zero, 50                  # se usa para comparar el fin
LOOP:
SB          $t0, 1($s1)                     # manda a DATA $t0, (COLOR)
SB          $t1, 4($s1)                     # almaceno lo que hay en $t1 en DATA(Y)
SB          $t2, 5($s1)                     # almaceno lo que hay en $s2 en DATA(X) ____________
DADDI       $t3, $zero, 5                   # funcion 5
SD          $t3, $zero, 5                   # mando a control 5
DADDI       $t2, $t2, 1                     # a la coordenada X le suma 1
BNE         $t4, $t2, LOOP                  # si $t2 = 50 salta
DADDI       $t2, $zero, 0                   # hago que vuelva a la coordenada X = 0 ____________
DADDI       $t0, $t0, -5
DADDI       $t1, $t1, 1                     # sumo 1 a la coordenada Y
BNE         $t5, $t1, LOOP

HALT