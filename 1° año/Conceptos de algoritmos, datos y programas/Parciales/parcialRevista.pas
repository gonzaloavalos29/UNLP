program revista_deportiva;
const
	no_participa = 0;
	maxEquipos = 28;
	maxFechas = 27;
	maxCalificacion = 10;
type
	rangoEquipos = 1..maxEquipos;
	rangoFechas = 1..maxFechas;
	rangoCalificacion = 0..maxCalificacion;
	
	vector_calificaciones = array[rangoFechas] of rangoCalificacion;
	
	jugador = record
		codigo: integer;
		apellido: string;
		nombre: string;
		equipo: rangoEquipos;
		anioNac: integer;
		calificacion: vector_calificaciones;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: jugador;
		sig: lista;
	end;
	
	jugador_titular = record
		calif_prom: real;
		cod: integer;
	end;
	
	lista2 = ^nodo2;
	nodo2 = record
		dato: jugador_titular;
		sig: lista2;
	end;
	
	vector_equipos = array[rangoEquipos] of integer; // cantidad de jugadores por equipo

procedure inicializarVector(var v: vector_equipos);
var
	i: integer;
begin
	for i:= 1 to maxEquipos do
		v[i]:= 0;
end;

function verificarJugador(v: vector_calificaciones): boolean;
var
	cantFechas: integer;
	i: integer;
begin
	cantFechas:= 0;
	for i:= 1 to maxFechas do begin
		if (v[i] > 0) then
			cantFechas:= cantFechas + 1;
	end;
	verificarJugador:= (cantFechas > 14);
end;

function calcularPromedio(v: vector_calificaciones): real;
var
	i: integer;
	totalCalificaciones, cantFechas: integer;
begin
	cantFechas:= 0; totalCalificaciones:= 0;
	for i:= 1 to maxFechas do begin
		if (v[i] > 0) then begin
			totalCalificaciones:= totalCalificaciones + v[i];
			cantFechas:= cantFechas + 1;
		end;
	end;
	calcularPromedio:= (totalCalificaciones / cantFechas);
end;
{
procedure leerJugador(var j: jugador);
begin
	with j do begin
		readln(codigo);
		readln(apellido);
		readln(nombre);
		readln(equipo);
		readln(anioNac);
	end;
end;
}
procedure agregarNodo(var l: lista2; j: jugador_titular);
var
	nue: lista2;
begin
	new(nue);
	nue^.dato:= j;
	nue^.sig:= l;
	l:= nue;
end;
{
procedure agregarNodo2(var l: lista; j: jugador);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= j;
	nue^.sig:= l;
	l:= nue;
end;
}
procedure cargarLista(var l: lista); // SE DISPONE
{var
	j: jugador;
begin
	leerJugador(j);
	while (j.codigo <> 0) do begin
		agregarNodo2(l, j);
		leerJugador(j);
	end;
end;}

procedure recorrerLista(l: lista; var l2: lista2; var v: vector_equipos);
var
	j: jugador_titular;
begin
	l2:= nil;
	while (l <> nil) do begin
		if (2023 - l^.dato.anioNac > 35) then 
			v[l^.dato.equipo]:= v[l^.dato.equipo] + 1;
		
		if (verificarJugador(l^.dato.calificacion)) then begin
			j.calif_prom:= calcularPromedio(l^.dato.calificacion);
			j.cod:= l^.dato.codigo;
			agregarNodo(l2, j);
		end;
	end;
end;

procedure informarJugadores(v: vector_equipos);
var
	i: integer;
begin
	for i:= 1 to maxEquipos do
		writeln('La cantidad de jugadores del equipo ', i, ' mayores a 35 anios es ', v[i]);
end;

procedure mejoresPromedios(l: lista2);
var
	codMax1, codMax2: integer;
	max1, max2: real;
begin
	max1:= -1; max2:= -1;
	codMax1:= 0; codMax2:= 0;
	while (l <> nil) do begin
		if (l^.dato.calif_prom > max1) then begin
			max2:= max1;
			codMax2:= codMax1;
			max1:= l^.dato.calif_prom;
			codMax1:= l^.dato.cod;
		end else if (l^.dato.calif_prom > max2) then begin
			max2:= l^.dato.calif_prom;
			codMax2:= l^.dato.cod;
		end;
		
		l:= l^.sig;
	end;
	writeln('Los codigos de los dos jugadores con mejor calificacion promedio que participaron en mas de 14 fechas son: ', codMax1, ' y ',
	codMax2);
end;

var
	l: lista;
	l2: lista2;
	v: vector_equipos;
begin
	cargarLista(l); // SE DISPONE
	inicializarVector(v);
	recorrerLista(l, l2, v);
// PUNTO A
	informarJugadores(v);
// PUNTO B
	mejoresPromedios(l2);
end.
