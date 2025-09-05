program ejercicio2;
const
	fin = 0;
type
	venta = record
		codigo: integer;
		fecha: String;
		cantVend: integer;
	end;
	producto = record
		codigo: integer;
		cantVend: integer;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: venta;
		HI: arbol;
		HD: arbol;
	end;
	arbol2 = ^nodo2;
	nodo2 = record
		dato: producto;
		HI: arbol2;
		HD: arbol2;
	end;
	
	
	
procedure leerVentas(var v: venta);
begin
	write('Ingrese codigo de producto: '); readln(v.codigo);
	if (v.codigo <> fin) then begin
		write('Ingrese fecha de venta: '); readln(v.fecha);
		write('Ingrese cantidad de unidades vendidas: '); readln(v.cantVend);
	end;
end;

procedure armarArbol(var a: arbol; v: venta);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:= v;
		a^.HI:= nil;
		a^.HD:= nil;
	end else if (v.codigo <= v.codigo) then 
		armarArbol(a^.HI, v)
	else
		armarArbol(a^.HD, v);
end;

procedure cargarArbol(var a: arbol);
var
	v: venta;
begin
	leerVentas(v);
	while (v.codigo <> fin) do begin
		armarArbol(a, v);
		leerVentas(v);
	end;
end;

procedure actualizar(var cant: integer; valor: integer);
begin
	cant:= cant + valor;
end;

procedure armarArbol2(var a: arbol2; v: venta);
begin
	if (a = nil) then begin
		new(a);
		a^.dato.codigo:= v.codigo;
		a^.dato.cantVend:= v.cantVend;
		a^.HI:= nil;
		a^.HD:= nil;
	end else if (v.codigo = a^.dato.codigo) then begin
		actualizar(a^.dato.cantVend, v.cantVend);
	end else if (v.codigo < a^.dato.codigo) then begin
		armarArbol2(a^.HI, v);
	end else
		armarArbol2(a^.HD, v);
end;

procedure recorrerYCargar(a: arbol; var a2: arbol2);
begin
	if (a <> nil) then begin
		recorrerYCargar(a^.HI, a2);
		armarArbol2(a2, a^.dato);
		recorrerYCargar(a^.HD, a2);
	end;
end;

procedure imprimir(a: arbol2);
begin 
    if (a <> nil) then begin
        imprimir(a^.HI);
        write(a^.dato.cantVend,'|');
        imprimir(a^.HD);
    end;
end;

procedure contarCantU(a: arbol; var uniV: integer; codP: integer);
begin
	if (a <> nil) then begin
		contarCantU(a^.HI, uniV, codP);
		if (a^.dato.codigo = codP) then begin
			uniV:= a^.dato.cantVend;
		end;
		contarCantU(a^.HD, uniV, codP);
	end;
end;

procedure contarCantU2(a: arbol2; var uniV: integer; codP: integer);
begin
	if (a <> nil) then begin
		contarCantU2(a^.HI, uniV, codP);
		if (a^.dato.codigo = codP) then begin
			uniV:= a^.dato.cantVend;
		end;
		contarCantU2(a^.HD, uniV, codP);
	end;
end;

VAR
	a: arbol;
	a2: arbol2;
	codPro, cantPro: integer;
BEGIN
	Randomize;
	a:= nil;
	a2:= nil;
	cantPro:= 0;
	cargarArbol(a);
	recorrerYCargar(a, a2);
	imprimir(a2);
	write('Ingresar cod de producto para contar sus ventas: '); readln(codPro);
	contarCantU(a, cantPro, codPro);
	writeln('El codigo tuvo ',cantPro,' ventas');		// Inciso B 1
	write('Ingresar cod de producto para contar sus ventas: '); readln(codPro);
	contarCantU2(a2, cantPro, codPro);
END.
