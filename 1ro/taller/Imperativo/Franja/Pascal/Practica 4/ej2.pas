program ej2p4;
Type
	prestamos= record
		isbn: integer;
		nroSocio: integer;
		dia: integer;
		mes: integer;
		cantDiasP: integer;
	end;
	
	arbol= ^nodo;
	nodo=record
		dato: prestamos;
		HI: arbol;
		HD: arbol;
	end;
	
	lista= ^nodo2;
	nodo2= record
		dato: prestamos;
		sig: lista;
	end;
	
	arbol2= ^nodo3;
	nodo3= record
		dato: lista;
		HI: arbol2;
		HD: arbol2;
	end;
	
procedure leerPrestamo(var p: prestamos);
begin
	write('Ingresar isbn: ');readln(p.isbn);
	if(p.isbn <> -1)then begin
		write('Ingresar nro de socio: ');readln(p.nroSocio);
		write('Ingresar dia: ');readln(p.dia);
		write('Ingresar mes: ');readln(p.mes);
		write('Cantidad de dias prestado: ');readln(p.cantDiasP);
	end;
end;

procedure armarHoja(var a: arbol; p: prestamos);
begin
	if (a= nil)then begin
		new(a);
		a^.dato:= p;
		a^.HI:= nil;
		a^.HD:= nil;
	end else if(p.isbn <= a^.dato.isbn)then
		armarHoja(a^.HI, p)
		else
			armarHoja(a^.HD, p)
end;

procedure agregarAdelante(var l: lista; p: prestamos);
var
	aux: lista;
begin
	new(aux);
	aux^.dato:= p;
	aux^.sig:= l;
	l:= aux;
end;

procedure armarHoja2(var a: arbol2; p: prestamos);
begin
	if (a= nil)then begin
		new(a);
		agregarAdelante(a^.dato, p);
		a^.HI:= nil;
		a^.HD:= nil;
	end else 
		if (p.isbn = a^.dato^.dato.isbn)then
			agregarAdelante(a^.dato, p)
		else
			if(p.isbn < a^.dato^.dato.isbn)then
				armarHoja2(a^.HI, p)
			else
				armarHoja2(a^.HD, p)
end;

procedure cargarArbol(var a: arbol; var a2: arbol2);
var
	p: prestamos;
begin
	leerPrestamo(p);
	while (p.isbn <> -1)do begin
		armarHoja(a, p);
		armarHoja2(a2, p);
		leerPrestamo(p);
	end;
end;

function buscarMax(a: arbol): integer;
begin
	if (a^.HD = nil)then
		buscarMax:=a^.dato.isbn		
	else 
		buscarMax:= buscarMax(a^.HD);
end;

function buscarMin(a:arbol2): integer;
begin
	if (a^.HI = Nil) then
		buscarMin:= a^.dato^.dato.isbn
	else
		buscarMin:= buscarMin(a^.HI);
end;

function buscarNodo(a: arbol; x: integer): arbol;		// Busco el nodo que tenga el codigo que necesito
begin
	if (a= nil)then 
		buscarNodo:= nil
	else if(a^.dato.nroSocio = x)then 
		buscarNodo:= a
		else if (x > a^.dato.nroSocio)then
				buscarNodo:= buscarNodo(a^.HD, x)
			else
				buscarNodo:= buscarNodo(a^.HI, x);
end;

function buscarNodo2(a: arbol2; nroSoc: integer): lista;		// Busco el nodo que tenga el codigo que necesito
begin
	if (a= nil)then 
		buscarNodo2:= nil
	else if(a^.dato^.dato.nroSocio = nroSoc)then 
		buscarNodo2:= a^.dato
		else if (nroSoc > a^.dato^.dato.nroSocio)then
				buscarNodo2:= buscarNodo2(a^.HD, nroSoc)
			else
				buscarNodo2:= buscarNodo2(a^.HI, nroSoc);
end;

procedure contarIsbn(a:arbol; cod: integer; var cont: integer);		// Recibe el nodo anterior para contar repetidos
begin
	if (a <> nil)then begin
		if(a^.dato.nroSocio = cod) then
			cont:= cont +1;
		contarIsbn(a^.HI, cod, cont);
	end;
end;

procedure contarIsbnLista(l: lista; var cont: integer; cod: integer);
begin
	if (l <> nil)then begin
		contarIsbnLista(l^.sig, cont, cod);
		if (l^.dato.isbn = cod)then
			cont:= cont +1;
	end;
end;

var
	Ar, aux: arbol;
	Ar2: arbol2;
	auxL: lista;
	isbnMax, isbnMin, socioB, contIsbn: integer;
Begin
	Ar:= nil;
	Ar2:= nil;
	cargarArbol(Ar, Ar2);		// Inciso 1 Ai y Aii
	isbnMax:= buscarMax(Ar);
	writeln('El isbn mayor es: ', isbnMax);		// Inciso 1 B
	isbnMin:= buscarMin(Ar2);
	writeln('El isbn menor es: ', isbnMin);		// Inciso 1 C
	write('Ingresar socio a buscar: ');readln(socioB);
	aux:= buscarNodo(Ar, socioB);
	contIsbn:= 0;
	contarIsbn(aux, socioB, contIsbn);
	writeln('La cantidad de prestamos a dicho socio son: ',contIsbn);	// Inciso 1 D
	auxL:= buscarNodo2(Ar2, socioB);
	contIsbn:= 0;
	contarIsbnLista(auxL, contIsbn, socioB);
	writeln('La cantidad de prestamos a dicho socio son: ',contIsbn);	// Inciso 1 D
end.
