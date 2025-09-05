program ejercicio5;
const
	fin= -1;
type
	producto = record
		codigo: integer;
		descripcion: string;
		stock_actual: integer;
		stock_minimo: integer;
		precio: real;
	end;
	lista = ^nodo;
	nodo = record
		dato: producto;
		sig: lista;
	end;
	
procedure leerProducto(var p: producto);
begin
	write('CODIGO: '); readln(p.codigo);
	if (p.codigo <> fin) then begin
		write('DESCRIPCION: '); readln(p.descripcion);
		write('STOCK ACTUAL: '); readln(p.stock_actual);
		write('STOCK MINIMO: '); readln(p.stock_minimo);
		write('PRECIO: '); readln(p.precio);
	end;
end;

procedure agregarNodo(var l: lista; p: producto);
var
	nuevo: lista;
begin
	new(nuevo); { creo un nodo }
	nuevo^.dato:= p; { cargo el dato } 
	nuevo^.sig:= nil; { realizo el enlace }
	if (l = nil) then begin
		l:= nuevo; { actualizo }
	end else begin
		nuevo^.sig:= l;
		l:= nuevo; { actualizo }
	end;
end;

procedure cargarLista(var l: lista);
var
	p: producto;
begin
	leerProducto(p);
	while (p.codigo <> fin) do begin
		agregarNodo(l, p);
		writeln('PRODUCTO LEIDO');
		leerProducto(p);
	end;
end;

procedure imprimirLista(l: lista);
begin
	while (l <> nil) do begin
		writeln('Codigo: ', l^.dato.codigo);
		writeln('Descripcion: ', l^.dato.descripcion);
		writeln('Stock Actual: ', l^.dato.stock_actual);
		writeln('Stock minimo: ', l^.dato.stock_minimo);
		writeln('Precio: ', l^.dato.precio:1:2); 
		l:= l^.sig;
	end;
end;

function calcularPorcentaje(l: lista): real;
var
	cant_total, cant_especial: integer;
begin
	cant_total:= 0;
	cant_especial:= 0;
	while (l <> nil) do begin // Recorro la lista
		cant_total:= cant_total + 1; // Cantidad total de elementos de la lista
		if (l^.dato.stock_actual < l^.dato.stock_minimo) then begin // Si el stock actual está por debajo del stock minimo
			cant_especial:= cant_especial + 1;
		end;
		l:= l^.sig;
	end;
	calcularPorcentaje:= (cant_especial * 100 / cant_total);
end;

function digitosPar(n: integer): longint;
var
	aux: longint; // Contador de digitos pares
begin
	aux:= 0; //Inicializar en 0 por si el WHILE no se hace para devolver algo
	while (n <> 0) do begin
		if ((n mod 2) = 0) then
			aux:= aux + 1;
		n:= n div 10;
	end;
	digitosPar:= aux;
end;

procedure procesarLista(l: lista; var codigo1, codigo2: integer); // Descripción de productos con al menos 3 dígitos pares y código de los dos productos más económicos
var
	precio1, precio2: real;
begin
	precio1:= 9999.99;
	precio2:= 9999.99;
	while (l <> nil) do begin // Recorro la lista hasta el último elemento
		if (digitosPar(l^.dato.codigo) >= 3) then // Imprimo elementos con dígitos pares >= 3
			writeln(l^.dato.descripcion);
		if (l^.dato.precio < precio1) then begin // Busco mínimos
			precio2:= precio1;
			codigo2:= codigo1;
			precio1:= l^.dato.precio;
			codigo2:= l^.dato.codigo;
		end else begin
			precio2:= l^.dato.precio;
			codigo2:= l^.dato.codigo;
		end;
		l:= l^.sig // Paso al siguiente elemento
	end;
end;

var
	l: lista;
	codigo1, codigo2: integer;
begin
	codigo1:= 0;
	codigo2:= 0;
	l:= nil;
	cargarLista(l);
	imprimirLista(l);
	writeln('El porcentaje de stock actual menor a stock minimo es de: ', calcularPorcentaje(l):2:2, '%');
	procesarLista(l, codigo1, codigo2);
	writeln('Los dos productos mas economicos son: ', codigo1, ' y ', codigo2);
end.
