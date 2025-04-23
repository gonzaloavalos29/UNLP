				.data
		coorX: 		.byte 24; coordenada X de un punto
		coorY: 		.byte 24; coordenada Y de un punto
		color: 		.byte 255, 0, 0, 0; color: máximo rojo + máximo azul => magenta
		CONTROL:	.word32 0x10000
		DATA:		.word32 0x10008
;
				.code
				lwu	$s6, CONTROL($zero); $s6 = dirección de CONTROL
				lwu	$s7, DATA($zero); $s7 = dirección de DATA
				daddi	$t0, $zero, 7; $t0 = 7 -> función 7: limpiar pantalla gráfica
				daddi	$t8, $zero, 8; Función para leer x desde teclado			
				sd	$t0, 0($s6); CONTROL recibe 7 y limpia la pantalla gráfica
				sd	$t8, 0($s6); CONTROL recibe 8 y espera x
				lbu	$s0, 0($s7); Valor coordenada x
				sd	$t8, 0($s6); CONTROL recibe 8 y espera y
				lbu	$s1, 0($s7); Valor coordenada y
				sb	$s0, 5($s7); DATA+5 recibe el valor de coordenada X
				sb	$s1, 4($s7); DATA+4 recibe el valor de coordenada Y
				lwu	$s2, color($zero); $s2 = valor de color a pintar
				sw	$s2, 0($s7); DATA recibe el valor del color a pintar
				daddi	$t0, $zero, 5; $t0 = 5 -> función 5: salida gráfica
				sd	$t0, 0($s6); CONTROL recibe 5 y produce el dibujo del punto
				halt