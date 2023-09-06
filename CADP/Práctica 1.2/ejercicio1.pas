Program ejercicio1a;

var
	i, numero, suma, mayoresA5: integer;
begin
	suma:= 0;
	writeln('Ingrese 10 numeros');
	for i := 1 to 10 do begin
		readln(numero);
		suma:= suma+numero;
		if (numero>5) then
			mayoresA5:= mayoresA5 +1;
	end;
	writeln('La suma es: ', suma);
	writeln('Mayores a 5: ', mayoresA5);
End.
