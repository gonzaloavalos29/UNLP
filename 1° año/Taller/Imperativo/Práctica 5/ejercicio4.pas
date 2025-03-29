program ej4p5;
const
	fin = 0;
type
	reclamo = record
		dni: integer;
		codigo: integer;
		anio: integer;
		tipo: integer;
	end;
	
	reclamo2 = record
		codigo: integer;
		anio: integer;
		tipo: integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: reclamo2;
		sig: lista;
	end;
	
	dniReclamo = record
		dni: integer;
		cant: integer;
		l: lista;
	end;
	
	arbol = ^nodo2;
	nodo2 = record
		dato: dniReclamo;
		HI: arbol;
		HD: arbol;
	end;
	
	listaAnio = ^nodoLista2;
	nodoLista2 = record
		dato: integer;
		sig: listaAnio;
	end;
	
procedure leerReclamo(var r: reclamo);
begin
	readln(r.codigo);
	if (r.codigo <> fin) then begin
		readln(r.dni);
		readln(r.anio);
		readln(r.tipo);
	end;
end;

procedure agregarNodo(var l: lista; r: reclamo2);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= r;
	nue^.sig:= l;
	l:= nue;
end;

procedure armarHoja(var a: arbol; r: reclamo);
var
	r2: reclamo2;
begin
	if (a = nil) then begin
		new(a);
		a^.HI:= nil;
		a^.HD:= nil;
		a^.dato.l:= nil;
		a^.dato.cant:= 1;
		a^.dato.dni:= r.dni;
		r2.codigo:= r.codigo;
		r2.anio:= r.anio;
		r2.tipo:= r.tipo;
		agregarNodo(a^.dato.l, r2);
	end else if (r.dni < a^.dato.dni) then
		armarHoja(a^.HI, r)
	else if (r.dni > a^.dato.dni) then
		armarHoja(a^.HD, r)
	else
		a^.dato.dni:= a^.dato.dni + 1;
		r2.codigo:= r.codigo;
		r2.anio:= r.anio;
		r2.tipo:= r.tipo;
		agregarNodo(a^.dato.l, r2);
end;

procedure cargarArbol(var a: arbol);
var
	r: reclamo;
begin
	leerReclamo(r);
	while (r.codigo <> fin) do begin
		armarHoja(a, r);
		leerReclamo(r);
	end;
end;

function calcularCantidadReclamos(a: arbol; dni: integer; var cant: integer): integer;
begin
	if (a <> nil) then begin
		if (a^.dato.dni > dni) then
			calcularCantidadReclamos(a^.HI, dni, cant)
		else if(a^.dato.dni < dni) then
			calcularCantidadReclamos(a^.HD, dni, cant)
		else
			calcularCantidadReclamos:= calcularCantidadReclamos(a^.HI, dni, cant) + calcularCantidadReclamos(a^.HD, dni, cant) + 1;
	end;
end;

procedure calcularEntreValores(a: arbol; dni1, dni2: integer; var cant: integer);
begin
	if (a <> nil) then begin
		if (a^.dato.dni < dni1) then
			calcularEntreValores(a^.HD, dni1, dni2, cant)
		else if (a^.dato.dni > dni2) then
			calcularEntreValores(a^.HI, dni1, dni2, cant)
		else
			cant:= cant + 1;
			calcularEntreValores(a^.HI, dni1, dni2, cant);
			calcularEntreValores(a^.HI, dni1, dni2, cant);
	end;
end;

procedure agregarAdelanteII(var l: listaAnio; codigo: integer);
var
	nue: listaAnio;
begin
	new(nue);
	nue^.dato:= codigo;
	nue^.sig:= l;
	l:= nue;
end;

procedure generarListaPorAnio(l: lista; anio: integer; var lis: listaAnio);
begin
	while (l <> nil) do begin
		if (l^.dato.anio = anio) then
			agregarAdelanteII(lis, l^.dato.codigo);
		l:= l^.sig;
	end;
end;

procedure generarListaAnioArbol(a: arbol; anio: integer; var l: listaAnio);
begin
	if (a <> nil) then begin
		generarListaPorAnio(a^.dato.l, anio, l);
		generarListaAnioArbol(a^.HI, anio, l);
		generarListaAnioArbol(a^.HD, anio, l);
	end;
end;

procedure imprimirListaAnio(l: listaAnio);
begin
	while (l <> nil) do begin
		writeln('Codigo: ', l^.dato);
		l:= l^.sig;
	end;
end;

VAR
	a: arbol;
	l: listaAnio;
	dni1, dni2, anio, cant: integer;
BEGIN
	dni1:= 5; dni2:= 10; anio:= 2000; cant:= 0; anio:= 2000;
	a:= nil;
	cargarArbol(a);
	calcularCantidadReclamos(a, dni1, cant);
	writeln('Cantidad de reclamos: ', cant);
	cant:= 0;
	calcularEntreValores(a, dni1, dni2, cant);
	writeln('Cantidad de reclamos: ', cant);
	cant:= 0;
	generarListaAnioArbol(a, anio, l);
	imprimirListaAnio(l);
END.
