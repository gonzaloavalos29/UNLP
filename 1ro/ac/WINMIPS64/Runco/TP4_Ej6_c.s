; Multiplicar x 2 los elementos de VECTOR
		.data
VECTOR: 	.word 20,-3,-5,3,2,58,18,-7,12,-11 ; Cada elemento es almacenado en 64 bits
LONG: 		.word 10 ; Longitud de VECTOR
		.code
		LD R1, LONG(R0); R1:=10 Contenido de LONG
		DADD R3, R0, R0; R3:=R0 + R0, R3 índice para recorrer vector
	LOOP:   LD R4, VECTOR(R3); R4:= elemento de VECTOR, R3=índice
		DADD R4, R4, R4; Multiplica por 2 
		SD R4, VECTOR(R3); Almacena el elemento multiplicado
    		DADDI R1, R1, -1; R1:=R1 – 1, un elemento menos
		DADDI R3, R3, 8; R3:=R3 + 8, apunto al elemento que sigue
                BNEZ  R1, LOOP; Si no llego a 0 --> sigo
                HALT