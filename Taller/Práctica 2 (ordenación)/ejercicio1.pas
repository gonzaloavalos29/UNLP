program ej1;
const
	max = 50;
	fin = 0;
type
	r_dias = 0..30;
	r_codigo = 1..15;
	r_cantidad = 1..99;
	
	venta = record
		dia: r_dias;
		codigo: r_codigo;
		cantidad: r_cantidad;
	end;
	vectorVentas = array[1..max] of venta;
	vectorCodigos = array[1..max] of integer;

{procedure inicializarVector(var v: vectorCodigos);
var
	i: integer;
begin
	for i:= 1 to max do 
		v[i]= 0
end;}

function esPar(num: integer): boolean;
begin
	esPar:= ((num mod 2) = 0);
end;
procedure generarVenta(var v: venta);
begin
	v.dia:= Random(30);
	if (v.dia <> fin) then begin
		v.codigo:= Random(15);
		v.cantidad:= Random(99);
	end;
end;
procedure cargarVector(var v: vectorVentas; var dimL: integer);
var
	i: integer;
	ven: venta;
begin
	i:= 1;
	ven.dia:= 1; // Inicializo
	while (i < max) and (ven.dia <> fin) do begin
		dimL:= dimL + 1;
		generarVenta(v[i]);
		i:= i + 1;
	end;
end;
procedure informarVector(v: vectorVentas; dimL: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do begin
		writeln('<<Venta nro: ', i, '>>');
		writeln('Dia de la venta: ', v[i].dia);
		writeln('Codigo del producto: ', v[i].codigo);
		writeln('Cantidad vendida: ', v[i].cantidad);
		writeln;
	end;
end;
procedure ordenarVector(var v: vectorVentas; dimL: integer);
var	
	i, j: integer;
	temp: venta;
begin
	for i:= 1 to dimL do begin
		for j:= 1 to (dimL - i) do begin
			if (v[j].codigo > v[j+1].codigo) then begin // SWAP
				temp:= v[j];
				v[j]:= v[+1];
				v[j+1]:= temp;
			end;
		end;
	end;
end;
function encontrarElem(v: vectorVentas; dimL, valor: integer): integer;
var
	i: integer;
begin
	i:= 1;
	while (i <= dimL) and (v[i].codigo < valor) do begin
		i:= i + 1;
	end;
	if (i > dimL) then // Si se encontró...
		encontrarElem:= 0
	else
		encontrarElem:= i;
end;
function encontrarElem2(v: vectorVentas; pos, dimL, valor: integer): integer;
begin
	while(pos <= dimL) and (v[pos].codigo <= valor) do begin
		pos:= pos + 1;
	end;
	if (pos > dimL) then // Si no se encontró el elemento...
		encontrarElem2:= dimL
	else				 // Si se encontró...
		encontrarElem2:= pos - 1;
	end;
procedure eliminarElemVector(var v: vectorVentas; var dimL: integer; valorMenor, valorMayor: integer);
var
	i, posMin, posMax, rango: integer;
begin
	i:= 0;
	if (dimL > 0) then begin // Primero fijarse si queda espacio
		posMin:= encontrarElem(v, dimL, valorMenor);
		posMax:= encontrarElem2(v, posMin, dimL, valorMayor);
		// ELIMINAR TODOS LOS ELEMENTOS DEL VECTOR QUE SE ENCUENTREN EN ESTE RANGO
		rango:= posMax - posMin;
		for i:= posMax to dimL do begin
			v[i - rango]:= v[i]; /// Reemplazo el elemento de la posición por el nuevo
		end;
		dimL:= dimL - rango; // Sustraer, de la dimensión lógica, los espacios que ya no se utilizan
	end;
end;
procedure moduloG(v: vectorVentas; dimL: integer; v2: vectorCodigos; var dimL2, cantVentas: integer);
var
	i, j: integer;
begin
	j:= 0;
	for i:= 1 to dimL do begin
		if (esPar(v[i].codigo)) and (dimL2 <= max) then begin
			j:= j + 1;
			v2[j]:= v[i].codigo;
			dimL2:= j;
		end;
		cantVentas:= cantVentas + 1;
	end;
end;
procedure informarVector3(v: vectorCodigos; dimL: integer);
var	
	i: integer;
begin
	for i:= 1 to dimL do begin
		writeln('CODIGO DEL PRODUCTO: ', v[i]);
	end;
end;
VAR
	vector, vector2: vectorVentas;
	vector3: vectorCodigos;
	dimL, dimL2, dimL3, cantVentas: integer;
BEGIN
	Randomize; // Generar numeros
	cantVentas:= 0;
	dimL:= 0;
	dimL2:= 0;
	dimL3:= 0;
	{inicializarVector(vector3);}
	cargarVector(vector, dimL); // Inciso A
	informarVector(vector, dimL); // Inciso B
	ordenarVector(vector, dimL); // Inciso C
	vector2:= vector;
	dimL2:= dimL;
	informarVector(vector, dimL); // Inciso D
	eliminarElemVector(vector, dimL, 5, 8); // Inciso E
	informarVector(vector, dimL); // Inciso F
	moduloG(vector2, dimL2, vector3, dimL3, cantVentas); // Inciso G
	informarVector3(vector3, dimL3);
	write('Cantidad total de ventas realizadas: ', cantVentas);
end.
