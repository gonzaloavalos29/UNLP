Program ejercicio9;

var
	operacion: string;
	contador, numeros: integer;
begin
	writeln('Ingrese una operacion de + o -');
	readln(operacion);
	if((operacion='+') or (operacion='-')) then
		begin
			writeln('Introduzca una secuencia de numeros a restar o sumar');
			readln(numeros);
			contador:= 0;
			while(numeros<>0) do begin
				if (operacion='+') then
					contador:= contador+numeros
				else
					contador:= contador-numeros;
				writeln('Ingrese un numero');
				readln(numeros);
			end;
			writeln('El resultado de la operacion es: ', contador);
		end
	else
		writeln('No se registro una operacion de suma o resta');
End.
