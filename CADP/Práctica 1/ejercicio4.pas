Program ejercicio4;
var
	numero1, numero, doble: real;
begin
	writeln('Ingrese un numero: ');
	readln(numero1);
	numero := -1;
	doble := numero1*2;
	while(numero <> 0) do begin
		writeln('Ingrese el doble de ', numero1:1:2, ' para terminar');
		readln(numero);
		if(numero = doble) then
			numero:= 0;
	end;
End.
