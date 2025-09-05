;Función para contar ocurrencia de un caracter en un string terminado en 0
;$a0=dirección del string. $a1=caracter a encontrar
;Devuelve $v0=1 si hay caracter y $v0=0 si no está
;Contar apariciones de un caracter
			.data
	cadena: 	.asciiz "adbdcdedfdgdhdid"	; cadena a analizar
	car:     	.ascii "d"	; caracter buscado
	aparecio:    	.word 0	; si apatreció o no
			.code
			DADDI $a0, $zero, cadena; dirección de string en $a0
			LBU   $a1, car($zero)
			JAL carac_apa
 			SD    $v0, aparecio($zero)          
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
