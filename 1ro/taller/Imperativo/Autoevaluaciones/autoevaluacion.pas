Program cinco;
Type
arbol= ^nodo;
nodo = record
  dato: integer;
  HI: arbol;
  HD: arbol;
end;

procedure agregar(var a: arbol; e: integer); // Carga arbol común y corriente
begin
	if (a = nil) then begin
		new(a);
		a^.hi:= nil;
		a^.hd:= nil;
		a^.dato:= e;
	end else if (e < a^.dato) then
		agregar(a^.hi, e)
	else
		agregar(a^.hd, e);
end;

procedure cargarArbol(var a: arbol);
var
	i: integer;
begin
	writeln('Entero: ');
	readln(i);
	while (i <> 0) do begin
		agregar(a, i);
		writeln('Entero: ');
		readln(i);
	end;
end;

function sumar (a:arbol; v1, v2: integer): integer;
begin
  if (a = nil) then 
   sumar:= 0
  else 
   begin
      if (a^.dato >= v1) and (a^.dato < v2) then 
         sumar:= a^.dato + sumar (a^.HI, v1,v2)+ sumar (a^.HD,v1,v2)
      else 
        if (a^.dato > v1) then 
           sumar:= a^.dato + sumar (a^.HD, v1,v2)
        else 
           sumar:= a^.dato + sumar (a^.HI, v1,v2);
   end;
end;

var a: arbol;
Begin
   cargarArbol(a); {carga un ABB como muestra la figura}
   writeln ('Cantidad: ', sumar (a, 5, 10));
end.
