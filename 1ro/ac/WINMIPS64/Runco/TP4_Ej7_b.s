; La fórmula Fibonacci es Fn=Fn-1+Fn-2. Después del 0 y el 1
;cada número es la suma de los dos anteriores
		.data
VECTOR: 	.word 0,0,0,0,0,0,0,0,0,0 ; Cada elemento es almacenado en 64 bits
LONG: 		.word 10 ; Longitud del vector
		.code
		LD R1, LONG(R0); R1:=10 Contenido de LONG
		DADD R3, R0, R0; R3:=R0 + R0 Índice para recorrer el vector
		DADDI R5, R0, 1; Segundo elemento
		SD R0, VECTOR(R3); Primer elemento almacenado (0)
		DADDI R1, R1, -1; Un elemento menos
		DADDI R3, R3, 8; apunto al lugar que sigue
		SD R5, VECTOR(R3); segundo elemento almacenado (1)
		DADDI R1, R1, -1; Un elemento menos
	SIGO:	DADDI R4, R3,-8; Índice para caracter anterior en la fórmula
		LD R6, VECTOR(R4); Caracter anterior. El actual está en R5
		DADD R5, R5, R6; Suma dos caracteres para obtener el nuevo
		DADDI R3, R3, 8; Posición para almacenar el nuevo
		SD R5, VECTOR(R3); Almacena caracter nuevo
		DADDI R1, R1, -1; Un elemento menos
		BNEZ R1, SIGO; 
		HALT