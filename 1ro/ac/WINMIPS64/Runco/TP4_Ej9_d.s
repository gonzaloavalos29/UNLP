;Contar apariciones de un caracter
			.data
	cadena: 	.asciiz "adbdcdedfdgdhdid"	; cadena a analizar
	car:     	.ascii "d"	; caracter buscado
	cant:    	.word 0	; cantidad de veces que se repite el carácter car en cadena
			.code
			DADD R3, R0, R0; R3:=R0 + R0=0; índice para recorrer cadena
			DADD R5, R0, R0; R5:=0 Para contar caracteres iguales
			LBU R6, car(R0); caracter buscado
		LOOP:   LBU R4, cadena(R3); R4:= elemento de cadena, R3=índice
			BEQZ R4, FIN; final de la cadena
			BNE R4, R6, DISTINTOS; Para ver si son iguales
			DADDI R5, R5, 1; Cuento 1 carácter igual al buscado
	  DISTINTOS:	DADDI R3, R3, 1; Apunto al byte que sigue. 1 caracter=1 byte
			J LOOP
 		FIN:	SD R5, cant(R0)	               
			HALT