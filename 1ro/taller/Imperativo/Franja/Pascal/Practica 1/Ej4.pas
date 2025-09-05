{Una librería requiere el procesamiento de la información de sus productos. De cada
producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de los productos y los almacene ordenados por código de producto y
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza
cuando se lee el precio 0.
b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que
puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3
es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.
d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos
métodos vistos en la teoría.
e. Muestre los precios del vector resultante del punto d).
f. Calcule el promedio de los precios del vector resultante del punto d).}
program Ej4;
const
	dimF= 8;
	dimF2= 30;
Type
	subr= 1..dimF;
	prod= record
		codP: integer;
		codR: subr;
		precio: real;
	end;
	lista= ^nodo;
	nodo= record
		dato: prod;
		sig: lista;
	end;
	vecProd= Array[subr] of lista;
	vecGen3= Array[1..30] of prod;
	
procedure inicializarListas(var vec: vecProd);
var
	i:integer;
begin
	for i:= 1 to dimF do begin
		vec[i]:= nil;
	end;
end;

procedure leerProducto(var p: prod);
begin
	//write('Ingresar cod producto: ');readln(p.codP);
	p.codP:= Random(99);
	//write('Ingresar codigo de rubro: ');readln(p.codR);
	p.codR:= Random(8);
	write('Ingresar precio: ');readln(p.precio);
end;

procedure insertarOrdenado(var pri:lista; p:prod);
var
	act,nue,ant:lista;
begin
	new(nue);
	nue^.dato:=p;
	nue^.sig:=nil;
	if (pri=nil) then
		pri:=nue
	else begin
		act:=pri;
		ant:=pri;
		while (act<>nil) and (act^.dato.codR <p.codR) do begin
			ant:=act;
			act:=act^.sig;
		end;
		if (ant=act) then begin
			nue^.sig:=pri;
			pri:=nue;
		end
		else begin
			ant^.sig:=nue;
			nue^.sig:=act;
		end;
	end;
end;

procedure cargarListas(var vec: vecProd);
var
	p:prod;
begin
	leerProducto(p);
	while (p.precio <> 0)do begin
		insertarOrdenado(vec[p.codR], p);
		leerProducto(p);
	end;
end;

procedure mostrarCodRubros(vec: vecProd);
var
	i:integer;
	act: lista;
begin
	for i:= 1 to dimF do begin
		act:= vec[i];
		writeln('Codigos de peliculas del rubro ',i);
		while (act <> nil)do begin
			write(act^.dato.codP,' - ');
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
	while (aux <> nil) and (dimL < dimF2)do begin
		dimL:= dimL +1;
		vec[dimL]:= aux^.dato;
		aux:= aux^.sig;
	end;
end;

procedure ordenacionInsercion (var v: vecGen3; dimL: integer);
var
	j, i: integer; 
	aux: prod;
begin
	for i:= 2 to dimL do  begin
		aux:= v[i];
		j:= i-1;
		while (j > 0) and (v[j].precio > aux.precio) do begin
			v[j+1] := v[j];
			j:= j -1;
		end;
		v[j+1]:= aux;
	end;
end;

procedure mostrarVect(v: vecGen3; dimL: integer; var prom: real);
var
	i:integer;
	total: real;
begin
	total:= 0;
	for i:= 1 to dimL do begin
		writeln('Precio de producto ',i,': ',v[i].precio:0:2);
		total:= total + v[i].precio;				// Hago inciso F aca para no tener que volver a leer todo
	end;
	prom:= total / dimL;
end;

var
	vect: vecProd;
	vect2: vecGen3;
	dimL: integer;
	prom: real;
Begin
	prom:= 0;		// Solamente para que no tire warning rojo molesto
	inicializarListas(vect);
	cargarListas(vect);
	mostrarCodRubros(vect);		// Inciso B
	dimL:= 0;
	leerGen3(vect[3],vect2,dimL);		// Inciso C
	ordenacionInsercion(vect2,dimL);	// Inciso D
	mostrarVect(vect2,dimL, prom);		// Inciso E y F
	writeln('El promedio de los productos del tercer rubro es de: ',prom:0:2);
end.
