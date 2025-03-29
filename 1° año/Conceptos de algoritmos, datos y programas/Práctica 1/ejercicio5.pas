Program ejercicio5;
var
	numero1, numero, doble: real;
	contador: integer;
begin
	writeln('Ingrese un numero: ');
	readln(numero1);
	numero := -1;
	doble := numero1*2;
	contador := 1;
	while(contador<10) do begin
		writeln('Ingrese el doble de ', numero1:1:2, ' para terminar');
		readln(numero);
		if(numero = doble) then
			contador := 10
		else if(contador = 10) then
			writeln('No se ha ingresado el doble de ', numero1:1:2);
		contador := contador+1;
	end;
End.
