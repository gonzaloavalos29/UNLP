//	Inicializar contador (cant)
//	Leer registro (ani)
//	Mientras (no sea la condición de fin) do
//	begin
//		guardar la raza actual
//		mientras (sea la misma raza) do
//		begin
//			contar perro
//			Leer registro (ani)
//		end;
//	write('La cantidad es', cant);
//	end;

program uno;
type
	perro = record
		raza: string;
		nombre: string;
		edad: integer;
	end;
	// modulos
var
	ani: perro;
	cant: integer;
	actual: string;
	total: integer;
	max: integer;
	razaMax: string;
// CORTE DE CONTROL CON REGISTRO
begin
	total:= 0;
	max:= -1;
	leer(ani);
	while (ani.raza <> 'XXX')do
	begin
		cant:= 0;
		actual:= ani.raza;
		while ((ani.raza <> 'XXX') and (ani.raza = actual)) do 
		begin
			cant:= cant + 1;
			leer(ani);
		end;
		if (cant >= max) then begin
			max:= cant;
			razaMax:= actual;
		end;
		total:= total + cant;
		write('La cantidad de la raza', actual, ' es ', cant);
	end;
end.

// CORTE DE CONTROL CON LISTAS Y VECTORES
{program parcialTren;
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

procedure cargarLista(l: listaViajes); // SE DISPONE
procedure cargarVector(v: vectorCostos); // SE DISPONE

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
}
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
{
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

end.}
