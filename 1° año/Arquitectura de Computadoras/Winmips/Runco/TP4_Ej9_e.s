;Las mayúsculas están entre A=65 (decimal) y Z=90 (decimal)
;Busco si el caracter está entre 65 y 90
			.data
	cadena: 	.asciiz "ArquiTectuRa de ComPutaDoraZ"
	mayusculas: 	.word 0
			.code
			DADD R3, R0, R0; R3:=R0 + R0=0; índice para recorrer cadena
			DADD R5, R0, R0; R5:=0 Para contar mayúsculas
		LOOP:   LBU R4, cadena(R3); R4:= elemento de cadena, R3=índice
			BEQZ R4, FIN; final de la cadena
			SLTI R6, R4, 65; R6:=1 si R4<65 (65=letra A)
			BNEZ R6, NO_ES_MAYU
			SLTI R6, R4, 91; 91=un caracter más, para contar la Z
			BEQZ R6, NO_ES_MAYU
			DADDI R5, R5, 1; Cuento 1 mayúscula
	 NO_ES_MAYU:	DADDI R3, R3, 1; Apunto al byte que sigue. 1 caracter=1 byte
			J LOOP
 		FIN:	SD R5, mayusculas(R0)	               
			HALT