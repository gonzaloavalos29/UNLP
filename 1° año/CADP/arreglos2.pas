function posicion(v: vector): integer;
var
	pos, resto: integer;
	seguir: boolean;

begin
	seguir:= true;
	pos:= 1;
	while ((pos<=tam) and (seguir = true)) do
		begin
			resto:= v[pos] MOD multi;
			if (resto = 0) then
				seguir:= false
			else
				pos:= pos + 1;
		end;
		if (seguir = false) then posicion:= pos
							else posicion:= -1;
