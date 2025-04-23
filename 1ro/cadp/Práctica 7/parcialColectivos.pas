program colectivos;
const
	COCHEMAX = 2500;
type
	r_coche = 1000..COCHEMAX;
	r_meses = 1..12;
	viaje = record
		codigo: integer;
		coche: r_coche;
		mes: r_meses;
		pasajes: integer; // vendidos
		dni: longint;
	end;
	vector_capacidad = array[r_coche] of integer;
	lista = ^nodo;
	nodo = record
		dato: viaje;
		sig: lista;
	end;
	
procedure cargarLista(var l: lista); // SE DISPONE
procedure cargarVector(var v: vector_capacidad); // SE DISPONE
procedure inicializarVectores(var v, v2: vector_capacidad);
var
	i: integer;
begin
	for i:=1 to COCHEMAX do begin
		v[i]:= 0;
		v2[i]:= 0;
	end;
end;

{procedure inicializarVector(var v: vector_capacidad);
var
	i: integer;
begin
	for i:=1 to COCHEMAX do
		v[i]:= 0;
end;}

procedure maximo(v: vector_capacidad; var maxCoche: integer);
var
	i: integer;
	max: integer;
begin
	maxCoche:= 0;
	max:= -1;
	for i:=1 to COCHEMAX do begin
		if (v[i] > max) then begin
			max:= v[i];
			maxCoche:= i;
		end;
	end;
end;

function cumple(via: viaje; v: vector_capacidad): boolean;
begin
	cumple:= ((via.dni mod 10) = 0) and (via.pasajes < v[via.coche]) and (via.mes = 2);
end;

procedure agregarNodo(var l: lista; via: viaje);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= via;
	nue^.sig:= l;
	l:= nue;
end;

procedure procesarDatos(l: lista; var l2: lista; v: vector_capacidad; var v2, v3: vector_capacidad);
var
	promedio: real;
	i: integer;
begin
	while (l <> nil) do begin
		if (cumple(l^.dato, v)) then
			agregarNodo(l2, l^.dato);
		v2[l^.dato.codigo]:= v2[l^.dato.codigo] + 1;
		v3[l^.dato.codigo]:= v3[l^.dato.codigo] + l^.dato.pasajes;
		l:= l^.sig;
	end;
	for i:= 1 to COCHEMAX do begin
		promedio:= v3[i] div v2[i];
		writeln('El promedio de pasajeros que viajaron en el coche ', i, 'es ', promedio);
	end;
end;

var
	l, l2: lista;
	v, vector_viajes, totalPasajeros: vector_capacidad;
	maxCoche: integer; // codigo
begin
	//l:= nil;
	l2:= nil;
	cargarLista(l); // SE DISPONE
	cargarVector(v); // SE DISPONE
	inicializarVectores(vector_viajes, totalPasajeros);
	//inicializarVector(v);
	procesarDatos(l, l2, v, vector_viajes, totalPasajeros);
	maximo(vector_viajes, maxCoche);
	writeln('El coche con el cual se realizaron mas viajes fue: ', maxCoche);
end.
	
