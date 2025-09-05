program parcialPrimeraFecha;
const
	valorAlto = 9999;
type
	presentacion = record
		codArtista: integer;
		artista: string;
		codEvento: integer;
		evento: string;
		anio: integer;
		likes: integer;
		dislikes: integer;
		puntaje: real;
	end;
	archivo = file of presentacion;
	
procedure leer(var arc: archivo; var pres: presentacion);
begin
	if (not eof(arc)) then begin
		with pres do begin
			read(arc, pres);
		end;
	end else
		pres.codArtista:= valorAlto;
end;

procedure generarInforme(var arc: archivo);
var
	anioAct, eventoAct, artistaAct: integer;
	likesTot, dislikesTot, cantPresPorAnio: integer;
	minPunt, puntTot: real;
	minArtista, minEvento: string;
	pres: presentacion;
begin
	assign(arc, 'presentaciones.txt');
	reset(arc);
	leer(arc, pres);
	minArtista:= '';
	minEvento:= '';
	minPunt:= valorAlto;
	while (pres.codArtista <> valorAlto) do begin
		anioAct:= pres.anio;
		cantPresPorAnio:= 0;
		while (pres.anio = anioAct) do begin
			eventoAct:= pres.codEvento;
			while (pres.codEvento = eventoAct) and (pres.anio = anioAct) do begin
				artistaAct:= pres.codArtista;
				likesTot:= 0; dislikesTot:= 0; puntTot:= 0;
				while ((pres.codEvento = eventoAct) and (pres.anio = anioAct) and (pres.codArtista = artistaAct)) do begin
					cantPresPorAnio:= cantPresPorAnio + 1;
					likesTot:= likesTot + pres.likes;
					dislikesTot:= dislikesTot + pres.dislikes;
					puntTot:= puntTot + pres.puntaje;
					leer(arc, pres);
				end;
				if (minPunt < puntTot) then begin
					minPunt:= puntTot;
					minEvento:= pres.evento;
					minArtista:= pres.artista;
				end;
				writeln(pres.artista);
				writeln('Likes totales: ', likesTot);
				writeln('Dislikes totales: ', dislikesTot);
				writeln('Diferencia: ', likesTot - dislikesTot);
				writeln('Puntaje obtenido: ', puntTot);
			end;
			writeln(eventoAct, ': ', pres.codEvento);
			writeln('El artista, ', minArtista, ' fue el menos influyente de ', minEvento, ' del año ', anioAct);
		end;
		writeln('La cantidad total de presentaciones fue de: ', cantPresPorAnio);
	end;
end;

VAR
	arc: archivo;
BEGIN
	generarInforme(arc);
END.
