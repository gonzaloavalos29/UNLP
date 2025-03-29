;Contar positivos de un vectror y almacenar la cuenta en una variable P
		.data
VECTOR: 	.word 20,-3,-5,3,2,58,18,-7,12,-11 ; Cada elemento es almacenado ; en 64 bits
P:		.word 0
LONG: 		.word 10
		.code
		LD R1, LONG(R0); R1:=10 Longitud del vector
		DADD R3, R0, R0; R3:=R0 + R0=0 Índice para recorrer VECTOR
		DADD R10, R0, R0; R10:=R0 + R0=0 Acá llevo la cuenta
	LOOP:   LD R4, VECTOR(R3); R4:= elemento de VECTOR, R3=índice
		SLT R2,R4,R0	;Si R4<0 --> R2=1, elemento negativo
		BNEZ R2, NEGATIVO ;No cuenta, salta instrucción siguiente
		DADDI R10,R10,1; Si no salta --> elemento positivo --> cuenta
    NEGATIVO:	DADDI R1, R1, -1; R1:=R1 – 1, un elemento menos
		DADDI R3, R3, 8; R3:=R3 + 8, apunto al elemento que sigue
                BNEZ  R1, LOOP
		SD R10, P(R0)
                HALT