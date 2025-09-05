;pasando los parámetros por referencia en la pila
;devolviendo el resultado por valor en un registro
;
			.data
	base: 		.word 2
	exponente: 	.word 4
	result: 	.word 0
			.code
			daddi	$t3, $zero, base; $t3 = dirección de la base
			daddi	$t4, $zero, exponente; $t4 = dirección del exponente
			daddi	$sp, $zero, 0x0300; defino la zona de memoria para la pila
			daddi	$sp, $sp, -8; decremento en 8 el puntero de pila
			sd	$t3, 0($sp); dirección de la base a la pila (push $t3)
			daddi	$sp, $sp, -8; decremento en 8 el puntero de pila
			sd	$t4, 0($sp); dirección del exponente a la pila (push $t4)
			jal	potencia
			sd	$v0, result($zero)
			halt
;
	potencia:	ld	$t1, 0($sp); cargo dirección del exponente en $t1
			daddi	$sp, $sp, 8; (pop $t1)
			ld	$t2, 0($sp); cargo la dirección de la base en $t2
			daddi	$sp, $sp, 8; (pop $t2)
			ld	$a0, 0($t2); $a0 = carga la base
			ld	$a1, 0($t1); $a1 = carga el exponente
			daddi	$v0, $zero, 1 ; lo que sigue es la potencia
            lazo:	beqz 	$a1, terminar
			daddi	$a1, $a1, -1
			dmul 	$v0, $v0, $a0
			j     	lazo
     	terminar:	jr    	$ra

