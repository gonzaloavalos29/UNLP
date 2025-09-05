program p1ej1;
const
	maxVentas = 50;
	maxDias = 31;
	maxCodigo = 15;
	maxCantVendida = 99;
type
	rangoDia = 0..maxDias;
	rangoCodigo = 0..maxCodigo;
	rangoCantidadVendida = 0..maxCantVendida;
	venta = record
		dia: rangoDia;
		codigo: rangoCodigo;
		cantVend: rangoCantidadVendida;
	end;
	
	vectorVentas = array[1..maxVentas] of venta;

// a
procedure leerVenta(var v: venta);
begin
	write('Ingrese un dia (ingrese 0 para terminar): ');
	readln(v.dia);
	if (v.dia <> 0) then begin
		v.codigo:= random(16)+1;
		writeln('Codigo: ', v.codigo);
		write('Ingrese la cantidad vendida: ');
		readln(v.cantVend);
	end else
		writeln('Terminado.');
end;

procedure cargarVector(var v: vectorVentas; var dimL: integer);
var
	unaVenta: venta;
begin
	dimL:= 0;
	leerVenta(unaVenta);
	while ((unaVenta.dia <> 0) and (dimL < maxVentas)) do begin
		dimL:= dimL + 1;
		v[dimL]:= unaVenta;
		leerVenta(unaVenta);
	end;
end;

procedure inicializarVector(var v: vectorVentas);
var
	i: integer;
begin
	for i:= 0 to maxVentas do begin
		v[i].dia:= 0;
		v[i].codigo:= 0;
		v[i].cantVend:= 0;
	end;
end;

procedure imprimirVector(v: vectorVentas; dimL: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do begin
		writeln('Dia: ', v[i].dia);
		writeln('Codigo: ', v[i].codigo);
		writeln('Cantidad vendida: ', v[i].cantVend);
	end;
end;

procedure ordenacionInsercion(var v: vectorVentas; dimL: integer);
var
	i, j: integer; 
	aux: venta;
begin
	for i:= 2 to dimL do  begin
		aux:= v[i];
		j:= i-1;
		while (j > 0) and (v[j].codigo > aux.codigo) do begin
			v[j+1] := v[j];
			j:= j -1;
		end;
		v[j+1]:= aux;
	end;
end;

procedure eliminar(var v: vectorVentas; var dimL, cod1, cod2: integer);
var
	i, elementos: integer;
	pI, pF, min, min2: integer;
	enc, enc2: boolean;
begin
	if (cod1 < cod2) then begin
		min:= cod1;
		cod1:= cod2;
	end else begin
		min:= cod2;
		min2:= cod1;
	end;
	i:= 1;
	enc:= false;
	enc2:= false;
	while (i < dimL) and (v[i].codigo <= min2) do begin
		if (v[i].codigo <= min) and (enc <> true) then begin
			if (v[i].codigo = min) then
				pI:= i
			else
				pI:= i - 1;
			enc:= true;
		if (v[i].codigo >= min2) and (enc2 <> true) then begin
			if (v[i].codigo = min2) then
				pF:= i
			end else if (v[i].codigo > min2) then begin
				pF:= i - 1;
				enc2:= true;
			end;
		end;
		i:= i+1;
	end;
	elementos:= pF - pI+1;
	for i:= pF+1 to dimL do begin
		v[pI]:= v[i];
		pI:= pI+1;
	end;
	dimL:= dimL - elementos;
	writeln('Se borraron ', elementos, ' elementos.');
end;

procedure armarNuevoV(v: vectorVentas; dimL: integer; var v2: vectorVentas; var dimL2: integer; var total: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do begin
		if (v[i].codigo MOD 2 = 0) then begin
			dimL2:= dimL2 + 1;
			v2[dimL2]:= v[i];
			total:= total + v[i].cantVend;
		end;
	end;
end;

procedure mostrarVector2(v: vectorVentas; dimL: integer; total: integer);
begin
	imprimirVector(v, dimL);
	writeln('El total de productos vendidos es: ', total);
end;

VAR
	v: vectorVentas;
	dimL: integer;
BEGIN
	Randomize;
	inicializarVector(v);
	cargarVector(v, dimL);
	imprimirVector(v, dimL);
	ordenacionInsercion(v, dimL);
	imprimirVector(v, dimL);
END.
