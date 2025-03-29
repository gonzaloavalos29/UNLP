program ej3p3;
Type
	materia= record
		codi: integer;
		nota: real;
	end;
	lista= ^nodo;
	nodo= record
		dato: materia;
		sig: lista;
	end;
	alumnos= record
		legajo: integer;
		dni: integer;
		aIngreso: integer;
		materias: lista;
	end;
	
	arbol= ^nodo2;
	nodo2= record
		dato: alumnos;
		HI: arbol;
		HD: arbol;
	end;
	
	legInf= record
		dniB: integer;
		anoIngreso: integer;
	end;
	listaB= ^nodo3;
	nodo3= record
		dato: legInf;
		sig: listaB;
	end;
	
procedure leerNotas(var m: materia);
begin
	write('Ingresar codigo de materia: ');readln(m.codi);
	if (m.codi <> -1)then begin
		write('Ingresar nota de final: '); readln(m.nota);
	end;
end;

procedure agregarAdelante(var l: lista; m: materia);
var
	aux: lista;
begin
	new(aux);
	aux^.dato:= m;
	aux^.sig:= l;
	l:= aux;
end;

procedure armarLista(var l: lista);
var
	m: materia;
begin
	leerNotas(m);
	while (m.codi <> -1)do begin
		agregarAdelante(l, m);
		leerNotas(m);
	end;
end;

procedure leerAlumno(var a: alumnos);
begin
	write('Ingresar nro de legajo: ');readln(a.legajo);
	if (a. legajo <> 0)then begin
		write('Ingresar nro de dni: '); readln(a.dni);
		write('Ingresar ano de ingreso: '); readln(a.aIngreso);
		armarLista(a.materias);
	end;
end;

procedure armarHoja(var A: arbol; al: alumnos);
begin
	if (A = nil)then begin
		new(A);
		A^.dato:= al;
		A^.HI:= nil;
		A^.HD:= nil;
	end else
		if (al.legajo <= A^.dato.legajo)then
			armarHoja(A^.HI, al)
		else
			armarHoja(A^.HD, al);
end;

procedure cargarArbol(var A: arbol);
var
	al: alumnos;
begin
	leerAlumno(al);
	while (al.legajo <> 0)do begin
		armarHoja(A, al);
		leerAlumno(al);
	end;
end;

procedure agregarAdelanteB(var l: listaB; a: alumnos);
var
	aux: listaB;
begin
	new(aux);
	aux^.dato.dniB:= a.dni;
	aux^.dato.anoIngreso:= a.aIngreso;
	aux^.sig:= l;
	l:= aux;
end;

procedure incisoB(a: arbol; var l: listaB; valor: integer);
begin 
    if (a<> nil) then begin
        incisoB(a^.HI, l, valor);
        if (a^.dato.legajo < valor)then begin
			agregarAdelanteB(l, a^.dato);
			end;
        incisoB(a^.HD, l, valor);
    end;
end;

procedure buscarLegajoMax(A:arbol; var max: integer);
begin
    if(A <> nil ) then begin
        buscarLegajoMax(A^.HD, max);
        if (A^.dato.legajo > max)then
			max:= A^.dato.legajo;
    end;
end;

procedure buscarDniMax(a: arbol; var maxDNI: integer);
begin 
    if (a<> nil) then begin
        buscarDniMax(a^.HI, maxDni);
        if (a^.dato.dni < maxDNI)then begin
			maxDNI:= a^.dato.dni;
			end;
        buscarDniMax(a^.HD, maxDni);
    end;
end;

procedure buscarCantImpar(a: arbol; var impar: integer);
begin 
    if (a<> nil) then begin
        buscarCantImpar(a^.HI, impar);
        if (a^.dato.legajo MOD 2 = 1)then begin
			impar:= impar +1;
			end;
        buscarCantImpar(a^.HD, impar);
    end;
end;

procedure recorrerNotas(l: lista; var cant: integer; var notasT: real);
begin
	while (l <> nil)do begin
		cant:= cant+1;
		notasT:= notasT + l^.dato.nota;
		l:=l^.sig;
	end;
end;

procedure buscarPromedioMax(a: arbol; var legajoMax: integer; var promMax: real);
var
	cant: integer;
	prom: real;
begin 
    if (a<> nil) then begin
        buscarPromedioMax(a^.HI, legajoMax, promMax);
        cant:= 0;
        prom:= 0;
        recorrerNotas(a^.dato.materias, cant, prom);
        prom:= prom / cant;
        if (prom > promMax)then begin
			promMax:= prom;
			legajoMax:= a^.dato.legajo;
        end;
        buscarPromedioMax(a^.HD, legajoMax, promMax);
    end;
end;

var
	Ar: arbol;
	valorL, lMax, dniMax, cantImpar, legMax: integer;
	promMax: real;
	lB: listaB;
Begin
	Ar:= nil;
	cargarArbol(Ar);
	lB:= nil;
	write('Ingresar un valor de legajo: '); readln(valorL);
	incisoB(Ar, lB, valorL);			// lB Guarda todos los casos que cumplan
	lMax:= -1;
	buscarLegajoMax(Ar, lMax);			// El legajo mas grande se guardar en lMax
	dniMax:= -1;
	buscarDniMax(Ar, dniMax);			// El dni mas grande se guarda en dniMax
	cantImpar:= 0;
	buscarCantImpar(Ar, cantImpar);		// La cantidad de legajos impares se guardan en cantImpar
	promMax:= -1;
	buscarPromedioMax(Ar, legMax, promMax);		// El legajo del promedio max se guarda en LegMax y el promedio maximo en promMax
end.
