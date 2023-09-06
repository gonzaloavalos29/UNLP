// Busqueda en lista desordenadas
function buscar(pI: listaE; valor: integer): boolean;
var
	aux: listaE;
	encontre: boolean;
begin
	encontre:= false;
	aux:= pI;
	while ((aux <> nil) and (encontre = false)) do begin
		if (aux^.elem = valor) then
			encontre = true;
		else
			aux:= aux^.sig;
	end;
	buscar:= encontre;
end;

// Busqueda en lista ordenada
function buscar(pI: listaE; valor: integer): boolean;
var
	aux: listaE;
	encontre: boolean;
begin
	encontre:= false;
	aux:= pI;
	while ((aux <> nil) and (aux^.elem < valor)) do begin
		aux:= aux^.sig;
	end;
	if (aux <> nil) and (aux^.elem = valor) then encontre:= true;
	buscar:= encontre;
end;



