program uno;
const
	tam = 10;
	multi = 3;
type
	vector = array [1..tam] of integer;
function multiplos(v: vector): integer;
var
	i, cant, resto: integer;
begin
	cant:= 0;
	for i:= 1 to tam do
		begin
			resto:= v[i] MOD multi;
			if (resto = 0) then 
				cant:= cant + 1;
			end;
		multiplos:= cant;
		end;
	end;
end;
procedure cargar(var v:vector);
var
	i, valor: integer;
begin
	for i:= 1 to tam do
		begin
			read(valor);
			v[i]:= valor;
			//read(v[i]);
		end;
	end;
var
	v1: vector;
	cant: integer;
	
begin
	cargar(v1)
	cant:= multiplos(v1);
	write('La cantidad de multiplos de ', multi, ' es ', cant);
end.
