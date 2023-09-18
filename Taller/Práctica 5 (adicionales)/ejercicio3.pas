program ejercicio3;
const
	dimF = 10;
	fin = -1;
type
	rango = 1..diMF;
	
	producto = record
		cod: integer;
		rubro: rango;
		stock: integer;
		precio: real;
	end;
	
	max = record
		cod: integer;
		stock: integer;
	end;
	
	arbol = ^nodo;
	nodo = record
		data: producto;
		HI: arbol;
		HD: arbol;
	end;
	
	vectorRubro = array[rango] of arbol;
	vectorContador = array[rango] of integer;
	vectorIntervalo = array[rango] of integer;
	
procedure inicializarVector(var v: vectorRubro);
var
	i: rango;
begin
	for i:= 1 to dimF do
		v[i]:= NIL
end;

procedure leerProducto(var p: producto);
begin
	write('Ingrese codigo de producto: ');
	readln(p.cod);
	if (p.cod <> -1) then begin
		write('Ingrese rubro de producto: ');
		readln(p.rubro);
		write('Ingrese stock: ');
		readln(p.stock);
		write('Ingrese precio de producto: ');
		readln(p.precio);
		write(' ++ Producto Cargado ++ ');
	end;
end;

procedure cargarArbol(var a: arbol; p: producto);
begin
	if (a = nil) then begin
		new(a);
		a^.data:= p;
		a^.HI:= nil;
		a^.HD:= nil;
	end else
		if (a^.data.cod >= p.cod) then
			cargarArbol(a^.HI, p)
		else
			cargarArbol(a^.HD, p);
end;

procedure cargarEstructura(var v: vectorRubro);
var
	p: producto;
begin
	leerProducto(p);
	while (p.cod <> fin) do begin
		cargarArbol(v[p.rubro], p);
		leerProducto(p);
	end;
end;

procedure imprimirArbol(a: arbol);
begin
	if (a <> nil) then begin
		imprimirArbol(a^.HI);
		writeln('Codigo: ', a^.data.cod);
		writeln('Rubro: ', a^.data.rubro);
		writeln('Stock: ', a^.data.stock);
		writeln('Precio: ', a^.data.precio:4:2);
		writeln(' --------------- ');
		imprimirArbol(a^.HD);
	end;
end;

procedure imprimirVector(v: vectorRubro);
var
	i: rango;
begin
	for i:= 1 to dimF do
		imprimirArbol(v[i])
end;

function busqueda(a: arbol; cod: integer): boolean;
begin
	if (a <> nil) then begin
		if (a^.data.cod <> cod) then begin
			if (a^.data.cod > cod) then
				busqueda:= busqueda(a^.HD, cod)
			else
				busqueda:= busqueda(a^.HI, cod);
		end else
			busqueda:= true;
	end else
		busqueda:= false
end;

procedure buscarCodEnRubro(v: vectorRubro);
var
	rub: rango;
	cod: integer;
begin
	write('Ingrese rubro: ');
	readln(rub);
	write('Ingrese codigo de producto a buscar: ');
	readln(cod);
	if (busqueda(v[rub], cod)) then
		writeln('El codigo existe en el rubro')
	else
		writeln('El codigo no existe en el rubro');
end;

function buscarMax(a: arbol): arbol;
begin
	if (a^.HD <> nil) then
		buscarMax:= buscarMax(a^.HD)
	else
		buscarMax:= a;
end;

procedure cargarCantidad(v: vectorRubro; var vc: vectorContador);
var
	i: integer;
	aux: arbol;
begin
	for i:= 1 to dimF do begin
		aux:= nil;
		if (v[i] <> nil) then
			aux:= buscarMax(v[i]);
		if (aux <> nil) then begin
			vc[i].cod:= aux^.data.cod;
			vc[i].stock:= aux^.data.stock;
		end else begin
			vc[i].cod:= 0;
			vc[i].stock:= 0;
		end;
	end;
end;

function contarEntreValores(a: arbol; cod1, cod2: integer): integer;
begin
	if (a <> nil) then begin
		if (a^.data.cod >= cod1) then begin
			if (a^.data.cod <=2) then
				contarEntreValores:= contarEntreValores(a^.HI, cod1, cod2) + contarEntreValores(a^.HD, cod1, cod2) + 1
			else
				contarEntreValores:= contarEntreValores(a^.HI, cod1, cod2);
		end else
			contarEntreValores:= contarEntreValores(a^.HD, cod1, cod2);
		end
	else
		contarEntreValores:= 0;
end;

procedure cantidadEntreValores(v: vectorRubro; var vi: vectorIntervalo);
var
	cod1, cod2, aux: integer;
	i: rango;
begin
	write('Ingrese codigo 1: ');
	readln(cod1);
	write('Ingrese codigo 2: ');
	readln(cod2);
	if (cod1 > cod2) then begin
		aux:= cod2;
		cod2:= cod1;
		cod1:= aux;
	end;
	for i:= 1 to dimF do
		vi[i]:= contarEntreValores(v[i], cod1, cod2)
end;

procedure imprimirVectorCant(vc: vectorContador);
var
	i: integer;
begin
	for i:= 1 to dimF do begin
		if (vc[i].stock <> 0) then begin
			writeln('Rubro: ', i);
			writeln('Codigo: ', vc[i].cod);
			writeln('Stock: ', vc[i].stock);
			writeln('**********');
		end;
	end;
end;

procedure imprimirVectorIntervalo(v: vectorIntervalo);
var
	i: integer;
begin
	for i:= 1 to dimF do begin
		if (v[i] <> 0) then begin
			writeln('Rubro: ', i);
			writeln(v[i]);
			writeln('*******');
		end;
	end;
end;

VAR
	v: vectorRubro;
	vc: vectorContador;
	vi: vectorIntervalo;
BEGIN
	inicializarVector(v);
	cargarEstructura(v);
	imprimirVector(v);
	buscarCodEnRubro(v);
	cargarCantidad(v, vc);
	imprimirVectorCant(vc);
	cantidadEntreValores(v, vi);
	imprimirVectorIntervalo(vi);
END.
