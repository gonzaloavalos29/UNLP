program JugamosConListas;
type
	lista = ^nodo;
	nodo = record
		num: integer;
		sig: lista;
end;

procedure armarNodo(var L: lista; v: integer);
var
	aux: lista;
begin
	new(aux);
	aux^.num:= v;
	aux^.sig:= L;
	L:= aux;
end;

procedure imprimirLista(pri: lista);
begin
	while (pri <> nil) do
		begin
			writeln(pri^.num);
			pri:= pri^.sig;
		end;
end;

procedure incrementar(pri: lista; num: integer);
begin
	while (pri <> nil) do
		begin
			pri^.num:= pri^.num + num;
			pri:= pri^.sig;
		end;
end;

function maximo(l: lista): integer;
var
	max: integer;
begin
	max:= -1;
	while (l <> nil) do begin
		if (l^.num > max) then
			max:= l^.num;
		l:= l^.sig;
	end;
	maximo:= max;
end;

function minimo(l: lista): integer;
var
	min: integer;
begin
	min:= 9999;
	while (l <> nil) do begin
		if (l^.num < min) then
			min:= l^.num;
		l:= l^.sig;
	end;
	minimo:= min;
end;

function multiplos(l: lista; num: integer): integer;
var
	cantM: integer;
begin
	cantM:= 0;
	while (l <> nil) do begin
		if ((l^.num mod num) = 0) then
			cantM:= cantM + 1;
		l:= l^.sig;
	end;
	multiplos:= cantM;
end;

var
	pri: lista;
	valor: integer;
	m: integer;
begin
	pri:= nil;
	m:= 2;
	writeln('Ingrese un numero');
	read(valor);
	while (valor <> 0) do begin
		armarNodo(pri, valor);
		writeln('Ingrese un numero');
		read(valor);
	end;
	writeln('El valor maximo de la lista es: ', maximo(pri));
	writeln('El valor minimo de la lista es: ', minimo(pri));
	writeln('La cantidad de multiplos del numero: ', m, ' es: ', multiplos(pri, m));
	incrementar(pri, 1);
	imprimirLista(pri);
end.
