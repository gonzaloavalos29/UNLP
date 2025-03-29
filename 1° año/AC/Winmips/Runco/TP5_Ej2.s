; 2^3 = base^exponente = 2 x 2 x 2
; $a0 = base, $a1 = exponente
;
			.data
	base: 		.word 2
	exponente: 	.word 4
	result: 	.word 0
	
			.code
			ld    $a0, base($zero); $a0 = base
			ld    $a1, exponente($zero); $a1 = exponente
			jal   potencia
			sd    $v0, result($zero)
			halt

	potencia:	daddi $v0, $zero, 1 ; base^0 = 1
            lazo:	beqz  $a1, terminar; si llega a 0 el exponente
			daddi $a1, $a1, -1; una multiplicación menos
			dmul  $v0, $v0, $a0; multiplico la base las veces exponente
			j     lazo
     	terminar:	jr    $ra

