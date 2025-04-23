program ejercicio3;
type
	lista = ^nodo;
	persona = record
		dni: integer;
		nombre: string;
		apellido: string;
	end;
	nodo = record
		dato: persona;
		sig: lista;
	end;

procedure leerPersona(var p: persona); // 1) Faltaba pasar por referencia
begin
	p.dni:= 0;
	writeln('Ingrese su dni: '); readln(p.dni);
	if (p.dni <> 0) then begin
		writeln('Ingrese su nombre: '); readln(p.nombre);
		writeln('Ingrese su apellido'); readln(p.apellido);
	end;
end;

procedure agregarAtras(var pri, ult: lista; p: persona); // 2) Faltaba pasar por referencia
var
	nuevo: lista;
begin
	new(nuevo); {creo un nodo} // 3) Faltaba crear nodo
	nuevo^.dato:= p; {cargo el dato}
	nuevo^.sig:= nil; {Inicializo el enlace en NIL} // 9) FALTABA REVISAR SI L ES NIL (PRIMER ELEMENTO) O SI L TENÍA OTRA DIRECCIÓN
	if (pri = nil) then begin { si la lista está vacía }
		pri:= nuevo; { actualizo el inicio }
		ult:= nuevo;
	end 
	else begin { si no está vacía }
		ult^.sig:= nuevo; { realizo enlace con el último }
		ult:= nuevo; { actualizo el último }
	end;
end;

{ Carga la lista hasta que llega el dni 0 }
procedure generarLista(var l: lista);
var
	p: persona; // 4) El registro como variable estaba mal asignado
	ult: lista;
begin
	leerPersona(p);
	while (p.dni <> 0) do begin
		agregarAtras(l, ult, p);
		leerPersona(p); // 5) Faltaba volver a leer persona
	end;
end;

procedure imprimirInformacion(l: lista); // 6) La lista va por valor (ya está cargada)
begin
	while (l <> nil) do begin
		writeln('DNI: ', l^.dato.dni, ' Nombre: ', l^.dato.nombre, ' Apellido: ', l^.dato.apellido); // 7) Nombre y apellido están mal llamados
		l:= l^.sig;
	end;
end;

var
	l: lista;
begin
	l:= nil; // 8) Faltaba inicializar en NIL.
	generarLista(l);
	imprimirInformacion(l);
end.

