# Colores alternativos
# Escribir un programa que imprime alternativamente un punto rojo y uno azul en la pantalla gráfica, y llena toda la pantalla de esta forma.
# Para ello, implementar una subrutina fila_alternativa que recibe un número de fila y dos colores, y llena toda la fila con pixeles de los dos colores de forma alternativa. Utilizando fila_alternativa, escriba un programa que pinte toda la pantalla de rojo y azul, de forma tal que en la primera fila comience con el rojo, en la 2da con azul, y así sucesivamente.
.data
pos_X:      .byte 0
pos_Y:      .byte 0
color_rojo: .byte 255, 0, 0, 0
color_azul: .byte 0, 0, 255, 0
CONTROL:    .word32 0x10000
DATA:       .word 32 0x10008

.code
LBU                 $s0, pos_Y(r0)
LBU                 $s1, pos_X(r0)
LWU                 $s2, color_rojo(r0)
LWU                 $s3, color_azul(r0)
DADDI               $s4, $0, 1
OTRA_F: DADD        $a0, $0, $s0
        BEQZ        $s4, invertir
        DADDI       $a1, $s2, 0             ; color rojo en $a1
        DADDI       $a2, $s3, 0             ; color azul en $a2
        J           SALTEO

INVERTIR:   DADDI   $a2, $s2, 0             ; color rojo en $a2
            DADDI   $a1, $s3, 0             ; color azul en $a1

SALTEO:     JAL     FILA_ALTERNATIVA 
            DADDI   $s0, $s0, 1             ; incremento coord Y
            LBU     $s1, pos_X(r0)          ; reinicio coord x
            XORI    $s4, $s4, 1
            SLTI    $s5, $s0, 50
            BNEZ    $s5, otra_f 
            HALT

FILA_ANTERNATIVA:   LWU $t6, CONTROL(r0)
                    LWU $t7, DATA(r0)
                    DADDI $t0, $s0, 0
                    DADDI $t1, $0, 1
                    SB $a0, 4($t7)          ; fila fija
SEGUIR:             SB $t0, 5($t7)
                    BEQZ $t1, color
                    DADDI $t4, $a1, 0       ; color 1
                    J SALTEO
COLOR:              DADDI $t4, $a2, 0       ; color 2
SALTO:              SW $t4, 0($t7)
                    XORI $t1, $t1, 1        ; invierte valor
                    DADDI $t2, $0, 5
                    SD $t2, 0($t6)          ; 5 en control
                    DADDI $t0, $t0, 1       ; incremento coord x
                    SLTI $t9, $t0, 50
                    BNEZ $t9, SEGUIR
                    jr $ra