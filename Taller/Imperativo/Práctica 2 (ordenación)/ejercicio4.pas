program ejercicio4;
const
	corte = 0;
	dimF = 8; // Dim. F. del vector de rubros
	dimF2 = 30; // Dim. F. del vector del pedido en el punto C
type
	r_rubro = 1..dimF;
	producto = record
		codigoProd: integer;
		codigoRubro: r_rubro;
		precio: real;
	end;
	lista = ^nodo;
	nodo = record
		dato: producto;
		sig: lista;
	end;
	vectorRubros = array[r_rubro] of lista;
	vectorC = array[1..dimF2] of producto;
procedure insertarOrdenado(var l: lista; data: producto);
var
	aux, ant, act: lista;
begin
	new(aux);
	aux^.dato:= data;
	aux^.sig:= l;
	if (l = nil) then begin
		l:= aux;
	end else begin
		ant:= l;
		act:= l;
		while (act <> nil) and (act^.dato.codigoProd < aux^.dato.codigoProd) do begin
		// recorrer la lista hasta encontrar un lugar adecuado
			ant:= act; // pasaje de direcciones de memoria
			act:= act^.sig;
		end;
		if (act = l) then begin
			aux^.sig:= l;
			l:= aux;
		end else begin
			ant^.sig:= aux; // Lazo para conectar el nuevo elemento insertado
			aux^.sig:= act;
		end;
	end;
end;
procedure leerProducto(var p: producto);
begin
	write('Precio: '); readln(p.precio);
	if (p.precio <> corte) then begin // la lectura se corta cuando se pasa un 0 como precio
		write('Codigo del producto: '); readln(p.codigoProd);
		write('Codigo del rubro: '); readln(p.codigoRubro);
	end;
end;
procedure cargarEstructura(var v: vectorRubros);
var
	p: producto;
begin
	leerProducto(p);
	while (p.precio <> corte) do begin // mientras el precio leído sea distinto de 0...
		insertarOrdenado(v[p.codigoRubro], p); // acceder a la lista con índice 'p.codigoRubro' del vector e insertar un producto ordenadamente
		writeln;
		leerProducto(p);
	end;
end;
procedure leerEstructura(v: vectorRubros);
var
	aux: lista; // para recorrer las listas
	i: integer;
begin
	for i:= 1 to dimF do begin
		aux:= v[i]; // asignarle a AUX la dirección de memoria de la lista número i
		if (aux <> nil) then begin
			writeln('Rubro nro. ', aux^.dato.codigoRubro);
			while (aux <> nil) do begin // Recorrer la lista hasta que la dirección de AUX sea NIL
				writeln('Codigo del producto: ', aux^.dato.codigoProd);
				aux:= aux^.sig; // avanzar al siguiente elemento
			end;
			writeln;
		end;
	end;
end;
procedure cargarEstructura2(v: vectorRubros; var v2: vectorC; var dimL: integer);
var
	i: integer;
begin
	i:= 0;
	// Recorrer la lista del rubro 3
	while (v[3] <> nil) and (i < dimF2) do begin
		i:= i + 1;
		v2[i]:= v[3]^.dato; // Insertar elemento de la lista en el vector
		v[3]:= v[3]^.sig;
	end;
	dimL:= i; // La dimensión lógica es igual a las veces que se iteró en el WHILE
end;
procedure burbuja(var v2: vectorC; dimL: integer);
var
	i, j: integer;
	temp: producto;
begin
	for i:= 1 to dimL do begin
		for j:= 1 to (dimL - i) do begin
			if (v2[j].precio < v2[j+1].precio) then begin // Realizar el intercambio de elementos
				temp:= v2[j];
				v2[j]:= v2[j+1];
				v2[j+1]:= temp;
			end;
		end;
	end;
end;
procedure leerEstructura2(v2: vectorC; dimL: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do begin
		writeln('Precio ', v2[i].precio:2:2, ' / código ', v2[i].codigoprod, ' / rubro ', v2[i].codigoRubro);
	end;
end;
function promedioEstructura2(v2: vectorC; dimL: integer): real;
var
	i: integer;
	prom: real;
begin
	prom:= 0;
	for i:= 1 to dimL do begin
		prom:= prom + v2[i].precio;
	end;
	promedioEstructura2:= prom/dimL;
end;
VAR
	vector1: vectorRubros;
	vector2: vectorC;
	dimL: integer;
begin
	dimL:= 0;
	cargarEstructura(vector1); // MÓDULO A
	leerEstructura(vector1); // MÓDULO B
	cargarEstructura2(vector1, vector2, dimL); // MÓDULO C
	burbuja(vector2, dimL); // MÓDULO D
	leerEstructura2(vector2, dimL); // MÓDULO E
	write('El promedio de los precios del segundo vector es: ', promedioEstructura2(vector2, dimL):2:2); // MÓDULO F
end.
