;Función para encontrar vocales en un string
;$a0=dirección del string. $a1=caracter a encontrar
;Devuelve $v0=1 si es vocal y $v0=0 si no es vocal
;Una forma de hacerlo
			.data
	cadena: 	.asciiz "AEIOUaeiou"	; todas las vocales
	string:     	.asciiz "ArqUitectura de COmputadorAs"; cadena a analizar
	vocales:    	.word 0	; cantidad de vocales
			.code
			DADD  $t3, $zero, $zero; para contar vocales
			DADD  $t2, $zero, $zero; Índice para recorrer string
	     arriba: 	LBU   $a1, string($t2)
			BEQZ  $a1, final
			DADDI $a0, $zero, cadena; dirección de vocales en $a0
			JAL carac_apa
			DADD  $t3, $t3, $v0
			DADDI $t2, $t2, 1
			J     arriba
 	      final:	SD    $t3, vocales($zero)          
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
