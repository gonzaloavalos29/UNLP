program uno;
type
	listaE= ^datosEnteros;
	datosEnteros = record
		elem: integer;
		sig: listaE;
	end;

procedure agregarAlFinal(var pI: listaE; num: integer);
var
	nuevo, aux: listaE;
begin
	new(nuevo); nuevo^.elem:= num; nuevo^.sig:= nil;
	if (pI = nil) then pI:= nuevo
	else begin
		aux:= pI;
		while (aux^.sig <> nil) do
			aux:= aux^.sig;
		aux^.sig:= nuevo;
	end;
end;

procedure agregarAlFinal2(var pI, pU: listaE; num: integer);
var
	nuevo: listaE;
begin
	new(nuevo); nuevo^.elem:= num; nuevo^.sig:= nil;
	if (pI = nil) then begin
		pI:= nuevo;
		pU:= nuevo;
	end
	else begin
		pU^.sig:= nuevo;
		pU:= nuevo;
	end;
end;

var
	pri: listaE;
	num: integer;
begin
	crear(pri, ult);
	read(num);
	agregarAlFinal(pri, ult, num);
	read(num);
	agregarAlFinal(pri, ult, num);
end.
