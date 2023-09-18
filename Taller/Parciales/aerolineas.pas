program aerolineas_argentinas;

const
	corte = 0;
	dimF = 100;
type

	pasaje = record
		cod_ciu: integer; // codigo
		vuelo: integer; // codigo
		cliente: integer; // codigo
		monto: real;
	end;
	
	pasajeReducido = record
		vuelo: integer; // codigo
		cliente: integer;
		monto: real;
	end;
	
	ciudades = record
		destino: integer; // codigo
		cantPasajes: integer;
	end;
	
	lista2 = ^nodo2;
	nodo2 = record
		dato: ciudades;
		sig: lista2;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: pasaje;
		HI: arbol;
		HD: arbol;
	end;
	
	lista = ^nodo3;
	nodo3 = record
		dato: pasajeReducido;
		sig: lista;
	end;
	
// INCISO A	

procedure leerPasaje(var p: pasaje);
begin
	p.monto:= Random(9999) / (Random(10) + 1);
	if (p.monto <> 0) then begin
		p.vuelo:= Random(7000);
		p.cliente:= Random(100) + 1;
		p.cod_ciu:= Random(500) + 1;
	end;
end;

procedure agregarArbol(var a: arbol; p: pasaje);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:= p;
		a^.HI:= nil;
		a^.HD:= nil;
	end else if (p.cod_ciu < a^.dato.cod_ciu) then // ordenado por código de destino
		agregarArbol(a^.HI, p)
	else if (p.cod_ciu >= a^.dato.cod_ciu) then
		agregarArbol(a^.HD, p);
end;

procedure cargarArbol(var a: arbol);
var
	p: pasaje;
begin
	leerPasaje(p);
	while (p.monto <> corte) do begin
		agregarArbol(a, p);
		leerPasaje(p);
	end;
end;

// INCISO B

procedure agregarAdelante(var l: lista; p: pasajeReducido);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= p;
	nue^.sig:= l;
	l:= nue;
end;

procedure generarLista(a: arbol; cod_ciudad: integer; var l: lista); // retornará la lista de pasajes de la ciudad pedida
var
	p: pasajeReducido;
begin
	if (a <> nil) then begin
		if (cod_ciudad = a^.dato.cod_ciu) then begin
			p.vuelo:= a^.dato.vuelo;
			p.cliente:= a^.dato.cliente;
			p.monto:= a^.dato.monto;
			agregarAdelante(l, p);
		end else if (cod_ciudad < a^.dato.cod_ciu) then begin
			generarLista(a^.HI, cod_ciudad, l);
		end else if (cod_ciudad > a^.dato.cod_ciu) then begin
			generarLista(a^.HD, cod_ciudad, l);
		end;
	end;
end;

procedure insertarOrdenado(var l: lista2; c: ciudades);
var
	nuevo, ant, act: lista2;
begin
	new(nuevo);
	nuevo^.dato:= c;
	act:= l;
	while (act <> nil) and (act^.dato.destino < c.destino) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act = l) then
		l:= nuevo
	else
		ant^.sig:= nuevo;
	nuevo^.sig:= act;
end;

procedure cargarListaPorCiudad(a: arbol; var l2: lista2);
var
	c: ciudades;
begin
	c.cantPasajes:= 0;
	if (a <> nil) then begin
		cargarListaPorCiudad(a^.HI, l2);
		c.destino:= a^.dato.cod_ciu;
		insertarOrdenado(l2, c);
		cargarListaPorCiudad(a^.HD, l2);
	end;
end;

procedure ciudadConMasPasajesVendidos(l2: lista2; var max_ciudad: integer);
var
	contador: integer;
	ciudadActual: integer;
	max: integer;
begin
	max:= -1;
	while (l2 <> nil) do begin
		ciudadActual:= l2^.dato.destino;
		contador:= 0;
		while (l2 <> nil) and (l2^.dato.destino = ciudadActual) do begin
			contador:= contador + 1;
		end;
		if (contador > max) then begin
			max:= contador;
			max_ciudad:= ciudadActual;
		end;
	end;
end;

VAR
	a: arbol;
	l: lista;
	l2: lista2;
	cod_ciudad: integer;
	maxDestino: integer; // ciudad destino con más pasajes vendidos
BEGIN
	// Inciso A
	cargarArbol(a);
	
	// Inciso B
	l:= nil;
	l2:= nil;
	read(cod_ciudad);
	generarLista(a, cod_ciudad, l); // Devuelve una lista de pasajes de la ciudad "cod_ciudad" ingresada
	
	// Inciso C
	ciudadConMasPasajesVendidos(l2, maxDestino);
	writeln('La ciudad con más pasajes vendidos es: ', maxDestino);
END.
