program entidadBancaria;

type
	r_transferencias = 1..7;
	r_dia = 1..31;
	r_mes = 1..11;
	r_hora = 1..24;
	r_fecha = record
		dia: r_dia;
		mes: r_mes;
	end;

	transferencia = record
		nroCuenta: integer;
		dniOrigen: integer;
		nroCuentaD: integer;
		dniDestino: integer;
		fecha: r_fecha;
		hora: r_hora;
		monto: real;
		codigo: r_transferencias;
	end;
	vector_motivo = array [r_transferencias] of integer;
	lista = ^nodo;
	nodo = record
		dato: transferencia;
		sig: lista;
	end;
	
function menorParQueImpar(nroDestino: integer): boolean;
var
	pares, impares: integer;
begin
	pares:= 0;
	impares:= 0;
	while (nroDestino <> 0) do begin
		if ((nroDestino mod 10) mod 2) = 0 then
			pares:= pares + 1
		else
			impares:= impares + 1;
		nroDestino:= nroDestino div 10;
	end;
	menorParQueImpar:= (pares < impares);
end;

procedure leerFecha(var f: r_fecha);
begin
	write('Leer dia: '); readln(f.dia);
	write('Leer mes: '); readln(f.mes);
end;
procedure leerTransferencia(var t: transferencia);
begin
	write('Leer numero de cuenta origen: '); readln(t.nroCuenta);
	write('Leer DNI de su titular: '); readln(t.dniOrigen);
	write('Leer numero de su cuenta destino: '); readln(t.nroCuentaD);
	write('Leer DNI de su titular: '); readln(t.dniDestino);
	leerFecha(t.fecha);
	write('Leer hora de la transaccion: '); readln(t.hora);
	write('Leer monto: '); readln(t.monto);
	write('Leer codigo del motivo: '); readln(t.codigo);
end;
procedure agregarNodo(var l: lista; t: transferencia); // SE DISPONE
var
	aux: lista;
begin
	new(aux);
	aux^.dato:= t;
	aux^.sig:= nil;
	if (l <> nil) then
		aux^.sig:= l;
	l:= aux;
end;
procedure cargarLista(var l: lista); // SE DISPONE
var
	t: transferencia;
	seguir: integer;
begin
	seguir:= -1;
	while (seguir <> 0) do begin
		leerTransferencia(t);
		agregarNodo(l, t);
		writeln;
		write('Seguir?: '); readln(seguir);
	end;
end;
procedure insertarOrdenado(var l: lista; t: transferencia);
var
	aux, ant, act: lista;
begin
	new(aux);
	aux^.dato:= t;
	ant:= l;
	act:= l;
	while (act <> nil) and (act^.dato.nroCuenta < aux^.dato.nroCuenta) do begin	
		ant:= act;
		act:= act^.sig;
	end;
	if (ant = act) then begin
		l:= aux;
	end else begin
		ant^.sig:= aux;
	end;
	aux^.sig:= act;
end;
procedure generarLista(l: lista; var l2: lista);
var
	condicion: boolean;
begin
	condicion:= false;
	while (l <> nil) do begin
		condicion:= (l^.dato.dniOrigen <> l^.dato.dniDestino);
		if (condicion) then
			insertarOrdenado(l2, l^.dato);
		l:= l^.sig;
	end;
end;
procedure calcularMontoTransferido(l2: lista);
var
	acumulador: real;
	cuentaActual: integer;
begin
	while (l2 <> nil) do begin
		acumulador:= 0;
		cuentaActual:= l2^.dato.nroCuenta;
		while (l2 <> nil) and (cuentaActual = l2^.dato.nroCuenta) do begin
			acumulador:= acumulador + l2^.dato.monto;
			l2:= l2^.sig;
		end;
		write('La cuenta ', cuentaActual, ' transfirio un total de ', acumulador:2:2, '$ a terceros');
	end;
end;
procedure maximoTransferencias(l2: lista; var motivoMax: integer);
var
	v: vector_motivo;
	i, transfMax: integer;
begin
	transfMax:= -1;
	for i:= 1 to 7 do begin
		v[i]:= 0;
	end;
	while (l2 <> nil) do begin
		v[l2^.dato.codigo]:= v[l2^.dato.codigo] + 1;
		l2:= l2^.sig;
	end;
	for i:= 1 to 7 do begin
		if (v[i] > transfMax) then begin
			transfMax:= v[i];
			motivoMax:= i;
		end;
	end;
end;
procedure transferenciasJunio(l: lista; var cantT: integer);
begin
	cantT:= 0;
	while (l <> nil) do begin
		if (l^.dato.fecha.mes = 6) and (menorParQueImpar(l^.dato.nroCuentaD)) then
			cantT:= cantT + 1;
		l:= l^.sig;
	end;
end;

var
	l, l2: lista;
	motivoMax, cantEsp: integer;
begin
	l:= nil;
	l2:= nil;
	motivoMax:= 0;
	cantEsp:= 0;
	cargarLista(l); // SE DISPONE
	generarLista(l, l2);
	calcularMontoTransferido(l2);
	maximoTransferencias(l2, motivoMax);
	transferenciasJunio(l2, cantEsp);
	writeln('Codigo de motivo que mas transferencias a terceros tuvo: ', motivoMax);
	writeln('Cantidad de transferencias a terceros realizadas en el mes de Junio en las cuales el número de cuenta destino posea menos digitos pares que impares: ',
	cantEsp);
end.
