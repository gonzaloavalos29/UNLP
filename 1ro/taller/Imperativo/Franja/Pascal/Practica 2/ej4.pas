{Escribir un programa con:
a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 0 y
menores a 100.
b. Un módulo recursivo que devuelva el máximo valor del vector.
c. Un módulo recursivo que devuelva la suma de los valores contenidos en el vector.}
program ej4;
const
	dimF= 20;
Type
	vect= Array[1..dimF] of integer;

procedure leerNum(var v: vect; var dimL: integer);
var
	n: integer;
begin
	n:= Random(99)+1;
	if (dimL < dimF)then begin
		dimL:= dimL+1;
		v[dimL]:= n;
		leerNum(v,dimL);
	end;
end;

function buscarMax(v:vect; pI: integer; var max: integer):integer;
begin
	if (pI < dimF)then begin
		if (v[pI] > max)then
			max:= v[pI];
		buscarMax(v, pI+1, max);
	end;
	buscarMax:= max;
end;

function suma(v: vect; pI: integer; var sumaa: integer): integer;
begin
	if (pI < dimF)then begin
		sumaa:= sumaa + v[pI];
		suma(v, pI+1, sumaa);
	end;
	suma:= sumaa;
end; 

var
	vec: vect;
	dimL, max, pI, total: integer;
Begin
	pI:= 1;
	dimL:= 0;
	max:= -1;
	total:= 0;
	Randomize;
	leerNum(vec, dimL);
	max:= buscarMax(vec, pI, max);
	writeln('El numero maximo del vector es: ',max);
	total:= suma(vec, pI, total);
	writeln('La suma total del vector es: ',total);
end.
