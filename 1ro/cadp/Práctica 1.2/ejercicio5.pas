Program ejercicio5;
var
	numero, min, max: integer;
begin
	numero:= 0;
	min:= 9999; max:= -99;
	repeat
		writeln('Ingrese numeros para obtener maximo, minimo y suma total de los mismos. Ingrese 100 para terminar.');
		read(numero);
		if (numero<min) then
			min:= numero
		else
			if ((numero>max) and (numero<>100)) then
				max:= numero;
	UNTIL (numero=100);
	writeln('El minimo es: ', min, ' y el maximo ', max);
End.
