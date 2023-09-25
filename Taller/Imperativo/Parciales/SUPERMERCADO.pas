program supermercado;
const
	fin = 0;
type
	sub_mes = 1..12;
	vector_montos = array[sub_mes] of real;
	compra = record
		cliente: integer;
		mes: sub_mes;
		monto: real;
		montos: vector_montos;
	end;
	arbol = ^nodo;
	nodo = record
		dato: compra;
		HI: arbol;
		HD: arbol;
	end;
	
procedure leerCompra(var c: compra);
begin
	c.cliente:= Random(100);
	if (c.cliente <> fin) then begin
		c.monto:= (Random(20000) / Random(10)+1);
		c.mes:= Random(12) + 1;
	end;
end;

procedure inicializarVector(var v: vector_montos);
var
	i: sub_mes;
begin
	for i:= 1 to 12 do
		v[i]:= 0
end;

procedure agregarArbol(var a: arbol; c: compra);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:= c;
		a^.HI:= nil;
		a^.HD:= nil;
	end else
		if (a^.dato.cliente = c.cliente) and (a^.dato.mes = c.mes) then
			a^.dato.montos[a^.dato.mes]:= a^.dato.montos[a^.dato.mes] + a^.dato.monto;
		if (c.cliente <= a^.dato.cliente) then
			agregarArbol(a^.HI, c)
		else
			agregarArbol(a^.HD, c);
end;

procedure cargarArbol(var a: arbol);
var
	c: compra;
begin
	leerCompra(c);
	while (c.cliente <> fin) do begin
		agregarArbol(a, c);
		leerCompra(c);
	end;
end;

function maximo(v: vector_montos): sub_mes;
var
	i: integer;
	montoMax: real;
	pos: integer;
begin
	pos:= -1;
	montoMax:= -1;
	for i:= 1 to 12 do begin
		if (v[i] > montoMax) then begin
			montoMax:= v[i];
			pos:= i;
		end;
	end;
	maximo:= pos;
end;
		

function maxMes(a: arbol; c: compra): integer;
begin
	if (a = nil) then
		maxMes:= 0
	else
		if (a^.dato.cliente <> c.cliente) then begin
			maxMes(a^.HI, c);
			maxMes(a^.HD, c);
			if (a^.dato.cliente = c.cliente) then 
				maxMes:= maximo(a^.dato.montos);
		end;
end;



function cantSinGasto(a: arbol; m: sub_mes): integer;
var
	contador: integer;
begin
	if (a <> nil) then begin
		if (a^.dato.mes = m) and (a^.dato.montos = 0) then
			contador:= contador + 1;
		cantSinGasto(a^.HI; 


