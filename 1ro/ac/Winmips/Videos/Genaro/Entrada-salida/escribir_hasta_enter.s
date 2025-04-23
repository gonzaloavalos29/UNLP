.data
CONTROL:        .word 0x10000
DATA:           .word 0x10008
CARACTER:       .byte 0

.code
LWU         $s0, CONTROL($zero)        ; $s0 = CONTROL
LWU         $s1, DATA($zero)           ; $s1 = DATA

DADDI       $s4, $zero, 13             ; $s4 = ASCII del ENTER

; Pará crack, leeme un caracter
LOOP:   DADDI   $t1, $zero, 9
        SD      $t1, 0($s0)         ; CONTROL = 9     
        
        ; *Presiona una tecla*. La CPU guarda el caracter en DATA
        LBU     $t1, 0($s1)         ; Tomo caracter en $t1

        ; Comparo con el ASCII del ENTER
        BEQ     $t1, $s4, FIN

        ; Guardo en variable
        SB      $t1, CARACTER($zero)

        ; Tomo dir de CARACTER y la pongo en $s3
        DADDI   $s3, $zero, CARACTER

        ; Mando dir de CARACTER a DATA
        SD      $s3, 0($s1)

        ; Imprimimos caracter
        DADDI   $t1, $zero, 4
        SD      $t1, 0($s0)         ; CONTROL = 4

        J LOOP

FIN: HALT