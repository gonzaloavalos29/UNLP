program parcialColectivos;
type
	numcoche = 1000..2500;
	viaje = record
		cod: integer;
		coche: numcoche;
		mes: integer;
		cant_vendidos: integer;
		dni: longint;
	end;
	lista = ^nodo;
	nodo = record
		dato: viaje;
		sig: lista;
	end;
	
	vectorcoches = array[numcoche] of integer;
	
procedure cargarLista(var l: lista); // SE DISPONE
procedure cargarVector(var v: vectorcoches); // SE DISPONE
	
function maximo(v: vectorcoches): integer;
var
	i, maxCoche: numcoche;
	capacidadMax: integer;
begin
	capacidadMax:= -1;
	for i:= 1000 to 2500 do
		if (v[i] > capacidadMax) then begin
			capacidadMax:= v[i];
			maxCoche:= i;
		end;
	maximo:= maxCoche;
end;

function promedio(pasajeros, viajes: integer): real;
begin
	if (viajes > 0) then
		promedio:= pasajeros / viajes
	else
		promedio:= 0;
end;

procedure inicializarVectores(var v1, v2: vectorcoches);
var
	i: numcoche;
begin
	for i:= 1000 to 2500 do begin
		v1[i]:= 0;
		v2[i]:= 0;
	end;
end;

function cumple(via: viaje; v: vectorcoches): boolean;
begin
	cumple:= (via.mes = 2) and ((via.dni MOD 10) = 0) and (v[via.coche] > via.pasajeros);
end;

procedure procesarViajes(l: lista; v: vectorcoches; var viajesPorCoche, totalPasajeros: vectorcoches; var viajesDNI: lista);
var
	coche: numcoche;
begin
	viajesDNI:= NIL;
	inicializarVectores(viajesPorCoche, totalPasajeros);
	while (l <> NIL) do begin
		viajesPorCoche[coche]:= viajesPorCoche[coche] + 1;
		totalPasajeros[coche]:= totalPasajeros[coche] + l^.dato.pasajeros;
		if (cumple(l^.dato, v)) then
			agregarAdelante(viajesDNI, l^.dato);
		
		l:= l^.sig;
	end;
	
var
	l, viajesDNI: lista;
	v, viajesPorCoche, totalPasajeros: vectorcoches;
	cocheMax: numcoche;
	i: integer;
begin
	cargarLista(l); // SE DISPONE
	cargarVector(v); // SE DISPONE
	procesarViajes(l, v, viajesPorCoche, totalPasajeros, viajesDNI);
	
	cocheMax:= maximo(viajesPorCoche);
	
end.
