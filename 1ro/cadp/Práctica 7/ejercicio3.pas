program remiseria;
type
	r_codigo = 1..100;
	viaje = record
		codigo: r_codigo;
		direccion: string;
		destino: string;
		kmrecorridos: integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: viaje;
		sig: lista;
	end;
	
	vector_viajes = array[r_codigo] of integer;

procedure cargarLista(var l: lista); // SE DISPONE
procedure cargarVector(var v: vector_viajes); // SE DISPONE

procedure informarMaximos(v: vector_viajes; var maxCod1, maxCod2);
var
	i, max1, max2: integer;
begin
	max1:= -1; max2:= -1;
	maxCod1:= 0; maxCod2:= 0;
	for i:= 1 to 100 do begin
		if (v[i] > max) then begin
			max2:= max1;
			maxCod2:= maxCod1;
			max1:= v[i];
			maxCod1:= i;
		else
			max2:= v[i];
			maxCod2:= i;
		end;
	end;
end;

procedure procesar(l: lista; var l2: lista; v: vector_viajes);
var
	viajeActual: integer;
begin
	l2:= nil;
	while (l <> nil) do begin
		viajeActual:= l^.dato.codigo;
		while (l <> nil) and (viajeActual = l^.dato.codigo) do begin
			if (v[l^.dato.codigo] > 5) then
				l2:= l;
			l:= l^.sig;
		end;
	end;
end;

var
	l, l2: lista;
	v: vector_viajes;
begin
	cargarVector(v);
	procesar(l);
end;
