procedure cargarValores(var a: numeros; var dimL: integer);
var
	num: integer;
begin
	dimL:= 0;
	readln(num);
	while ((dimL < dF) and (num <> 50)) do
		begin
			dimL:= dimL + 1;
			a[dimL]:= num;
			readln(num);
		end;
end;

function maximo (a: numeros; dimL: integer): integer;
var
	max, i: integer;
begin
	max:= -9999;
	for i:= 1 to dimL do
		begin
			if (a[i] >= max) then max:= a[i];
		end;
	maximo:= max;
end;
