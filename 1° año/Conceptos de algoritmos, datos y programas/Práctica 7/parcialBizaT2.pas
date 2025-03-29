program Biza;
const
	max_genero = 5;
type
	rango_genero = 1..max_genero;
	sesion = record
		titulo: string;
		nombre: string;
		genero: rango_genero;
		año: integer;
		reproducciones: longint;
	end;
	vector_generos = array[rango_genero] of longint;
	lista = ^nodo;
	nodo = record
		dato: sesion;
		sig: lista;
	end;
	
procedure cargarLista(var l: lista); // SE DISPONE

procedure inicializarVector(var v: vector);
var
	i: integer;
begin
	for i:= 1 to max_genero do
		v[i]:= 0;
end;

procedure maximos(v: vector_generos; var codMin1, codMin2: integer);
var
	min1, min2: longint;
begin
	min1:= 999999999; min2:= 999999999;
	for i:= 1 to max_genero do begin
		if (v[i] < min1) then begin
			min2:= min1;
			codMin2:= codMin1;
			min1:= v[i];
			codMin1:= i;
		end else if (v[i] < min2) then begin
			min2:= v[i];
			codMin2:= i;
		end;
	end;
end;

function cumple(genero: rango_genero; reproducciones: longint): boolean;
var
	sumaDigitos: integer;
begin
	sumaDigitos:= 0;
	while (reproducciones <> 0) do begin
		sumaDigitos:= sumaDigitos + (reproducciones mod 10);
		reproducciones:= reproducciones div 10;
	end;
	cumple:= ((genero = 1) or (genero = 3)) and ((sumaDigitos mod 5) = 0);
end;
	
end;
			
procedure insertarOrdenado(var l: lista; s: sesion);
var
	ant, act, aux: lista;
begin
	new(aux);
	aux^.dato:= s;
	act:= l;
	ant:= l;
	while (act <> nil) and (act^.dato.año < s.año) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act = ant) then
		l:= aux
	else
		ant^.sig:= aux;
	aux^.sig:= l;
end;

procedure procesarDatos(l: lista; var l2: lista; var v: vector_generos);
var
	codMin1, codMin2: integer;
begin
	l2:= nil;
	while (l <> nil) do begin
		if (cumple(l^.dato.genero, l^.dato.reproducciones)) then
			insertarOrdenado(l2, l^.dato);
		v[l^.dato.genero]:= v[l^.dato.genero] + l^.dato.reproducciones;
		l:= l^.sig;
	end;
	maximos(v, codMax1, codMax2);
	writeln('Los dos codigos con menor cantidad de reproducciones son: ', codMin1, codMin2);
end;

procedure informarSesiones(l2: lista);
var
	añoActual: integer;
	cantSesiones: integer;
	totalReproducciones: longint;
begin
	while (l2 <> nil) do begin
		añoActual:= l2^.dato.año;
		cantSesiones:= 0;
		totalReproducciones:= 0;
		while (l2 <> nil) and (añoActual = l2^.dato.año) do begin
			cantSesiones:= cantSesiones + 1;
			totalReproducciones:= totalReproducciones + l2^.dato.reproducciones;
			l:= l^.sig;
		end;
		writeln('Para el año: ', añoActual, ' hubo ', cantSesiones, ' sesiones, con un total de ', totalReproducciones '.');
	end;
end;

var
	l, l2: lista;
	v: vector_generos;
begin
	cargarLista(l); // SE DISPONE
	inicializarVector(v);
	procesarDatos(l, l2, v);
	informarSesiones(l2);
end.
