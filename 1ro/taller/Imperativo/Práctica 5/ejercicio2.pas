program ej2p5;
const
	fin = 'MMM';
type
	cadena30 = String[30];
	
	auto = record
		patente: String[10];
		anio: integer;
		marca: cadena30;
		modelo: cadena30;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: auto;
		HI: arbol;
		HD: arbol;
	end;
	
procedure leerAuto(var a: auto);
begin
	writeln('Ingrese marca de auto (ingrese MMM para finalizar): '); readln(a.marca);
	if (a.marca <> fin) then begin
		writeln('Patente: '); readln(a.patente);
		writeln('Anio: '); readln(a.anio);
		writeln('Modelo: '); readln(a.modelo);
	end;
end;

procedure armarHoja(var a: arbol; auto: auto);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:= auto;
		a^.HI:= nil;
		a^.HD:= nil;
	end else if (auto.patenta > a^.dato.patente) then
		armarHoja(a^.HD, auto)
	else
		armarHoja(a^.HI, auto);
end;

procedure armarHojaPorAnio(var a: arbol; au: auto);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:= au;
		a^.HI:= nil;
		a^.HD:= nil;
	end else if (au.anio > a^.dato.anio) then
		armarHoja(a^.HD, au)
	else
		armarHoja(a^.HI, au);
end;

procedure cargarArbol(var a: arbol);
var
	au: auto;
begin
	leerAuto(au);
	while (au.marca <> fin) do begin
		armarHoja(a, au);
		leerAuto(au);
	end;
end;

procedure imprimirArbol(a: arbol);
begin
	if (a <> nil) then begin
		imprimirArbol(a^.HI);
		writeln('Auto: ', a^.dato.patente);
		imprimirArbol(a^.HD);
	end;
end;

function calcularAutos(a: arbol): integer;
begin
	if (a <> nil) then begin
		calcularAutos:= 1 + calcularAutos(a^.HI) + calcularAutos(a^.HD);
	end else
		calcularAutos:= 0;
end;

VAR+
++
	a, a2: arbol;
BEGIN
	cargarArbol(a); // A
	imprimirArbol(a);
	writeln('Cantidad de autos: ', calcularAutos(a)); // B
	cargarArbol(a2); // D
END.
