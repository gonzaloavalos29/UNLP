# Escriba un programa que utilize potencia. En el programa principal se solicitara el ingreso de la base y del exponente (ambos enteros) y se deberá utilizar la subrutina potencia para calcular el resultado pedido. Muestre el resultado numerico a traves de la operación en pantalla

.data
mensajeBase:            .asciiz         "Ingrese un numero para la base: "
mensajeExpo:            .asciiz         "Ingrese un numero para el exponente: "
mensajeResu:            .ascii          "El resultado de la potencia: "
CONTROL:                .word32         0x10000
DATA:                   .word32         0x10008

.code
LWU                     $t6, CONTROL($0)
LWU                     $t7, DATA($0)

DADDI                   $t0, $0, 4
DADDI                   $t1, $0, mensajeBase    ; para imprimir mensajeBase
SD                      $t1, 0($t7)             ; cargo mensajeBase
SD                      $t0, 0($t6)             ; 4 en control imprime MSG
DADDI                   $t0, $0, 8
SD                      $t0, 0($t6)             ; 8 en control lee un numero
LW                      $a0, 0($t7)             ; en $a0 el nro que esta en DATA
DADDI                   $t0, $0, 4              ; 4 en control para imprimir MSG
DADDI                   $t1, $0, mensajeExpo    ; para imprimir mensajeExpo
SD                      $t1, 0($t7)             ; cargo mensajeExpo
SD                      $t0, 0($t6)             ; 4 en control para imprimir MSG
DADDI                   $t0, $0, 8
SD                      $t0, 0($t6)             ; 8 en control lee un numero
LWU                     $a1, 0($t7)             ; en $a1 el nro que esta en DATA

JAL                     potencia

DADDI                   $t0, $0, 4
DADDI                   $t1, $0, mensajeResu    ; para imprimir mensajeResul
SD                      $t1, 0($t7)             ; mensajeResul
SD                      $t0, 0($t6)             ; 4 en control para imprimir msg
DADDI                   $t0, $0, 1
SD                      $v0, 0($t7)             ; resultado en DATA
SD                      $t0, 0($t6)             ; 1 en control imprime entero

HALT

potencia: DADDI         $v0, $zero, 1
lazo:     BEQZ          $a1, terminar
          DADDI         $a1, $a1, -1
          dmul          $v0, $v0, $a0
          J             lazo
terminar: JR            $ra