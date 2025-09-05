program ej1p3;
Type
	socios= record
		nroSocio: integer;
		nombre: string;
		edad: integer;
	end;
	arbol= ^nodo;
	nodo= record
		dato: socios;
		HI: arbol;
		HD: arbol;
	end;
	
procedure leerSocio(var s:socios);
begin
	write('Ingresar nro de socio: '); readln(s.nroSocio);
	if (s.nroSocio <> 0)then begin
		write('Ingresar nombre: '); readln(s.nombre);
		write('Ingresar edad: '); readln(s.edad);
	end;
end;

procedure crearHoja(var A: arbol; s: socios);
begin
	if (A = nil)then begin
		new(A);
		A^.dato:= s;
		A^.HI:= nil;
		A^.HD:= nil;
	end else
		if (s.nroSocio <= A^.dato.nroSocio)then
			crearHoja(A^.HI, s)
			else
				crearHoja(A^.HD, s);
end;

procedure crearArbol(var A: arbol);
var
	s:socios;
begin
	leerSocio(s);
	while (s.nroSocio <> 0)do begin
		crearHoja(A, s);
		leerSocio(s);
	end;
end;

procedure buscarNSocioMax(A:arbol; var max: integer);
begin
    if(A <> nil ) then begin
        buscarNSocioMax(A^.HI, max);
        if (A^.dato.nroSocio > max)then
			max:= A^.dato.nroSocio;
        buscarNSocioMax(A^.HD, max);
    end;
end;

procedure buscarNSocioMin(A:arbol; var min: integer; var socioMin: socios);
begin
    if(A <> nil ) then begin
        buscarNSocioMin(A^.HI, min, socioMin);
        if (A^.dato.nroSocio < min)then begin
			min:= A^.dato.nroSocio;
			socioMin:= A^.dato;
			end;
        buscarNSocioMin(A^.HD, min, socioMin);
    end;
end;

procedure buscarNSocioMaxEdad(A:arbol; var edadMax, socioEdadMax: integer);
begin
    if(A <> nil ) then begin
        buscarNSocioMax(A^.HI, edadMax);
        if (A^.dato.edad > edadMax)then begin
			edadMax:= A^.dato.edad;
			socioEdadMax:= A^.dato.nroSocio;
			end;
        buscarNSocioMax(A^.HD, edadMax);
    end;
end;

procedure aumentar(A:arbol);
begin
    if(A <> nil ) then begin
        aumentar(A^.HI);
        A^.dato.edad:= A^.dato.edad +1;
        aumentar(A^.HD);
    end;
end;

procedure imprimir(A:arbol);
begin
    if(A <> nil ) then begin
        imprimir(A^.HI);
        write(' ',A^.dato.edad,' de socio nro ',A^.dato.nroSocio);
        imprimir(A^.HD);
        end;
end;

function buscarValor(A: arbol; num: integer): boolean;
begin
    if (A = nil) then
        buscarValor:= False  // Final del arbol, esta vacio, el numero no se esta
    else if (A^.dato.nroSocio = num) then
        buscarValor:= True  // Encontramos el numero.
    else
        buscarValor:= buscarValor(A^.HI, num) or buscarValor(A^.HD, num); // Buscamos en las subramas izquierda y derecha.
end;

function buscarNombre(A: arbol; nom: string): boolean;
begin
    if (A = nil) then
        buscarNombre:= False  // Final del arbol, esta vacio, el numero no se esta
    else if (A^.dato.nombre = nom) then
        buscarNombre:= True  // Encontramos el numero.
    else
        buscarNombre:= buscarNombre(A^.HI, nom) or buscarNombre(A^.HD, nom); // Buscamos en las subramas izquierda y derecha.
end;

procedure contar(A:arbol;var cant: integer);
begin
    if(A <> nil ) then begin
        contar(A^.HI, cant);
        cant:= cant+1;
        contar(A^.HD, cant);
        end;
end;

procedure contarEdad(A:arbol;var edadT: integer);
begin
    if(A <> nil ) then begin
        contarEdad(A^.HI, edadT);
        edadT:= edadT + A^.dato.edad;
        contarEdad(A^.HD, edadT);
        end;
end;

procedure imprimirOrdenCreciente(A:arbol);
begin
    if(A <> nil ) then begin
        imprimirOrdenCreciente(A^.HI);
        write(A^.dato.nroSocio, ' ');
        imprimirOrdenCreciente(A^.HD);
        end;
end;

procedure imprimirOrdenDecreciente(A:arbol);
begin
    if(A <> nil ) then begin
        imprimirOrdenDecreciente(A^.HD);
        write(A^.dato.nroSocio,' ');
        imprimirOrdenDecreciente(A^.HI);
        end;
end;

var
	arb: arbol;
	socioMasChico: socios;
	max, min, edadMax, socioMax, valor, cantSocios, edad: integer;
	nombre: string;
	enc, encNom: boolean;
Begin
	arb:= nil;
	crearArbol(arb);			// Inciso A
	max:= -1;
	buscarNSocioMax(arb, max);		//Inciso B 1
	writeln('El numero de socio mas grande es: ',max);
	min:= 9999;
	buscarNSocioMin(arb, min, socioMasChico);	// Inciso B 2
	writeln('Socio con numero de socio mas chico: ',socioMasChico.nroSocio,' - Nombre: ',socioMasChico.nombre,' - Edad: ',socioMasChico.edad);
	edadMax:= -1;
	buscarNSocioMaxEdad(arb, edadMax, socioMax);		// Inciso B 3
	writeln('El numero de socio del socio con mas edad es: ',socioMax);
	aumentar(arb);							// Inciso B 4
	imprimir(arb);			// Para comprobar que modifico la edad
	writeln('');
	write('Ingresar un valor a buscar: ');readln(valor);
	enc:= buscarValor(arb, valor);						// Inciso B 5
	if (enc = True) then writeln('Lo encontre') else writeln('No lo encontre');
	writeln('');
	write('Ingresar un nombre a buscar: '); readln(nombre);
	encNom:= buscarNombre(arb, nombre);					// Inciso B 6
	if (encNom = True) then writeln('Lo encontre') else writeln('No lo encontre');
	cantSocios:= 0;
	contar(arb, cantSocios);			// Inciso B 7
	writeln('La cantidad de socios es: ',cantSocios);
	edad:= 0;
	contarEdad(arb, edad);
	writeln('El promedio de edad de los socios es ',(edad DIV cantSocios));	// Inciso B 8
	writeln('Orden creciente: ');			// Inciso B 9
	imprimirOrdenCreciente(arb);
	writeln('');
	writeln('Orden decreciente: ');			// Inciso B 10
	imprimirOrdenDecreciente(arb);
end.
