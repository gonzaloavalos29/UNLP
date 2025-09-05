.data
CONTROL:        .word 0x10000
DATA:           .word 0x10008
CARACTER:       .byte 0

.code
LWU         $s0, CONTROL($0)        ; $s0 = CONTROL
LWU         $s1, DATA($0)           ; $s1 = DATA

; Pará crack, leeme un caracter
DADDI   $t1, $0, 9
SD      $t1, 0($s0)         ; CONTROL = 9 (LEO CARACTER)

; "Presiona una tecla". La CPU guarda el caracter en DATA
LBU     $t1, 0($s1)         ; Tomo caracter en $t1

; Guardo en variable
SB      $t1, CARACTER($0)

; Tomo dir de CARACTER y la pongo en $s3
DADDI   $s3, $0, CARACTER

; Mando dir de CARACTER a DATA
SD      $s3, 0($s1)

; Imprimimos caracter
DADDI   $t1, $0, 4
SD      $t1, 0($s0)         ; CONTROL = 4 (IMPRIMIR)
FIN: HALT