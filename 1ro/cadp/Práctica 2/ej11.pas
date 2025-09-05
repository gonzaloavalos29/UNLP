program ej11;
function noEsSimboloDePeso(caracter: char): boolean;
	begin
		noEsSimboloDePeso:= (caracter <> '$');
	end;
function esArroba(caracter: char): boolean;
	begin
		esArroba:= (caracter = '@');
	end;
procedure seCumpleSecA(var verificar: boolean; var largo: integer);
	var
		caracter: char;
	begin
		writeln(' --- SECUENCIA A --- ');
		writeln(' Para terminar la secuencia, ingrese un "%"');
		write(' Ingrese cualquier caracter (menos"$"): '); readln(caracter);
		while (caracter <> '%') and (verificar) do begin {mientras el caracter no sea un "%", o siga siendo uno de los símbolos permitidos...}
			if (not noEsSimboloDePeso(caracter)) then begin
				verificar:= false;
			end
			else begin
				verificar:= true;
				write(' >'); readln(caracter);
			end;
			largo:= largo + 1;
		end;
		writeln(' ------------- ');
	end;
procedure seCumpleSecB(var verificar: boolean; largo: integer);
	var
		caracter: char;
		ingresos, vecesArroba: integer;
	begin
		ingresos:= 0;
		vecesArroba:= 0;
		writeln('               ');
		writeln(' --- SECUENCIA B --- ');
		write(' Ingrese cualquier caracter: '); readln(caracter);
		writeln(' >(', ingresos, '/', largo, ')');
		while (caracter <> '*') and (ingresos < largo) do begin {mientras el caracter no sea un "*", o el largo de la secuencia sea menor a la variable...}
			if (esArroba(caracter)) then begin
				vecesArroba:= vecesArroba + 1;
			end;
			write(' >'); readln(caracter);
			ingresos:= ingresos + 1;
			writeln(' >(', ingresos, '/', largo, ')');
		end;
		if (vecesArroba > 2) then begin
			verificar:= true;
		end
		else begin
			verificar:= false;
		end;
		writeln('');
	end;
var
	verificar: boolean;
	largo: integer;
begin
	verificar:= true; {Inicializar variables}
	largo:= 0;
	seCumpleSecA(verificar, largo);
	if (verificar) then begin
		seCumpleSecB(verificar, largo);
		if (verificar) then begin
			write(' --- SE CUMPLE LA SECUENCIA ---');
		end else begin
			write(' --- NO SE CUMPLE LA SECUENCIA B ---');
		end;
	end else begin
		write(' --- NO SE CUMPLE LA SECUENCIA A ---');
	end;
end.
