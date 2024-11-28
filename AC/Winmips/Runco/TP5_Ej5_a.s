;calcular potencia pasando los parámetros por referencia en
;registros y devolviendo el resultado por valor en registro			
			.data
	base: 		.word 2
	exponente: 	.word 4
	result: 	.word 0
	
			.code
			daddi	$a2, $zero, base; $a2 = dirección de la base
			daddi	$a3, $zero, exponente; $a3 = dirección del exponente
			jal	potencia
			sd	$v0, result($zero); $v0 = tiene el resultado
			halt

	potencia:	ld	$a0, 0($a2); $a0 = carga la base
			ld	$a1, 0($a3); $a1 = carga el exponente
			daddi	$v0, $zero, 1 ; lo que viene es igual que antes
            lazo:	beqz 	$a1, terminar 
			daddi	$a1, $a1, -1
			dmul 	$v0, $v0, $a0
			j     	lazo
     	terminar:	jr    	$ra

