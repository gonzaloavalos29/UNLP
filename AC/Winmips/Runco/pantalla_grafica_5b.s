				.data
		 X:		.byte 45
		 Y:		.byte 0
	     color:		.byte 0, 255, 0, 0
	   CONTROL:		.word32 0x10000
	      DATA:		.word32 0x10008
;
;
				.code
				lwu 	$s0, CONTROL($zero)
				lwu 	$s1, DATA($zero)
				lwu 	$t0, color($zero)
				sw 	$t0, 0($s1)
				lbu	$t1, Y($zero); coordenada Y
				lbu 	$t2, X($zero)
				daddi	$t4, $zero, 50
				daddi	$t5, $zero, 5
		loop:		sb	$t1, 4($s1)
				sb	$t2, 5($s1); escribe coordenada x
				daddi	$t3, $zero, 5
				sd	$t3, 0($s0)
				daddi	$t2, $t2, 1
				bne	$t4, $t2, loop
				lbu	$t2, X($zero); inicializa coordenada x
				daddi	$t1, $t1, 1
				bne	$t5, $t1, loop
				halt 