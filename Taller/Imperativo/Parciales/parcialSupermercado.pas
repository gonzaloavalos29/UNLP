program parcial3;
const
	dimF = 12;
type
	sub_mes = 1..12;
	compra = record
		monto:real;
		cod_cliente:integer;
		mes:sub_mes;
	end;
	
	vMeses = array [sub_mes] of real;
	
	nodoarbol = record
		cod: integer;
		v:Vmeses;
	end;
		
	arbol = ^nodo;
	nodo = record
		dato:nodoarbol;
		HI:arbol;
		HD:arbol;
	end;
	
	
	
	
	
procedure leerCompra (var c : compra);
begin
	writeln('Ingrese el codigo de cliente: ');
	readln(c.cod_cliente);
	if (c.cod_cliente <> 0) then begin
		writeln('Ingrese el monto de la compra del mes: ');
		c.monto:= Random (20000)/ (Random(10)+1);
		writeln(c.monto);
		writeln('Ingrese el mes de la compra: ');
		readln(c.mes);
		writeln('-------------------------------');
		writeln;
	end;
end;
procedure inicializarVector (var v: vMeses);
var
	i: sub_mes;
begin
	for i := 1 to 12 do
		v[i]:=0
end;
procedure agregarAlVector (var v: vMeses;mes:integer;monto:real);
begin
	v[mes]:= v[mes] + monto
end;
procedure agregarArbol (var a : arbol; c:compra);
var
	n:nodoArbol;v:vMeses;
begin
	if (a = nil) then begin
		new(a);
		inicializarVector(a^.dato.v);
		n.cod:=c.cod_cliente;
		agregarAlVector(v,c.mes,c.monto);
		a^.dato:=n;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else
		if (c.cod_cliente = a^.dato.cod) then
			agregarAlVector(v,c.mes,c.monto)
		else 
			if (c.cod_cliente < a^.dato.cod) then
				agregarArbol(a^.HI,c)
			else
				agregarArbol(a^.HD,c);
end;

			
procedure cargarArbol(var a :arbol);
var
	c:compra;
begin
	leerCompra(c);
	while(c.cod_cliente <> 0 ) do begin
		agregarArbol(a,c);
		leerCompra(c);
	end;
end;

procedure incisoB (a:arbol; codigo:integer; var mesMax: integer );
		
		function maximoAliendre(v:vMeses):integer;
		var
			i: sub_mes; max:real; mes:integer;
		begin
			max:=-1;mes:=0;
			for i:= 1 to 12 do begin
				if (v[i]> max) then begin
					max:= v[i];
					mes:=i;
				end;
			end;
			maximoAliendre:=mes;		
		end;
	
	
begin
	if (a= nil) then 
		codigo:=0
	else
		if (a^.dato.cod = codigo) then begin
			mesMax:= maximoAliendre(a^.dato.v)	
		end
		else if (codigo < a^.dato.cod) then
			incisoB(a^.HI,codigo,mesMax)
		else
			incisoB(a^.HD,codigo,mesMax)
			
end;
procedure incisoC (a:arbol;mes:integer; var cant0: integer);	
begin
	if (a<>nil) then begin
		incisoC(a^.HI,mes,cant0);
		if (a^.dato.v[mes] = 0) then
			cant0:=cant0 +1;
		incisoC(a^.HD,mes,cant0);
	end;
end;
//programa principal
var
	a:arbol;codigo,mesMax,mes,cant0:integer;
begin
	a:= nil;cant0:=0;mes:=0;
	cargarArbol(a);
	writeln('Ingrese el codigo del cliente: ');
	readln(codigo);
	incisoB(a,codigo,mesMax);
	writeln('Ingrese un numero de mes: ');
	readln(mes);
	incisoC(a,mes,cant0);
end.
