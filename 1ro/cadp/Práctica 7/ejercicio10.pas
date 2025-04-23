program insumosAgricolas;
const
	fin = -1;
	maxCultivos = 20;
type
	cultivo = record
		tipo: string; // Trigo, maiz, soja, girasol, etc...
		hectareas: integer;
		meses: integer;
	end;
	vector_cultivos = array[1..maxCultivos] of cultivo; // maxCultivos = dimensión lógica
	empresa = record
		codigo: integer;
		nombre: string;
		tipo: integer; // estatal: 1, privada: 2
		ciudad: string;
		cult: vector_cultivos;
		dimL: integer;
	end;
	lista = ^nodo;
	nodo = record
		dato: empresa;
		sig: lista;
	end;
procedure leerCultivo(var c: cultivo);
begin
	readln(c.tipo);
	readln(c.hectareas);
	readln(c.meses);
end;
procedure leerEmpresa(var e: empresa);
var
	c: cultivo;
	i: integer;
begin
	readln(e.codigo);
	readln(e.nombre);
	readln(e.tipo);
	readln(e.ciudad);
	leerCultivo(c);
	i:= 1;
	e.dimL:= 0;
	while (i <= maxCultivos) and (c.hectareas <> fin) do begin
		e.dimL:= e.dimL + 1;
		e.cult[i]:= c;
		leerCultivo(c);
		i:= i + 1;
	end;
end;
procedure agregarNodo(var l: lista; e: empresa);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= e;
	nue^.sig:= l;
	l:= nue;
end;
procedure cargarLista(var l: lista);
var
	e: empresa;
begin
	leerEmpresa(e);
	while (e.codigo <> fin) do begin
		agregarNodo(l, e);
		leerEmpresa(e);
	end;
end;
function poseeDosCeros(codigo: integer): boolean;
var
	ceros: integer;
begin
	ceros:= 0;
	while (codigo <> 0) do begin
		if ((codigo mod 10) = 0) then
			ceros:= ceros + 1;
		codigo:= codigo div 10;
	end;
	poseeDosCeros:= (ceros = 2);
end;
{ b. Nombres de las empresas radicadas en “San Miguel del Monte” que cultivan trigo y cuyo código 
de empresa posee al menos dos ceros.
c. La cantidad de hectáreas dedicadas al cultivo de soja y qué porcentaje representa con respecto 
al total de hectáreas.
d. La empresa que dedica más tiempo al cultivo de maíz
e. Realizar un módulo que incremente en un mes los tiempos de cultivos de girasol de menos de 5 
hectáreas de todas las empresas que no son estatales. }
procedure procesar(l: lista);
var
	empresaActual, empresaMax: string;
	condicion: boolean;
	i, hectSoja, hectTotal, tiempoActual, tiempoMax: integer;
begin
	hectSoja:= 0;
	hectTotal:= 0;
	empresaMax:= '';
	tiempoMax:= -1;
	while (l <> nil) do begin
		empresaActual:= l^.dato.nombre;
		tiempoActual:= 0;
		condicion:= false;
		for i:= 1 to l^.dato.dimL do begin
			if (l^.dato.cult[i].tipo = 'trigo') then
				condicion:= true;
			if (l^.dato.cult[i].tipo = 'maiz') then
				tiempoActual:= tiempoActual + l^.dato.cult[i].meses;
			if (l^.dato.tipo = 2) and (l^.dato.cult[i].tipo = 'girasol') and (l^.dato.cult[i].hectareas < 5) then
				l^.dato.cult[i].meses:= l^.dato.cult[i].meses + 1;
				writeln('Tiempo aumentado: de ', l^.dato.cult[i].meses-1, ' a ', l^.dato.cult[i].meses);
			if (l^.dato.cult[i].tipo = 'soja') then
				hectSoja:= hectSoja + l^.dato.cult[i].hectareas;
			hectTotal:= hectTotal + l^.dato.cult[i].hectareas;
		end;
		if (l^.dato.ciudad = 'San Miguel del Monte') and (poseeDosCeros(l^.dato.codigo)) and (condicion) then
			writeln(l^.dato.nombre);
		if (tiempoActual > tiempoMax) then begin
			tiempoMax:= tiempoActual;
			empresaMax:= empresaActual;
		end;
		l:= l^.sig;
	end;
	writeln('Porcentaje que representa con respecto al total de hectareas: ', ((hectSoja/hectTotal)*100):2:2, '% de ', hectTotal);
	writeln('La empresa que dedica mas tiempo al cultivo de maiz ', empresaMax);
end;

var
	l: lista;
begin
	l:= nil;
	cargarLista(l);
	procesar(l);
end.
