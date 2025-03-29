Program ejercicio2;

var
	i, posicionMaximo, numero, maximo: integer;
begin
	maximo:= -1;
	writeln('Ingrese 10 numeros');
	for i := 1 to 10 do begin
		readln(numero);
		if (numero>maximo) then
			begin
				maximo:= numero;
				posicionMaximo:= i;
			end;
	end;
	writeln('El mayor numero leido fue el: ', maximo, ' en la posicion: ', posicionMaximo);
End.
