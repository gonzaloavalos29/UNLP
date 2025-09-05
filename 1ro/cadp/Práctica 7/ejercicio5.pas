program flota;
const
	fin = -1;
	dimF = 100;
type
	r_camion = 1..100;

	camiones = record
		patente: string;
		anio: integer;
		capacidad: integer; // TONELADAS
	end;
	
	v_camiones = array[r_camion] of camiones; // SE DISPONE
	v_codigo = array[r_camion] of integer;
	
	viajes = record
		codigo: integer;
		camion: integer;
		distancia_recorrida: integer; // KILOMETROS
		destino: string;
		anio: integer;
		dni: longint;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: viajes;
		sig: lista;
	end;
	
procedure leerCamion(var c: camiones); // SE DISPONE
begin
	with c do begin
		readln(patente);
		readln(anio);
		readln(capacidad);
	end;
end;
	
procedure leerViaje(var v: viajes);
begin
	with v do begin
		read(codigo);
		if (codigo <> fin) then begin
			read(camion);
			read(distancia_recorrida);
			read(destino);
			read(anio);
			read(dni);
		end;
	end;
end;

procedure agregarAdelante(var l: lista; v: viajes);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= v;
	nue^.sig:= l;
	l:= nue;
end;

procedure cargarLista(var l: lista);
var
	v: viajes;
begin
	leerViaje(v);
	while (v.codigo <> fin) do begin
		agregarAdelante(l, v);
		leerViaje(v);
	end;
end;

function esDNIImpar(v: viajes): boolean;
var
	nro: longint;
	pares: integer;
begin
	pares:= 0;
	nro:= v.anio;
	while (nro <> 0) do begin
		if (((nro mod 10) mod 2) = 0) then
			pares:= pares + 1;
	end;
	if (pares <> 0) then
		esDNIImpar:= false
	else
		esDNIImpar:= true;
end;

procedure procesarLista(l: lista; var patenteMax, patenteMin, cantCumple: integer{; v: v_camiones}); // v: v_camion SE DISPONE
var
	kmMax, kmMin: integer;
begin
	kmMax:= -1;
	kmMin:= 9999;
	while (l <> nil) do begin
		// Punto A
		if (l^.dato.distancia_recorrida > kmMax) then begin
			kmMax:= l^.dato.distancia_recorrida;
			{patenteMax:= v[l^.dato.camion];}
		end;
		if (l^.dato.distancia_recorrida < kmMin) then begin
			kmMin:= l^.dato.distancia_recorrida;
			{patenteMin:= v[l^.dato.patente];}
		end;
		// Punto B
		{if (v[l^.dato.patente].capacidad >= 30.5) and ((v[l^.dato.patente].anio + 5) > l^.dato.anio) then
			cantCumple:= cantCumple + 1;}
		// Punto C
		{if (esDNIImpar(l^.dato.dni)) then
			writeln('Codigo de viaje: ', l^.dato.codigo);
		l:= l^.dato.sig;}
	end;
end;

var
	l: lista;
	//c: v_camion;
	patenteMax, patenteMin, cantCumple: integer;
begin
	l:= nil;
	patenteMax:= 0;
	patenteMin:= 0;
	cantCumple:= 0;
	//cargarVector(c); SE DISPONE
	cargarLista(l);
	procesarLista(l, patenteMax, patenteMin, cantCumple);
end.
