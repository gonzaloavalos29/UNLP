; pasando por valor en la pila base y exponente
;devolviendo el resultado por valor en un registro
			.data
	base: 		.word 2
	exponente: 	.word 4
	result: 	.word 0
			.code
			ld	$t0, base($zero); $t0 = base
			ld	$t1, exponente($zero); $t1 = exponente
			daddi	$sp, $zero, 0x0300; defino la zona de memoria como pila 
			daddi	$sp, $sp, -8; decremento $sp en 8
			sd	$t0, 0($sp); paso la base a la pila (push $t0)
			daddi	$sp, $sp, -8; decremento $sp en 8
			sd	$t1, 0($sp); exponente a la pila (push $t1)
			jal	potencia
			sd	$v0, result($zero); en $v0 devuelve el resultado 
			halt
;
	potencia:	ld	$a1, 0($sp); cargo la base en $a1 ($fp????)
			daddi	$sp, $sp, 8; "como si fuera un pop"
			ld	$a0, 0($sp); cargo el exponente en $a0
			daddi	$sp, $sp, 8; "como si fuera un pop"
			daddi	$v0, $zero, 1; sigue la rutina como siempre
            lazo:	beqz 	$a1, terminar
			daddi	$a1, $a1, -1
			dmul 	$v0, $v0, $a0
			j     	lazo
     	terminar:	jr    	$ra

