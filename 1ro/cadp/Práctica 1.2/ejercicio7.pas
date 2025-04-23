Program ejercicio7;
const
	maxPilotos = 5;
var
	nombrePiloto, nombre1, nombre2, nombre3, nombre4: string;
	i, tiempoTot, tiempo1, tiempo2, tiempo3, tiempo4: integer;
begin
	tiempoTot:= 0;
	tiempo4:= -1;
	tiempo3:= -1;
	tiempo2:= 9999;
	tiempo1:= 9999; 
	for i:= 1 to maxPilotos do begin
		writeln('Ingrese el nombre del piloto y el tiempo total que le tomo finalizar la carrera: ');
		readln(nombrePiloto, tiempoTot);
		if(tiempoTot > tiempo4) then begin
			tiempo3:= tiempo4;
			tiempo4:= tiempoTot;
			nombre4:= nombrePiloto;
		end
		else
			if(tiempoTot > tiempo3) then begin
				tiempo3:= tiempoTot;
				nombre3:= nombrePiloto;
			end;
		if(tiempoTot < tiempo1) then begin
			tiempo2:= tiempo1;
			tiempo1:= tiempoTot;
			nombre1:= nombrePiloto;
		end
		else
			if(tiempoTot < tiempo2) then begin
				tiempo2:= tiempoTot;
				nombre2:= nombrePiloto;
			end;
	end;
	writeln('Los pilotos que terminaron en ultimo y anteultimo puesto son: ', nombre4, ' y ', nombre3, ' en ', tiempo4, ' y ', tiempo3, ' respectivamente.');
	writeln('Los pilotos que terminaron en primer y segundo puesto son: ', nombre1, ' y ', nombre2, ' en ', tiempo1, ' y ', tiempo2, ' respectivamente.');
End.
