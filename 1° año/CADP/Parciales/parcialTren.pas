program parcialTren;
type
	rangoMeses = 1..12;
	rangoCiudades = 1..20;
	viaje = record
		tren; integer;
		mes: rangoMeses;
		pasajeros: integer;
		destino: rangoCiudad;
	end;

	listaViajes = ^nodoViajes;
	nodoViajes = record
		dato: viaje;
		sig: listaViajes;
	end;
	
	vectorCostos = array[rangoCiudades] of real;
	
	infoTren = record
		tren: integer;
		cant: integer;
	end;
	
	listaTrenes = ^nodoTren;
	nodoTren = record
		dato: infoTren;
		sig: listaTrenes;
	end;
	
	vectorRecaudaciones = array[rangoMeses] of real;

procedure cargarLista(var l: listaViajes); // SE DISPONE
procedure cargarVector(var v: vectorCostos); // SE DISPONE

procedure inicializarVector(var v: vectorRecaudaciones);
var
	i: rangoMeses;
begin
	for i:= 1 to 12 do 
		v[i]:= 0;
end;

function maximo(v: vectorRecaudaciones): real;
var	
	max: real;
	mesMax, i: rangoMeses;
begin
	max:= 1;
	for i:= 1 to 12 do
		if (v[i] > max) then begin
			max:= v[i];
			mesMax:= i;
		end;
	maximo:= mesMax;
end;

procedure procesarViajes(l: listaViajes; v: vectorCostos; var l2: listaTrenes; var v2: vectorRecaudaciones);
var
	trenActual, cantViajes, cantPasajeros: integer;
	costo: real;
begin
	while (l <> NIL) do begin
		trenActual:= l^.dato.tren;
		cantViajes:= 0;
		cantPasajeros:= 0;
		while (l <> NIL) and (trenActual = l^.dato.tren) do begin
			cantViajes:= cantViajes + 1;
			cantPasajeros:= cantPasajeros + l^.dato.pasajeros;
			costo:= v[l^.dato.destino]*l^.dato.pasajeros;
			v2[l^.dato.mes]:= v2[l^.dato.mes] + costo;
			l:= l^.sig;
		end;
		
		infoTren.tren:= trenActual;
		infoTren.cant:= cantPasajeros;
		agregarAdelante(l2, infoTren);
		writeln('El promedio de pasajeros del tren ', trenActual, ' es ', cantPasajeros/cantViajes);
		
	end;
end;
	
	
var
	l: listaViajes;
	v: vectorCostos;
	trenes: listaTrenes;
	recaudaciones: vectorRecaudaciones;
begin

	cargarLista(l);
	cargar(v);
	listaTrenes:= NIL;
	inicializarVector(recaudaciones);
	procesarViajes(l, v, listaTrenes, recaudaciones);
	writeln('El mes con mayor recaudacion fue ', maximo(recaudaciones));

end.
