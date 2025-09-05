{El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
las expensas de dichas oficinas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina
se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura
finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la
oficina.
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.}
program ej2;
const
	dimF=  5;
Type
	oficina= record
		codID: integer;
		dni: integer;
		valor: real;
	end;
	oficinas= Array [1..dimF]  of oficina;
	
procedure leerOficina(var o: oficina);
begin
	o.codID:= Random(999);
	if (o.codID <> -1)then begin
		o.dni:= Random(1111);
		o.valor:= o.dni / 2;
	end;
end;

procedure armarVector(var vec: oficinas; var dimL: integer);
var
	o: oficina;
begin
	leerOficina(o);
	while (o.codID <> -1) and (dimL < dimF)do begin
		dimL:= dimL +1;
		vec[dimL]:= o;
		leerOficina(o);
	end;
end;

procedure ordenacionInsercion (var v: oficinas; dimL: integer);
var
	j, i: integer; 
	aux: oficina;
begin
	for i:= 2 to dimL do  begin
		aux:= v[i];
		j:= i-1;
		while (j > 0) and (v[j].codID > aux.codID) do begin
			v[j+1] := v[j];
			j:= j -1;
		end;
		v[j+1]:= aux;
	end;
end;

procedure mostrarVector (vect: oficinas; dimL: integer);
var
	i:integer;
begin
	for i:= 1 to dimL do begin
		writeln('ID: ',vect[i].codID);
		writeln('DNI: ',vect[i].dni);
		writeln('Valor: ',vect[i].valor:0:0);
		writeln('');
	end;
end;

Procedure ordenarSeleccion (var v: oficinas; dimLog: integer);

var i, j, pos: integer; 
item: oficina;		
begin
	for i:=1 to dimLog-1 do begin 
		pos := i;
        for j := i+1 to dimLog do
			if v[j].codID < v[pos].codID then 
				pos:=j;
			item := v[pos];
			v[pos]:= v[i];   
			v[i]:= item;
      end;
end;


var
	vect: oficinas;
	dimL: integer;
Begin
	dimL:= 0;
	armarVector(vect, dimL);
	//ordenacionInsercion(vect,dimL);
	ordenarSeleccion(vect,dimL);
	mostrarVector(vect, dimL);
end.
