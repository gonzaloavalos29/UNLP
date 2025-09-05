;Si se escribe en DATA un color expresado en RGB (usando 4 bytes para representarlo: un byte para cada componente de color e
;ignorando el valor del cuarto byte), en DATA+4 la coordenada Y, en DATA+5 la coordenada X y se escribe un 5 en CONTROL, se 
;pintará con el color indicado un punto de la pantalla gráfica de la terminal, cuyas coordenadas están indicadas por X e Y. 
;La pantalla gráfica cuenta con una resolución de 50x50 puntos, siendo (0, 0) las coordenadas del punto en la esquina inferior
;izquierda y (49, 49) las del punto en la esquina superior derecha.
;
;
;
				.data
		coorX: 		.byte 24; coordenada X de un punto
		coorY: 		.byte 24; coordenada Y de un punto
;	color: 		.byte 255, 0, 255, 0; color: máximo rojo + máximo azul => magenta
		color:		.word32 0x00FF00FF
		CONTROL:	.word32 0x10000
		DATA:		.word32 0x10008
;
				.code
				lwu	$s6, CONTROL($zero); $s6 = dirección de CONTROL
				lwu	$s7, DATA($zero); $s7 = dirección de DATA
				daddi	$t0, $zero, 7; $t0 = 7 -> función 7: limpiar pantalla gráfica
				sd	$t0, 0($s6); CONTROL recibe 7 y limpia la pantalla gráfica
				lbu	$s0, coorX($zero); $s0 = valor de coordenada X
				sb	$s0, 5($s7); DATA+5 recibe el valor de coordenada X
				lbu	$s1, coorY($zero); $s1 = valor de coordenada Y
				sb	$s1, 4($s7); DATA+4 recibe el valor de coordenada Y
				lwu	$s2, color($zero); $s2 = valor de color a pintar
				sw	$s2, 0($s7); DATA recibe el valor del color a pintar
				daddi	$t0, $zero, 5; $t0 = 5 -> función 5: salida gráfica
				sd	$t0, 0($s6); CONTROL recibe 5 y produce el dibujo del punto
				halt