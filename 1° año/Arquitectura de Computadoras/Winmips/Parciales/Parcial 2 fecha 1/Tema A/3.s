.data
pos_X:      .byte 24
pos_Y:      .byte 24
color_rojo: .byte 255, 0, 0, 0
color_azul: .byte 0, 0, 255, 0
CONTROL:    .word32 0x10000
DATA:       .word32 0x10008

.code
LWU             $s6, CONTROL(r0)
LWU             $s7, DATA(r0)
LBU             $s0, pos_Y(r0)
LBU             $s1, pos_X(r0)
LWU             $s2, color_rojo(r0)
LWU             $s3, color_azul(r0)
DADDI           $t8, $0, 1
seguir:     SB $s0, 4($s7)
            SB $s1, 5($s7)
            BEQZ $t8, azul      # _____________
            DADDI $t4, $s2, 0
            J salto
azul:       DADDI $t4, $s3, 0
salto:      SD  $t4, 0($s7)     # _____________
            XORI $t8, $t8, 1
            DADDI $t1, $0, 5
            SD $t1, 0($s6)
            DADDI $s0, $s1, 1
            SLTI $t9, $s1, 49   # _____________
            BNEZ $t9, seguir

HALT