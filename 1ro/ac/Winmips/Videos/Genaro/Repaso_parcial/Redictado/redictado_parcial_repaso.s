.data
INGRESO:            .asciiz     ""
TEXTO:              .asciiz     "Ingrese una cadena (finalizar con 0)"
CONTROL:            .word       0x10000
DATA:               .word       0x10008
INGRESO_AL_REVES    .asciiz     ""
LONGITUD            .word       0

.code
LD      $t0, CONTROL($0)
LD      $t1, DATA($0)
DADDI   $t2, $0, TEXTO      ; apunto a texto
SD      $t2, 0($t1)         ; DATA recibe el puntero al comienzo del mensaje
DADDI   $t4, 0, 4
DADDI   $t3, $0, 0          ; $t3 = 0(contador de car)
SD      $t4, 0($0)          ; CONTROL recibe 4 e imprime string
DADDI   $t2, $0, INGRESO
DADDI   $t4, $0, 9
LOOP:   SD      $t4, 0($0)           ; leo caracter
        LBU     $t5, 0($t1)         ; paso car leido a reg
        SB      $t5, 0($t2)         ; guardo car en memoria -> ingreso
        DADDI   $t3, $t3, 1         ; actualizo puntero
        BNEZ    $t5, LOOP           ; si car leido != 0 -> LOOP

SW      $t3, 0(LONGITUD)
DADDI   $t4, $0, 4
DADDI   $t2, $0, INGRESO            ; apunto a INGRESO
SD      $t2, 0($t1)                 ; DATA = dir ingreso
SD      $t4, 0($t0)                 ; CONTROL imprime STRING
DADDI   $t6, $0, INGRESO_AL_REVES   ; apunto a ingreso_al_reves
DADDI   $t7, $t7, 0
CREAR_STRING:   LBU     $t5, LONGITUD($t2) ; $t5 = desplazamiento ingreso
                SB      $t5, $t7($t6)
                DADDI   $t7, $t7, 1
                DADDI   $t3, $t3, -1
                SW      $t3, 0(LONGITUD)
                BNEZ    $t3, CREAR_STRING
SD      $t6, 0($t1)                 ; DATA = dir. ingreso_al_reves
SD      $t4, 0($t0)                 ; CONTROL = 4 (imprime string)
