program ejemplo;
const
	valorA = 9999;
type
	cadenaResto = record
		codigo: integer;
		nombre: string;
		costo: real;
		fecha: longInt;
		cant_ven: integer;
	end;
	resto = record
		codigo: integer;
		cant_vend: integer;
	end;
	maestro = file of cadenaResto;
	detalle = file of resto;
	resto = array[1..17] of resto;
	detalles = array[1..17] of detalle;
	
procedure leer(var det: detalle; var regDet: resto);
begin
	if (not EOF(det)) then
		read(det, regDet)
	else
		regDet.codigo:= valorA;
end;

procedure minimo(var det: detalles; var resto: resto; var min: resto);
var
	posMin: integer;
begin
	min:= resto[1];
	posMin:= 1;
	for i:= 2 to 17 do begin
		if (resto[i].codigo < min.codigo) then begin
			min:= resto[i];
			posMin:= i;
		end;
	end;
	leer(det[posMin], resto[posMin]);
end;

procedure actualizar(var m: maestro; var det: detalles);
var
	resto: resto;
	min: resto;
	regM: maestro;
begin
	for i:= 1 to 17 do
		reset(det[i]);
		leer(det[i], resto[i]);
	end;
	reset(m);
	minimo(det, resto, min);
	while (min.codigo <> valorA) do begin
		while (min.codigo <> regM.codigo) do begin
			read(m, regM);
		end;
		while (regM.codigo = min.codigo) and (min.codigo <> valorA) do begin
			regM.cant_vend:= regM.cant_vend + min.cant_vend;
			minimo(det, resto, min);
		end;
		seek(m, filepos(m)-1);
		write(m, regM);
	end;
	close(m);
	for i:= 1 to 17 do
		close(det[i])
end;

VAR
	m: maestro;
	det: detalles;
	opc, i: integer;
	nombreDet: string;
BEGIN
	for i:= 1 to 17 do begin
		writeln('ESCRIBA UN NOMBRE PARA EL ARCHIVO: ');
		read(nombreDet);
		assign(det[i], nombreDet);
	end;
	actualizar(m, det);
END.
