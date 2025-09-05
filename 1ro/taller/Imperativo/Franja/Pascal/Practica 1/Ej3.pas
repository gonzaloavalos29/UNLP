{Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
diciembre de 2022. De cada película se conoce: código de película, código de género (1: acción,
2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y puntaje
promedio otorgado por las críticas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de
género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el
código de la película -1.
b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje
obtenido entre todas las críticas, a partir de la estructura generada en a)..
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos
métodos vistos en la teoría.
d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje,
del vector obtenido en el punto c).}
program Ej3;
const
	dimF= 8;
Type
	subg= 1..8;
	peliculas= record
	codPel: integer;
	codGen: subg;
	puntProm: real;
	end;
	maximos= record
		codMax: integer;
		punMax: real;
	end;
	lista= ^nodo;
	nodo= record
	dato: peliculas;
	sig: lista;
	end;
	peliculasMes= Array[1..dimF] of lista;
	vectorMax= Array[1..dimF] of maximos;

procedure leerPeli(var p: peliculas);
begin
	write('Ingresar cod pelicula: ');readln(p.codPel);
	if (p.codPel <> -1)then begin
		write('Ingresar genero: ');readln(p.codGen);
		//p.codGen:= Random(7)+1;
		p.puntProm:= Random(9)+1;
	end;
end;

procedure agregarAtras (var l: lista; p:peliculas);
var
    nuevo, actual, ant: lista;
Begin
    new(nuevo);
    nuevo^.sig:= nil;
    nuevo^.dato:=p;
    if (l = nil) then
        l:= nuevo
    else begin
        actual:= l;
        ant:= l;
        while (actual <> nil) do  begin
            ant:= actual;
            actual:= actual^.sig;
        end;
    ant^.sig:= nuevo;
    end;
end;

procedure cargarListas(var vec: peliculasMes);
var
	p:peliculas;
begin
	leerPeli(p);
	while (p.codPel <> -1)do begin
		agregarAtras(vec[p.codGen], p);
		leerPeli(p);
	end;
end;

procedure inicializarListas(var vec: peliculasMes);
var
	i: integer;
begin
	for i:= 1 to dimF do begin
		vec[i]:= nil;
	end;
end;

procedure inicializarMaximos(var vec: vectorMax);
var
	i: integer;
begin
	for i:= 1 to dimF do begin
		vec[i].codMax:= -1;
		vec[i].punMax:= -1;
	end;
end;

procedure buscarMaximos(var vecM: vectorMax; vec: peliculasMes);
var
	i: integer;
	act: lista;
begin
	for i:= 1 to dimF do begin
		act:= vec[i];
		while(act <> nil) do begin
			if(act^.dato.puntProm > vecM[i].punMax)then begin
				vecM[i].punMax:= act^.dato.puntProm;
				vecM[i].codMax:= act^.dato.codPel;
			end;
			act:= act^.sig;
		end;
	end;
end;

procedure ordenacionInsercion (var v: vectorMax);
var
	j, i: integer; 
	aux: maximos;
begin
	for i:= 2 to dimF do  begin
		aux:= v[i];
		j:= i-1;
		while (j > 0) and (v[j].punMax > aux.punMax) do begin
			v[j+1] := v[j];
			j:= j -1;
		end;
		v[j+1]:= aux;
	end;
end;

procedure mostrarVecMax(v: vectorMax);
var
	i: integer;
begin
	for i:= dimF downto 1 do begin
		if (i = dimF)then
			writeln('El codigo de pelicula con mayor puntaje es: ',v[i].codMax);
		if (i = 1)then
			writeln('El codigo de pelicula con menor puntaje es: ',v[i].codMax);
	end;
end;

var
	vector: peliculasMes;
	vector2: vectorMax;
Begin
	Randomize;
	inicializarListas(vector);
	cargarListas(vector);		// Lee todas las peliculas y ordena por orden de llegada
	inicializarMaximos(vector2);
	buscarMaximos(vector2, vector);		// Hasta aca inciso B
	ordenacionInsercion(vector2);	// Inciso C
	mostrarVecMax(vector2);			// Inciso D
end.
