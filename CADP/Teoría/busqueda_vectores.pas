// Vector desordenado: se debe recorrer todo el vector y detener la búsqueda en el momento que se encuentra el dato o que se termine el vector.
// Vector ordenado: se recorre el vector teniendo en cuenta la busqueda mejorada y busqueda binaria.

// Busqueda en vector desordenado
function buscar(a: numeros; dL: integer; valor: integer): boolean;
var
	pos: integer;
	esta: boolean;
begin
	esta:= false;
	pos:= 1;
	while ((pos <= dL) and (not esta)) do
		begin
			if (a[pos] = valor) then esta:= true
			else
				pos:= pos + 1;
		end;
	buscar:= esta;
end;

// Busqueda mejorada en vector ordenado
function existe (a: numeros; dL: integer; valor: integer): boolean;
var
	pos: integer;
begin
	pos:= 1;
	while ((pos <= dL) and (a[pos]<num)) do
		begin	
			pos:= pos + 1;
		end;
	if ((pos <= dL) and (a[pos]= num)) then existe:= true
	else buscar:= false;
end;

//Busqueda dicotómica o binaria
function buscar(a: numeros; dL: integer; valor: integer): boolean;
var
	pri, ult, medio: integer;
	ok: boolean;
begin
	ok:= false;
	pri:= 1; ult:= dL; medio:= (pri + ult) div 2;
	while (pri <= ult) and (valor <> vec[medio]) do
		begin
			if (valor < vec[medio]) then
				ult:= medio - 1;
			else pri:= medio + 1;
			medio:= (pri + ult) div 2;
		end;
	if (pri <= ult) and (valor = vec[medio]) then ok:= true;
end;

// Programa principal
program uno;
const
	fisica = 10;
type
	numeros = array [1..fisica] of integer;
	
var
	VN: numeros;
	dimL, valor: integer;
	ok: boolean;
begin
	cargar(VN, dimL);
	read(valor);
	res:= buscar(VN, dimL, valor); // desordenado
	ok:= existe(VN, dimL, valor); // ordenado
end.
