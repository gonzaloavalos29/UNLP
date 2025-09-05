// Si el elemento existe y está una vez, y la lista está desordenada
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

// Si la lista está desordenada y el elemento puede repetirse
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
