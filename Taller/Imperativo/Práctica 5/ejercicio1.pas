program ej1;
const
	fin = 0;
	maxOficinas = 300;
type
	oficina = record
		codigo: integer;
		dni: longint;
		expensas: real;
	end;
	
	vectorOfi = array[0..maxOficinas] of oficina;
	
procedure inicializarVector(var v: vectorOfi);
var
	i: integer;
begin
	for i:= 1 to 300 do begin
		v[i].codigo:= 0;
		v[i].dni:= 0;
		v[i].expensas:= 0;
	end;
end;

procedure leerOficina(var o: oficina);
begin
	writeln('Ingrese la identificacion de oficina: '); readln(o.codigo);
	if (o.codigo <> fin) then begin
		writeln('Ingrese dni del propietario: '); readln(o.dni);
		writeln('Ingrese expensas: '); readln(o.expensas);
	end;
end;

procedure cargarVector(var v: vectorOfi; var dimL: integer);
var
	o: oficina;
begin
	dimL:= 0;
	leerOficina(o);
	while ((o.codigo <> fin) and (dimL < maxOficinas)) do begin
		dimL:= dimL + 1;
		v[dimL]:= o;
		leerOficina(o);
	end;
end;

procedure insercion(var v: vectorOfi; dimL: integer);
var
	i, j, actual: integer;
begin
	for i:= 2 to dimL do begin
		actual:= v[i].codigo;
		j:= i - 1;
		while ((j > 0) and (v[j].codigo > actual)) do begin
			v[j+1].codigo:= v[j].codigo;
			j:= j - 1;
		end;
		v[j+1].codigo:= actual;
	end;
end;

procedure busquedaDicotomica(v: vectorOfi; ini, fin: integer; dato: integer; var pos: integer; var dni: longint);
var
	aux: integer;
begin
	if (pos = 0) then begin
		aux:= (ini + fin) DIV 2;
		if (v[aux].codigo = dato) then begin
			pos:= aux;
			dni:= v[aux].dni;
		end else begin
			if (dato < v[aux].codigo) then
				busquedaDicotomica(v, ini, aux-1, dato, pos, dni)
			else
				busquedaDicotomica(v, aux+1, fin, dato, pos, dni);
		end;
	end;
end;

// CON FUNCIÓN
function busquedaDicotomica(v: vectorOfi; codigo: integer; dimL, ini, fin: integer): integer;
var
	medio: integer;
begin
	if (dimL > 0) then begin
		if (ini <= fin) then begin
			medio:= (ini + fin) DIV 2;
			if (v[medio].codigo = codigo) then
				busquedaDicotomica:= medio
			else if (codigo < v[medio.codigo) then
				busquedaDicotomica:= busquedaDicotomica(v, codigo, dimL, ini, medio-1)
			else
				busquedaDicotomica:= busquedaDicotomica(v, codigo, dimL, ini+1, fin);
		end else
			busquedaDicotomica:= 0;
	end else
		busquedaDicotomica:= 0;
end;

function calcularMonto(v: vectorOfi; dimL: integer): real;
begin
	if (dimL > 0) then begin
		calcularMonto:= v[dimL].expensas + calcularMonto(v, dimL-1);
		calcularMonto(v, dimL-1);
	end else
		calcularMonto:= 0;
end;

VAR
	v: vectorOfi;
	dimL: integer;
	pos: integer;
	dni: longint;
BEGIN
	dni:= 0;
	pos:= 0;
	cargarVector(v, dimL);
	insercion(v, dimL);
	busquedaDicotomica(v, 1, dimL, 5, pos, dni);
	write('El monto total de las expensas del edificio es: ', calcularMonto(v, dimL));
END.
	
