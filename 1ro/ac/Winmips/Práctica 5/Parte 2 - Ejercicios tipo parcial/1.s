# Lectura y procesamiento de números

.data
mensaje:            .asciiz             "Ingrese un numero entre 1 y 9 "
msg_error:          .asciiz             "Debe ingresar un numero!"
msg_final:          .asciiz             "Cantidad de impares: "
MAX:                .word 020
resultado:          .word 0
CONTROL:            .word32 0x10000
DATA:               .word32 0x10008
numeros:            .byte 0

.code
DADDI               $sp, $0, 0x300
DADDI               $a0, $0, numeros            ; direccion de números
DADDI               $a1, $0, 0                  ; veces que ingresó un número
DADDI               $s0, $0, 0                  ; suma de los números ingresados
LD                  $s1, MAX($0)                ; valor a alcanzar
SEGUIR:             
JAL                 ingresar_numero
DADD                $s0, $s0, $v0               ; sumo el valor obtenido
SB                  $v0, numeros($a1)           ; guardo en la tabla
DADDI               $a1, $a1, 1                 ; incremento numeros guardados
SLT                 $s2, $s0, $s1               ; s2 = 1 si no alcance el total
BNEZ                $s2, SEGUIR
DADDI               $a0, $0, numeros            ; dirección de números
JAL                 procesar_numeros
SD                  $v0, resultado($0)
HALT

INGRESAR_NUMERO:
DADDI               $sp, $sp, -8
SD                  $ra, 0($sp)
DADD                $t4, $0, $a0                ; resguardo valores
DADD                $t5, $0, $a1
LWU                 $t6, CONTROL($0)
LWU                 $t7, DATA($0)
DADDI               $t0, $0, 4                  ; imprimo mensaje
DADDI               $t1, $0, mensaje
SD                  $t1, 0($t7)
SD                  $t0, 0($t6)
DADDI               $t0, $0, 9                  ; leo un caracter
SD                  $t0, 0($t6)
LD                  $t2, 0($t7)

DADDI               $t2, $t2, -48               ; t2 tiene ascii del caracter.
                                                ; le resto 48 (código del 0)
DADD                $a0, $0, $t2                ; parámetros para sub entre
DADDI               $a1, $0, 1
DADDI               $a2, $0, 9

JAL                 ENTRE
BEQZ                $v0, ERROR
DADDI               $v0, $t2, 0                 ; devuelve $v0 = el número ingresado
DADDI               $t0, $0, 1                  ; lo imprimo
SD                  $t2, 0($t7)
SD                  $t0, 0($t6)
J                   TERMINAR

ERROR:
DADDI               $t0, $0, 4                  ; imprime "Debe ingresar un número"
DADDI               $t1, $0, MSG_ERROR
SD                  $t1, 0($t7)
SD                  $t0, 0($t6)
DADDI               $v0, $0, 0                  ; devuelve $v0 = 0

TERMINAR:  
DADD                $a0, $0, $t4
DADD                $a1, $0, $t5
LD                  $ra, 0($sp)
DADDI               $sp, $sp, 8
JR                  $ra
ENTRE:
DADDI               $v0, $0, 0
SLT                 $t9, $a0, $a1               ; si $a0 < 1 => $t9 = 1 sino $t9 = 0
BNEZ                $t9, no_es
DADDI               $a2, $a2, 1

SLT                 $t9, $a0, $a2               ; si $a0 < 10 => $t9 = 1 sino $t9 = 0
BEQZ                $t9, no_es

DADDI               $v0, $0, 1
no_es:              jr $ra
PROCESAR_NUMEROS:
DADDI               $sp, $sp, -8
SD                  $ra, 0($sp)´
DADD                $t4, $0, $a0

DADDI               $t2, $0, 0                  ; cantidad de números impares
LAZO:
LB                  $t0, 0($t4)                 ; leo de la tabla
DADD                $a0, $0, $t0
JAL                 es_impar

DADDI               $t2, $t2, 1                 ; incremento cantidad de impares
es_par:
DADDI               $a1, $a1, -1                ; un elemento menos para procesar
DADDI               $t4, $t4, 1                 ; nuevo elemento de la tabla
BNEZ                $a1, LAZO                   ; si no llegué a 0, sigo

DADDI               $t0, $0, 4                  ; imprimo mensaje
DADDI               $t1, $0, MSG_FINAL
SD                  $t1, 0($t7)
SD                  $t0, 0($t6)
DADDI               $t0, $0, 1                  ; muestro cantidad impares
SD                  $t2, 0($t7)
SD                  $t0, 0($t6)
DADD                $v0, $0, $t2                ; devuelvo en v0 la cantidad
LD                  $ra, 0($sp)
DADDI               $sp, $sp, 8

JR                  $RA
es_impar:           ANDI $v0, $a0, 1
                    jr $ra