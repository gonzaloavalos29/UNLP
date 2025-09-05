program  ProgramaListasOrdenadas;
type
	lista = ^nodo;
	nodo = record
		dato : integer;
		sig : lista;
	end;

procedure agregarOrdenado(var L:lista;num:integer);
var
	aux : lista;
	act,ant : lista; {PUNTEROS PARA EL RECORRIDO}
begin
	new(aux);
	aux^.dato := num;
	act := L; {ACT Y ANT INICIO DE LA LISTA}
	ant := L;
	while (act <> nil) and (num > act^.dato) do begin
		ant := act;
		act := act^.sig;
	end;
	if (act = ant) then {INICIO O LISTA VACIA}
		L:=aux
	else {MEDIO O FINAL}
		ant^.sig := aux;
	aux^.sig := act;
end;

procedure cargarListaOrdenada(var L:lista);
var
	num : integer;
begin
	Randomize;
	num := 100 + random(51);
	while (num <> 120) do begin
		agregarOrdenado(L,num);
		num := 100 + random(51);
	end;
	writeln('Se genero un 120 :( ');
end;

procedure ImprimirLista(L:lista);
begin
	while (L <> nil) do begin
		writeln('Numero de la lista : ', L^.dato);
		L:= L^.sig;
	end;
end;

function BuscarElementoOrdenado(L:lista):boolean;
var
	aux:boolean;
	num:integer;
begin
	aux:=false;
	writeln('Dame un nuemero para buscar');readln(num);
	while (L <> nil) and (L^.dato <= num) do begin
        if (L^.dato = num) then begin
            aux := true;
		end;
        L := L^.sig;
	end;
	BuscarElementoOrdenado:=aux;
end;

VAR
	L:lista;
BEGIN
	L:=nil;
	CargarListaOrdenada(L);
	ImprimirLista(L);
	if (BuscarElementoOrdenado(L)) then
		writeln('Se encontro el elemento')
	else
		writeln('No se encontro el elemento');
END. 
