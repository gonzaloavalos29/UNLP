.data
coorX: .byte 24 ; coordenada X de un punto
coorY: .byte 24 ; coordenada Y de un punto
color: .byte 255, 0, 0, 0.9 ; color: maximo rojo + maximo azul
CONTROL: .word 0x10000
DATA: .word 0x100008

.code
DADDI       $t5, $zero, 255     # inicializamos en 255
DADD        $t4, $zero, $zero   # usamos t4 como contador

LD          $t0, CONTROL($zero) # usamos t4 como contador
LD          $t1, DATA($zero)

LBU         $t2, coorY($zero)
SB          $t2, 4($t1)

LOOP:
LWU         $t2, color($zero)   ; carga el color en $t2
DADD        $t2, $t4, $zero,    ; cargamos t4 en t2
DADDI       $t5, $t5, -1        ; decrementamos el comparador
SW          $t2, 0($t1)         ; se lo manda a data
DADDI       $t4, $t4, 1         ; incrementamos el color
DADDI       $t2, $zero, 5
SD          $t2, 0($t0)
BNEZ        $t5, LOOP

HALT