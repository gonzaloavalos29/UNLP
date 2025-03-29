program ejercicio7;
procedure descomponer(num: integer; var cantDigitos: integer; sumaDigitos: integer);
	begin
		sumaDigitos:= 0;
		while (num <> 0) do begin
			cantDigitos:= cantDigitos + 1;
			sumaDigitos:= sumaDigitos + (num mod 10);
			num:= num div 10;
		end;
	end;
var
	num, cant, suma: integer;
begin
	cant:= 0;
	suma:= 0;
	repeat
		writeln('Ingrese un numero: ');
		readln(num);
		descomponer(num, cant, suma);
	until (suma = 10);
	write('Se leyeron un total de ', cant, ' digitos.');
end.
