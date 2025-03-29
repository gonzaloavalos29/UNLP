program cine;
const
	corte = -1;
	maxGenero = 8;
type
	r_genero = 1..maxGenero;
	pelicula = record
		codigo: integer;
		titulo: string;
		genero: r_genero;
		puntaje_prom: integer;
	end;
	lista = ^nodo;
	nodo = record
		dato: pelicula;
		sig: lista;
	end;
	
	critica = record
		dni: longint;
		apellido: string;
		nombre: string;
		cod_pelicula: integer;
		puntaje: integer;
	end;
	
	lista2 = ^nodo2;
	nodo2 = record
		dato: critica;
		sig: lista2;
	end;
	
	vector_generos = array[r_genero] of integer; // puntajes por genero
	
procedure leerCriticas(var c: criticas);
begin
	readln(c.dni);
	readln(c.apellido);
	readln(c.nombre);
	readln(c.cod_pelicula);
	readln(c.puntaje);
end;

procedure insertarOrdenado(var l: lista2; c: critica);
var
	nue, ant, act: lista;
begin
	new(nue);
	nue^.dato:= c;
	ant:= l;
	act:= l;
	while (act <> nil) and (act^.dato.codigo < c.codigo) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act = ant) then
		l:= nue;
	else
		ant^.sig:= nue;
	nue^.sig:= l;
end;

procedure cargarLista(var l: lista); // SE DISPONE
procedure cargarLista2(var l: lista2);
var
	c: criticas;
begin
	l:= nil;
	leerCriticas(c);
	while (c.cod_pelicula <> corte) do begin
		insertarOrdenado(l, c);
		leerCriticas(c);
	end;
end;

procedure inicializarVector(var v: vector_generos);
var
	i: integer;
begin
	for i:= 1 to 8 do
		v[i]:= 0;
end;

function mismaCantParesImpares(dni: longint): boolean;
var
	pares, impares: integer;
begin
	pares:= 0; impares:= 0;
	while (dni <> 0) do begin
		if ((dni mod 10) mod 2 = 0) then
			pares:= pares + 1;
		else	
			impares:= impares + 1;
		dni:= dni div 10;
	end;
	mismaCantParesImpares:= (pares = impares);
end;

procedure calcularMaximo(v: vector_generos; var codMax: integer);
var
	i: integer;
	max: integer;
begin
	max:= -1;
	for i:= 1 to maxGenero do begin
		if (v[i] > max) then begin
			max:= v[i];
			codMax:= i;
		end;
	end;
end;

procedure actualizarDatos(l: lista; l2: lista2; var v: vector_generos);
var
	sumaPuntajes: real;
	cantCriticas: integer;
	codActual: integer;
begin
	while (l2 <> nil) do begin
		codActual:= l2^.dato.cod_pelicula;
		sumaPuntajes:= 0;
		cantCriticas:= 0;
		while (l2 <> nil) and (codActual = l2^.dato.cod_pelicula);
			cantCriticas:= cantCriticas + 1;
			sumaPuntajes:= sumaPuntajes + l2^.dato.puntaje;
			l2:= l2^.sig;
		end;
		l^.dato.puntaje_prom:= (sumaPuntajes / cantCriticas);



procedure eliminar_pelicula(var l: lista; codigo: integer);
var
	act, ant: lista;
begin
	act:= l;
	ant:= l;
	while (act <> nil) and (act^.dato.codigo < codigo) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act <> nil) and (act^.dato.codigo = codigo) then begin
		if (act = l) then
			l:= l^.sig
		else
			ant^.sig:= act^.sig;
		dispose(act);
	end;
end;

// se repite
{procedure eliminar_pelicula(var l: lista; codigo: integer);
var
	act, ant: lista;
begin
	act:= l;
	ant:= l;
	while (act <> nil) do begin
		if (act^.dato.codigo <> codigo) then begin
			ant:= act;
			act:= act^.sig;
		end else begin
			if (act = l) then
				l:= l^.sig
			else
				ant^.sig:= act^.sig;
			dispose(act);
			act:= ant;
		end;
	end;
end;}

