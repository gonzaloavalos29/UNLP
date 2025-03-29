;Contar los caracteres de un string terminado en 0
		.data
string: 	.asciiz "ArquiTectuRa de ComPutaDoras"
longitud: 	.word 0
		.code
		DADD R3, R0, R0; R3:=R0 + R0=0; índice para recorrer string
		DADD R5, R0, R0; R5:=0 Para contar caracteres
	LOOP:   LBU R4, string(R3); R4:= elemento de string, R3=índice
		BEQZ R4, FIN; final del string
		DADDI R5, R5, 1;Si no salta --> cuento 1 carácter más
		DADDI R3, R3, 1; Apunto al byte que sigue. 1 caracter=1 byte
		J LOOP ; Salto incondicional
 	FIN:	SD R5, longitud(R0)	               
		HALT