program ordenar;
const
	dimF = 10;
type
	tVector = array[1..dimF] of integer;
	
procedure inicializarVector(var v: tVector);
var
	i: integer;
begin
	for i:=1 to dimF do
		v[i]:= 0
end;

procedure cargarVector(var v: tVector; var dimL: integer);
begin
	dimL:= 0;
	while (dimL <= dimF) and (v[dimL] <> 0) do begin
		dimL:= dimL + 1;
		readln(v[dimL]);
	end;
end;

procedure seleccion(var v: tVector; dimL: integer);
var
	i, j, pos: integer;
	item: integer; // O el elemento q corresponda
begin
	for i:= 1 to dimL-1 do begin // busca el mínimo y guarda en pos la posición
		pos:= i;
		for j:= i+1 to dimL do begin
			if v[j] < v[pos] then
				pos:= j
		end;
		item:= v[pos];
		v[pos]:= v[i];
		v[i]:= item;
	end;
end;
		
procedure insercion(var v: tVector; dimL: integer);
var
	i, j: integer;
	actual: integer;
begin
	for i:= 2 to dimL do begin
		actual:= v[i];
		j:= i-1;
		while (j > 0) and (v[j] > actual) do begin
			v[j+1]:= v[j];
			j:= j-1;
		end;
		v[j+1]:= actual;
	end;
end;

// BUSQUEDA DICOTÓMICA
function dicotomica(v: vector; dimL: integer; valor: integer): boolean;
var
	ini, fin, medio: integer;
	ok: boolean;
begin
	ok:= false;
	ini:= 1;
	fin:= dimL;
	medio:= (ini+fin) div 2;
	while (ini <= fin) and (v[medio] <> valor) do begin
		if (valor < v[medio]) then
			fin:= medio - 1
		else
			ini:= medio + 1;
		medio:= (ini+fin) div 2;
	if (v[medio] = valor) then
		ok:= true
end;

VAR
	v: tVector;
	dimL: integer;
BEGIN
	inicializarVector(v);
	cargarVector(v, dimL);
	seleccion(v, dimL);
	insercion(v, dimL);
END.
	
