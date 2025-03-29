; La fórmula impar=2*n+1 con n=0,1,2,....8,9
		.data
VECTOR: 	.word 0,0,0,0,0,0,0,0,0,0 ; Cada elemento es almacenado en 64 bits
LONG: 		.word 10 ; Longitud del vector
		.code
		LD R1, LONG(R0); R1:=10 Contenido de LONG
		DADD R3, R0, R0; R3:=R0 + R0 Índice para recorrer el vector
		DADD R5, R0, R0; R5:=0, es como "n" en la fórmula impar
		DADDI R6, R0, 2; R6:=2, es el que multiplica en la fórmula impar
	LOOP:	DMUL R7, R5, R6; R7:= multiplica, hace 2*n
		DADDI R7, R7, 1; R7:= 2*n+1, acá sumo 1
		SD R7, VECTOR(R3); R7:= elemento impar lo almacenamos en VECTOR, R3=índice
    		DADDI R5, R5, 1; El n que sigue
		DADDI R1, R1, -1; R1:=R1 – 1, un elemento menos
		DADDI R3, R3, 8; R3:=R3 + 8, apunto al elemento que sigue
                BNEZ  R1, LOOP; Salta hasta que R1:=0
                HALT