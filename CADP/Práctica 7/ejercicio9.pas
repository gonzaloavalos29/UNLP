program cine;
const
	fin = -1;
type
	r_genero = 1..8;
	pelicula = record
		codigo: integer;
		titulo: string;
		genero: r_genero;
		puntaje: real;
	end;
	
	critica = record
		dni: longint;
		nombre: string;
		apellido: string;
		codigo: integer;
		puntaje: real;
	end;
	lista = ^nodo;
	nodo = record
		dato: pelicula;
		sig: lista;
	end;
	lista2 = ^nodo2;
	nodo2 = record
		dato: critica;
		sig: lista2;
	end;
	// Vector de categoría de películas
	v_genero = array[r_genero] of real;
	
//ESTOS MÓDULOS "SE DISPONEN", PERO LOS ESCRIBO IGUAL PARA QUE FUNCIONE EL PROGRAMA
procedure leerPelicula(var p: pelicula); //Módulo que lee los registros de películas
    begin
        with p do begin
            write('Código de la película: '); readln(codigo);
            write('Título de la película: '); readln(titulo);
            write('Código del género: '); readln(genero);
            write('Puntaje promedio de la crítica: '); readln(puntaje);
        end;
    end;
procedure agregarNodo(var l: lista; p: pelicula); //Módulo que agrega un nodo a la lista de adelante
    var
        aux: lista;
    begin
        new(aux); //Asignarle una posición de memoria al nodo auxiliar
        aux^.dato:= p; //Asignarle en la posición de memoria que apunta el registro cargado
        aux^.sig:= nil; //Asignarle como su siguiente "nil"
        if (l <> nil) then //Si la lista no está vacía...
            aux^.sig:= l; //Asignarle como su siguiente la dirección del nodo ingresado
        l:= aux; //Asignarle al nodo ingresado la dirección del nodo auxiliar
    end;
procedure cargarLista(var l: lista); //La lista de películas que tiene el cine
    var
        p: pelicula;
        seguir: integer;
    begin
        seguir:= -1;
        while (seguir <> 0) do begin
            leerPelicula(p);
            agregarNodo(l, p);
            write('¿Seguir ingresando? (0/1): '); readln(seguir);
            writeln;
        end;
    end;
	
procedure leerCritica(var c: critica);
begin
	readln(c.dni);
	readln(c.apellido);
	readln(c.nombre);
	readln(c.codigo);
	readln(c.puntaje);
end;

//Insertar nodos de manera ordenada "la información viene ordenada por código de película"
procedure insertarOrdenado(var l: lista2; c: critica);
var
	ant, act, aux: lista2;
begin
	new(aux);
	aux^.dato:= c;
	ant:= l;
	act:= l;
	while (act <> nil) and (act^.dato.codigo < c.codigo) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (ant = act) then
		l:= aux
	else
		ant^.sig:= aux;
	aux^.sig:= act;
end;

procedure cargarLista2(var l: lista2);
var
	c: critica;
begin
	leerCritica(c);
	while (l^.dato.codigo <> fin) do begin
		insertarOrdenado(l, c);
		leerCritica(c);
	end;
end;

function mismaCantParesImpares(dni: longint): boolean;
var
	pares, impares: integer;
begin
	pares:= 0; impares:= 0;
	while (dni <> 0) do begin
		if (dni mod 10) mod 2 = 0 then
			pares:= pares + 1
		else
			impares:= impares + 1;
		dni:= dni div 10;
	end;
	mismaCantParesImpares:= (pares = impares);
end;

// PUNTO A
procedure actualizarLista(var l: lista; l2: lista2);
var
	codigoActual, aux1: integer;
	puntajePromedio: real;
	aux: lista;
begin
	while (l2 <> nil) do begin
		codigoActual:= l2^.dato.codigo;
		puntajePromedio:= 0;
		aux1:= 0; // guarda la cantidad de peliculas del mismo codigo
		while (l2 <> nil) and (codigoActual = l2^.dato.codigo) do begin
			puntajePromedio:= puntajePromedio + l2^.dato.puntaje; // Agregar a la variable el puntaje
			aux1:= aux1 + 1;
			l2:= l2^.sig;
		end;
		// Buscar la película en la lista y actualizarla
		if (l2 <> nil) then begin
			aux:= l;
			while (aux <> nil) and (aux^.dato.codigo <> codigoActual) do begin // mientras no se haya alcanzado la última posición y no se haya alcanzado la posición con el código actual
				aux:= aux^.sig; // Recorrer la lista
			end;
			// Una vez encontrada la dirección (seguro existe) actualizar el valor del puntaje promedio
			puntajePromedio:= ((puntajePromedio / aux1) + aux^.dato.puntaje)/2; // Sumarle el promedio anterior y dividir todo por 2.
			aux^.dato.puntaje:= puntajePromedio;
			writeln('Puntaje promediado!');
		end;
	end;
end;
procedure calcularMaximo(l: lista; var categoriaMax: integer);
var
	v: v_genero;
	i: integer;
	puntajeMax: real;
begin
	puntajeMax:= -1;
	for i:= 1 to 8 do // Inicializar vector
		v[i]:= 0;
	while (l <> nil) do begin // Anotar puntajes por categoría
		v[l^.dato.genero]:= v[l^.dato.genero] + l^.dato.puntaje;
		l:= l^.sig;
	end;
	for i:= 1 to 8 do begin // Actualizar máximo
		if (v[i] > puntajeMax) then begin
			puntajeMax:= v[i];
			categoriaMax:= i;
		end;
	end;
end;

procedure evaluarDNI(l2: lista2);
begin
	while(l2 <> nil) do begin
		if(mismaCantParesImpares(l2^.dato.dni)) then
			writeln('El critico ', l2^.dato.nombre, ' ', l2^.dato.apellido, ' tiene un DNI con igual cant. de pares que impares (',l2^.dato.dni,')');
		l2:= l2^.sig;
	end;
end;

procedure eliminarElemento(var l: lista; codEliminar: integer);
var
	aux, ant: lista;
begin
	aux:= l;
	while (aux <> nil) and (aux^.dato.codigo <> codEliminar) do begin
		ant:= aux;
		aux:= aux^.sig;
	end;
	if (aux^.dato.codigo = codEliminar) then begin // Revisa si el código fue encontrado
		if (aux = l) then
			l:= l^.sig // Mover a L un lugar más a la derecha para eliminar la posición primera
		else
			ant^.sig:= aux^.sig;
		dispose(aux);
	end;
end;

// PROGRAMA PRINCIPAL
var
	l, aux: lista;
	l2, aux2: lista2;
	categoriaMax: integer;
begin
	l:= nil;
	l2:= nil;
	categoriaMax:= 0;
	cargarLista(l);
	cargarLista2(l2);
	actualizarLista(l, l2);
	{aux2:= l2;
	while (aux2 <> nil) do begin
		writeln('Codigo: ', aux2^.dato.codigo,' / Elemento: ', aux2^.dato.puntaje:2:2);
		aux2:= aux2^.sig;
	end;}
	calcularMaximo(l, categoriaMax);
	writeln('La categoria con mas puntaje es: ', categoriaMax);
	evaluarDNI(l2);
	eliminarElemento(l, 15);
	{aux:= l;
	writeln;
	while (aux <> nil) do begin
		writeln('Codigo: ', aux^.dato.codigo, ' / Nuevo puntaje promedio: ', aux^.dato.puntaje:2:2);
		aux:= aux^.sig;}
	end;
end.
