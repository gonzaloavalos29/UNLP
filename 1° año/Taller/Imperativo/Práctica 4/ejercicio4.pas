program ej4p4;
const
    fin = 0;
type   
    prestamo = record   
        isbn: integer;
        numSocio: integer;
        dia: integer;
        mes: integer;
        diasPrestado: integer;
    end;

    prestamo2 = record  
        isbn: integer;
        cantVecesPrestado: integer;
    end;

    arbol = ^nodoArbol;
    nodoArbol = record  
        dato: prestamo;
        HI: arbol;
        HD: arbol;
    end;

    lista = ^nodo;
    nodo = record
        dato: prestamo;
        sig: lista;
    end;

    arboldelistas = ^nodoArbolDeListas;
    nodoArbolDeListas = record
        dato: lista;
        HI: arboldelistas;
        HD: arboldelistas;
    end;

    lista2 = ^nodo2;
    nodo2 = record  
        dato: prestamo2;
        sig: lista2;
    end;

procedure leerPrestamo(var p: prestamo);
begin
    writeln('Ingrese nro de ISBN: ');
    readln(p.isbn);
    if (p.isbn <> fin) then begin
        writeln('Ingrese nro de socio: ');
        readln(p.numSocio);
        writeln('Ingrese dia del mes en que fue prestado: ');
        readln(p.dia);
        writeln('Ingrese mes del año en que fue prestado: ');
        readln(p.mes);
        writeln('Cantidad de dias prestados: ');
        readln(p.diasPrestado);
    end;
end;

procedure armarHoja(var a: arbol; p: prestamo);
begin  
    if (a = nil) then begin
        new(a);
        a^.dato:= p;
        a^.HI:= nil;
        a^.HD:= nil;
    end else if (a^.dato.isbn >= p.isbn) then
        armarHoja(a^.HD, p)
    else
        armarHoja(a^.HI, p);
end;

procedure agregarNodo(var l: lista; p: prestamo);
var
    nue: lista;
begin
    new(nue);
    nue^.dato:= p;
    nue^.sig:= nil;
    l:= nue;
end;

procedure agregarNodo2(var l: lista2; p: prestamo2);
var
    nue: lista2;
begin
    new(nue);
    nue^.dato:= p;
    nue^.sig:= nil;
    l:= nue;
end;

procedure armarHojaDeNodos(var a: arboldelistas; p: prestamo);
begin  
    if (a = nil) then begin
        new(a);
        agregarNodo(a^.dato, p);
        a^.HI:= nil;
        a^.HD:= nil;
    end else if (p.isbn < a^.dato^.dato.isbn) then 
        armarHojaDeNodos(a^.HI, p)
    else if (p.isbn > a^.dato^.dato.isbn) then  
        armarHojaDeNodos(a^.HD, p)
    else
        agregarNodo(a^.dato, p);
end;

procedure cargarArbol(var a: arbol; var a2: arboldelistas);
var
    p: prestamo;
begin
    leerPrestamo(p);
    while (p.isbn <> fin) do begin
        armarHoja(a, p);
        armarHojaDeNodos(a2, p);
        leerPrestamo(p);
    end;
end;

procedure buscarMax(a: arbol; var maxISBN: integer);
begin   
    if (a <> nil) then begin
        if (a^.dato.isbn > maxISBN) then
            maxISBN:= a^.dato.isbn;
        buscarMax(a^.HD, maxISBN);
    end;
end;

procedure buscarMin(a: arboldelistas; var minISBN: integer);
begin
    if (a <> nil) then begin
        if (a^.dato^.dato.isbn < minISBN) then
            minISBN:= a^.dato^.dato.isbn;
        buscarMin(a^.HI, minISBN);
    end;
end;

procedure cantPrestamosASocio(a: arbol; s: integer; var cantPrestamos: integer);
begin
    if (a <> nil) then begin
        cantPrestamosASocio(a^.HI, s, cantPrestamos);
        if (a^.dato.isbn = s) then
            cantPrestamos:= cantPrestamos + 1;
        cantPrestamosASocio(a^.HD, s, cantPrestamos);
    end;
end;

procedure cantPrestamosASocio2(a: arboldelistas; socio: integer; var cantPrestamos: integer);
begin
    if (a <> nil) then begin
        cantPrestamosASocio2(a^.HI, socio, cantPrestamos);
        while (a^.dato <> nil) do begin
			if (a^.dato^.dato.numSocio = socio) then
				cantPrestamos:= cantPrestamos + 1;
			a^.dato:= a^.dato^.sig;
		end;
        cantPrestamosASocio2(a^.HD, socio, cantPrestamos);
    end;
end;

procedure generarEstructuraPorISBN(a: arbol; var cantPrestamos: integer; var l2: lista2);
var
	p: prestamo2;
begin
    if (a <> nil) then begin
        if (a^.dato.isbn = a^.HD^.dato.isbn) then begin
			cantPrestamos:= cantPrestamos + 1;
			generarEstructuraPorISBN(a^.HD, cantPrestamos, l2);
		end;
		p.isbn:= a^.dato.isbn;
		p.cantVecesPrestado:= cantPrestamos;
		agregarNodo2(l2, p);
		writeln('Cantidad de veces prestado del libro ', p.isbn, ': ', p.cantVecesPrestado);
		cantPrestamos:= 1;
        generarEstructuraPorISBN(a^.HI, cantPrestamos, l2);
        generarEstructuraPorISBN(a^.HD, cantPrestamos, l2);
    end;
end;

procedure generarEstructuraPorISBN2(a: arboldelistas; var cantPrestamos: integer; var l2: lista2);
var
	p: prestamo2;
begin
    if (a <> nil) then begin
        generarEstructuraPorISBN2(a^.HI, cantPrestamos, l2);
        while (a^.dato <> nil) do begin
			cantPrestamos:= cantPrestamos + 1;
			a^.dato:= a^.dato^.sig;
		end;
		p.cantVecesPrestado:= cantPrestamos;
		p.isbn:= a^.dato^.dato.isbn;
		cantPrestamos:= 0;
		agregarNodo2(l2, p);
		writeln('Cantidad de veces prestado del libro ', p.isbn, ': ', p.cantVecesPrestado); 
        generarEstructuraPorISBN2(a^.HD, cantPrestamos, l2);
    end;
end;

procedure recorrerLista(l: lista2);
begin
	while (l <> nil) do begin
		writeln('ISBN: ', l^.dato.isbn);
		writeln('Veces prestado: ', l^.dato.cantVecesPrestado);
		l:= l^.sig;
	end;
end;

procedure recorrerArbol(a: arbol; valorInf, valorSup: integer; var cantVeces: integer);
begin
	if (a <> nil) then begin
		if (a^.dato.isbn > valorSup) then
			recorrerArbol(a^.HI, valorInf, valorSup, cantVeces)
		else if (a^.dato.isbn < valorInf) then
			recorrerArbol(a^.HD, valorInf, valorSup, cantVeces)
		else
			cantVeces:= cantVeces + 1;
	end;
end;

procedure recorrerArbol2(a: arboldelistas; valorInf, valorSup: integer; var cantVeces: integer);
begin
	if (a <> nil) then begin
		if (a^.dato^.dato.isbn > valorSup) then
			recorrerArbol2(a^.HI, valorInf, valorSup, cantVeces)
		else if (a^.dato^.dato.isbn < valorInf) then
			recorrerArbol2(a^.HD, valorInf, valorSup, cantVeces)
		else begin
			while (a^.dato <> nil) do begin
				cantVeces:= cantVeces + 1;
				a^.dato:= a^.dato^.sig;
			end;
		end;
	end;
end;

VAR
    a: arbol;
    a2: arboldelistas;
    maxISBN, minISBN, nroSocio, cantPrestamos, valorInf, valorSup, cantVeces: integer;
    l, l2: lista2;
BEGIN
    a:= nil; minISBN:= 9999; maxISBN:= -1; nroSocio:= 3; cantPrestamos:= 0; valorInf:= 5; valorSup:= 10; cantVeces:= 0;
    cargarArbol(a, a2); // A
    buscarMax(a, maxISBN); // B
    buscarMin(a2, minISBN); // C
    cantPrestamosASocio(a, nroSocio, cantPrestamos); // D
    writeln('La cantidad de prestamos realizados al socio ', nroSocio, ' es de ', cantPrestamos);
    cantPrestamos:= 0;
    cantPrestamosASocio2(a2, nroSocio, cantPrestamos); // E
    writeln('La cantidad de prestamos realizados al socio ', nroSocio, ' es de ', cantPrestamos);
    cantPrestamos:= 1;
    generarEstructuraPorISBN(a, cantPrestamos, l); // F
    cantPrestamos:= 0;
    generarEstructuraPorISBN2(a2, cantPrestamos, l2); // G
    recorrerLista(l2); // H
    recorrerArbol(a, valorInf, valorSup, cantVeces); // I 
    cantVeces:= 0;
	recorrerArbol2(a2, valorInf, valorSup, cantVeces); // J
END.

