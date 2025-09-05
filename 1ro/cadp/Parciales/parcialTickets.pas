program parcialTickets;
type
	rangoMeses = 1..12;
	rangoUbicacion = 1..4;
	ticket = record
		codEvento: integer;
		dni: longint;
		mes: rangoMeses;
		ubi: rangoUbicacion;
	end;
	
	listaTickets = ^nodoTickets;
	nodoTicket = record
		dato: ticket;
		sig: listaTickets;
	end;
	
	vectorCostos = array[rangoUbicacion] of real;
	
	tVendidos = record
		cod: integer;
		cant: integer;
	end;
	
	listaVendidos = ^nodoVendidos;
	nodoVendidos = record
		dato: tVendidos;
		sig: listaVendidos;
	end;
	
	vectorRecaudaciones = array[rangoMeses] of real;
	
procedure cargarLista(var l: listaTickets); // SE DISPONE
procedure cargarVector(var v: vectorCostos); // SE DISPONE
	
procedure inicializarVector(var v: vectorRecaudaciones);
var
	i: rangoMeses;
begin
	for i:= 1 to 12 do
		v[i]:= 0;
end;

function maximo(v: vectorRecaudaciones): integer;
var
	i, mesMax: integer;
	max: real;
begin
	max:= -1;
	for i:= 1 to 12 do begin
		if (v[i] > max) then begin
			max:= v[i];
			mesMax:= i;
		end;
	end;
	maximo:= mesMax;
end;

// COMPLETO
procedure procesarViajes(l: listaTickets; v: vectorCostos; var l2: listaVendidos; var v2: vectorRecaudaciones);
var
	codActual: integer;
	cantVendidos: integer;
	costo: real;
	cantRecaudada: real;
	t: tVendidos;
begin
	while (l <> NIL) do begin
		codActual:= l^.dato.codEvento;
		cantVendidos:= 0;
		cantRecaudada:= 0;
		while (l <> NIL) and (codActual = l^.dato.codEvento) do begin
			cantVendidos:= cantVendidos + 1;
			costo:= v[l^.dato.ubi]*cantVendidos;
			cantRecaudada:= cantRecaudada + precio;
			v2[l^.dato.mes]:= cantVendidos*precio;
			l:= l^.sig;
		end;
		t.cod:= codActual;
		t.cant:= cantVendidos;
		agregarAdelante(l2, t);
		writeln('El promedio recaudado en el mes ', l^.dato.mes, ' es ', cantRecaudada/cantVendidos);
	end;
end;

var
	l: listaTickets;
	v: vectorCostos;
	vendidos: listaVendidos;
	recaudaciones: vectorRecaudaciones;
begin
	cargarLista(l); // SE DISPONE
	cargarVector(v); // SE DISPONE 
	vendidos:= NIL;
	inicializarVector(recaudaciones);
	
	procesarViajes(l, v, vendidos, recaudaciones); // COMPLETO
	
	writeln('El mes con mayor monto recaudado fue ', maximo(recaudaciones));
end.
