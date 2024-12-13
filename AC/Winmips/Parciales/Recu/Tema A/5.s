.data
CADENA:         .byte           0
PUNTO:          .asciiz         "."
CONTROL:        .word 0x10000
DATA:           .word 0x10008

.code
LD              $s6, CONTROL($0)        ; $s6 = CONTROL
LD              $s7, DATA($0)           ; $s7 = DATA

DADDI           $s0, $0, PUNTO          ; $s0 = ASCII del PUNTO
DADDI           $t2, $0, 0              ; inicializo $t0 (desplazamiento)
JAL             LEER

DADDI           $a0, $0, CADENA

; Crack leeme un caracter
LEER:   DADDI   $t1, $zero, 9
        SD      $t1, 0($s6)             ; CONTROL = 9     

        LBU     $t1, 0($s7)             ; TOMO CARACTER EN $t1
        
        ; Actualizo el desplazamiento
        DADDI   $t2, $0, 8
        ; Guardo en variable
        SB      $t1, CARACTER($t2)
        ; Comparo con el ASCII del ENTER
        BEQ     $t1, $s0, FIN

        J       LEER
FIN:    JR      $ra

CAMBIAR:

HALT