Program ejercicio6;
const
	aprobado= 6.5;
	destacado= 8.5;
	fin= -1;
var
	promedio: real;
	legajo, cantAlu, cantAprobados, cantDestacados, porcentajeDestacados: integer;
begin
	cantAlu:= 0;
	cantAprobados:= 0;
	cantDestacados := 0;
	legajo:= 0;
	while(legajo <> fin) do begin
		if (legajo<>fin) then
			writeln('Ingrese el legajo y promedio de los alumnos: ');
			readln(promedio, legajo);
			cantAlu := cantAlu+1;
			if (promedio>=aprobado) then
				cantAprobados:= cantAprobados+1;
			if ((promedio>=destacado) and (legajo<2500)) then
				cantDestacados:= cantDestacados+1;
	end;
	porcentajeDestacados := ((cantDestacados*100) div cantAlu);
	write(porcentajeDestacados);
End.
