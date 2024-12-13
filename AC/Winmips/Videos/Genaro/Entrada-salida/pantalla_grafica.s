.data
coorX:      .byte 24 ; Coordenada X
coorY:      .byte 24 ; Coordenada Y
color:      .byte 255, 0, 255, 0 ; Maximo rojo + maximo azul = magenta
CONTROL:    .word32 0x10000
DATA:       .word32 0x10008

.code
LWU         $s0, CONTROL($0)    ; $s0 = dir de CONTROL
LWU         $s1, DATA($0)       ; $s1 = dir de DATA

DADDI       $t0, $0, 7          ; $t0 = 7 -> función 7: limpiar pantalla gráfica
SD          $t0, 0($s0)         ; CONTROL = 7 (limpia la pantalla gráfica)

LBU         $t0, coorX($zero)   ; $t0 = valor de coordenada X
SB          $t0, 5($s1)         ; DATA + 5 recibe el valor de coordenada X

LBU         $t1, coorY($zero)   ; $t1 = valor de coordenada Y
SB          $t1, 4($s1)         ; DATA + 4 recibe el valor de coordenada Y

LWU         $t2, color($0)      ; $t2 = color
SW          $t2, 0($s1)         ; pongo color en DATA

DADDI       $t0, $zero, 5
SD          $t0, 0($s0)         ; Pinta el píxel

HALT