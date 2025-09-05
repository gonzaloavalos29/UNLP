program ejercicio2;
type
	lista = ^nodo;
	nodo = record
		dato: integer;
		sig: lista;
	end;
	
procedure agregarAtras(var l, ult: lista; num: integer);
var
	nue: lista;
begin	
	new(nue);
	nue^.dato:= num;
	nue^.sig:= nil;
	if (l = nil) then
		l:= nue
	else
		ult^.sig:= nue;
	ult:= nue;
end;

procedure cargarLista(var l: lista; min, max: integer);
var
	num: integer;
	ult: lista;
begin
	num:= random(max-min+1)+min;
	write(num, ' ');
	if (num <> 100) then begin
		agregarAtras(l, ult, num);
		cargarLista(l^.sig, min, max);
	end;
end;

procedure imprimirLista(l: lista);
begin
	writeln();
	while (l <> nil) do begin
		write(l^.dato, ' ');
		l:= l^.sig;
	end;
end;

procedure imprimirRecursivo(l: lista);
begin
	if (l <> nil) then begin
		imprimirRecursivo(l^.sig);
		write(l^.dato, ' ');
	end;
end;

procedure minimoRecursivo(l: lista; var min: integer);
begin
	if (l <> nil) then begin
		if (l^.dato < min) then
			min:= l^.dato;
		minimoRecursivo(l^.sig, min);
	end;
end;

procedure encontrarValor(l: lista; valor: integer; var encontrado: boolean);
begin
	if ((l <> nil) and (encontrado = false)) then begin
		if (l^.dato = valor) then 
			encontrado:= true;
		encontrarValor(l^.sig, valor, encontrado);
	end;
end;

VAR
	l: lista;
	encontre: boolean;
	min, valorMin, valorMax: integer;
BEGIN
	Randomize;
	min:= 9999;
	encontre:= false;
	l:= nil;
	write('Ingrese un min: '); readln(valorMin);
	write('Ingrese un max: '); readln(valorMax);
	cargarLista(l, valorMin, valorMax); // INCISO A
	imprimirLista(l); // INCISO B
	writeln();
	imprimirRecursivo(l); // INCISO C
	minimoRecursivo(l, min); // INCISO D
	writeln();
	writeln('El minimo valor de la lista es: ', min);
	encontrarValor(l, 200, encontre); // INCISO E
	writeln();
	writeln(encontre);
END.
