.data
texto: .asciiz "Hola, Mundo!" ; el mensaje a mostrar
CONTROL: .word 0x10000
DATA: .word 0x10008

.code
DADDI   $t3, $zero, 10
LD      $t0, CONTROL($zero) ; $t0 = direccion de CONTROL
LD      $t1, DATA($zero)    ; $t1 = direccion de DATA
DADDI   $t2, $zero, texto   ; $t2 = direccion del mensaje a mostrar
SD      $t2, 0($t1)         ; DATA recibe al puntero al comienzo del mensaje
DADDI   $t2, $zero, 4       ; $t2 = 4 -> funcion 4: salida de una cadena ASCII
loop:
SD      $t2, 0($t0)         ; CONTROL recibe 4 y produce la salida del mensaje
DADDI   $t3, $t3, -1
BNEZ    $t3, loop
HALT

# A: $t0 almacena la dirección de CONTROL, $t1 la dirección de DATA