program p1ej3;
const
	dimF = 8;
type
	pelicula = record
		codigo: integer;
		genero: integer;
		puntaje_prom: real;
	end;
	
	maximos = record
		puntMax: real;
		codMax: integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: pelicula;
		sig: lista;
	end;
	
	vectorGenero = array[1..dimF] of lista;
	vectorMax = array[1..dimF] of maximos;

procedure leerPelicula(var p: pelicula);
begin
	readln(p.codigo);
	if (p.codigo <> -1) then begin
		readln(p.genero);
		readln(p.puntaje_prom);
	end;
end;

procedure agregarAtras(var l: lista; p: pelicula);
var
	ant, actual, nuevo: lista;
begin
	new(nuevo);
	l^.dato:= p;
	l^.sig:= nil;
	if (l = nil) then 
		l:= nuevo
	else begin
		actual:= l;
		ant:= l;
		while (actual <> nil) do begin
			ant:= actual;
			actual:= actual^.sig;
		end;
		ant^.sig:= nuevo;
	end;
end;

procedure cargarVector(var v: vectorGenero);
var
	p: pelicula;
begin
	leerPelicula(p);
	while (p.codigo <> -1) do begin
		agregarAtras(v[p.genero], p);
		leerPelicula(p);
	end;
end;

procedure inicializarListas(var v: vectorGenero);
var
	i: integer;
begin
	for i:= 1 to dimF do begin
		v[i]:= nil
	end;
end;

procedure inicializarMaximos(var v: vectorMax);
var
	i: integer;
begin
	for i:= 1 to dimF do begin
		v[i].codMax:= -1;
		v[i].puntMax:= -1;
	end;
end;

procedure buscarMaximos(var v: vectorGenero; v2: vectorMax);
var
	i: integer;
	act: lista;
begin
	for i:= 1 to dimF do begin
		act:= v[i];
		while (act <> nil) do begin
			if (act^.dato.puntaje_prom > v2[i].puntMax) then begin
				v2[i].puntMax:= act^.dato.puntaje_prom;
				v2[i].codMax:= act^.dato.codigo;
			end;
			act:= act^.sig;
		end;
	end;
end;

procedure ordenacionInsercion(var v: vectorMax);
var
	i, j: integer;
	aux: maximos;
begin
	for i:= 2 to dimF do begin
		aux:= v[i];
		j:= i-1;
		while (j > 0) and (v[j].puntMax > aux.puntMax) do begin
			v[j+1]:= v[j];
			j:= j - 1;
		end;
		v[j+1]:= aux;
	end;
end;

procedure mostrarVecMax(v: vectorMax);
var
	i: integer;
begin
	for i:= 1 to dimF do begin
		if (i = 1) then
			writeln('La pelicula con menor puntaje es: ', v[i].puntMax)
		else if (i = dimF) then
			writeln('La pelicula con menor puntaje es: ', v[i].puntMax)
	end;
end;

VAR
	vector: vectorGenero;
	vector2: vectorMax;
BEGIN
	Randomize;
	inicializarListas(vector);
	cargarVector(vector); // lee todas las películas y ordena por orden de llegada
	inicializarMaximos(vector2);
	buscarMaximos(vector, vector2); // B
	ordenacionInsercion(vector2); // C
	mostrarVecMax(vector2); // D
END.

		


	
