program ej1p4;
Type
	venta= record
		codV: integer;
		codPro: integer;
		cantVendidas: integer;
		precioU: real;
	end;
	
	producto= record
		codP: integer;
		cantT: integer;
		montoT: real;
	end;
	
	arbol= ^nodo;
	nodo= record
		dato: producto;
		HI: arbol;
		HD: arbol;
	end;
	
procedure leerVenta(var v: venta);
begin
	write('Codigo de venta: ');readln(v.codV);
	if (v.codV <> -1)then begin
		write('Codigo de producto: ');readln(v.codPro);
		write('Cantidad ventas: ');readln(v.cantVendidas);
		write('Precio unitario: '); readln(v.precioU);
	end;
end;

procedure armarProducto(v: venta; var p: producto);
begin
	p.codP:= v.codPro;
	p.cantT:= v.cantVendidas;
	p.montoT:= p.cantT * v.precioU;
end;

procedure armarHoja(var a: arbol; p: producto);
begin
	if (a = nil)then begin
		new(a);
		a^.dato:= p;
		a^.HI:= nil;
		a^.HD:= nil;
	end else if (p.codP = a^.dato.codP)then begin
		a^.dato.cantT:= a^.dato.cantT + p.cantT;
		a^.dato.montoT:= a^.dato.montoT + p.montoT;
		end
		else if (p.codP < a^.dato.codP)then
			armarHoja(a^.HI, p)
			else
				armarHoja(a^.HD, p);
end;

procedure cargarArbol(var a: arbol);
var
	v: venta;
	p: producto;
begin
	leerVenta(v);
	while (v.codV <> -1)do begin
		armarProducto(v, p);
		armarHoja(a, p);
		leerVenta(v);
	end;
end;

procedure imprimir(a: arbol);
begin
	if (a <> nil)then begin 
		imprimir(a^.HI);
		write('Codigo de producto: ',a^.dato.codP,' cantidad vendida: ',a^.dato.cantT,' a $',a^.dato.montoT:0:2);
		imprimir(a^.HD);
		end;
end;

procedure buscarMaxVentas(a: arbol; var codPMax, maxVentas: integer);
begin
	if (a <> nil)then begin 
		buscarMaxVentas(a^.HI, codPMax, maxVentas);
		if (a^.dato.cantT > maxVentas)then begin
			maxVentas:= a^.dato.cantT;
			codPMax:= a^.dato.codP;
		end;
		buscarMaxVentas(a^.HD, codPMax, maxVentas);
		end;
end;
procedure incisoD (var cant: integer; a: arbol; cod: integer);
var 

begin
	if (a <> nil ) then begin
		if (a^.dato.codP <> cod) then begin
			if (a^.dato.codP < cod) then begin
				cant:= cant +1;
				incisoD (cant, a^.HI, cod);
			end;
			else 
				incisoD (cant, a^.HD, cod);
		end;
	end;
end;


function incisoDB (a: arbol; cod integer): arbol;
begin
	
end;
var
	Ar: arbol;
	codPMax, maxVentas, cant, codigo: integer;
	
begin
	Ar:= nil;
	cant:= 0;
	cargarArbol(Ar);		// Inciso 1 A
	imprimir(Ar);			// Inciso 1 B
	maxVentas:= -1;
	buscarMaxVentas(Ar, codPMax, maxVentas);		// Inciso 1 C
	writeln('El codigo de producto con mas ventas es ',codPMax,' con ',maxVentas,' ventas');
	read (codigo);
	incisoD (cant, Ar, codigo)
end.
