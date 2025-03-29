program parcialAviones;
const
	fin = 0;
type
	pasaje = record
		vuelo: integer;
		cliente: integer;
		destino: integer;
		monto: real;
	end;
	
	pasaje2 = record
		vuelo: integer;
		cliente: integer;
		monto: real;
	end;
	
	lista = ^nodo;
	nodo = record;
		dato: pasaje2;
		sig: lista;
	end;
	
	ciudad = record
		destino: integer;
		l: lista;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: ciudad;
		HI: arbol;
		HD: arbol;
	end;
	
procedure leerPasaje(var p: pasaje);
begin
	write('Ingrese monto de pasaje: '); readln(p.monto);
	if (p.monto <> fin) then begin
		write('Ingrese codigo de pasaje: '); readln(p.codigo);
		write('Ingrese codigo de cliente: '); readln(p.cliente);
		write('Ingrese ciudad de destino: '); readln(p.destino);
	end;
end;

procedure agregarAdelante(var l: lista; p: pasaje2);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= p;
	nue^.sig:= nil;
	l:= nue;
end;

procedure armarHoja(var a: arbol; p: pasaje);
var
	pas: pasaje2;
begin
	if (a = nil) then begin
		new(a);
		a^.HI:= nil;
		a^.HD:= nil;
		a^.dato.l:= nil;
		a^.dato.destino:= p.destino;
		pas.vuelo:= p.vuelo;
		pas.cliente:= p.cliente;
		pas.monto:= p.monto;
		agregarAdelante(a^.dato.l, pas);
	end else if (a^.dato.destino = p.destino) then begin
		pas.vuelo:= p.vuelo;
		pas.cliente:= p.cliente;
		pas.monto:= p.monto;
		agregarAdelante(a^.dato.l, pas);
	end else if (p.destino < a^.dato.destino) then
		armarHoja(a^.HI, p)
	else
		armarHoja(a^.HD, p);
end;

procedure cargarArbol(var a: arbol);
var
	p: pasaje;
	i: integer;
begin
	for i:= 1 to Random(12)+5 do begin
		p.vuelo:= Random(30)+1;
		p.cliente:= Random(20)+1;
		p.destino:= Random(5)+1;
		p.monto:= ((Random(5)+1) * p.cliente);
		writeln('VUELO=', p.vuelo, ' CODECLI=', p.cliente, ' CIUDAD=', p.destino, ' MONTO=', p.monto:0:2);
		cargarArbol(a, p);
	end;
end;

procedure imprimirLista(l: lista);
begin
	while (l <> nil) do begin
		write(' | VUELO=', l^.dato.vuelo, ' CLIENTE=' l^.dato.cliente, ' MONTO=', l^.dato.monto:0:2);
		l:= l^.sig;
	end;
end;

procedure imprimirCiudad(c: ciudad);
begin
	write('CODE= ', c.destino);
	imprimirLista(c.l);
	writeln();
end;

procedure imprimirArbol(a: arbol);
begin
	if (a <> nil) then begin
		imprimirArbol(a^.HI);
		imprimirCiudad(a^.dato);
		imprimirArbol(a^.HD);
	end;
end;

procedure obtenerLista(a: arbol; codigoCiudad: integer; var l: lista);
begin
	if (a <> nil) then begin
		if (a^.dato.destino = codigoCiudad) then
			l:= a^.dato.l
		else
			if (codigoCiudad < a^.dato.destino) then
				obtenerLista(a^.HI, codigoCiudad, l)
			else
				obtenerLista(a^.HD, codigoCiudad, l);
	end else
		l:= nil;
end;

function obtenerCantidad(var l: lista): integer;
var
	cant: integer;
begin
	cant:= 0;
	while (l <> nil) do begin
		can

function calcularPasajesDestino(a: arbol; destino: integer): integer;
begin
	if (a <> nil) then begin
		if (destino < a^.dato.destino) then
			calcularPasajesDestino(a^.HI, destino)
		else if (destino > a^.dato.destino) then
			calcularPasajesDestino(a^.HD, destino)
		else
			calcularPasajesDestino:= calcularPasajesDestino(a^.HI, destino) + calcularPasajesDestino(a^.HD, destino) + 1;
	end;
end;	

procedure calcularMax(a: arbol; var maxVentas): integer;
begin
	if (a <> nil) then begin
		if (destino < a^.dato.destino) then
			calcularPasajesDestino(a^.HI, destino)
		else if (destino > a^.dato.destino) then
			calcularPasajesDestino(a^.HD, destino)
		else
			calcularPasajesDestino:= calcularPasajesDestino(a^.HI, destino) + calcularPasajesDestino(a^.HD, destino) + 1;
	end;
end;		

VAR
	a: arbol;
	destino: integer;
BEGIN
	destino:= 5;
	a:= nil;
	cargarArbol(a); // A
	writeln('Cantidad de pasajes del destino ', destino, ': ', calcularPasajesDestino(a, destino)); // B
	
END.

	
