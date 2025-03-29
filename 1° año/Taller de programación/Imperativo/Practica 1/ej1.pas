program ej1;
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

procedure Eliminar (var v: vectorVentas; var dimL: integer; valorInferior, valorSuperior: integer);

  function BuscarPosicion (v: vectorVentas; dimL: integer; elemABuscar: integer): integer;
  var pos: rangoDia;
  begin
    pos:= 1;
    while ((pos <= dimL) and (elemABuscar > v[pos].codigo)) do
       pos:= pos + 1;
    if (pos > dimL) then BuscarPosicion:= 0
                    else BuscarPosicion:= pos;
  end;
  
  function BuscarPosicionDesde (v: vectorVentas; dimL, pos : integer; elemABuscar: integer): integer;
  begin
    while (pos <= dimL) and (elemABuscar >= v[pos].codigo) do
       pos:= pos + 1;
    if (pos > dimL) then BuscarPosicionDesde:= dimL
                    else BuscarPosicionDesde:= pos - 1;
  end;

var posInferior, posSuperior, salto, i: integer; 
Begin
  posInferior:= BuscarPosicion (v, dimL, valorInferior);
  if (posInferior <> 0)
  then begin
         posSuperior:= BuscarPosicionDesde (v, dimL, posInferior, valorSuperior);
         salto:= posSuperior - posInferior+1;
         for i:= posSuperior+1 to dimL do begin
			v[i-salto]:= v[i];
       end;
   end;
   dimL:=dimL-salto;
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
	dimL, piso, techo: integer;
BEGIN
	Randomize;
	cargarVector(v, dimL);
	{imprimirVector(v, dimL);}
	ordenacionInsercion(v, dimL);
	imprimirVector(v, dimL);
	writeln('Ingrese piso y techo: ');
	readln(piso);
	readln(techo);
	Eliminar(v, dimL, piso, techo);
	imprimirVector(v, dimL);
END.
