program APU;
const
	fin = -1;
	dimF = 24;
type
	r_notas = 0..10;
	r_materias = 1..24;
	v_notas = array[r_materias] of r_notas;
	
	alumno = record
		numero: integer;
		apellido: string;
		nombre: string;
		correo: string;
		ingreso: integer;
		egreso: integer;
		notas: v_notas;
	end;
	lista = ^nodo;
	nodo = record
		dato: alumno;
		sig: lista;
	end;
	
procedure intercambio(var a, b: r_notas);
var
	aux: r_notas;
begin
	aux:= a;
	a:= b;
	b:= aux;
end;

procedure burbujeo(var v: v_notas);
var
	i, j: integer;
begin
	for i:= 1 to dimF do begin
		for j:= 1 to (dimF-i) do begin
			if (v[j] < v[j+1]) then
				intercambio(v[j], v[j+1]);
		end;
	end;
end;
	
procedure leerAlumno(var a: alumno);
var
	i: integer;
	nota: r_notas;
begin
	nota:= 0;
	write('Numero de alumno: '); readln(a.numero);
	if (a.numero <> fin) then begin
		write('Apelldo del alumno: '); readln(a.apellido);
		write('Nombre(s) del alumno: '); readln(a.nombre);
		write('Correo electronico del alumno: '); readln(a.correo);
		write('Anio de ingreso del alumno: '); readln(a.ingreso);
		write('Anio de egreso del alumno: '); readln(a.egreso);
		
		// Inicializar vector
		for i:= 1 to dimF do
			a.notas[i]:= 0;
		
		// Asignar notas
		for i:= 1 to dimF do begin
			write('Nota del alumno [', a.numero, ']: '); readln(nota);
			if (nota > 3) then
				a.notas[i]:= nota;
		end;
		
		// Ordenar notas del vector de forma descendente
		burbujeo(a.notas);
	end;
end;

procedure agregarNodo(var l: lista; a: alumno);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= a;
	nue^.sig:= l;
	l:= nue;
end;

procedure cargarLista(var l: lista);
var
	a: alumno;
begin
	leerAlumno(a);
	while (a.numero <> fin) do begin
		agregarNodo(l, a);
		leerAlumno(a);
	end;
end;

procedure calcularPromedio(l: lista);
var
	i: integer;
	promedio: real;
begin
	while (l <> nil) do begin // Recorrer la lista
		promedio:= 0;
		for i:= 1 to dimF do begin // Agregar todas las notas a una variable acumuladora
			promedio:= promedio + l^.dato.notas[i];
		end;
		writeln('Promedio de notas del alumno ', l^.dato.nombre, ': ', (promedio/24):2:2);
		l:= l^.sig;
	end;
end;

function soloDigitosImpares(nro: integer): boolean;
var
	pares, impares: integer;
	condicion: boolean;
begin
	pares:= 0;
	impares:= 0;
	condicion:= false;
	while (nro <> 0) do begin
		if ((nro mod 10) mod 2) = 0 then
			pares:= pares + 1
		else
			impares:= impares + 1;
		nro:= nro div 10; //Buscar otro dígito
	end;
	if (pares = 0) and (impares <> 0) then
		condicion:= true;
	soloDigitosImpares:= condicion;
end;

procedure verificar(l: lista; var cantCumple: integer);
begin
	cantCumple:= 0;
	while (l <> nil) do begin
		if (l^.dato.ingreso = 2012) and (soloDigitosImpares(l^.dato.numero)) then
			cantCumple:= cantCumple + 1;
		l:= l^.sig;
	end;
end;

procedure actualizarMaximo(a1: alumno; tiempoActual: integer; var a2, a3: alumno; var t1, t2: integer);
begin
	writeln(a3.nombre);
	if (tiempoActual < t1) then begin
		t2:= t1;
		a3:= a2;
		t1:= tiempoActual;
		a2:= a1;
	end else if (tiempoActual < t2) then begin
		t2:= tiempoActual;
		a3:= a1;
	end;
end;

procedure minimos(l: lista; var alumnoMax1, alumnoMax2: alumno);
var
	tiempoActual, tiempomax1, tiempoMax2: integer;
begin
	tiempoMax1:= 9999;
	tiempoMax2:= 9999;
	while (l <> nil) do begin
		tiempoActual:= l^.dato.egreso - l^.dato.ingreso;
		actualizarMaximo(l^.dato, tiempoActual, alumnoMax1, alumnoMax2, tiempoMax1, tiempoMax2);
		l:= l^.sig;
	end;
end;

procedure eliminarElemLista(var l: lista; nroIngresado: integer);
var
	act, ant: lista;
begin
	act:= l;
	while (act <> nil) and (act^.dato.numero <> nroIngresado) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (l <> nil) then begin
		if (act^.dato.numero = nroIngresado) then begin
			if (act = l) then begin
				l:= act^.sig; // Mover el nodo ingresado a la siguiente posicion
			end else begin
				ant^.sig:= act^.sig; // Hacer que el siguiente del anterior sea el siguiente del actual, así la lista se enlaza
			end;
			dispose(act); // Liberar la dirección de memoria del nodo actual.
			writeln('El numero ', nroIngresado, ' fue eliminado con exito de la lista');
		end;
	end else begin
		writeln('El numero no fue encontrado dentro de la lista: (');
	end;
end;

var
	alumnoMax1, alumnoMax2: alumno;
	cantCumple, nroAlumno: integer;
	l: lista;
begin
	l:= nil;
	cargarLista(l);
	calcularPromedio(l); // Punto A
	verificar(l, cantCumple); // Punto B
	writeln('La cantidad de alumnos ingresantes 2012 cuyo nro de alumno esta compuesto por digitos impares: ', cantCumple);
	minimos(l, alumnoMax1, alumnoMax2); // Punto C
	writeln(alumnoMax1.apellido, ' ', alumnoMax1.nombre, ' ', alumnoMax1.correo);
	writeln(alumnoMax2.apellido, ' ', alumnoMax2.nombre, ' ', alumnoMax2.correo);
	write('Ingrese un numero de alumno: '); readln(nroAlumno);
	eliminarElemLista(l, nroAlumno);
	while (l <> nil) do begin
		writeln(l^.dato.numero);
		l:= l^.sig;
	end;
end.
