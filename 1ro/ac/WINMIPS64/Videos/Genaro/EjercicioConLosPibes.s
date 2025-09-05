.data
CONTROL:            .word 0x10000
DATA:               .word 0x10008

.code
LWU                 $s0, CONTROL($zero)         ; $s0 = CONTROL
LWU                 $s1, DATA($zero)            ; $s1 = DATA

; Para crack, leeme un caracter
LOOP:
        DADDI               $t1, $zero, 9
        SD                  $t1, 0($s0)                 ; CONTROL = 9

        ; "Presiona una tecla". La CPU guarda el caracter en DATA
        LBU                 $t1, 0($s1)                 ; Tomo caracter en $t1

        ; Guardo en variable
        SB                  $t1, CARACTER($zero)

        ; Tomo direccion de CARACTER y la pongo en $s3
        DADDI               $s3, $zero, CARACTER

        ; Mando direccion de CARACTER a DATA    
        SD                  $s3, 0($s1)

        ; Imprimimos caracter
        DADDI               $t1, $zero, 4
        SD                  $t1, 0($s0)                 ; CONTROL = 4

        J LOOP
HALT    