program arboles;
type
	arbol = ^nodo;
	nodo = record
		dato: integer;
		HI: arbol;
		HD: arbol;
	end;
procedure agregar(var a: arbol; num: integer);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:= num;
		a^.HI:= nil;
		a^.HD:= nil;
	end else
		if (num <= a^.dato) then 
			agregar(a^.HI, num)
		else
			agregar(a^.HD, num);
end;
procedure enOrden(a: arbol);
begin
	if (a <> nil) then begin
		enOrden(a^.HI);
		write(a^.dato);
		enOrden(a^.HD);
	end;
end;
procedure preOrden(a: arbol);
begin
	if (a <> nil) then begin
		write(a^.dato);
		preOrden(a^.HI);
		preOrden(a^.HD);
	end;
end;
procedure postOrden(a: arbol);
begin
	if (a <> nil) then begin
		postOrden(a^.HI);
		postOrden(a^.HD);
		write(a^.dato);
	end;
end;
VAR
	a: arbol;
	num: integer;
BEGIN
	a:= nil; // Indico que el árbol está vacío
	read(num); // leo un valor
	while (num <> 50) do begin
		agregar(a, num); // Agrego el valor al arbol
		read(num);
	end;
end.
	
