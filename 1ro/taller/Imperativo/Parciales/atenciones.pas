program turnoM;
const
	fin = 0;
	max = 6;
type
	atencion = record
		matricula: integer;
		dni: integer;
		dia: integer;
		diagnostico: integer; // A = 1, B = 2, C = 3, D = 4, E = 5, F = 6
	end;
	
	atencionMatri = record
		matricula: integer;
		cantAtenciones: integer;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: atencionMatri;
		HI: arbol;
		HD: arbol;
	end;
	
	lista = ^nodo2;
	nodo2 = record
		dato: integer; // dni
		sig: lista;
	end;
	
	genero = record
		tipo: integer;
		l: lista;
	end;
	
	vector = array[1..max] of genero;

procedure leerAtencion(var a: atencion);
begin
	a.dni:= Random(5000);
	if (a.dni <> fin) then begin
		a.matricula:= Random(1000)+2000;
		a.dia:= Random(31)+1;
		a.diagnostico:= Random(6)+1;
	end;
end;

procedure inicializarVector(var v: vector);
var
	i: integer;
begin
	for i:= 1 to max do begin
		v[i].tipo:= 0;
		v[i].l:= nil;
	end;
end;

procedure agregarAdelante(var l: lista; dni: integer);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= dni;
	nue^.sig:= l;
	l:= nue;
end;

procedure cargarHoja(var a: arbol; var v: vector; ate: atencion);
begin
	if (a = nil) then begin
		new(a);
		a^.dato.matricula:= ate.matricula;
		a^.dato.cantAtenciones:= 1;
		agregarAdelante(v[ate.diagnostico].l, ate.dni);
		v[ate.diagnostico].l^.dato:= ate.dni;
		a^.HI:= nil;
		a^.HD:= nil;
	end else if (ate.matricula < a^.dato.matricula) then begin
		v[ate.diagnostico].l^.dato:= ate.dni;
		agregarAdelante(v[ate.diagnostico].l, ate.dni);
		cargarHoja(a^.HI, v, ate);
	end else begin
		v[ate.diagnostico].l^.dato:= ate.dni;
		agregarAdelante(v[ate.diagnostico].l, ate.dni);
		cargarHoja(a^.HD, v, ate);
	end;
end;

procedure cargarArbol(var a: arbol; var v: vector);
var
	ate: atencion;
begin
	leerAtencion(ate);
	while (ate.matricula <> fin) do begin
		cargarHoja(a, v, ate);
		leerAtencion(ate);
	end;
end;

procedure cantidadTotal(a: arbol; matri: integer; var cantTotal: integer);
begin
	if (a <> nil) then begin
		if (matri <= a^.dato.matricula) then
			cantidadTotal(a^.HD, matri, cantTotal)
		else begin
			cantTotal:= cantTotal + 1;
			cantidadTotal(a^.HD, matri, cantTotal);
		end;
	end;
end;

procedure recorrerYContarLista(l: lista; var cant: integer);
begin
	while (l <> nil) do begin
		cant:= cant + 1;
		l:= l^.sig;
	end;
end;

procedure maxVector(v: vector; var maxDiagnostico, cantMax: integer; dimF: integer);
var
	cant: integer;
begin
	if (dimF > 0) then begin
		recorrerYContarLista(v[dimF].l, cant);
		if (cant > cantMax) then begin
			maxDiagnostico:= dimF;
			cantMax:= cant;
		end;
		maxVector(v, maxDiagnostico, cantMax, dimF-1);
	end;
end;

VAR
	a: arbol;
	v: vector;
	matri, cantTotal, cantMax, maxDiagnostico, dimF: integer;
BEGIN
	matri:= 5; cantTotal:= 0; maxDiagnostico:= -1; dimF:= max; cantMax:= -1;
	a:= nil;
	cargarArbol(a, v); // A
	cantidadTotal(a, matri, cantTotal); // B
	maxVector(v, maxDiagnostico, cantMax, dimF); // C
END.
		

