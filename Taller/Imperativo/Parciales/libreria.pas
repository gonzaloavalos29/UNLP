{1. Implementar un programa modularizado para una librería que:
* 
a. Almacene los productos vendidos en una estructura eficiente para la búsqueda por
código de producto. De cada producto deben quedar almacenados la cantidad total de
unidades vendidas y el monto total. De cada venta se lee código de venta, código del
producto vendido, cantidad de unidades vendidas y precio unitario. El ingreso de las
ventas finaliza cuando se lee el código de venta -1.
* 
b. Imprima el contenido del árbol ordenado por código de producto.
* 
c. Contenga un módulo que reciba la estructura generada en el punto a y retorne el
código de producto con mayor cantidad de unidades vendidas.
* 
d. Contenga un módulo que reciba la estructura generada en el punto a y un código de
producto y retorne la cantidad de códigos menores que él que hay en la estructura.
* 
e. Contenga un módulo que reciba la estructura generada en el punto a y dos códigos de
producto y retorne el monto total entre todos los códigos de productos comprendidos
entre los dos valores recibidos (sin incluir).}
program libreria;
const
	corte = -1;
type
	venta = record
		codProducto: integer;
		unidadesVendidas: integer;
		montoTotal: real;
	end;
	arbol = ^nodo;
	nodo = record
		dato: venta;
		HI: arbol;
		HD: arbol;
	end;
	
procedure leerVentas(var v: venta; var codVenta: integer);
var
	precioU: integer;
begin
	write('Ingrese codigo de venta: '); readln(codVenta);
	if (codVenta <> corte) then begin
		write('Ingrese codigo de producto: '); readln(v.codProducto);
		write('Ingrese precio unitario: '); readln(precioU);
		write('Ingrese cant de unidades vendidas: '); readln(v.unidadesVendidas);
		v.montoTotal:= v.unidadesVendidas * precioU;
	end;
end;

procedure agregarArbol(var a: arbol; v: venta);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:= v;
		a^.HI:= nil;
		a^.HD:= nil;
	end else begin
		if (v.codProducto = a^.dato.codProducto) then begin
			a^.dato.unidadesVendidas:= a^.dato.unidadesVendidas + v.unidadesVendidas;
			a^.dato.montoTotal:= a^.dato.montoTotal + v.montoTotal;
		end else begin
			if (v.codProducto < a^.dato.codProducto) then
				agregarArbol(a^.HI, v)
			else
				agregarArbol(a^.HD, v);
		end;
	end;
end;

procedure cargarArbol(var a: arbol);
var
	codV: integer;
	vent: venta;
begin
	leerVentas(vent, codV);
	while (codV <> corte) do begin
		agregarArbol(a, vent);
		leerVentas(vent, codV);
	end;
end;

procedure imprimir(a: arbol); // Inciso B
begin
	if (a <> nil) then begin
		imprimir(a^.HI);
		write('|', a^.dato.codProducto); 
		write('|m', a^.dato.montoTotal:2:2);
		write('|u', a^.dato.unidadesVendidas);
		writeln;
		imprimir(a^.HD);
	end;
end;

procedure encontrarMaximo(a: arbol; var codigoMax, cantidadMax: integer); // Inciso C
begin
	if (a <> nil) then begin
		if (a^.dato.unidadesVendidas > cantidadMax) then begin
			codigoMax:= a^.dato.codProducto;
			cantidadMax:= a^.dato.unidadesVendidas;
		end;
		encontrarMaximo(a^.HI, codigoMax, cantidadMax);
		encontrarMaximo(a^.HD, codigoMax, cantidadMax);
	end;
end;

procedure cantMinimos(a: arbol; cod: integer; var cant: integer);
begin
	if (a = nil) then
		cod:= corte
	else begin
		if (a^.dato.codProducto <= cod) then begin
			cant:= cant + 1;
			cantMinimos(a^.HI, cod, cant);
			if (a^.HD <> nil) and (a^.HD^.dato.codProducto <= cod) then
				cantMinimos(a^.HD, cod, cant);
		end;
	end;
end;

VAR
	raiz: arbol;
	codigoMax, cantidadMax, codD, cantD: integer;
BEGIN
	codigoMax:= 0;
	cantD:= 0;
	cantidadMax:= -1;
	raiz:= nil;
	cargarArbol(raiz);
	imprimir(raiz);
	encontrarMaximo(raiz, codigoMax, cantidadMax);
	writeln('Codigo: ', codigoMax);
	writeln('Ingrese cod para comparar: ');
	readln(codD);
	cantMinimos(raiz, codD, cantD);
	writeln('La cantidad de codigos de producto menores a: ', codD, ' es: ', cantD);
	// writeln('La cantidad de nodos con codigo menor a: ', codD, ' es: ', cantMinimos(raiz, codD));
END.
