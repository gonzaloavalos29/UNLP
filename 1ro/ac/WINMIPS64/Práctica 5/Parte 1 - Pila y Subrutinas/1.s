.data
base:       .word 5
exponente:  .word 4
result:     .word 0

.code
LD          $a0, base($zero)
LD          $a1, exponente($zero)
JAL         potencia
SD          $v0, result($zero)

potencia:   daddi $v0, $zero, 1
lazo:       beqz  $a1, terminar
            daddi $a1, $a1, -1
            dmul  $v0, $v0, $a0
            J     lazo
terminar:   JR    $ra

HALT
# En las primeras dos lineas del programa principal, se cargan valores a dos registros para ser pasados a la subrutina "potencia", $a0 tiene el valor de la base, y $al el exponente.
# La subrutina "potencia" calcula la potencia multiplicando $a0 por si mismo tantas veces como lo indica el valor que contiene $al.
# En el registro $v0 se le retorna al programa principal el valor de la potencia.

# La instruccion "jal" = jump and link salta a "potencia", que es la etiqueta direccion de la primera instruccion de la subrutina. Ademas, salva en $ra la direccion de retorno (dir de jal + 4)
# La instruccion jr $ra carga en el PC la direccion salvada en $ra (equivalente al ret).

# En el registro $ra se guarda la direccion de memoria de la instruccion "sd $v0, result($zero)", la instruccion siguiente al jal.
# Los registros $a0 y $al son los usados como parametros de entrada a la subrutina, mientras que $v0 es el usado para retornar el valor al programa principal (parametro de salida). Los valores que se pasan son todos de tipo entero "WORD"

# La subrutina potencia debe guardar el valor que contiene $ra previo a invocar a otra subrutina, para no perderlo con ese proximo salto. Una vez que se retorna de la segunda subrutina se debe actualizar nuevamente el valor en $ra para que pueda retornar al programa principal.