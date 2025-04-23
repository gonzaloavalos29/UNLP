program p1ejercicio2;
const
	maxOficinas = 300;
	fin = -1;
type
	oficina = record
		codigo: integer;
		dni: integer;
		valor: integer;
	end;
	
	vectorOficinas = array[1..maxOficinas] of oficina;
	
procedure leerOficina(var o: oficina);
begin
	readln(o.codigo);
	if (o.codigo <> fin) then begin
		readln(o.dni);
		readln(o.valor);
	end;
end;

procedure cargarVector(var v: vectorOficinas; var dimL: integer);
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

procedure insercion(var v: vectorOficinas; dimL: integer);
var
	i, j: integer;
	actual: oficina;
begin
	for i:= 2 to dimL do begin
		actual:= v[i];
		j:= i-1;
		while ((j > 0) and (v[j].codigo > actual.codigo)) do begin
			v[j+1]:= v[j];
			j:= j - 1;
		end;
		v[j+1]:= actual;
	end;
end;

procedure seleccion(var v: vectorOficinas; dimL: integer);
var
	i, j, pos, item: integer;
begin
	for i:= 1 to dimL-1 do begin
		pos:= i;
		for j:= i+1 to dimL do begin
			if (v[j].dni < v[pos].dni) then
				pos:= j
		end;
		item:= v[pos].dni;
		v[pos]:= v[i];
		v[i].dni:= item;
	end;
end;

VAR
	v: vectorOficinas;
	dimL: integer;
BEGIN
	cargarVector(v, dimL);
	insercion(v, dimL);
END.
