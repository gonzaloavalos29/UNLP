program listas;
type
	lista = ^nodo;
	nodo = record
		dato: integer;
		sig: lista;
	end;
	
procedure cargarLista(var l: lista; a, b: integer);
var
	ale: integer;
	aux: lista;
begin
	ale:= Random(b-a+1)+a;
	l:= nil;
	while (ale <> 120) do begin
		new(aux);
		aux^.dato:= ale;
		aux^.sig:= nil;
		if (l = nil) then begin
			l:= aux;
		end else begin
			aux^.sig:= l;
			l:= aux;
		end;
		ale:= Random(b-a+1)+a;
	end;
end;

procedure imprimirLista(l: lista);
begin
	while (l <> nil) do begin
		writeln(l^.dato);
		l:= l^.sig;
	end;
end;

function buscar(l: lista; num: integer): boolean;
begin
	buscar:= False;
	while ((l <> nil) and (buscar = false)) do begin
		if (l^.dato = num) then
			buscar:= True
		else
			l:= l^.sig;
	end;
end;

VAR
	a, b: integer;
	l: lista;
	esta: boolean;
BEGIN
	Randomize;
	writeln('Ingrese un numero para min a: ');
	readln(a);
	writeln('Ingrese un numero para max b: ');
	readln(b);
	cargarLista(l, a, b);
	imprimirLista(l);
	esta:= buscar(l, 122);
	writeln(esta);
END.
