program parcial;
const
	va = 9999;
	N = 12;
type
	str30 = string[30];
	tEquipo = record
		cod: integer;
		nom: str30;
		jugados: integer;
		ganados: integer;
		empatados: integer;
		perdidos: integer;
		puntos: integer;
	end;
	tPartido = record
		cod: integer;
		fecha: str30;
		puntos: integer;
		codRival: integer;
	end;
	
	maestro = file of tEquipo;
	detalle = file of tPartido;
	
	detalles = array[1..N] of detalle;
	regDetalle = array[1..N] of tPartido;
	
procedure leer(var a: detalle; var reg: tPartido);
begin
	if (not EOF(a)) then
		read(a, reg)
	else
		reg.cod:= va;
end;

procedure minimo(var vDet: detalles; var rDet: regDetalle; var min: tPartido);
var
	i, posMin: integer;
begin
	posMin:= -1; min.cod:= va;
	for i:= 1 to N do begin
		if (rDet[i].cod < min.cod) then begin
			min:= rDet[i];
			posMin:= i;
		end;
	end;
	if (min.cod <> va) then
		leer(vDet[posMin], rDet[posMin]);
end;

procedure asignarArchivos(var m: maestro; var vDet: detalles);
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
	i, total, maxPuntos: integer;
	min: tPartido;
	nombreMax: str30;
	regM: tEquipo;
	partidos: regDetalle;
begin
	maxPuntos:= -1;
	asignarArchivos(m, vDet);
	reset(m);
	for i:= 1 to N do begin
		reset(vDet[i]);
		leer(vDet[i], partidos[i]);
	end;
	minimo(vDet, partidos, min);
	while (min.cod <> va) do begin
		read(m, regM);
		while (regM.cod <> min.cod) do 
			read(m, regM);
		total:= 0;
		while (regM.cod = min.cod) do begin
			total:= total + min.puntos;
			regM.jugados:= regM.jugados + 1;
			if (min.puntos = 3) then
				regM.ganados:= regM.ganados + 1
			else
				if (min.puntos = 1) then
					regM.empatados:= regM.empatados + 1
				else
					regM.perdidos:= regM.perdidos + 1;
			minimo(vDet, partidos, min);
		end;
		regM.puntos:= regM.puntos + total;
		if (total > maxPuntos) then begin
			maxPuntos:= total;
			nombreMax:= regM.nom;
		end;
		seek(m, filePos(m)-1);
		write(m, regM);
	end;
	writeln('El equipo que sumo mas puntos durante la temporada fue: ', nombreMax, ' con ', maxPuntos, ' puntos.');
	close(m);
	for i:= 1 to N do
		close(vDet[i]);
end;

VAR
	m: maestro;
	d: detalles;
BEGIN
	ejercicio(m, d);
END.
