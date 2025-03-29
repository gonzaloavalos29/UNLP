.data
coorX:      .byte 0              ; coordenada X de un punto
coorY:      .byte 24             ; coordenada Y de un punto
color:      .byte 0, 0, 255, 0   ; color: maximo rojo + maximo azul => magenta
CONTROL:    .word 0x10000
DATA:       .word 0x10008

.code
DADDI       $t4, $zero, 50
LD          $t0, CONTROL($zero) ; $t0 = direccion de CONTROL
LD          $t1, DATA($zero)    ; $t1 = direccion de DATA

LBU         $t2, coorY($zero)   ; $t2 = valor de coordenada Y
SB          $t2, 4($t1)         ; DATA+4 recibe el valor de coordenada Y

LWU         $t2, color($zero)   ; $t2 = valor de color a pintar (4 bytes)
SW          $t2, 0($t1)         ; DATA recibe el valor del color a pintar

DADDI       $t9, $zero, 5       ; $t2 = 5 -> funcion 5: salida grafica
LB          $t2, coorX($zero)   ; $t2 = valor de coordenada X

LOOP:  
SB          $t2, 5($t1)         ; DATA+5 recibe el valor de coordenada X
SD          $t9, 0($t0)         ; CONTROL recibe 5 y produce el dibujo del punto
DADDI       $t2, $t2, 1
BNE         $t4, $t2, LOOP

HALT