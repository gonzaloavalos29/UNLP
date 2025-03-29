program p2ejercicio3;
const
	dimF = 20;
type
	indice = -1..20;
	vectorRandom = array[indice] of integer;
	
procedure cargarVector(var v: vectorRandom; var i: integer);
begin
	if (i <= dimF) then begin
		i:= i+1;
		v[i]:= Random(1551-300+1)+300;
		write(v[i], ' ');
		cargarVector(v, i);
	end;
end;

procedure imprimirVector(v: vectorRandom);
var
	i: integer;
begin
	for i:= 1 to dimF do
		write(v[i], ' ')
end;

procedure insercion(var v: vectorRandom);
var
	i, j, actual: integer;
begin
	for i:= 2 to dimF do begin
		actual:= v[i];
		j:= i-1;
		while (j > 0) and (actual < v[j]) do begin
			v[j+1]:= v[j];
			j:= j-1;
		end;
		v[j+1]:= actual;
	end;
end;
		

procedure busquedaDicotomica(v: vectorRandom; ini, fin: indice; dato: integer; var pos: indice);
var
	medio, valor: integer;
begin
	medio:= (ini + fin) DIV 2;
	while (ini <= fin) and (dato <> v[medio]) do begin
		if (dato < v[medio]) then
			fin:= medio - 1
		else
			ini:= medio + 1;
		medio:= (ini + fin) DIV 2;
	end;
	if (ini <= fin) and (dato = v[medio]) then
		valor:= medio
	else
		valor:= -1;
	pos:= valor;
end;

VAR
	v: vectorRandom;
	i, dato: integer;
	ini, fin, pos: indice;
BEGIN
	ini:= 1; fin:= 20; pos:= -1; dato:= 300; i:= 0;
	Randomize;
	cargarVector(v, i); // INCISO A
	writeln;
	imprimirVector(v); 
	writeln;
	insercion(v); // INCISO B
	imprimirVector(v);
	busquedaDicotomica(v, ini, fin, dato, pos); // INCISO C
	writeln;
	write('Pos: ', pos);
END.
