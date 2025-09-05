const
	VA = 9999;
	N = 12;
type
	str30 = string[30]
	TEquipo = record
		codEquipo: integer;
		nombreEquipo: str30;
		cantJ: integer;
		cantG: integer;
		cantE: integer;
		cantP: integer;
		cantPuntos: integer;
	end;
	TPartido = record
		codEquipo: integer;
		fechaPartido: longInt;
		cantPuntos: integer;
		codRival: integer;
	end;
	
	maestro = file of TEquipo;
	detalle = file of TPartido;
	
	detalles = array[1..N] of detalle;
	regDetalle = array[1..N] of TPartido;
	
procedure leer(var a: detalle; var reg: TPartido);
begin
	if (not EOF(a))) then
		read(a, reg)
	else
		reg.codEquipo:= VA;
end;
procedure minimo(var vDet: detalles; var rDet. regDetalle; var min: TPartido);
var
	i, posMin: integer;
begin
	posMin:= -1; min.codEquipo:= VA;
	for i:= 1 to N do begin
		if (rDet[i].codEquipo < min.codEquipo) then begin
			min:= rDet[i];
			posMin:= i;
		end;
	end;
	if (min.codEquipo <> VA) then
		leer(vDet[posMin], rDet[posMin]);
end;

procedure asignarArchivos(var m: maestro, var vDet: detalles);
var
	i: integer;
	nombreArchivo: str30;
begin	
	writeln('Ingrese el nombre del archivo maestro: ');
	readln(nombreArchivo);
	assign(m, nombreArchivo);
	for i:= 1 to N do begin
		writeln('Ingrese el nombre del archivo detalle: ', i);
		readln(nombreArchivo);
		assign(vDet[i], nombreArchivo);
	end;
end;

procedure ejercicio(var m: maestro; var vDet: detalles);
var
	i: integer; min: TPartido; total: integer;
	puntos, maxPuntos: integer; nombreMax: str30;
	regM: TEquipo;
	partidos: regDetalle;
	nombreArchivo: str30;
begin
	maxPuntos:= -1;
	asignarArchivos(m, vDet);
	reset(m);
	for i:= 1 to N do begin
		reset(vDet[i]);
		leer(vDet[i], partidos[i]);
	end;
	minimo(vDet, partidos, min);
	while (min.codEquipo <> VA) do begin
		read(m, regM);
		while (regM.codEquipo <> min.codEquipo) do 
			read(m, regM);
		puntos:= 0;
		while (regM.codEquipo = min.codEquipo) do begin
			puntos:= puntos + min.cantPuntos;
			if (min.cantPuntos = 3) then
				regM.cantG:= regM.cantG + 1;
			else if (min.cantPuntos = 1) then
				regM.cantE:= regM.cantE + 1;
			else
				regM.cantP:= regM.cantP + 1;
			minimo(vDet, partidos, min);
		end;
		regM.cantPuntos:= regM.cantPuntos + puntos;
		if (puntos > maxPuntos) then begin
			maxPuntos:= puntos;
			nombreMax:= regM.nombreEquipo;
		end;
		seek(m, filePos(m) - 1);
		write(m, regM);
	end;
	writeln('El equipo que sumó más puntos durante la temporada fue: ', nombreMax, ' con ', maxPuntos, ' puntos.');
	close(m);
	for i:= 1 to N do
		close(vDet[i]);
end;
