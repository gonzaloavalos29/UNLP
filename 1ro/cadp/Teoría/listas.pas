program uno;
type
	listaE= ^nodo;
	
	nodo = record
		elemento: integer;
		punteroSig: listaE;
	end;
	
var
	pri: listaE
begin
	pri:= nil;
end.
