program ej3p5;
const
	fin = 0;
	max = 10;
type
	subr = 1..max;
	producto = record
		rubro: integer;
		codigo: integer;
		stock: integer;
		precio: real;
	end;
	
	prodRubro = record
		codigo: integer;
		stock: integer;
		precio: real;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: prodRubro;
		HI: arbol;
		HD: arbol;
	end;
	
	vector = array[subr] of arbol;
	
	prodMaxStock = record
		codigo: integer;
		stock: integer;
	end;
	
	vectorMax = array[subr] of prodMaxStock;
	vectorCantProductos = array[subr] of integer;
	
procedure leerProducto(var p: producto);
begin
	write('Codigo: ');
	read(p.codigo);
	if (p.codigo <> fin) then begin
		write('Stock: ');
		readln(p.stock);
		write('Rubro: ');
		readln(p.rubro);
		write('Precio: ');
		readln(p.precio);
	end;
end;

procedure inicializarVector(var v: vector);
var
	i: integer;
begin
	for i:= 1 to max do begin
		v[i]:= nil;
	end;
end;

procedure armarHoja(var a: arbol; p: prodRubro);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:= p;
		a^.HI:= nil;
		a^.HD:= nil;
	end else if (p.codigo < a^.dato.codigo) then
		armarHoja(a^.HI, p)
	else	
		armarHoja(a^.HD, p);
end;

procedure cargarVector(var v: vector);
var
	p: producto;
	prod: prodRubro;
begin
	leerProducto(p);
	while (p.codigo <> fin) do begin
		prod.codigo:= p.codigo;
		prod.stock:= p.stock;
		prod.precio:= p.precio;
		armarHoja(v[p.rubro], prod);
		leerProducto(p);
	end;
end;

procedure imprimirProducto(p: prodRubro);
begin
	write('Codigo: ', p.codigo, ' | Stock: ', p.stock, ' | Precio: ', p.precio:0:2);
	writeln;
end;

procedure imprimirArbol(a: arbol);
begin
	if (a <> nil) then begin
		imprimirArbol(a^.HI);
		imprimirProducto(a^.dato);
		imprimirArbol(a^.HD);
	end;
end;

procedure imprimirVector(v: vector);
var
	i: integer;
begin
	for i:= 1 to max do begin
		write(i, '. ');
		imprimirArbol(v[i]);
		writeln();
	end;
end;

procedure buscar(a: arbol; codigo: integer; var esta: boolean);
begin
	if (a <> nil) then begin
		if (codigo = a^.dato.codigo) then
			esta:= true
		else
			if (codigo < a^.dato.codigo) then
				buscar(a^.HI, codigo, esta)
			else
				buscar(a^.HD, codigo, esta);
	end;
end;

function existe(v: vector; rubro: integer; codigo: integer): boolean;
var
	i: integer;
begin
	i:= 1;
	existe:= false;
	while ((existe = false) and (i <= max)) do begin
		buscar(v[i], codigo, existe);
		i:= i + 1;
	end;
end;

procedure maxArbol(a: arbol; var maxCod, maxStock: integer);
begin
	if (a <> nil) then begin
		maxArbol(a^.HD, maxCod, maxStock);
		if (a^.dato.codigo > maxCod) then begin
			maxCod:= a^.dato.codigo;
			maxStock:= a^.dato.stock;
		end;
	end;
end;

procedure maxCodigo(v: vector; var vec: vectorMax);
var
	i: integer;
	maxCod, maxStock: integer;
begin
	for i:= 1 to max do begin
		maxCod:= -1; maxStock:= -1;
		maxArbol(v[i], maxCod, maxStock);
		vec[i].stock:= maxStock;
		vec[i].codigo:= maxCod;
	end;
end;

procedure imprimirVector2(v: vectorMax);
var
	i: integer;
begin
	for i:= 1 to max do begin
		write(i, ': ');
		write('Codigo max: ', v[i].codigo);
		write('| Stock max: ', v[i].stock);
		writeln;
	end;
end;

procedure entreValores(a: arbol; valorInf, valorSup: integer; var cant: integer);
begin
	if (a <> nil) then begin
		if (a^.dato.codigo < valorInf) then
			entreValores(a^.HD, valorInf, valorSup, cant)
		else if(a^.dato.codigo > valorSup) then
			entreValores(a^.HI, valorInf, valorSup, cant)
		else
			cant:= cant + a^.dato.stock;
			entreValores(a^.HD, valorInf, valorSup, cant);
			entreValores(a^.HI, valorInf, valorSup, cant);
	end;
end;

procedure generarVectorCant(v: vector; var vector: vectorCantProductos; valorInf, valorSup: integer);
var
	i, cant: integer;
begin
	cant:= 0;
	for i:= 1 to max do begin
		entreValores(v[i], valorInf, valorSup, cant);
		vector[i]:= cant;
		cant:= 0;
	end;
end;

procedure inicializarVector3(var v: vectorCantProductos);
var
	i: integer;
begin
	for i:= 1 to max do begin	
		v[i]:= 0;
	end;
end;

procedure imprimirVector3(v: vectorCantProductos);
var
	i: integer;
begin
	for i:= 1 to max do
		writeln('El rubro ', i, ' tiene cantidad de productos entre valores: ', v[i])
end;

VAR
	v: vector;
	v2: vectorMax;
	v3: vectorCantProductos;
BEGIN
	inicializarVector(v);
	cargarVector(v); // A
	imprimirVector(v);
	writeln('El codigo existe: ', existe(v, 5, 5)); // B
	maxCodigo(v, v2); // C
	imprimirVector2(v2);
	inicializarVector3(v3);
	generarVectorCant(v, v3, 5, 8);
	imprimirVector3(v3); // D
END.
