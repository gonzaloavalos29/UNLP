{2. Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la
información de los autos en venta. Implementar un programa que:
a) Lea la información de los autos (patente, año de fabricación (2010..2018), marca y
modelo) y los almacene en dos estructuras de datos:
i. Una estructura eficiente para la búsqueda por patente.
ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
almacenar todos juntos los autos pertenecientes a ella.
b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia.
c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.
d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.
e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.
f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
modelo del auto con dicha patente.
* }

program ej2;
type
	str10 = string[10];
	t_ano = 2010..2018;
	auto = record
		patente: integer;
		anoFabricacion: integer;
		marca: str10;
		modelo: str10;
	end;
	arbolPatente = ^nodoPatente;
	nodoPatente = record
		data: auto;
		HI: arbolPatente;
		HD: arbolPatente;
	end;
	listaMarcas = ^nodoListaMarca;
	nodoListaMarca = record
		data: auto;
		sig: listaMarcas;
	end;
	arbolMarca = ^nodoMarca;
	nodoMarca = record
		data: listaMarcas;
		marca: str10; // Para identificar la lista
		HI: arbolMarca;
		HD: arbolMarca;
	end;

procedure leerAuto(var aut: auto);
begin
	write('Patente del auto: '); readln(aut.patente);
	write('Año de fabricacion: '); readln(aut.anoFabricacion);
	write('Marca: '); readln(aut.marca);
	write('Modelo: '); readln(aut.modelo);
end;

procedure agregarArbol_1(var a1: arbolPatente; aut: auto);
begin
	if (a1 = nil) then begin
		new(a1);
		a1^.data:= aut;
		a1^.HI:= nil;
		a1^.HD:= nil;
	end else begin
		if (a1^.data.patente >= aut.patente) then
			agregarArbol_1(a1^.HD, aut)
		else
			agregarArbol_1(a1^.HI, aut);
	end;
end;

procedure agregarNodo_2(var l: listaMarcas; aut: auto);
var
	aux: listaMarcas;
begin
	new(aux);
	aux^.data:= aut;
	aux^.sig:= l;
	l:= aux;
end;

procedure agregarArbol_2(var a2: arbolMarca; aut: auto);
begin
	if (a2 = nil) then begin
		new(a2);
		a2^.marca:= aut.marca;
		a2^.data:= nil;
		agregarNodo_2(a2^.data, aut);
		a2^.HI:= nil;
		a2^.HD:= nil;
	end else begin
		if (a2^.marca > aut.marca) then begin // Ordenar por texto
			agregarArbol_2(a2^.HD, aut);
		end else begin
			agregarArbol_2(a2^.HI, aut);
		end;
	end;
end;

procedure cargarArboles(var a1: arbolPatente; var a2: arbolMarca);
var
	aut: auto;
	texto: str10;
begin
	texto:= '';
	write('¿Ingresar un elemento? (si/no): '); readln(texto);
	while (texto <> 'no') do begin
		leerAuto(aut);
		agregarArbol_1(a1, aut);
		agregarArbol_2(a2, aut);
		writeln;
		write('¿Ingresar un elemento? (si/no): '); readln(texto);
	end;
end;

procedure imprimirLista_2(l: listaMarcas);
begin
	if (l <> nil) then begin
		writeln('Patente: ', l^.data.patente, ' / año fabricacion: ', l^.data.anoFabricacion, ' Modelo: ', l^.data.modelo);
		imprimirLista_2(l^.sig);
	end;
end;

procedure imprimirArbol_2(a2: arbolMarca);
begin
	if (a2 <> nil) then begin
		imprimirArbol_2(a2^.HI);
		writeln('MARCA: ', a2^.marca);
		imprimirLista_2(a2^.data);
		imprimirArbol_2(a2^.HD);
	end;
end;



// PUNTO B
function retornarCantidadAutos_1(a1: arbolPatente; marca: str10): integer;
var
	sumatoria: integer;
begin
	sumatoria:= 0;
	if (a1 <> nil) then begin
		if (a1^.data.marca = marca) then
			sumatoria:= sumatoria + 1;
		sumatoria:= sumatoria + retornarCantidadAutos_1(a1^.HI, marca); // No hay forma más eficiente de buscar
		sumatoria:= sumatoria + retornarCantidadAutos_1(a1^.HD, marca);
	end;
	retornarCantidadAutos_1:= sumatoria;
end;

// PUNTO C
function retornarCantElemLista_2(l: listaMarcas): integer; // REPARAR
var
	sumatoria: integer;
begin
	sumatoria:= 0;
	if (l <> nil) then
		sumatoria:= sumatoria + 1;
		sumatoria:= sumatoria + retornarCantElemLista_2(l^.sig); // Sumar 1 MAS lo que retorne la función
	retornarCantElemLista_2:= sumatoria;
end;

function retornarCantidadAutos_2(a2: arbolMarca; marca: str10): integer;
var
	sumatoria: integer;
begin
	sumatoria:= 0;
	if (a2 <> nil) and (a2^.marca <> marca) then begin // Si no coincide la marca entonces buscar por la lista
		sumatoria:= retornarCantidadAutos_2(a2^.HI, marca);
		sumatoria:= retornarCantidadAutos_2(a2^.HD, marca);
	end else begin
		sumatoria:= retornarCantElemLista_2(a2^.data); // Leer la lista de autos de la marca
	end;
	retornarCantidadAutos_2:= sumatoria;
end;

VAR
	a1: arbolPatente;
	a2: arbolMarca;
begin
	a1:= nil;
	a2:= nil;
	cargarArboles(a1, a2);
	imprimirArbol_2(a2);
	writeln('Cantidad de autos marca Renault: ', retornarCantidadAutos_1(a1, 'F'));
	writeln('Cantidad de autos marca Renault: ', retornarCantidadAutos_2(a2, 'F'));
END.
