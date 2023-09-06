Program ejercicio3;
var
	num1, num2, num3, aux: integer;
begin
	writeln('Ingrese 3 numeros a continuacion: ');
	readln(num1, num2, num3);
	if (num1>num2) then
		begin
			aux := num2;
			num2 := num1;
			num1 := aux;
		end;
	if (num2>num3) then
		begin
			aux := num2;
			num2 := num3;
			num3 := aux;
		end;
	writeln(num1);writeln(num2);writeln(num3);
End.
