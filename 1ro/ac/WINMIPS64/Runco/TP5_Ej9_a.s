;Función para sumar números de una tabla
;$a0=dirección de la tabla
;$a1=cantidad de números de 64 bits
;
			.data
	tabla:		.word 2,6,12,45,63,124,34,7,9,15,8,23,78,345,12
	cantidad:	.word 15
	resultado:	.word 0
			.code
			daddi $a0, $zero, tabla; carga en $a0 la dirección de tabla
			ld    $a1, cantidad($zero); carga en $a1 cantidad de números en tabla
			jal   suma; llama a subrutina que suma
			sd    $v0, resultado($zero); almacena el resultado devuelto en $v0
			halt
;
	    suma:	ld    $v0, 0($a0); primer número de tabla
	    sigo:	daddi $a1, $a1, -1; un número menos
			beqz  $a1, fin; sumé todos los números
			daddi $a0, $a0, 8; apunto al que sigue
			ld    $t0, 0($a0); número que sigue en $t0
			dadd  $v0, $v0, $t0; hago la suma
			j     sigo ; salto incondicional a sigo
	     fin:	jr    $ra