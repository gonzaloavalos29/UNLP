program bizarrap;
const
	fin = 'Peso Pluma';
	maxGenero = 5;
type
	r_genero = 1..maxGenero;
	sesion = record
		titulo: string;
		artista: string;
		genero: r_genero;
		visualizaciones: longint;
	end;
	lista = ^nodo;
	nodo = record
		dato: sesion;
		sig: lista;
	end;
	
	vector_genero = array[r_genero] of longint; // cantidad de visualizaciones por cada genero

procedure leerSesion(var s: sesion);
begin
	readln(s.titulo);
	readln(s.artista);
	readln(s.genero);
	readln(s.visualizaciones);
end;
procedure insertarOrdenado(var l: lista; s: sesion);
var
	ant, act, nue: lista;
begin
	new(nue);
	nue^.dato:= s;
	act:= l;
	ant:= l;
	while (act <> nil) and (act^.dato.titulo < s.titulo) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (ant = act) then
		l:= nue
	else
		ant^.sig:= nue;
	nue^.sig:= l;
end;

procedure cargarLista(var l: lista);
var
	s: sesion;
begin
	repeat 
		leerSesion(s);
		insertarOrdenado(l, s);
	until (s.titulo = fin);
end;

procedure inicializarVector(var v: vector_genero);
var
	i: integer;
begin
	for i:=1 to maxGenero do
		v[i]:= 0;
end;

function mismaCantParImpar(digito: longint): boolean;
var
	pares, impares: integer;
begin
	pares:= 0; impares:= 0;
	while (digito <> 0) do begin
		if ((digito mod 10) mod 2 = 0) then 
			pares:= pares + 1
		else
			impares:= impares + 1;
		digito:= digito div 10;
	end;
	mismaCantParImpar:= (pares = impares);
end;

procedure maximo(v: vector_genero; var codMax1, codMax2: integer);
var
	i, max1, max2: longint;
begin
	max1:= -1; max2:= -1;
	codMax1:= 0; codMax2:= 0;
	for i:= 1 to maxGenero do begin
		if (v[i] > max1) then begin
			max2:= max1;
			codMax2:= codMax1;
			max1:= v[i];
			codMax1:= i;
		end else if (v[i] > max2) then begin
			max2:= v[i];
			codMax2:= i;
		end;
	end;
end;

procedure procesarLista(l: lista; var v: vector_genero);
var
	codMax1, codMax2: integer;
	cantSesiones: integer;
begin
	codMax1:= 0; codMax2:= 0;
	cantSesiones:= 0;
	while (l <> nil) do begin
		if (mismaCantParImpar(l^.dato.visualizaciones) and (l^.dato.genero = 2)) then
			cantSesiones:= cantSesiones + 1;
		v[l^.dato.genero]:= v[l^.dato.genero] + l^.dato.visualizaciones;
		l:= l^.sig;
	end;
	maximo(v, codMax1, codMax2);
	writeln('Los codigos de genero con mayor visualizaciones son: ', codMax1, ' y ', codMax2);
	writeln('Cantidad de sesiones con visualizaciones de cantidad de digitos pares iguales a los impares: ', cantSesiones);
end;

// el elemento puede no existir y la lista está ordenada
procedure eliminarSesion(var l: lista; titulo: string);
var
	ant, act: lista;
begin
	act:= l;
	ant:= l;
	while (act <> nil) and (act^.dato.titulo < titulo) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act <> nil) and (act^.dato.titulo = titulo) then begin
		if (act = l) then
			l:= l^.sig
		else
			ant^.sig:= act^.sig;
		dispose(act);
	end;
end;

var
	l: lista;
	v: vector_genero;
begin
	l:= nil;
	cargarLista(l);
	inicializarVector(v);
	procesarLista(l, v);
	
	// Eliminar (COMPLETO)
	eliminarSesion(l, 'Anuel AA');
end.
