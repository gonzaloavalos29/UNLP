procedure agregarAdelante(var l: lista; r: registro);
var
	aux: lista; // o nuevo
begin
	new(aux);
	aux^.dato:= r;
	aux^.sig:= nil;
	if (l <> nil) then
		aux^.sig:= l;
	l:= aux;
end;

procedure agregarAtras(var pri, ult: lista; r: registro);
var
	aux: lista; // o nuevo
begin
	new(aux);
	aux^.dato:= r;
	aux^.sig:= nil;
	if (pri = nil) then begin
		pri:= aux;
		ult:= aux;
	end else begin
		ult:= aux;
		ult^.sig:= aux; // actualizo el siguiente del último y el último.
	end;
end;

procedure insertarOrdenado(var l: lista; j: jugador);
var
	aux: lista;
	act, ant: lista; // Punteros auxiliares para recorrido
begin
	new(aux);
	aux^.dato:= j;
	act:= l; { ubico act y ant al inicio de la lista }
	ant:= l;
	while (act <> nil) and (j.altura < act^.dato.altura) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (ant = act) then {al inicio o lista vacía}
		l:= aux;
	else {al medio o al final}
		ant^.sig:= aux;
	aux^.sig:= act;
end;

{procedure insertarOrdenado(var l: lista; r: registro);
var
	aux, act, ant: lista;
begin
	new(aux);
	aux^.dato:= r;
	aux^.sig:= nil;
	if (l = nil) then begin
		l:= aux;
	end else begin
		act:= l;
		ant:= l;
		while (l <> nil) and (act^.dato.codigo < aux^.dato.codigo) do begin
			ant:= act;
			act:= act^.sig;
		if (ant = act) then begin
			aux^.sig:= l;
			l:= aux;
		end else begin
			ant^.sig:= aux;
			aux^.sig:= act;
		end;
	end;
end;}

procedure cargarLista(var l: lista);
var
	j: jugador;
begin
	leerJugador(j);
	while (j.dni <> 0) do begin
		insertarOrdenado(l, j);
		leerJugador(j);
	end;
end;

// Busqueda en lista desordenada
function buscar(pI: listaE; valor: integer): boolean;
var
	aux: listaE;
	encontre: boolean;
begin
	encontre:= false;
	aux:= pI;
	while ((aux <> nil) and (encontre = false)) do begin
		if (aux^.elem = valor) then
			encontre = true;
		else
			aux:= aux^.sig;
	end;
	buscar:= encontre;
end;

// Busqueda en lista ordenada
function buscar(pI: listaE; valor: integer): boolean;
var
	aux: listaE;
	encontre: boolean;
begin
	encontre:= false;
	aux:= pI;
	while ((aux <> nil) and (aux^.elem < valor)) do begin
		aux:= aux^.sig;
	end;
	if (aux <> nil) and (aux^.elem = valor) then encontre:= true;
	buscar:= encontre;
end;

// Eliminar si el elemento existe, está una sola vez, y la lista está desordenada
procedure eliminar(var l: listaE; valor: integer);
var
	actual, ant: listaE;
begin
	actual:= l;
	while (actual <> nil) and (actual^.elem <> valor) do begin
		ant:= actual;
		actual:= actual^.sig;
	end;
	if (actual <> nil) then
		if (actual = l) then
			l:= l^.sig;
		else
			ant^.sig:= actual^.sig;
		dispose(actual);
end;

// Eliminar si la lista está desordenada y el elemento puede repetirse
procedure eliminar (var l: listaE; valor: integer);
var
	actual, ant: listaE;
begin
	actual:= l;
	while (actual <> nil) do begin
		if (actual^.elem <> valor) then begin
			ant:= actual; 
			actual:= actual^.sig;
		end else begin
			if (actual = l) then
				l:= l^.sig;
			else
				ant^.sig:= actual^.sig;
			dispose(actual);
			actual:= ant;
		end;
	end;
end;

// Eliminar si el elemento puede no existir y la lista está ordenada
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
