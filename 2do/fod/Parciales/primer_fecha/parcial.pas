program parcial;
const
	VA = 9999;
	MAX = -1;
type
	str30 = string[30];
	pres = record
		codArtista: integer;
		nombreArtista: str30;
		año: integer;
		codEvento: integer;
		nombreEvento: string;
		cantLikes: longInt;
		cantDislikes: longInt;
		puntaje: real;
	end;
	archivo = file of pres;
	
procedure leer(var arc: archivo; var reg: pres);
begin
	if (not EOF(arc)) then
		read(arc, reg)
	else
		reg.año:= VA;
end;
procedure procesar(var arc: archivo);
var
	reg, act: pres;
	presPorAnio, años: integer;
	puntajeMin, presTotal: real;
	nombreArtista: str30;
	dislikesMax: longInt;
begin
	assign(arc, 'archivo.txt');
	reset(arc);
	años:= 0;
	leer(arc, reg);
	presTotal:= 0;
	writeln('Resumen de menor influencia por evento');
	while (arc.año != valor_alto) do begin
		act.año:= reg.año;
		writeln('Año: ', añoAct);
		años:= años + 1;
		presPorAnio:= 0;
		while (añoAct = reg.año) do begin
			act.codEvento:= reg.codEvento;
			act.nombreEvento:= reg.nombreEvento;
			puntajeMin:= VA;
			dislikesMax:= MAX;
			writeln('Evento: ', act.nombreEvento, ' (Código: ', act.codEvento, ')');
			while (act.año = reg.año) and (act.codEvento = reg.codEvento) do begin
				act.codArtista:= reg.codArtista;
				act.nombreArtista:= reg.nombreArtista;
				act.cantLikes:= 0;
				act.cantDislikes:= 0;
				act.puntaje:= 0;
				writeln('Artista: ', act.nombreArtista, ' (Código: ', act.codArtista, ')'=;
				while (act.año = reg.año) and (act.codEvento = reg.codEvento) and (act.codArtista = reg.codArtista) do begin
					act.cantlikes:= act.cantLikes + reg.cantLikes);
					act.cantDislikes:= act.cantDislikes + reg.cantDislikes;
					act.puntaje:= act.puntaje + reg.puntaje;
					presPorAnio:= presPorAnio + 1;
					leer(a, reg);
				end;
				if (act.puntaje < puntajeMin) or ((act.puntaje = puntajeMin) and (act.cantDislikes > dislikesMax)) then begin
					puntajeMin:= act.puntaje;
					dislikesMax:= act.cantDislikes;
					nombreArtista:= act.nombreArtista;
				end;
				writeln('Likes totales: ', act.cantLikes);
				writeln('Dislikes totales: ', act.cantDislikes);
				writeln('Diferencia: ', (act.cantLikes - act.cantDislikes));
				writeln('Puntaje total del jurado: ', act.puntaje);
			end;
			writeln('El artista ', nombreArtista, ' fue el menos influyente de ', act.nombreEvento, ' del año ', act.año, '.');
		end;
		writeln('Durante el año ', act.año, ' se registraron ', presPorAnio, ' de presentaciones de artistas.');
		presTot:= presTot + presPorAnio;
	end;
	writeln;
	if (años > 0) then
		writeln('El promedio total de presentaciones por año es de: ', (presentacionesTotal / años):0:2, ' presentaciones.');
	else
		writeln('No se registraron presentaciones.');
	close(arc);
end;
