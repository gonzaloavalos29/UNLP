program supermercado;
const
	corte = -1;
	superavit = 30000;
type

	r_mes = 1..12;
	compra = record
		monto: real;
		mes: r_mes;
		cant_prod: integer;
		proveedor: string;
	end;
	lista = ^nodo;
	nodo = record
		dato: compra;
		sig: lista;
	end;
	vector_compras = array[r_mes] of integer; // compras por mes
	
procedure leerCompra(var c: compra);
begin
	readln(c.monto);
	readln(c.mes);
	readln(c.cant_prod);
	readln(c.proveedor);
end;

procedure insertarOrdenado(var l: lista; c: compra);
var
	ant, act, nue: lista;
begin
	new(nue);
	nue^.dato:= c;
	ant:= l;
	act:= l;
	while (act <> nil) and (act^.dato.proveedor < c.proveedor) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (ant = act) then
		l:= nue
	else
		ant^.sig:= nue;
	nue^.sig:= act;
end;

procedure cargarLista(var l: lista);
var
	c: compra;
begin
	leerCompra(c);
	while (c.monto <> corte) do begin
		insertarOrdenado(l, c);
		leerCompra(c);
	end;
end;

procedure inicializarVector(var v: vector_compras);
var
	i: integer;
begin
	for i:= 1 to 12 do
		v[i]:= 0;
end;

procedure calcularMaximos(v: vector_compras; var mesMax1, mesMax2: r_mes);
var
	i, comprasMax1, comprasMax2: integer;
begin
	comprasMax1:= -1; comprasMax2:= -1;
	for i:= 1 to 12 do begin
		if (v[i] > comprasMax1) then begin
			comprasMax2:= comprasMax1;
			mesMax2:= mesMax1;
			comprasMax1:= v[i];
			mesMax1:= i;
		end else if (v[i] > comprasMax2) then begin
			comprasMax2:= v[i];
			mesMax2:= i;
		end;
	end;
end;

procedure procesarDatos(l: lista; var v: vector_compras);
var
	proveedorActual: string;
	montoTotal: real;
	mesMax1, mesMax2: r_mes;
	cantCompras: integer;
	montoJulio: real;
	comprasJulio: integer;
begin
	montoJulio:= 0; comprasJulio:= 0;
	while (l <> nil) do begin
		proveedorActual:= l^.dato.proveedor;
		montoTotal:= 0;
		cantCompras:= 0;
		while (l <> nil) and (proveedorActual = l^.dato.proveedor) do begin
			cantCompras:= cantCompras + 1;
			montoTotal:= montoTotal + l^.dato.monto;
			v[l^.dato.mes]:= v[l^.dato.mes] + 1;
			if (l^.dato.mes = 7) then begin
				montoJulio:= montoJulio + l^.dato.monto;
				comprasJulio:= comprasJulio + 1;
			end;
			l:= l^.sig;
		end;
		if (montoTotal > superavit) then
			writeln('El proveedor: ', proveedorActual, ' supera los 30000 pesos.');
	end;
	calcularMaximos(v, mesMax1, mesMax2);
	writeln('Los meses con mayor cantidad de compras son: ', mesMax1, ' y ', mesMax2);
	writeln('El monto promedio de compras realizadas durante el mes de julio es: ', montoJulio/comprasJulio);
end;
	
var
	l: lista;
	v: vector_compras;
begin
	l:= nil;
	cargarLista(l);
	inicializarVector(v);
	procesarDatos(l, v);
end.
