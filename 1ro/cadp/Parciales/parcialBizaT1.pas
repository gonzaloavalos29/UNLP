program SegundaFechaT1;
type
	rango_genero = 1..5;
	sesion = record
		titulo: string;
		artista: string;
		genero: rango_genero;
		visualizaciones: integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: sesion;
		sig: lista;
	end;
	
	vector_generos = array[rango_genero] of integer;
	
procedure inicializar(var v: vector_generos);
var
	i: rango_genero;
begin
	for i:= 1 to 5 do
		v[i]:= 0;
end;

procedure leerSesion(var s: sesion);
begin
	readln(s.titulo);
	readln(s.artista);
	readln(s.visualizaciones);
	readln(s.genero);
end;

procedure insertarOrdenado(l: lista; s: sesion);
var
	ant, act, nue: lista;
begin
	new(nue);
	nue^.dato:= s;
	act:= l;
	ant:= l;
	while (act <> nil) and (act^.dato.titulo > s.titulo) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act = ant) then
		l:= nue
	else
		ant^.sig:= nue;
	nue^.sig:= act;
end;

procedure cargarLista(var l: lista);
var
	s: sesion;
begin
	repeat
		leerSesion(s);
		insertarOrdenado(l, s);
	until (s.artista = 'Peso Pluma');
end;
function paresImpares(num: integer): boolean;
var
	pares, impares, digito: integer;
begin
	pares:= 0; impares:= 0;
	while (num <> 0) do begin
		digito:= (num mod 10);
		if (digito mod 2 = 0) then
			pares:= pares + 1
		else
			impares:= impares + 1;
		num:= num div 10;
	end;
	paresImpares:= (pares = impares);
end;
function cumple(s: sesion): boolean;
begin
	cumple:= (s.genero = 2) and (paresImpares(s.visualizaciones));
end;
	
procedure procesarLista(l: lista; var v: vector_generos);
var
	cant: integer;
begin
	cant:= 0;
	while (l <> nil) do begin	
		v[l^.dato.genero]:= v[l^.dato.genero] + l^.dato.visualizaciones;
		if (cumple(l^.dato)) then
			cant:= cant + 1;
		l:= l^.sig;
	end;
end;

procedure obtenerMaximos(v: vector_generos; var cod1, cod2: rango_genero);
var
	max1, max2: integer;
	i: rango_genero;
begin
	max1:= -1;
	max2:= -1;
	for i:= 1 to 5 do begin
		if (v[i] > max1) then begin
			max2:= max1;
			cod2:= cod1;
			cod1:= i;
			max1:= v[i];
		end else if (v[i] > max2) then begin
			max2:= v[i];
		end;
	end;
end;

procedure eliminar(var l: lista; t: string);
var
	ant, act: lista;
begin
	ant:= l;
	act:= l;
	while (act <> nil) and (act^.dato.titulo < t) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act <> nil) and (act^.dato.titulo = t) then begin
		if (act = l) then
			l:= l^.sig
		else
			ant^.sig:= act^.sig;
		dispose(act);
	end;
end;

var
	L: lista;
	v: vector_generos;
	codMax1, codMax2: rango_genero;
	titulo: string;
begin
	l:= nil;
	inicializar(v);
	cargarLista(l);
	procesarLista(l, v);
	obtenerMaximos(v, codMax1, codMax2);
	writeln(codMax1, codMax2);
	// COMPLETO
	readln(titulo);
	eliminar(l, titulo);
end.
