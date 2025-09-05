;Función para encontrar si un caracter es una vocal
;$a0=dirección del string. $a1=caracter a encontrar
;Devuelve $v0=1 si es vocal y $v0=0 si no es vocal
;
			.data
	cadena: 	.asciiz "AEIOUaeiou"	; cadena a analizar
	car:     	.ascii "E"	; caracter buscado
	mayu_minu:    	.word 0	; si es mayúscula ó no
			.code
			DADDI $a0, $zero, cadena; dirección de string en $a0
			LBU   $a1, car($zero)
			JAL carac_apa
 			SD    $v0, mayu_minu($zero)          
			HALT

	  carac_apa:	DADD  $t0, $zero, $zero ; Para contar
			DADD  $v0, $zero, $zero
	       sigo:	LBU   $t1, 0($a0); byte de cadena
			BEQZ  $t1, fin; final de la cadena
			BNE   $t1, $a1, distintos
			DADDI $t0, $t0, 1; cuento 1
	distintos:	DADDI $a0, $a0, 1; apunto al byte que sigue
			J     sigo
	      fin:	BEQZ  $t0, no_esta
			DADDI $v0, $zero, 1
	  no_esta:	JR    $ra
