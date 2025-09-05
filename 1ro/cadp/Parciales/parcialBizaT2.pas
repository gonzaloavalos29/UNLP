program segundaFechaT2;
type
	rango_genero = 1..5;
	sesion = record
		titulo: string;
		artista: string;
		genero: rango_genero;
		anio: integer;
		reproducciones: integer;
	end;
	lista = ^nodo;
	nodo = record
		dato: sesion;
		sig: lista;
	end;
	
	vector = array[rango_genero] of integer;
	
procedure cargarLista(var l: lista); // SE DISPONE

procedure insertarOrdenado(var l: lista; s: sesion);
var
	act, ant, nue: lista;
begin
	new(nue);
	l^.dato:= s;
	act:= l;
	ant:= l;
	while (act <> nil) and (l^.dato.anio > s.anio) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act = ant) then
		l:= nue
	else
		ant^.sig:= nue;
	nue^.sig:= nue;
end;

function evaluarDigitos(num: integer): boolean;
var
	resto, suma: integer;
begin
	suma:= 0;
	while (num <> 0) do begin
		resto:= num mod 10;
		suma:= suma + resto;
		num:= num div 10;
	end;
	evaluarDigitos:= (suma mod 5 = 0);
end;

function cumple(g: rango_genero; rep: integer): boolean;
begin
	cumple:= ((g = 1) or (g = 3)) and (evaluarDigitos(rep));
end;

procedure inicializarVector(var v: vector);
var
	i: integer;
begin
	for i:= 1 to 5 do 	
		v[i]:= 0;
end;

procedure calcularMinimos(v: vector; var cod1, cod2: rango_genero);
var
	i: rango_genero;
	min1, min2: integer;
begin
	min1:= 9999;
	min2:= 9999;
	for i:= 1 to 5 do begin
		if (v[i] < min1) then begin
			min2:= min1;
			cod2:= cod1;
			cod1:= i;
			min1:= v[i];
		end else if (v[i] < min2) then begin
			min2:= v[i];
			cod2:= i;
		end;
	end;
end;

procedure procesarLista(l: lista; var cod1, cod2: rango_genero; var l2: lista);
var
	v: vector;
begin
	inicializarVector(v);
	while (l <> nil) do begin
		v[l^.dato.genero]:= v[l^.dato.genero] + l^.dato.reproducciones;
		if (cumple(l^.dato.genero, l^.dato.reproducciones)) then
			insertarOrdenado(l2, l^.dato);
		l:= l^.sig;
	end;
	
	calcularMinimos(v, cod1, cod2);
end;

procedure recorrerLista(l: lista);
var
	cantSesiones, totalRep, anioAct: integer;
begin
	while (l <> nil) do begin
		anioAct:= l^.dato.anio;
		cantSesiones:= 0;
		totalRep:= 0;
		while (l <> nil) and (l^.dato.anio = anioAct) do begin
			cantSesiones:= cantSesiones + 1;
			totalRep:= totalRep + l^.dato.reproducciones;
			l:= l^.sig;
		end;
		writeln('En el año ', anioAct, ' hubo ', cantSesiones, ' sesiones, con un total de ', totalRep, 'reproducciones.');
	end;
end;

var
	l, l2: lista;
	cod1, cod2: rango_genero;
begin
	cargarLista(l); // SE DISPONE
	l2:= nil;
	procesarLista(l, cod1, cod2, l2);
	recorrerLista(l2);
end.
