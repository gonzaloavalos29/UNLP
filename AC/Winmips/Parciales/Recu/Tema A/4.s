.data
CADENA:         .asciiz     ""
PUNTO:          .asciiz     "."
CONTROL:        .word       0x10000
DATA:           .word       0x10008

.text
LD              $s6, CONTROL($0)
LD              $s7, DATA($0)       