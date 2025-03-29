program p3ej1;
type
	socios = record
		nroSocio: integer;
		nombre: string;
		edad: integer;
	end;
	arbol = ^nodo;
	nodo = record
		dato: socios;
		hi: arbol;
		hd: arbol;
	end;
	
procedure leerSocio(var s: socios);
begin
	write('Ingresar nro de socio: '); readln(s.nroSocio);
	if (s.nroSocio <> 0) then begin
		write('Ingresar nombre: '); readln(s.nombre);
		write('Ingresar edad: '); readln(s.edad);
	end;
end;

procedure crearHoja(var a: arbol; s: socios);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:= s;
		a^.hi:= nil;
		a^.hd:= nil;
	end else if (s.nroSocio <= a^.dato.nroSocio) then
		crearHoja(a^.hi, s)
	else
		crearHoja(a^.hd, s);
end;

procedure crearArbol(var a: arbol);
var
	s: socios;
begin
	leerSocio(s);
	while (s.nroSocio <> 0) do begin
		crearHoja(a, s);
		leerSocio(s);
	end;
end;

procedure buscarNSocioMax(a: arbol; var max: integer);
begin
	if (a <> nil) then begin
		buscarNSocioMax(a^.hi, max);
		if (a^.dato.nroSocio > max) then
			max:= a^.dato.nroSocio;
		buscarNSocioMax(a^.hd, max);
	end;
end;

procedure buscarNSocioMin(a: arbol; var min: integer; var socioMin: socios);
begin
	if (a <> nil) then begin
		buscarNSocioMin(a^.hi, min, socioMin);
		if (a^.dato.nroSocio < min) then begin
			min:= a^.dato.nroSocio;
			socioMin:= a^.dato;
		end;
		buscarNSocioMin(a^.hd, min, socioMin);
	end;
end;

procedure buscarNSocioMaxEdad(a: arbol; var edadMax, socioEdadMax: integer);
begin
	if (a <> nil) then begin
		buscarNSocioMax(a^.hi, edadMax);
		if (a^.dato.edad > edadMax) then begin
			edadMax:= a^.dato.edad;
			socioEdadMax:= a^.dato.nroSocio;
		end;
		buscarNSocioMax(a^.hd, edadMax);
	end;
end;

procedure aumentar(a: arbol);
begin
	if (a <> nil) then begin
		aumentar(a^.hi);
		a^.dato.edad:= a^.dato.edad+1;
		aumentar(a^.hd);
	end;
end;

procedure imprimir(a: arbol);
begin
	if (a <> nil) then begin
		imprimir(a^.hi);
		write(' ', a^.dato.edad, ' de socio nro ', a^.dato.nroSocio);
		imprimir(a^.hd);
	end;
end;

function buscarValor(a: arbol; num: integer): boolean;
begin
	if (a = nil) then
		buscarValor:= false
	else if (a^.dato.nroSocio = num) then
		buscarValor:= true
	else
		buscarValor:= buscarValor(a^.hi, num) or buscarValor(a^.hd, num); // busco en hojas izquierda y derecha.
end;

function buscarNombre(a: arbol; nom: string): boolean;
begin
	if (a = nil) then
		buscarNombre:= false
	else if (a^.dato.nombre = nom) then
		buscarNombre:= true
	else
		buscarNombre:= buscarNombre(a^.hi, nom) or buscarNombre(a^.hd, nom); // busco en hojas izquierda y derecha.
end;

procedure contar(a: arbol; var cant: integer);
begin
	if (a <> nil) then begin
		contar(a^.hi, cant);
		cant:= cant + 1;
		contar(a^.hd, cant);
	end;
end;

procedure contarEdad(a: arbol; var edadT: integer);
begin
	if (a <> nil) then begin
		contarEdad(a^.hi, edadT);
		edadT:= edadT + a^.dato.edad;
		contarEdad(a^.hd, edadT);
	end;
end;

procedure imprimirOrdenCreciente(a: arbol);
begin
	if (a <> nil) then begin
		imprimirOrdenCreciente(a^.hi);
		write(a^.dato.nroSocio, ' ');
		imprimirOrdenCreciente(a^.hd);
	end;
end;

procedure imprimirOrdenDecreciente(a: arbol);
begin
	if (a <> nil) then begin
		imprimirOrdenDecreciente(a^.hd);
		write(a^.dato.nroSocio);
		imprimirOrdenDecreciente(a^.hi);
	end;
end;

VAR
	a: arbol;
	socioMasChico: socios;
	min, max, edadMax, socioMax, valor, cantSocios, edad: integer;
	nombre: string;
	encontre, encontreNombre: boolean;
BEGIN
	a:= nil; max:= -1; min:= 999; edadMax:= -1; cantSocios:= 0; edad:= 0; valor:= 10; nombre:= 'Gonzalo';
	crearArbol(a); // Inciso A
	buscarNSocioMax(a, max); // 1
	buscarNSocioMin(a, min, socioMasChico); // 2
	buscarNSocioMaxEdad(a, edadMax, socioMax); // 3
	aumentar(a); // 4
	imprimir(a); 
	encontre:= buscarValor(a, valor); // 5
	writeln('Valor: ', valor);
	encontreNombre:= buscarNombre(a, nombre); // 6
	writeln('Nombre: ', nombre);
	contar(a, cantSocios); // 7
	contarEdad(a, edad);
	writeln('El promedio de edad de los socios es: ', (edad DIV cantSocios)); // 8
	imprimirOrdenCreciente(a); // 9
	imprimirOrdenDecreciente(a); // 10
	
END.
