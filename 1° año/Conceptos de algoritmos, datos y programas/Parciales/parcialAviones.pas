program primeraFecha8hs;
type
	codaviones = 1000..2500;
	viaje = record
		avion: codaviones;
		anio: integer;
		pasajeros: integer;
		ciudad: string;
	end;
	lista = ^nodo;
	nodo = record
		dato: viaje;
		sig: lista;
	end;

	vectorcapacidad = array [codaviones] of integer;
	
procedure cargarLista(var l: lista); // SE DISPONE
procedure cargarVector(var v: vectorcapacidad); // SE DISPONE

function maximo(v: vectorcapacidad): integer;
var
	i, maxAvion: codaviones;
	capacidadMax: integer;
begin
	capacidadMax:= -1;
	for i:= 1000 to 2500 do
		if (v[i] > capacidadMax) then begin
			capacidadMax:= v[i];
			maxAvion:= i;
		end;
	maximo:= maxAvion;
end;

function promedio(pasajeros, viajes: integer): real;
begin
	if (viajes > 0) then
		promedio:= pasajeros / viajes
	else
		promedio:= 0;
end;

procedure inicializarVectores(var v1, v2: vectorcapacidad);
var
	i: codaviones;
begin
	for i:= 1000 to 2500 do begin
		v1[i]:= 0;
		v2[i]:= 0;
	end;
end;

function cumple(via: viaje; v: vectorcapacidad): boolean;
begin
	cumple:= ((via.anio MOD 10) = 0) and (via.ciudad = 'Punta Cana') and (via.pasajeros < v[via.avion]);
end;

procedure agregarAdelante(var l: lista; v: viaje);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= viaje;
	nue^.sig:= nil;
	if (l = nil) then begin
		l:= nue;
	end else begin
		nue^.sig:= l;
		l:= nue;
	end;
end;

procedure procesarViajes(l: lista; v: vectorcapacidad; var viajesPorAvion, totalPasajeros: vectorCapacidad; var puntaCana: lista);
var
	avion: codaviones;
begin
	puntaCana:= nil;
	inicializarVectores(viajesPorAvion, totalPasajeros);
	while (l <> nil) do begin
		avion:= l^.dato.avion;
		viajesPorAvion[avion]:= viajesPorAvion[avion] + 1;
		totalPasajeros[avion]:= totalPasajeros[avion] + l^.dato.pasajeros;
		
		if (cumple(l^.dato, v)) then
			agregarAdelante(puntaCana, l^.dato);
		
		l:= l^.sig;
	end;
end;

var
	l, viajesPuntaCana: lista;
	v, viajesPorAvion, totalPasajeros: vectorcapacidad;
	avionMax: codaviones;
	i: integer;
begin
	cargarLista(l);
	cargarVector(v);
	procesarViajes(l, v, viajesPorAvion, totalPasajeros, viajesPuntaCana);
		
	avionMax:= maximo(viajesPorAvion);
	writeln('El avion que realizo mas viajes es ', avionMax);
	
	for i:= 1000 to 2500 do
		writeln('El promedio de pasajeros del avion ', i, ' fue ', promedio(totalPasajeros[i], viajesPorAvion[i]));
end.
