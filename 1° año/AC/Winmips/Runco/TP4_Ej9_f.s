; a =97=0x61 --> h=104=0x68
			.data
	cadena: 	.space 50 ; Reservo 50 bytes para string a generar
	carac_com:    	.byte 97; Caracter de comienzo (a)
	carac_fin:	.byte 104; Carácter de fin (h)
			.code
			DADD R3, R0, R0; R3:=R0 + R0=0; índice para recorrer cadena
			LBU R5, carac_com(R0); R5:= ascii de la a=97
			LBU R6, carac_fin(R0); R6:= ascii de la h=104
			DADDI R6, R6, 1; así hacemos la h también
			DADDI R7, R0, 1; R7 := veces a repetir la letra 1,2,3...
		ARRIBA:	DADD R8, R7, R0 ; reinicia la cantidad a repetir
		SIGO:	SB R5, cadena(R3); almacena el byte en cadena
			DADDI R3, R3, 1; apunta al byte que sigue en memoria
			DADDI R8, R8, -1; uno menos de la cantidad a almacenar
			BNEZ R8, SIGO
			DADDI R7, R7, 1; La próxima vez repite una letra más
			DADDI R5, R5, 1; próxima letra
			BNE R6, R5, ARRIBA
			SB R0, cadena(R3)
			HALT