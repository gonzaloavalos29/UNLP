// AGREGAR
procedure agregar(var a: numeros; var dl: integer;{ var pude: boolean;} num: integer);
begin
	{pude:= false;}
	if ((dl + 1) <= fisica) then begin
		{pude:= true;}
		dl:= dl + 1;
		a[dl]:= num;
	end;
end;
// INSERTAR
procedure insertar(var a: numeros; var dl: integer;{ var pude: boolean;} num: integer; pos: integer);
var
	i: integer;
begin
	{ pude:= false;}
	if ((dl + 1) <= fisica) and (pos>= 1) and (pos <= dl)) then begin
		for i:= dl downto pos do
			a[i+1]:= a[i];
		{pude:= true;}
		a[pos]:= num;
		dl:= dl + 1;
	end;
end;
// ELIMINAR
procedure eliminar(var a: numeros; var dl: integer; var pude: boolean; pos: integer);
var
	i: integer;
begin
	pude:= false;
	if ((pos >= 1) and (pos <= dl)) then begin
		for i:= pos to (dl-1) do
			a[i]:= a[i+1]; // Piso el elemento a eliminar y retrocedo una posición desde el final
		pude:= true;
		dl:= dl - 1;
	end;
end;
// CARGAR ELEMENTOS CON DIMENSIÓN LÓGICA
procedure cargarValores(var a: numeros; var dimL: integer);
var
	num: integer;
begin
	dimL:= 0;
	read(num);
	while ((dimL < dF) and (num <> 50)) do begin // 50 es condición de corte
		dimL:= dimL + 1;
		a[dimL]:= num;
		read(num);
	end;
end;
// BUSQUEDA (vector desordenado)
function buscar(a: numeros; dl: integer; valor: integer): boolean;
var
	pos: integer;
	esta: boolean;
begin
	esta:= false;
	pos:= 1;
	while ((pos <= dl) and (not esta)) do begin
		if (a[pos]= valor) then
			esta:= true
		else
			pos:= pos+1;
	end;
	buscar:= esta;
end;

// BUSQUEDA DICOTÓMICA (vector ordenado)
function existe(v: numeros; dl: integer; valor: integer): boolean;
var
	pri, ult, medio: integer;
	ok: boolean;
begin
	ok:= false;
	pri:= 1; 
	ult:= dl; 
	medio:= (pri + ult) div 2;
	while (pri <= ult) and (valor <> v[medio]) do begin
		if (valor < v[medio]) then
			ult:= medio-1
		else
			pri:= medio+1;
		medio:= (pri+ult) div 2;
	end;
	if (pri <= ult) and (valor = v[medio]) then 
		ok:= true;
	existe:= ok;
end;

// ORDENAR POR MÉTODO DE SELECCIÓN
procedure ordenar(var v: numeros; dL: integer);
var
	i, j, p, item: integer;
begin
	for i:= 1 to dL-1 do begin // Busca el mínimo v[p] entre v[i], ..., v[N] }
		p:= i;
		for j:= i+1 to dL do
			if v[j] < v[p] then
				p:= j;
		{ intercambia v[i] y v[p] }
		item:= v[p];
		v[p]:= v[i];
		v[i]:= item;
	end;
end;
