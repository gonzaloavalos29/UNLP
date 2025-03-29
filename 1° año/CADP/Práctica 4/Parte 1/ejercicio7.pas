program ejercicio7;
const
	sizeLimit = 9; //El 9 es el dígito máximo
type
	vector = array[0..sizeLimit] of integer;
procedure procesarNumero(var v: vector; n: integer);
	begin
		repeat
			v[n mod 10]:= v[n mod 10] + 1;
			n:= n div 10;
		until (n = 0);
	end;
procedure buscarDigitoMaximo(v: vector; var digitoMax: integer);
	var
		i, aux: integer;
	begin
		aux:= -1;
		for i:= 0 to sizeLimit do begin
			if (v[i] > aux) then begin
				digitoMax:= i;
				aux:= v[i]; //guardar dígito
			end;
		end;
	end;
procedure leerDigitosSinOcurrencias(v: vector);
	var
		i: integer;
	begin
		for i:= 0 to sizeLimit do begin
			if (v[i] < 1) then begin
				write(i,', '); //Escribir los dígitos que no tuvieron ocurrencias
			end;
		end;
	end;
var
	v: vector;
	numIngresado, digitoMax: integer;
begin
	//Escribir numeros y usar los procesos
	digitoMax:= -1;
	write('Ingrese un número: >'); readln(numIngresado);
	while (numIngresado <> -1) do begin
		procesarNumero(v, numIngresado);
		write('Ingrese un número: >'); readln(numIngresado);
	end;
	if (digitoMax <> -1) then begin //Si hubo un dígitoMax...
		buscarDigitoMaximo(v, digitoMax);
		writeln('El dígito más leído fue el ', digitoMax);
	end;
	write('Los dígitos que no tuvieron ocurrencias son: ');
	leerDigitosSinOcurrencias(v);
end.
