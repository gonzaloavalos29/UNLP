{
* En un hospital se leen datos de consultas hasta que se lea el día número 0.
a) De cada consulta se lee:
• Matrícula del médico.
• DNI del paciente.
• Día de la consulta.
• Código de diagnóstico (1 a 15).
Crear una estructura eficiente para la búsqueda por matrícula del médico, donde cada matrícula está acompañada de todas las consultas al médico.

b) Usando la estructura del inciso a), hacer un módulo que reciba la misma estructura y una matrícula, el módulo debe retornar la información ordenada de cuántas veces fue diagnosticado cada código.

c) En base a la estructura de b), hacer un modulo que retorne la misma estructura pero ordenada de mayor a menor.
* }

program examen;

const
	dimF = 15;
// Inciso A Modulo LeerDatos, corta en dia numero 0, crear un arbol donde se acumulen los datos por matrícula de médico.
type
	code = 0..15;
	dia = 0..31;
	consulta = record
		dia: dia;
		DNI: integer;
		codigo: code;
		matricula: integer;
	end;
	
	consultaReducida = record
		dia: dia;
		DNI: integer;
		code: code;
	end;
	
	lista = ^nodoL;
	nodoL = record
		dato: consultaReducida;
		sig: lista;
	end;
	
	arbol = ^nodoA;
	nodoA = record
		matricula: integer;
		HI, HD: arbol;
		l: lista;
	end;
	
	vector_codigos = array[code] of integer; // vector contador de 

procedure leerConsulta(var c: consulta);
begin
	writeln('Ingrese el dia de la consulta: '); read(c.dia);
	if (c.dia <> 0) then begin
		write('Ingrese el codigo de la consulta: '); readln(c.codigo);
		write('Ingrese el DNI de la consulta: '); readln(c.matricula);
		write('Ingrese el  de la consulta: '); readln(c.DNI);
	end;
end;

procedure agregarAdelante(var L: lista; c: consulta);
var
	aux: lista;
begin
	new(aux);
	aux^.dato.dia:= c.dia;
	aux^.dato.code:= c.codigo;
	aux^.dato.DNI:= c.DNI;
	aux^.sig:= L;
	L:= aux;
end;

procedure agregarAcumulando(var a: arbol; c: consulta);
begin
	if (a = nil) then begin // Arbol vacío
		new(a);
		a^.L:= nil;
		agregarAdelante(a^.l, c);
		a^.matricula:= c.matricula;
		a^.HD:= nil;
		a^.HI:= nil;
	end else if (a^.matricula = c.matricula) then begin // Encontre el nodo donde debo acumular los datos
		agregarAdelante(a^.l, c);
	end else if (a^.matricula > c.matricula) then begin // Encontre una matricula mayor que la que recibí. Me voy a la izquierda.
		agregarAcumulando(a^.HI, c);
	end else
		agregarAcumulando(a^.HD, c); // Encontre una matrícula menor. Me voy a la derecha.
end;

procedure crearArbol(var a: arbol);
var
	c: consulta;
begin
	leerConsulta(c);
	if (c.dia <> 0) then begin
		agregarAcumulando(a, c);
		leerConsulta(c);
	end;
end;

procedure inicializarVector(var v: vector_codigos);
var
	i: integer;
begin
	for i:= 1 to dimF do
		v[i]:= 0
end;

procedure buscarMatricula(a: arbol; var l: lista; mat: integer);
begin
	if (a <> nil) then begin
		if (a^.matricula = mat) then
			l:= a^.l
		else if (a^.matricula > mat) then
			buscarMatricula(a^.HI, l, mat)
		else
			buscarMatricula(a^.HD, l, mat);
	end;
end; 

procedure recorrerCargando(var v: vector_codigos; l: lista);
begin
	while (l <> nil) do begin
		v[l^.dato.dia]:= v[l^.dato.dia] + 1;
		l:= l^.sig;
	end;
end;
		

procedure incisoB(a: arbol; mat: integer; var v: vector_codigos);
var
	l: lista;
begin
	inicializarVector(v);
	buscarMatricula(a, l, mat);
	recorrerCargando(v, l);
end;

procedure incisoC(var v: vector_codigos); // Ordenar por Selección.
var
	i, j, pos: integer;									// Ipij jp pj salvo p.
	aux: integer;
begin
	for i:= 1 to dimF-1 do begin
		pos:= i;
		for j:= i+1 to dimF do begin
			if (v[j] > v[pos]) then
				pos:= j;
		end;
		aux:= v[pos];
		v[pos]:= v[i];
		v[i]:= aux;
	end;
end;

VAR
	a: arbol;
	v: vector_codigos;
	mat: integer;
BEGIN
	a:= nil;
	
	// INCISO A
	crearArbol(a);
	
	// INCISO B
	writeln('Ingrese una matricula de la que pueda retornar los datos ordenados por codigo de diagnóstico: '); readln(mat);
	if (a <> nil) then begin
		incisoB(a, mat, v);
		incisoC(v);
	end else
		write('Arbol vacio')
END.
