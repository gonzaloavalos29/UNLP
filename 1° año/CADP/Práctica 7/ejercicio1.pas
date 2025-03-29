program casting;
const
	FIN = 33555444;
type
	rGenero = 1..5;
	persona = record
		DNI: longint;
		nombre: string;
		apellido: string;
		edad: integer;
		genero: rGenero;
	end;
	
	listaP = ^nodo;
	nodo = record
		dato: persona;
		sig: listaP;
	end;
	
	vectorgeneros = array[rGenero] of integer; // vector con los codigos y cantidad de veces elegidas de los géneros
	
procedure leerPersona(var p: persona);
begin
	with p do begin
		writeln('DNI: '); readln(DNI);
		writeln('Nombre: '); readln(nombre);
		writeln('Apellido: '); readln(apellido);
		writeln('Edad: '); readln(edad);
		writeln('Genero: '); readln(genero);
	end;
end;

procedure agregarAdelante(var l: listaP; p: persona);
var
	nue: listaP;
begin
	new(nue);
	nue^.dato:= p;
	nue^.sig:= l;
	l:= nue;
end;

procedure cargarLista(l: listaP);
var
	p: persona;
begin
	leerPersona(p);
	repeat
		agregarAdelante(l, p);
		leerPersona(p);
	until (p.DNI = FIN);
end;

function digParesImpares(dni: integer): boolean;
var
	num: integer;
	pares, impares: integer;
	cumple: boolean;
begin
	cumple:= false;
	pares:= 0;
	impares:= 0;
	num:= dni;
	while (num <> 0) do begin
		if (((num mod 10) mod 2) = 0) then
			pares:= pares + 1
		else
			impares:= impares + 1;
		num:= num div 10;
	end;
	if (pares = impares) then
		cumple:= true;
	digParesImpares:= cumple;
end;

procedure inicializarVector(var v: vectorgeneros);
var
	i: integer;
begin
	for i:= 1 to 5 do 
		v[i]:= 0;
end;

procedure maximos(v: vectorgeneros; var maxCod1, maxCod2: integer);
var
	i: integer;
	max1, max2: integer;
begin
	max1:= -1;
	max2:= -1;
	maxCod1:= 0;
	maxCod2:= 0;
	for i:= 1 to 5 do begin
		if (v[i] > max1) then begin
			max2:= max1;
			maxCod2:= maxCod1;
			max1:= v[i];
			maxCod1:= i;
		end
		else if (v[i] > max2) then begin
			max2:= v[i];
			maxCod2:= i;
		end;
	end;
end;

procedure procesar(l: listaP; var v: vectorgeneros; var cantDigitos: integer);

begin
	cantDigitos:= 0;
	while (l <> nil) do begin
		if digParesImpares(l^.dato.DNI) then
			cantDigitos:= cantDigitos + 1;
		v[l^.dato.genero]:= v[l^.dato.genero] + 1;
		
		l:= l^.sig;
	end;
end;

procedure eliminar(var l: listaP; dni: integer);
var
	actual, anterior: listaP;
begin
	anterior:= l;
	actual:= l;
	while (actual <> nil) and (actual^.dato.DNI <> dni) do begin
		anterior:= actual;
		actual:= actual^.sig;
	end;
	if (actual <> nil) then begin
		if (actual = l) then
			l:= l^.sig
		else
			anterior^.sig:= actual^.sig;
		dispose(actual);
	end;
end;

var
	l: listaP;
	v: vectorgeneros;
	cod1, cod2: integer;
	cantDigitos: integer;
begin
	l:= nil;
	inicializarVector(v);
	cargarLista(l);
	procesar(l, v, cantDigitos);
	maximos(v, cod1, cod2);
	writeln('Los codigos de los dos generos mas elegidos son: ', cod1, ' y ', cod2);
	eliminar(l, 3);
end.
		
