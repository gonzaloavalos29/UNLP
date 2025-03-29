# Pintar el pixel (24,10) de violeta
.data
coorX:      .byte   24              ; coordenada X de un punto
coorY:      .byte   10              ; coordenada Y de un punto
color:      .byte   255, 0, 255, 0  ; rojo + azul = violeta
CONTROL:    .word32 0x10000         ; dir de CONTROL
DATA:       .word32 0x10008         ; dir de DATA

.text
LWU         $s0, CONTROL($0)        ; $s6 = dir. de CONTROL
LWU         $s1, DATA($0)           ; $s7 = dir. de DATA
LBU         $s2, coorX($0)          ; $s0 = coordenada X
SB          $s2, 5($s1)             ; DATA+5 = coordenada X
LBU         $s3, coorY($0)          ; $s1 = coordenada Y
SB          $s3, 4($s1)             ; DATA+4 = coordenada Y
LWU         $s4, color($0)          ; $s2 = color
SW          $s4, 0($s1)             ; DATA = color
DADDI       $s5, $0, 5              ; $t0 = 5 -> salida gráfica
SD          $s5, 0($s0)             ; CONTROL = 5 -> salida gráfica

HALT