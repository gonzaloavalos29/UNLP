program parcialBizarrap;
const
	fin = 'Peso Pluma';
	reggaeton = 2;
type
	r_genero = 1..5;
	sesion = record
		titulo: string;
		nombre: string;
		genero: r_genero;
		cantVis: longint;
	end;
	
	listaB = ^nodoB;
	nodoB = record
		dato: sesion;
		sig: listaB;
	end;
	
	vectorvisitas = array[r_genero] of longint;
	
procedure leerSesion(var s: sesion);
begin
	readln(s.nombre);
	readln(s.titulo);
	readln(s.genero);
	readln(s.cantVis);
end;

procedure insertarOrdenado(var l: listaB; s: sesion);
var
	aux, ant, act: listaB;
begin
	new(aux);
	aux^.dato:= s;
	act:= l;
	ant:= l;
	while (act <> nil) and (s.titulo < act^.dato.titulo) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (ant = act) then begin
		l:= aux
	end else begin
		ant^.sig:= aux;
	end;
	aux^.sig:= act;
end;

procedure cargarLista(var l: listaB);
var
	s: sesion;
begin
	leerSesion(s);
	repeat
		insertarOrdenado(l, s);
		leerSesion(s);
	until (s.nombre <> fin);
end;

procedure inicializarVector(var v: vectorvisitas);
var
	i: integer;
begin
	for i:= 1 to 5 do
		v[i]:= 0;
end;

function digParesImpares(cant: longint): boolean;
var
	cumple: boolean;
	pares, impares: integer;
	num: integer;
begin
	pares:= 0;
	impares:= 0;
	cumple:= false;
	num:= cant;
	while (num <> 0) do begin
		if (((cant mod 10) mod 2) = 0) then begin
			pares:= pares + 1;
		end else begin
			impares:= impares + 1;
		end;
		num := num div 10;
	end;
	if (pares=impares) then
		cumple:= true;
	digParesImpares:= cumple;
end;

procedure maximos(v: vectorvisitas; var cod1, cod2: integer);
var
	max1, max2: longint;
	i: integer;
begin
	max1:= -1;
	max2:= -1;
	cod2:= 0;
	cod1:= 0;
	for i:= 1 to 5 do begin
		if (v[i] > max1) then begin
			max2:= max1;
			cod2:= cod1;
			max1:= v[i];
			cod1:= i;
		end;
	end;
end;

procedure procesarLista(l: listaB; var v: vectorvisitas);
var
	visitas: longint;
	contador: integer;
	cod1, cod2: integer;
begin
	contador:= 0;
	visitas:= 0;
	while (l <> nil) do begin
		visitas:= l^.dato.cantVis;
		v[l^.dato.genero]:= v[l^.dato.genero] + visitas;
		if (l^.dato.genero = reggaeton) and digParesImpares(visitas) then
			contador:= contador + 1;
		l:= l^.sig;
	end;
	maximos(v, cod1, cod2);
	writeln('Los dos codigos de genero musical con mayor cantidad de visualizaciones son: ', cod1, ' y ', cod2);
	writeln('La cantidad de sesiones del genero Reggaeton cuya cantidad de visualizaciones contiene la misma cantidad de digitos pares e impares es: ',
contador);
end;

{programa principal}
var
	l: listaB;
	v: vectorvisitas;
begin
	l:= nil;
	inicializarVector(v);
	cargarLista(l);
	procesarLista(l, v);
end.
