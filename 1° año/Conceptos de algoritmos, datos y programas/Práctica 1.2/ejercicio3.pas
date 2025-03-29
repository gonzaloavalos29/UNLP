Program ejercicio3;

var
	nombreAlu: string; 
	nota, i, cantAprobados, cant7: integer;
begin
	cantAprobados:= 0;
	cant7:= 0;
	i:= 0;
	repeat
		writeln('Ingrese un alumno y su nota');
		readln(nombreAlu, nota);
		if (nota=7) then
			cant7:= cant7+1
		else
			if(nota>=8) then
				cantAprobados:= cantAprobados+1;
	until (nombreAlu = 'Zidane Zinedine');
	writeln('Cantidad de aprobados: ', cantAprobados);
	writeln('Cantidad de alumnos con nota 7: ', cant7);
End.
