.data
coorX: .byte 24 ; coordenada X de un punto
coorY: .byte 24 ; coordenada Y de un punto
color: .byte 255, 0, 255, 0 ; color: maximo rojo + maximo azul => magenta
CONTROL: .word 0x10000
DATA: .word 0x10008

.code
LD      $t0, CONTROL($zero) ; $t0 = direccion de CONTROL
LD      $t1, DATA($zero)    ; $t1 = direccion de DATA

LWU     $t2, color($zero)   ; $t2 = valor de color a pintar (4 bytes)
SW      $t2, 0($t1)         ; DATA recibe el valor del color a pintar

DADDI   $t5, $zero, 8       ; funcion 8
SD      $t5, 0($t0)         ; mando 8 a CONTROL
LBU     $t3, 0($t1)         ; guardo en $t3 lo que quedo en DATA

SB      $t3, 5($t1)         ; DATA+5 recibe el valor de coordenada X

SD      $t5, 0($t0)         ; mando 8 a CONTROL
LBU     $t4, 0($t1)         ; guardo en $4 lo que quedo en DATA

SB      $t4, 4($t1)         ; DATA+4 recibe el valor de coordenada Y

DADDI   $t2, $zero, 5       ; $t2 = 5 -> funcion 5: salida grafica
SD      $t2, 0($t0)         ; CONTROL recibe 5 y produce el dibujo del punto

HALT