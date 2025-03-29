;VECTOR1=10 números cualesquiera. VECTOR2=los impares de VECTOR1
		.data
VECTOR1: 	.word 20,-3,-5,3,2,58,18,-7,12,11 ; Cada elemento es almacenado en 64 bits
LONG: 		.word 10; longitud de VECTOR1
VECTOR2:	.space 80; Reservo 80 bytes (10 elementos x 8 bytes C/U)
		.code
		LD R1, LONG(R0); R1:=10 Contenido de LONG
		DADD R3, R0, R0; R3:=R0 + R0; índice del vector1
		DADD R6, R0, R0; R3:=R0 + R0; índice del vector2
	LOOP:   LD R4, VECTOR1(R3); R4:= elemento de VECTOR1, R3=índice
		DADD R5, R4, R0; Guardo el número en R5 para poder modificarlo
		ANDI R5, R5, 1; R5 todos ceros salvo el bit menos significativo 
		BEQZ R5, ES_PAR ; Si este bit=0 --> el número es par
		SD R4, VECTOR2(R6); Si no salta el número es impar y hay que almacenarlo
		DADDI R6, R6, 8; R3:=R3 + 8, apunto al elemento que sigue en vector2
     ES_PAR:	DADDI R1, R1, -1; R1:=R1 – 1, un elemento menos
		DADDI R3, R3, 8; R3:=R3 + 8, apunto al elemento que sigue
                BNEZ  R1, LOOP; Salta hasta que R1=0, fin de VECTOR1
                HALT