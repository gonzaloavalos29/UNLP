program ejercicio2;
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

procedure agregarAdelante(var l: lista; p: persona); // 2) Faltaba pasar por referencia
var
	aux: lista;
begin
	new(aux); {creo un nodo} // 3) Faltaba crear nodo
	aux^.dato:= p; {cargo el dato}
	aux^.sig:= nil; {realizo el enlace} // 9) FALTABA REVISAR SI L ES NIL (PRIMER ELEMENTO) O SI L TENÍA OTRA DIRECCIÓN
	if (l = nil) then begin
		l:= aux;
	end else begin
		aux^.sig:= l;
		l:= aux;
	end;
	{actualizo el primero}
end;

{ Carga la lista hasta que llega el dni 0 }
procedure generarLista(var l: lista);
var
	p: persona; // 4) El registro como variable estaba mal asignado
begin
	leerPersona(p);
	while (p.dni <> 0) do begin
		agregarAdelante(l, p);
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

