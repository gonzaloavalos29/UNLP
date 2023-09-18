program ejercicio1;

const
	codigo_corte = -1;
	dimF = 300;
type
	oficina = record
		codigoID: integer;
		DNIprop: integer;
		valorExpensa: integer;
	end;
	vectorOficinas = array[1..dimF] of oficina; // Este vector no se encuentra ordenado
	
// Procesos
procedure leerOficina(var ofi: oficina);
begin
	write('Codigo de identificacion: '); readln(ofi.codigoID);
	if (ofi.codigoID <> codigo_corte) then begin
		write('DNI del propietario: '); readln(ofi.DNIprop);
		write('Valor de la expensa: '); readln(ofi.valorExpensa);
	end;
end;
	
// PUNTO A
procedure cargarVector(var vec: vectorOficinas; var dimL: integer);
var
	ofi: oficina;
begin
	leerOficina(ofi);
	while (dimL < dimF) and (ofi.codigoID <> codigo_corte) do begin
		dimL:= dimL + 1;
		vec[dimL]:= ofi;
		leerOficina(ofi);
	end;
end;

procedure imprimirVector(vec: vectorOficinas; indice, dimL: integer); // Recursivo
begin
	if (indice <= dimL) then begin
		write('Cod. ID: ', vec[indice].codigoID, ' / DNI: ', vec[indice].DNIprop, ' / valor: ', vec[indice].valorExpensa);
		imprimirVector(vec, indice + 1, dimL);
	end;
end;

//PUNTO B
procedure bubbleSort(var v: vectorOficinas; dimL: integer);
var
	i, j: integer;
	temp: oficina; // Registro temporal
begin
	for i:= 1 to dimL do begin // Recorrer toda la lista
		for j:= 1 to (dimL - i) do begin // Realizar el switch entre elementos
			if (v[j].codigoID > v[j+1].codigoID) then begin // Comparar el codigoID de los elementos a comparar
				temp:= v[j];
				v[j]:= v[j+1];
				v[j+1]:= temp;
			end;
		end;
	end;
end;

// PUNTO C
function buscarPosDicotomica(v: vectorOficinas; dimL, codigoBuscado: integer): integer; // Para que funcione el vector debe estar ordenado de la manera que lo pida la búsqueda
var
	pos, ini, mitad, fin: integer;
	encontre: boolean;
begin
	pos:= 0;
	ini:= 1;
	fin:= dimL;
	encontre:= false;
	while (ini <= fin) and (not encontre) do begin
		mitad:= (ini + fin) div 2;
		if (v[mitad].codigoID > codigoBuscado) then begin
			fin:= mitad - 1; // Reducir el rango de recorrido para abajo
		end else if (v[mitad].codigoID < codigoBuscado) then begin
			ini:= mitad + 1; // Reducir el rango de recorrido para arriba
		end else begin
			pos:= mitad;
			encontre:= true; // Encontrado
		end;
	end;
	buscarPosDicotomica:= pos;
end;

function buscarPosRecursivo(v: vectorOficinas; ini, fin, codigoBuscado: integer; encontrado: boolean): integer;
var
	mitad, pos: integer;
begin
	pos:= 0;
	mitad:= (ini + fin) div 2;
	if (ini <= fin) and (not encontrado) then begin
		if (v[mitad].codigoID > codigoBuscado) then begin
			pos:= buscarPosRecursivo(v, ini, mitad - 1, codigoBuscado, encontrado);
		end else if (v[mitad].codigoID < codigoBuscado) then begin
			pos:= buscarPosRecursivo(v, mitad + 1, fin, codigoBuscado, encontrado);
		end else begin
			pos:= mitad;
		end;
	end;
	buscarPosRecursivo:= pos;
end;

function montoRecursivo(v: vectorOficinas; indice, dimL: integer): integer;
var
	sumatoria: integer;
begin
	sumatoria:= 0;
	if (indice <= dimL) then
		sumatoria:= v[indice].valorExpensa + montoRecursivo(v, indice + 1, dimL);
	montoRecursivo:= sumatoria;
end;

VAR
	v: vectorOficinas;
	dimL, posDNI: integer;
begin
	dimL:= 0;
	posDNI:= -1;
	cargarVector(v, dimL);
	bubbleSort(v, dimL);
	imprimirVector(v, 1, dimL);
	posDNI:= buscarPosRecursivo(v, 1, dimL, 9, false);
	if (posDNI = 0) then
		writeln('No se ha encontrado dicho elemento')
	else
		writeln('Se ha encontrado el DNI en la posicion ', posDNI);
	write('Monto total recaudado en las oficinas: ', montoRecursivo(v, 1, dimL));
END.
