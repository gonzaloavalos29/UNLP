program ejercicio10;
const
	dimF = 300;
type
	vector = array [1..dimF] of real;
procedure cargarVector(var v: vector; var dimL: integer);
	var
		i, salario: integer;
	begin
		write('Ingrese el salario del empleado: >'); readln(salario);
		i:= 1;
		while (salario <> 0) and (i < dimF) do begin
			v[i]:= salario;
			dimL:= i;
			write('Ingrese el salario del empleado: >'); readln(salario);
			i:= i + 1;
		end;
	end;
procedure aumentarSalarios(var v: vector; dimL: integer);
	var
		i: integer;
	begin
		for i:= 1 to dimL do begin
			v[i]:= (v[i] * 1.15);
		end;
	end;
procedure promedioSalarios(v: vector; dimL: integer);
	var
		i: integer;
		promedio: real;
	begin
		promedio:= 0;
		for i:= 1 to dimL do begin
			promedio:= promedio + v[i];
			writeln('El promedio del total de salarios de la empresa es de ', (promedio/dimL):2:2);
		end;
	end;
var
	v: vector;
	dimL: integer;
begin
	cargarVector(v, dimL);
	promedioSalarios(v, dimL);
	aumentarSalarios(v, dimL);
	promedioSalarios(v, dimL);
end.
