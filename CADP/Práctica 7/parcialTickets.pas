program teatro;
const
	maxMes = 12;
	maxUbicacion = 4;
type
	r_mes = 1..maxMes;
	r_ubicacion = 1..maxUbicacion;
	
	ticket = record
		codigo: integer;
		dni: longint;
		mes: r_mes;
		ubi: r_ubicacion;
	end;
	
	evento = record
		codigo: integer;
		t_vendidos: integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: ticket;
		sig: lista;
	end;
	lista2 = ^nodo2;
	nodo2 = record
		dato: evento;
		sig: lista2;
	end;
	
	vector_ubicacion = array[r_ubicacion] of real; // costos por ubicación
	vector_mes = array[r_mes] of real; // costos por mes
	
procedure cargarLista(var l: lista); // SE DISPONE
procedure cargarVector(var v: vector_ubicacion); // SE DISPONE

procedure inicializarVector(var v: vector_mes);
var
	i: integer;
begin
	for i:=1 to maxMes do
		v[i]:= 0;
end;

procedure maximo(v: vector_mes; var mesMax: integer);
var
	i: integer;
	max: real;
begin
	max:= -1; mesMax:= 0;
	for i:=1 to maxMes do begin
		if (v[i] > max) then begin
			max:= v[i];
			mesMax:= i;
		end;
	end;
end;

procedure agregarAdelante(var l: lista2; e: evento);
var
	nue: lista2;
begin
	new(nue);
	nue^.dato:= e;
	nue^.sig:= l;
	l:= nue;
end;

procedure procesarLista(l: lista; var l2: lista2; v: vector_ubicacion; var v2: vector_mes);
var
	codActual: integer;
	costo: real;
	cantTickets: integer;
	cantRecaudada: real;
	e: evento;
begin
	while (l <> nil) do begin
		codActual:= l^.dato.codigo;
		cantTickets:= 0;
		cantRecaudada:= 0;
		while (l <> nil) and (codActual = l^.dato.codigo) do begin
			cantTickets:= cantTickets + 1;
			costo:= v[l^.dato.ubi];
			v2[l^.dato.mes]:= v2[l^.dato.mes] + costo;
			cantRecaudada:= cantRecaudada + costo;
			l:= l^.sig;
		end;
		e.codigo:= codActual;
		e.t_vendidos:= cantTickets;
		agregarAdelante(l2, e);
		writeln('El promedio recaudado en el evento ', codActual, 'fue de ', cantRecaudada/cantTickets);
	end;
end;

var
	l: lista;
	l2: lista2;
	v: vector_ubicacion;
	v2: vector_mes;
	max: integer;
begin
	l2:= nil;
	cargarLista(l); // SE DISPONE
	cargarVector(v); // SE DISPONE}
	inicializarVector(v2);
	procesarLista(l, l2, v, v2);
	maximo(v2, max);
	writeln('El mes con mayor monto recaudado fue ', max);
end.
		
		
