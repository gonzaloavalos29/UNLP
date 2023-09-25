program ejercicio6;
procedure binarizar(num: integer);
begin
	if (num <> 0) then begin
		binarizar(num div 2);
		write(num mod 2);
	end;
end;

VAR
	num: integer;
BEGIN
	write('Ingrese un numero: '); readln(num);
	while (num <> 0) do begin // Mientras el número ingresado sea diferente de 0
		binarizar(num); writeln;
		write('Ingrese un numero: '); readln(num);
	end;
end.
