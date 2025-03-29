program uno;
type
	listaE = ^datosEnteros;
	
	datosEnteros = record
		elem: integer;
		sig: listaE;
	end;
	
procedure insertar(var pI: listaE; valor: integer);
var
	actual, anterior, nuevo: listaE;
begin
	new(nuevo);
	nuevo^.elem:= valor;
	nuevo^.sig:= nil;
	if (pI = nil) then
		pI:= nuevo // 					caso 1 (lista vacía)
	if (actual = pI) then begin//		caso 2 pri = actual (lista no vacía, va al principio)
		nuevo^.sig:= pI;
		pI:= nuevo;
	end;
	else
		begin
			anterior^.sig:= nuevo;//	caso 3 (lista no vacía, va en el "medio") y 4 (lista no vacía, va al final)
			nuevo^.sig:= actual;
		end;
	end;
	else begin
		actual:= pI;
		ant:= pI;
		while(actual <> nil) and (actual^.elem < nuevo^.elem) do begin
			anterior:= actual;
			actual:= actual^.sig;
		end;
	end;

var
	pri: listaE;
	num: integer;
begin
	crear(pri);
	cargar(pri); // se dispone
	read(num);
	insertar(pri, num);
end.
