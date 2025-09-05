program p3ej3;
const
	fin = 0;
type

	materia = record
		nombre: String[30];
		nota: integer;
		fecha: integer;
	end;

	lista = ^nodo;
	nodo = record
		dato: materia;
		sig: lista;
	end;

	alumno = record
		legajo: integer;
		materias: lista;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: alumno;
		HI: arbol;
		HD: arbol;
	end;
	
procedure leerNotas(var a: alumno);
var
	m: materia;
begin
	write('Ingrese legajo del alumno: '); readln(a.legajo);
	if (a.legajo <> 0) then begin
		write('Ingrese materia: '); readln(m.nombre);
		a.materias^.dato.nombre:= m.nombre;
		writeln;
		write('Ingrese fecha de examen rendido: '); readln(m.fecha);
		a.materias^.dato.fecha:= m.fecha;
		writeln;
		write('Ingrese nota: '); readln(m.nota);
		a.materias^.dato.nota:= m.nota;
	end;
end;

procedure crearArbol(var a: arbol; alu: alumno);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:= alu;
		a^.HI:= nil;
		a^.HD:= nil;
	end else if (a^.dato.legajo <= alu.legajo) then 
		crearArbol(a^.HI, alu)
	else
		crearArbol(a^.HD, alu);
end;

procedure cargarArbol(var a: arbol);
var
	alu: alumno;
begin
	leerNotas(alu);
	while (alu.legajo <> fin) do begin
		crearArbol(a, alu);
		leerNotas(alu);
	end;
end;

function tieneLegajoImpar(l: integer): boolean;
begin
	if (((l MOD 10) MOD 2) <> 0) then
		tieneLegajoImpar:= true
	else
		tieneLegajoImpar:= false;
end;
		

procedure cantAlumLegajoImpar(a: arbol; var cant: integer);
begin
	if (a <> nil) then begin
		cantAlumLegajoImpar(a^.HI, cant);
		if (tieneLegajoImpar(a^.dato.legajo)) then
			cant:= cant + 1;
		cantAlumLegajoImpar(a^.HD, cant);
	end;
end;

procedure finalesAprobados(l: lista; var cantAprobados: integer);
begin
	cantAprobados:= 0;
	while (l <> nil) do begin
		if (l^.dato.nota >= 4) then begin
			cantAprobados:= cantAprobados + 1;
		end;
		l:= l^.sig;
	end;
end;

function promedioFinales(l: lista): real;
var
	sumaFinales, cantFinales: integer;
begin
	sumaFinales:= 0; cantFinales:= 0;
	while (l <> nil) do begin
		sumaFinales:= sumaFinales + l^.dato.nota;
		l:= l^.sig;
	end;
	promedioFinales:= (sumaFinales / cantFinales);
end;

procedure cantFinalesAprobadosPorAlumno(a: arbol);
var
	cantAprobados: integer;
begin
	if (a <> nil) then begin
		cantFinalesAprobadosPorAlumno(a^.HI);
		finalesAprobados(a^.dato.materias, cantAprobados);
		write('Cantidad de materias aprobadas del alumno ', a^.dato.legajo, ': ', cantAprobados);
		cantFinalesAprobadosPorAlumno(a^.HD);
	end;
end;

procedure mejoresPromedios(a: arbol);
var
	promedio: real;
begin
	if (a <> nil) then begin
		mejoresPromedios(a^.HI);
		promedio:= promedioFinales(a^.dato.materias);
		if (promedio >= 4) then begin
			write('El alumno con n° de legajo ', a^.dato.legajo, ' obtuvo un promedio de: ', promedio);
		end;
		mejoresPromedios(a^.HD);
	end;
end;

VAR
	a: arbol;
	cant: integer;
BEGIN
	cargarArbol(a); // inciso A
	cantAlumLegajoImpar(a, cant); // inciso B
	cantFinalesAprobadosPorAlumno(a); // inciso C
	mejoresPromedios(a);
END.
		
