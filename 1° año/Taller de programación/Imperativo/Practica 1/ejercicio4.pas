program ejercicio4;
const
	dimF = 8;
	dimF2 = 30;
type
	subr = 1..dimF;
	producto = record
		codigo: integer;
		rubro: subr;
		precio: real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: producto;
		sig: lista;
	end;
	
	vecProd = array[subr] of lista;
	vecGen3 = array[1..dimF2] of producto;
	
procedure inicializarListas(var v: vecProd);
var
	i: integer;
begin
	for i:= 1 to dimF do begin
		v[i]:= nil;
	end;
end;

procedure leerProducto(var p: producto);
begin
	// write('Ingresar cod producto: ') ;readln(p.codP);
	p.codigo:= Random(99);
	// write('Ingresar codigo de rubro: '); readln(p.codR);
	p.rubro:= Random(8);
	write('Ingresar precio: '); readln(p.precio);
end;

procedure insertarOrdenado(var pri: lista; p: producto);
var
	act, nue, ant: lista;
begin
	new(nue);
	nue^.dato:= p;
	nue^.sig:= nil;
	if (pri = nil) then 
		pri:= nue
	else begin
		act:= pri;
		ant:= pri;
		while (act <> nil) and (act^.dato.codigo < p.codigo) do begin
			ant:= act;
			act:= act^.sig;
		end;
		if (ant = act) then begin
			nue^.sig:= pri;
			pri:= nue;
		end else begin
			ant^.sig:= nue;
			nue^.sig:= act;
		end;
	end;
end;

procedure cargarListas(var vec: vecProd);
var
	p: producto;
begin 
	leerProducto(p);
	while (p.precio <> 0) do begin
		insertarOrdenado(vec[p.codigo], p);
		leerProducto(p);
	end;
end;

procedure mostrarCodRubros(vec: vecProd);
var
	i: integer;
	act: lista;
begin
	for i:= 1 to dimF do begin
		act:= vec[i];
		writeln('Codigos de peliculas del rubro ', i);
		while (act <> nil) do begin
			write(act^.dato.codigo, ' - ');
			act:= act^.sig;
		end;
		writeln('');
	end;
end;

procedure leerGen3(l: lista; var vec: vecGen3; var dimL: integer);
var
	aux: lista;
begin
	aux:= l;
	while (aux <> nil) and (dimL < dimF2) do begin
		dimL:= dimL + 1;
		vec[dimL]:= aux^.dato;
		aux:= aux^.sig;
	end;
end;

procedure ordenacionInsercion(var v: vecGen3; dimL: integer);
var
	i, j: integer;
	aux: producto;
begin
	for i:= 2 to dimL do begin
		j:= i - 1;
		aux:= v[i];
		while (j > 0) and (v[j].precio > aux.precio) do begin
			v[j+1]:= v[j];
			j:= j - 1;
		end;
		v[j+1]:= aux;
	end;
end;

procedure mostrarVector(v: vecGen3; dimL: integer; var prom: real);
var
	i: integer;
	total: real;
begin	
	total:= 0;
	for i:= 1 to dimL do begin
		writeln('Precio de producto ', i, ': ', v[i].precio:0:2);
		total:= total + v[i].precio;
	end;
	prom:= total / dimL;
end;

VAR
	v: vecProd;
	v2: vecGen3;
	dimL: integer;
	prom: real;
BEGIN
	prom:= 0;
	inicializarListas(v);
	cargarListas(v);
	mostrarCodRubros(v); // B
	dimL:= 0;
	leerGen3(v[3], v2, dimL); // C
	ordenacionInsercion(v2, diml); // D
	mostrarVector(v2, dimL, prom); // E y F
	writeln('El promedio de los productos del tercer rubro es de: ', prom:0:2);
END.
	
	
