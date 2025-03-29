program colectivos;

type
	r_mes: 1..12;
	r_coche: 1000..2500;
	viaje = record
		coche: r_coche;
		mes: r_mes;
		cant_vendidos: integer;
		dni: longint;
	end;
	
	listaViaje = ^nodoViaje;
	nodoViaje = record
		dato: viaje;
		sig: listaViaje;
	end;
	
	vectorcapacidad = array[r_coche] of integer;
	
	
procedure cargarLista(var l: listaViaje); // SE DISPONE
procedure cargarVector(var v: vectorcapacidad); // SE DISPONE

procedure inicializarVectores(var v1, v2: vectorcapacidad);
var
	i: r_coche;
begin
	for i:= 1000 to 2500 do
		v[i]:= 0;
end;

function maximo(v: vectorcapacidad): integer;
var
	i, maxCoche: r_coche;
	max: integer;
begin
	max:= -1;
	maxCoche:= 0;
	for i:= 1000 to 2500 do begin
		if (v[i] > max) then begin
			max:= v[i];
			maxCoche:= i;
		end;
	maximo:= maxCoche;
end;

function cumple(via: viaje; v: vectorcapacidad): boolean;
begin
	cumple:= ((v.dni mod 10) = 0) and (v.mes = 2) and (v.cantVendidos < v[v.coche]);
end;

procedure agregarAdelante(var l: lista; v: viaje);
var
	aux: lista;
begin
	new(aux);
	aux^.dato:= v;
	aux^.sig:= nil;
	if (l <> nil) then
		aux^.sig:= l;
	l:= aux;
end;

procedure procesarViajes(l: listaViajes; var l2: listaViajes; v: vectorcapacidad; var totalPasajeros, viajesPorCoche: vectorcapacidad);
var
	coche: r_coche;
begin
	l2:= NIL;
	while (l <> NIL) do begin
		coche:= l^.dato.coche;
		viajesPorCoche[coche]:= viajesPorCoche[coche] + 1;
		totalPasajeros[coche]:= totalPasajeros[coche] + l^.dato.cant_vendidos;
		
		if (cumple(l.dato, totalPasajeros)) then 
			agregarAdelante(l2, l.dato);
			
		l:= l^.sig;
	end;

var
	l, lViajesRealizados: listaViaje;
	v, totalPasajeros, viajesPorCoche: vectorcapacidad;
	maxCoche: r_coche;
	i:= integer;
begin
	cargarLista(l); // SE DISPONE
	cargarVector(v); // SE DISPONE
	inicializarVectores(totalPasajeros, viajesPorCoche);
	
	procesarViajes(l, lViajesRealizados, v, totalPasajeros, viajesPorCoche);
	
	for i:= 1000 to 2500 do
		writeln('El promedio de viajes realizados del coche ', i, ' es ', (viajesPorCoche[i] DIV totalPasajeros[i]));
end;
