program clientes;
const
	fin = 1122;
type
	rPoliza = 1..6;
	cliente = record
		codigo: integer;
		dni: longint;
		nombre: string;
		apellido: string;
		poliza: rPoliza;
		monto: real;
	end;
	
	listaClientes = ^nodo;
	nodo = record
		dato: cliente;
		sig: listaClientes;
	end;
	
	vectorpoliza = array[rPoliza] of real; // monto adicional que el cliente abona en la liquidación mensual de su seguro.
	
procedure leerCliente(var c: cliente);
begin
	with c do begin
		write('Codigo: '); readln(codigo);
		if (codigo <> fin) then begin
			write('DNI: '); readln(dni);
			write('Apellido: '); readln(apellido);
			write('Nombre: '); readln(nombre);
			write('Poliza: '); readln(poliza);
			write('Monto: '); readln(monto);
		end;
	end;
end;

procedure agregarAtras(var pri, ult: listaClientes; c: cliente);
var
	nue: listaClientes;
begin
	new(nue);
	nue^.dato:= c;
	nue^.sig:= nil;
	if (pri <> nil) then begin
		pri:= nue;
		ult:= nue;
	end else begin
		ult:= nue;
		ult^.sig:= nue; 
	end;
end;

procedure cargarLista(var pri, ult: listaClientes);
var
	c: cliente;
begin
	leerCliente(c);
	repeat
		agregarAtras(pri, ult, c);
		leerCliente(c);
	until (ult^.dato.codigo = fin);
end;

function cumple(dni: longint): boolean;
var
	num: longint;
	cant9: integer;
begin
	num:= dni;
	cant9:= 0;
	while (num <> 0) do begin
		if ((num mod 10)=9) then
			cant9:= cant9 + 1;
		num:= num div 10;
	end;
	if (num>=2) then
		cumple:= true
	else
		cumple:= false;
end;

procedure procesar(l: listaClientes; v: vectorpoliza);
begin
	while (l <> nil) do begin
		writeln('DNI: ', l^.dato.dni);
		writeln('Nombre: ', l^.dato.nombre);
		writeln('Apellido: ', l^.dato.apellido);
		writeln('Monto completo: ', (l^.dato.monto + v[l^.dato.poliza]));
		
		if (cumple(l^.dato.dni)) then
			writeln('El DNI ', l^.dato.dni, ' tiene al menos dos digitos 9.');
		
		l:= l^.sig;
	end;
end;

procedure eliminar(var l: listaClientes; codigo: integer);
var
	act, ant: listaClientes;
begin
	act:= l;
	ant:= l;
	while (act <> nil) and (act^.dato.codigo <> codigo) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act = l) then
		l:= l^.sig
	else
		ant^.sig:= act^.sig;
	dispose(act);
end;

var
	pri, ult: listaClientes;
	v: vectorpoliza; // SE DISPONE
	i: integer;
begin
	pri:= nil;
	ult:= nil;
	for i:= 1 to 6 do v[i]:= 0;
	cargarLista(pri, ult);
	procesar(ult, v);
	
	//eliminar(ult, 50);
	
end.
		
