program ej3p4;
const
	fin = -1;
type
	productoVendido = record
		codigo: integer;
		cantVendida: integer;
		precio: real;
	end;
	
	producto = record
		codigo: integer;
		cantTotal: integer;
		montoTotal: real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: productoVendido;
		sig: lista;
	end;
	
	lista2 = ^nodo2;
	nodo2 = record
		dato: producto;
		sig: lista2;
	end;
	
	venta = record
		codigo: integer;
		productoVendido: lista;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: venta;
		HI: arbol;
		HD: arbol;
	end;
	
procedure leerVentas(var v: venta);
begin
	readln(v.codigo);
	if (v.codigo <> fin) then begin
		readln(v.productoVendido^.dato.codigo);
		readln(v.productoVendido^.dato.precio);
		readln(v.productoVendido^.dato.cantVendida);
	end;
end;

procedure agregarAdelante(var l: lista2; p: productoVendido);
var
	aux: lista2;
begin	
	new(aux);
	aux^.dato.codigo:= p.codigo;
	aux^.sig:= nil;
	l:= aux;
end;
	
procedure crearHoja(var a: arbol; v: venta);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:= v;
		a^.HI:= nil;
		a^.HD:= nil;
	end else if (v.productoVendido^.dato.codigo <= a^.dato.productoVendido^.dato.codigo) then 
		crearHoja(a^.HI, v)
	else
		crearHoja(a^.HD, v);
end;

procedure cargarArbol(var a: arbol);
var
	v: venta;
begin
	a:= nil;
	leerVentas(v);
	while (v.codigo <> fin) do begin
		crearHoja(a, v);
		leerVentas(v);
	end;
end;

procedure imprimirArbol(a: arbol);
begin
	if (a = nil) then
		writeln('Arbol vacio.')
	else
		imprimirArbol(a^.HI);
		writeln('Venta nro.: ', a^.dato.codigo);
		imprimirArbol(a^.HD);
end;

procedure cargarLista(a: arbol; var l: lista2);

	procedure recorrerYCargar(a: arbol; var l: lista2);
	begin
		if (a <> nil) then begin
			recorrerYCargar(a^.HI, l);
			l^.dato.cantTotal:= l^.dato.cantTotal + a^.dato.productoVendido^.dato.cantVendida;
			l^.dato.montoTotal:= l^.dato.montoTotal + (a^.dato.productoVendido^.dato.precio * a^.dato.productoVendido^.dato.cantVendida);
			recorrerYCargar(a^.HD, l);
		end;
	end;
	
begin
	l:= nil;
	recorrerYCargar(a, l);
end;

procedure buscarProdMayorCantVend(l: lista2);
var	
	cantMax, max: integer;
begin
	max:= -1;
	cantMax:= -1;
	while (l <> nil) do begin
		if (l^.dato.cantTotal > max) then begin
			max:= l^.dato.codigo;
			cantMax:= l^.dato.cantTotal;
		end;
		l:= l^.sig;
	end;
	writeln('El producto mas vendido fue : ', max, ' con una cantidad total de: ', cantMax);
end;

procedure cantidadMenoresAValor(a: arbol);
	
	function calcularCantidad(a: arbol; valor: integer): integer;
	begin
		if (a = nil) then
			calcularCantidad:= 0
		else if (a^.dato.codigo >= valor) then
			calcularCantidad(a^.HI, valor)
		else
			calcularCantidad:= calcularCantidad(a^.HI, valor) + calcularCantidad(a^.HD, valor) + 1;
	end;
var
	valor: integer;
begin
	valor:= 5;
	writeln('La cantidad de productos con codigo menor a: ', valor, ' es de: ', calcularCantidad(a, valor));
end;

VAR
	a: arbol;
	l: lista2;
BEGIN
	l:= nil;
	cargarArbol(a); // A
	imprimirArbol(a); // B 
	cargarLista(a, l);
	buscarProdMayorCantVend(l); // C
	cantidadMenoresAValor(a); // D
END.
	
	
