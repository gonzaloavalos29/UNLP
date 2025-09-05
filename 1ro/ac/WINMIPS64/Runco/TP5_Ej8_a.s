;Función para contar los caracteres de un string terminado en 0
		.data
string: 	.asciiz "ArquiTectuRa de ComPutaDoras"
longitud: 	.word 0
		.code
		DADDI $a0, $zero, string; Dirección de string en $a0
		JAL long_str
		SD $v0, longitud($zero)
		HALT
;	
    long_str:	DADD  $v0, $zero, $zero; $v0 Para contar caracteres
	LOOP:   LBU   $t2, 0($a0); $t2:= elemento de string
		BEQZ  $t2, FIN; final del string
		DADDI $v0, $v0, 1;Si no salta --> cuento 1 carácter más
		DADDI $a0, $a0, 1; Apunto al byte que sigue. 1 caracter=1 byte
		J LOOP ; Salto incondicional
	 FIN:	JR $ra