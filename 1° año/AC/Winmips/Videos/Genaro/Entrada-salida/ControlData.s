.data
CONTROL: .word 0x10000
DATA:    .word 0x10008

.code   
LD          $s0, CONTROL($zero)             ; $s0 = CONTROL
LD          $s1, DATA($zero)                ; $s1 = DATA

DADDI       $t0, $zero, -85
SD          $t0, 0($s1)                     ; Mando el dato a DATA

DADDI       $t0, $zero, 2   
SD          $t0, 0($s0)                     ; CONTROL = 2 (escribe)

DADDI $t0, $zero, 6
SD    $t0, 0($s0)                         ; control = 6 (limpia)

HALT