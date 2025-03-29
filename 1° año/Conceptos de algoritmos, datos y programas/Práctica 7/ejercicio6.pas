program observatorio;
const
	fin = -1;
type
	r_categoria = 1..7;

	objeto = record
		codigo: integer;
		categoria: r_categoria;
		nombre: string[30];
		distancia: integer; // A la tierra en años luz
		descubridor: string[30];
		anio: integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: objeto;
		sig: lista;
	end;
	
	v_categoria = array[r_categoria] of integer;
	
function tieneMasPares(codigo: integer): boolean;
var
	pares, impares: integer;
begin
	pares:= 0; impares:= 0;
	while (codigo <> 0) do begin
		if (((codigo mod 10) mod 2) = 0) then
			pares:= pares + 1
		else
			impares:= impares + 1;
		codigo:= codigo div 10;
	end;
	if (pares > impares) then
		tieneMasPares:= true
	else
		tieneMasPares:= false;
end;

procedure leerObjeto(var o: objeto);
begin
	with o do begin
		read(codigo);
		if (codigo <> fin) then begin
			read(categoria);
			read(nombre);
			read(distancia);
			read(descubridor);
			read(anio);
		end;
	end;
end;

procedure agregarAtras(var pri, ult: lista; o: objeto);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= o;
	nue^.sig:= nil;
	if (pri = nil) then begin
		pri:= nue;
		ult:= nue;
	end else begin
		ult:= nue;
		ult^.sig:= nue;
	end;
end;

procedure cargarLista(var pri, ult: lista);
var
	o: objeto;
begin
	leerObjeto(o);
	while (o.codigo <> fin) do begin
		agregarAtras(pri, ult, o);
		leerObjeto(o);
	end;
end;

procedure inicializarVector(var v: v_categoria);
var
	i: integer;
begin
	for i:= 1 to 7 do
		v[i]:= 0;
end;

procedure informarObjetos(v: v_categoria);
var
	i: integer;
begin
	for i:= 1 to 7 do
		writeln('Cantidad de objetos observados en la categoria [', i, ']: ', v[i]);
end;

procedure actualizarMaximo(codActual, distActual: longint; var cod, cod2, dist, dist2: longint);
begin
	if (distActual > dist) then begin
		dist2:= dist;
		cod2:= cod;
		dist:= distActual;
		cod:= codActual;
	end else if (distActual > dist2) then begin
		dist2:= distActual;
		cod2:= codActual;
	end;
end;

procedure procesarLista(l: lista; var codMax, codMax2: longint; var cantDescubiertos: integer; var v: v_categoria);
var
	distMax, distMax2: longint;
begin
	distMax:= -1;
	distMax2:= -1;
	codMax:= 0;
	codMax2:= 0;
	cantDescubiertos:= 0;
	while (l <> nil) do begin
		// Inciso 1 - Obtener el codigo de los objetos que hayan estado a mayor distancia de la tierra
		actualizarMaximo(l^.dato.codigo, l^.dato.distancia, codMax, codMax2, distMax, distMax2);
		
		// Inciso 2 - Los objetos que haya descubierto Galileo antes del año 1600
		if (l^.dato.descubridor = 'Galileo Galilei') and (l^.dato.anio < 1600) then
			cantDescubiertos:= cantDescubiertos + 1;
		
		// Inciso 3 - Agregar objetos por categoría
		v[l^.dato.categoria]:= v[l^.dato.categoria] + 1;
		
		l:= l^.sig;
	end;
end;

var
	pri, ult: lista;
	v: v_categoria;
	codMax1, codMax2: longint;
	cantDescubiertos: integer;
begin
	pri:= nil;
	ult:= nil;
	cargarLista(pri, ult);
	inicializarVector(v);
	procesarLista(ult, codMax1, codMax2, cantDescubiertos, v);
	writeln('Los codigos de los dos objetos mas lejanos de la tierra son: ', codMax1, ' y ', codMax2);
	writeln('La cantidad de planetas descubiertos por Galileo Galilei antes del año 1600 es: ', cantDescubiertos);
	informarObjetos(v);
end.
