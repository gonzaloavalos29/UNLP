program uno;
type
	listaE= ^datosEnteros;
	datosEnteros = record
		elem: integer;
		sig: listaE;
	end;

procedure agregarAdelante(var pI: listaE; num: integer);
var
	nuevo: listaE;
begin
	new(nuevo); nuevo^.elem:= num; nuevo^.sig:= nil;
	if (pI = nil) then pI:= nuevo
	else begin
		nuevo^.sig:= pI;
		pI:= nuevo;
	end;
end;
	
	
	
var
	pri: listaE;
	num: integer;
begin
	crear(pri);
	read(num);
	agregarAdelante(pri, num);
	read(num);
	agregarAdelante(pri, num);
