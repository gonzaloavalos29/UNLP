Program ejercicio4;
const
	MAX_NUMEROS= 1000;
var
	i, numero, min1, min2: integer;
begin
	i:= 0; numero:= 0;
	min1:= -99; min2:= -99;
	repeat
		writeln('Ingrese 1000 numeros');
		read(numero);
		if (numero<min1) then begin
			min2:= min1;
			min1:= numero;
		end
		else
			if(numero<min2) then
				min2:= numero;
		UNTIL (numero=0);
	writeln('Los minimos son: ', min1, ' y ', min2);
End.
