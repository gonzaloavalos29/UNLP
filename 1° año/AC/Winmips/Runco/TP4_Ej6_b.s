;Calcular el máximo de un vector y almacenarlo en MAX
		.data
VECTOR: 	.word 20,-3,-5,3,2,58,18,-7,12,-11 ; Cada elemento es almacenado en 64 bits
MAX:		.word 0
LONG: 		.word 10
		.code
		LD R1, LONG(R0); R1:=10 Longitud del vector
		DADD R3, R0, R0; R3:=R0 + R0=0 Índice para recorrer el vector
		LD R4, VECTOR(R3); R4 tiene el 1er elemento del vector
		DADD R5,R4,R0
		DADDI R1, R1, -1; R1:=R1 – 1, un elemento menos
		DADDI R3, R3, 8; R3:=R3 + 8, apunto al elemento que sigue
	LOOP:   LD R4, VECTOR(R3); R4:= elemento de TABLA a comparar con el mayor, R3=índice
		SLT R2,R4,R5	;Si R4<R5 --> R2=1 --> Mayor el que estaba en R5
		BNEZ R2, MAYOR_ESTABA
		DADD R5,R4,R0 ; Mayor en R4 y lo paso a R5	
MAYOR_ESTABA:	DADDI R1, R1, -1; R1:=R1 – 1, un elemento menos
		DADDI R3, R3, 8; R3:=R3 + 8, apunto al elemento que sigue
                BNEZ  R1, LOOP
		SD R5, MAX(R0)
                HALT