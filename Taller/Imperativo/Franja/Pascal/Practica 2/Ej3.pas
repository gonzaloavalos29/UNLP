program ej2p3;
Type
	ventas= record
		codP: integer;
		dia: integer;
		cantVendidas: integer;
	end;
	arbol= ^nodo;
	nodo= record
		dato: ventas;
		HI: arbol;
		HD: arbol;
	end;
	
	productos= record
		codPro: integer;
		cantVTotal: integer;
	end;
	arbol2= ^nodo2;
	nodo2= record
		dato: productos;
		HI: arbol2;
		HD: arbol2;
	end;

procedure leerVentas(var v: ventas);
begin
	write('Ingresar codigo de producto: ');readln(v.codP);
	if (v.codP <> 0)then begin
		write('Ingresar dia / fecha: '); readln(v.dia);
		write('Ingresar cantidad vendidas del producto: ');readln(v.cantVendidas);
	end;
end;

procedure armarHoja(var A: arbol; v:ventas);
begin
	if (A = nil)then begin
		new(A);
		A^.dato:= v;
		A^.HI:= nil;
		A^.HD:= nil;
		end else
			if (v.codP <= A^.dato.codP)then
				armarHoja(A^.HI, v)
				else
					armarHoja(A^.HD, v);
end;

procedure actualizar(var cant: integer; valor: integer);
begin
	cant:= cant + valor;
end;

{procedure armarHoja2(var A: arbol2; v:ventas);
begin
	if (A = nil)then begin
		new(A);
		A^.dato.codPro:= v.codP;
		A^.dato.cantVTotal:= v.cantVendidas;
		A^.HI:= nil;
		A^.HD:= nil;
		writeln('carga');
		end else
			if (v.codP = A^.dato.codPro)then
				actualizar(A^.dato.cantVTotal, v.cantVendidas);
			if (v.codP < A^.dato.codPro)then
				armarHoja2(A^.HI, v)
				else
					armarHoja2(A^.HD, v);
end;}

procedure armarHoja2(var A: arbol2; v: ventas);
begin
	if (A = nil) then begin
		new(A);
		A^.dato.codPro:= v.codP;
		A^.dato.cantVTotal:= v.cantVendidas;
		A^.HI:= nil;
		A^.HD:= nil;
	end
	else begin
		if (v.codP = A^.dato.codPro) then begin
			actualizar(A^.dato.cantVTotal, v.cantVendidas);
		end
		else if (v.codP < A^.dato.codPro) then begin
			armarHoja2(A^.HI, v);
		end
		else begin
			armarHoja2(A^.HD, v);
		end;
	end;
end;


procedure cargarArbol(var A: arbol);
var
	v: ventas;
begin
	leerVentas(v);
	while (v.codP <> 0)do begin
		armarHoja(A,v);
		leerVentas(v);
	end;
end;

procedure recorrerYArmar(a: arbol; var arb2: arbol2);
begin 
    if(a<> nil) then begin
        recorrerYArmar(a^.HI, arb2);
        armarHoja2(arb2,a^.dato);
        recorrerYArmar(a^.HD, arb2);
    end;
end;

procedure imprimir(a: arbol2);
begin 
    if (a<> nil) then begin
        imprimir(a^.HI);
        write(a^.dato.cantVTotal,'|');
        imprimir(a^.HD);
    end;
end;

var
	arb: arbol;
	arb2: arbol2;
Begin
	arb:= nil;
	cargarArbol(arb);			// Inciso A 1
	arb2:= nil;
	writeln('Llega antes a 2');
	recorrerYArmar(arb, arb2);	// inciso A 2
	writeln('Llega');
	imprimir(arb2);
end.