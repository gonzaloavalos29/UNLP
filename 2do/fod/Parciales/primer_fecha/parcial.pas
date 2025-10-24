const
	va = 9999;
	max = -1;
type
	str30 = string[30];
	pres = record // presentacion
		codArtista: integer;
		nombreArtista: str30;
		año: integer;
		codEvento: integer;
		nombreEvento: str30;
		cantLikes: longInt;
		cantDislikes: longInt;
		puntaje: real;
	end;
	archivo = file of tRegistro;
	
procedure leer(var a: archivo; var reg: pres);
begin
	if (not EOF(a)) then
		read(a, reg)
	else
		reg.año:= va;
end;
procedure informe(var a: archivo);
var
	reg, act: pres;
	años, presAño, presTot: integer;
	puntajeMin: real;
	artistaMin: str30;
	dislikesMax: longInt;
begin
	años:= 0;
	reset(a);
	leer(a, reg);
	presTot:= 0;
	writeln('Resumen de menor influencia por evento.');
	while (reg.año <> va) do begin
		act.año:= reg.año;
		writeln('Año: ', act.año);
		años:= años + 1;
		presAño:= 0;
		while (act.año = reg.año) do begin
			act.codEvento:= reg.codEvento;
			act.nombreEvento:= reg.nombreEvento;
			puntajeMin:= va;
			dislikesMax:= max;
			writeln('Evento: ', act.nombreEvento, ' (Código: ', act.codEvento, ')');
			while (act.año = reg.año) and (act.codEvento = reg.codEvento) do begin
				act.codArtista:= reg.codArtista;
				act.nombreArtista:= reg.nombreArtista;
				act.cantLikes:= 0;
				act.cantDislikes:= 0;
				act.puntaje:= 0;
				writeln('Artista: ', act.nombreArtista, ' (Código: ', act.codArtista, ')');
				while (act.año = reg.año) and (act.codEvento = reg.codEvento) and (act.codArtista = reg.codArtista) do begin
					act.cantLikes:= act.cantLikes + reg.cantLikes;
					act.cantDislikes:= act.cantDislikes + reg.cantDislikes;
					act.puntaje:= act.puntaje + reg.puntaje;
					presAño:= presAño + 1;
					leer(a, reg);
				end;
				if (act.puntaje < puntajeMin) or ((act.puntaje = puntajeMin) and (act.cantDislikes > dislikesMax)) then begin
					puntajeMin:= act.puntaje;
					dislikesMax:= act.cantDislikes;
					artistaMin:= act.nombreArtista;
				end;
				writeln('Likes totales: ', act.cantLikes);
				writeln('Dislikes totales: ', act.cantDislikes);
				writeln('Diferencia: ', (act.cantLikes - act.cantDislikes));
				writeln('Puntaje total del jurado: ', act.puntaje);
			end;
			writeln('El artista ', artistaMin, ' fue el menos influyente de ', act.nombreEvento, ' del año ', act.año, '.');
		end;
		writeln('Durante el año ', act.año, ' se registraron ', presAño, ' de presentaciones de artistas.');
		presTot:= presTot + presAño;
	end;
	writeln;
	if (años > 0) then
		writeln('El promedio total de presentaciones por año es de: ', (presTot / años):0:2, ' presentaciones.');
	else
		writeln('No se registraron presentaciones.');
	close(a);
end;
