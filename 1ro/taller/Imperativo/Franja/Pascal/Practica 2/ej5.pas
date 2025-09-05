{Implementar un módulo que realice una búsqueda dicotómica en un vector, utilizando el
siguiente encabezado:
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector.}
program ej5;
const
	dimF= 20;
Type
	vector= Array[1..dimF] of integer;

procedure leerNum(var v: vector; var dimL: integer);
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

procedure imprimirVec(v:vector; pI: integer);
begin
	if (pI < dimF)then begin
		write(' ',v[pI]);
		imprimirVec(v, pI+1);
	end;
end;

Procedure busquedaDicotomica (v: vector; ini,fin: integer; dato:integer; var pos: integer);
var
	aux: integer;
begin
	if (pos <> 0)then begin
		aux:= (fin-ini) div 2;
		if (v[aux] = dato)then begin
			pos:= aux;
			writeln('Encontrado en pos ',aux)
		end
		else begin if(dato < v[aux])then
			busquedaDicotomica(v, ini, aux, dato, pos)
		else 
			busquedaDicotomica(v, aux, fin, dato, pos);
		end;
	end;
end;

var
	vec: vector;
	dimL: integer;
	ini, pos: integer;
	valor: integer;
Begin
	Randomize;
	dimL:= 0;
	leerNum(vec, dimL);
	ini:= 1;
	imprimirVec(vec, ini);
	writeln('');
	pos:= -1;
	write('Ingresar valor que deseas buscar: ');readln(valor);
	busquedaDicotomica(vec,ini, dimL, valor, pos);
	if (pos <> -1)then
		writeln('Encontrado');
end.
