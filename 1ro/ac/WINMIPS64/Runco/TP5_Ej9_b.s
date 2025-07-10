;Cuenta positivos en un arreglo de números de 64 bits
;$a0 pasa un número a la subrutina
;$v0 devuelve 1 si es + y 0 si es -
;
				.data
		tabla:		.word 1,2,3,-3,-5,8,-7,9,-10,15
	     cantidad:		.word 10
	    positivos:		.word 0
;
				.code
				ld    $s0, cantidad($zero)
				dadd  $s3, $zero, $zero
				dadd  $s1, $zero, $zero
		 sigo:		ld    $a0, tabla($s1)
				jal   es_positivo
				beqz  $v0, negativo
				daddi $s3, $s3, 1
	     negativo:		daddi $s1, $s1, 8
				daddi $s0, $s0, -1
				bnez  $s0, sigo
				sd    $s3, positivos($zero)
				halt
;
	  es_positivo:		slti  $v0, $a0, 0; $v0=1 si $a0 < 0
				bnez  $v0, es_negativo
				daddi $v0, $v0, 1; $v0=1 es positivo
				j     fin
	  es_negativo:		daddi $v0, $v0, -1
		  fin:		jr    $ra