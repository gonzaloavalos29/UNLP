program final101023;
type
	rango_sucursal = 1..5;
	factura = record
		nro: integer
		codC: integer;
		codS: rango_sucursal;
		montoT: real;
	end;
	
procedure leer(var f: factura);
begin
	readln(f.nro)
	if (f.nro <> 0) then begin
		readln(f.codC);
		readln(f.codS);
		readln(f.montoT);
	end;
end;

procedure agregarAdelante(var l: listaF; f: factura);
var
	nue: listaF;
begin
	new(nue);
	nue^.dato:= f;
	nue^.sig:= l; 
	l:= nue;
end;

procedure cargarFacturas(var l: listaF);
var
	f: factura;
begin
	leer(f);
	while (f.nro <> 0) do begin
		agregarAdelante(l, f);
		f.nro:= 0;
		leer(f);
	end;
end;

procedure imprimirLista(l: listaF);
begin
	while (l <> nil) do begin
		writeln(l^.dato.nro);
		writeln(l^.dato.codC);
		writeln(l^.dato.codS);
		l:= l^.sig;
	end;
end;

// Elimina un solo nodo
procedure eliminarFacturasSucursal(var l: listaF; var sucursal: integer);
var
	cantF: integer;
	actual, ant: listaF;
begin
	cantF:= 0; actual:= l;
	while (actual <> nil) do begin
		if (actual^.dato.codS <> sucursal) then begin
			ant:= actual;
			actual:= actual^.sig;
		end else begin
			if (actual = l) then
				l:= l^.sig
			else
				ant^.sig:= actual^.sig
			dispose(actual);
			cantF:= cantF + 1;
			actual:= ant;
		end;
	end;
end;

// Elimina todos los nodos que coinciden con la sucursal
procedure eliminarFacturasSucursal(var l: listaF; var sucursal: integer);
var
	cantF: integer;
	actual, ant, temp: listaF;
begin
	cantF:= 0;
	actual:= l;
	ant:= nil; // inicializamos el puntero anterior a nil
	while (actual <> nil) do begin
		if (actual^.dato.codS = sucursal) then begin
			temp:= actual; // guardamos el nodo actual
			actual:= actual^.sig; // movemos el puntero actual al siguiente nodo
			if (temp = l) then
				l:= actual // si el nodo a eliminar es el primero, actualizamos el inicio de la lista
			else
				ant^.sig:= actual; // enlazamos el nodo anterior con el siguiente al nodo actual
			dispose(temp); // liberamos memoria del nodo a eliminar
			cant:= cantF + 1;
		end else begin
			ant:= actual; // actualizamos el puntero anterior
			actual:= actual^.sig;
		end;
	end;
end;

VAR
	l: listaF;
	sucursal: integer;
BEGIN
	l:= nil;
	cargarFacturas(l);
	imprimirLista(l);
	eliminarFacturasSucursal(l, sucursal);
	imprimirLista(l);
END.
