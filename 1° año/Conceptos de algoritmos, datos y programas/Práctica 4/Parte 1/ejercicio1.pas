program ejercicio5;
const
	maxValor= 10;
	fin= 0;
type
	vNumeros = array[1..maxValor] of integer;
	numerosVector = 1..100;
	
procedure leerVector(vector: vNumeros);
var
	i: integer;
begin
	for i:=1 to maxValor do
		write('[', vector[i], ']');
		writeln('');
end;
	
procedure cargarVector(var vector: vNumeros);
var
	i: integer;
begin
	//i:= 1;
	//writeln('Ingrese un numero a cargar en el vector (ingrese 0 para terminar): ');
	writeln('Ingrese 10 numeros ');
	for i:=1 to maxValor do
		readln(vector[i]);
	leerVector(vector);
	//while ((vector[i]<>fin) and (i<=maxValor)) do begin
		//readln(vector[i]);
		//i:= i+1;
	//end;
end;
	
function buscarPosicion(vector: vNumeros; x: integer): integer;
var
	i: integer;
begin
	for i:=1 to maxValor do
		if (x=vector[i]) then
			buscarPosicion:= i
		else
			buscarPosicion:= -1;
end;

procedure modificarVector(x, y: numerosVector; var vector: vNumeros);
var
	aux, posNum1, posNum2: integer;
begin
	posNum1:= buscarPosicion(vector, x);
	posNum2:= buscarPosicion(vector, y);
	aux:= posNum1;
	vector[posNum1]:= vector[posNum2];
	vector[posNum2]:= vector[aux];
end;

function sumarVector(vector: vNumeros; var suma: integer): integer;
var
	i: integer;
begin
	for i:=1 to maxValor do
		suma:= suma + vector[i];
	sumarVector:= suma;
end;

function calcularPromedio(vector: vNumeros; var promedio: integer; suma: integer): integer;
begin
	sumarVector(vector, suma);
	promedio:= suma DIV maxValor;
	calcularPromedio:= promedio;
end;

function calcularMinimo(vector: vNumeros; var minimo: integer): integer;
var
	i: integer;
begin
	minimo:= 999;
	for i:=1 to maxValor do begin
		if (vector[i]<minimo) then
			minimo:= vector[i];
	end;
	calcularMinimo:= minimo;
end;

function calcularMaximo(vector: vNumeros; var maximo: integer): integer;
var
	i: integer;
begin
	maximo:= -1;
	for i:=1 to maxValor do begin
		if (vector[i]>maximo) then
			maximo:= vector[i];
	end;
	calcularMaximo:= maximo;
end;


var
	vector: vNumeros;
	maximo, minimo: integer;
begin
	maximo:= 0; minimo:= 0;
	cargarVector(vector);
	calcularMinimo(vector, minimo);
	calcularMaximo(vector, maximo);
	modificarVector(maximo, minimo, vector);
	leerVector(vector);
	writeln('El elemento maximo que se encontraba en la posicion ', maximo, ' fue intercambiado con el elemento minimo que se encontraba en la posicion ', minimo);
end.
