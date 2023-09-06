program ejercicio2;
const
	dimF = 300;
	corte = -1;
type
	oficina = record
		codIden: integer;
		DNI: integer;
		valor: real;
	end;
	vector = array[1..dimF] of oficina;
	indice = 0..dimF; // del vector
procedure leerOficina(var o: oficina);
begin
	write('Ingrese el código de identificación: '); readln(o.codIden);
	if (o.codIden <> corte) then begin
		write('Ingrese el DNI del propietario: '); readln(o.DNI);
		write('Ingrese el valor de la expensa: '); readln(o.valor);
	end;
end;
procedure cargarVector(var v: vector; var dimL: integer);
var
	i: integer;
	o: oficina;
begin
	i:= 1;
	leerOficina(o);
	writeln;
	while (i <= dimF) and (o.codIden <> corte) do begin
		v[i]:= o;
		i:= i + 1;
		dimL:= dimL + 1;
		leerOficina(o);
		writeln;
	end;
end;
procedure ordMetodoInsercion(var v: vector; dimL: integer);
var
	i, j: indice;
	actual: oficina;
begin
	for i:= 2 to dimL do begin // Se comienza a partir de la segunda posición ya que hay que comparar el primer elemento con algo
		actual:= v[i];
		j:= i - 1;
		while (j > 0) and (v[i].codIden > actual.codIden) do begin // ordenar de menor a mayor
			v[j+1]:= v[j];
			j:= j - 1;
		end;
		v[j+1]:= actual;
	end;
end;
procedure ordMetodoSeleccion(var v: vector; dimL: integer);
var
	i, j, pos: indice;
	item: oficina;
begin
	for i:= 1 to (dimL - 1) do begin
		pos:= i;
		for j:= i to dimL do begin
			if (v[j].codIden < v[pos].codIden) then
				pos:= j;
			item:= v[pos];
			v[pos]:= v[i];
			v[i]:= item;
		end;
	end;
end;
procedure informarVector(v: vector; dimL: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do begin
		writeln('Codigo de identificación: ', v[i].codIden);
	end;
end;

var
	v: vector;
	dimL: integer;
begin
	cargarVector(v, dimL);
	//ordMetodoInsercion(v, dimL);
	ordMetodoSeleccion(v, dimL);
	informarVector(v, dimL);
end.
