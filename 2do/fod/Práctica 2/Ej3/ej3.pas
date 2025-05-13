{4. A partir de información sobre la alfabetización en la Argentina, se necesita actualizar un
archivo que contiene los siguientes datos: nombre de provincia, cantidad de personas
alfabetizadas y total de encuestados. Se reciben dos archivos detalle provenientes de dos
agencias de censo diferentes, dichos archivos contienen: nombre de la provincia, código de
localidad, cantidad de alfabetizados y cantidad de encuestados. Se pide realizar los módulos
necesarios para actualizar el archivo maestro a partir de los dos archivos detalle.
NOTA: Los archivos están ordenados por nombre de provincia y en los archivos detalle
pueden venir 0, 1 ó más registros por cada provincia.}

program ej4;
const
	valorAlto = 'ZZZ';
type
	infoMaestro = record
		nombre: string;
		alfabetizados: integer;
		encuestados: integer;
	end;
	infoDetalle = record
		nombre: string;
		codigo: integer;
		alfabetizados: integer;
		encuestados: integer;
	end;
	maestro = file of infoMaestro;
	detalle = file of infoDetalle;
	
procedure leer(var det: detalle; var dato: infoDetalle);
begin
	if (not eof(det)) then begin
		min:= r1;
		leer(det1, r1);
	end else begin
		min:= r2;
		leer(det2, r2);
	end;
end;

procedure actualizarMaestro(var mae: maestro; var det1, det2: detalle);
var
	infoDet1, infoDet2, min: infoDetalle;
	infoMae: infoMaestro;
begin
	reset(mae);
	reset(det1);
	reset(det2);
	leer(det1, infoDet1);
	leer(det2, infoDet2);
	minimo(det1, det2, infoDet1, infoDet2, min);
	while (min.nombre <> valorAlto) do begin
		read(mae, infoMae);
		while (infoMae.nombre = min.nombre) do begin
			infoMae.alfabetizados:= infoMae.alfabetizados + min.alfabetizados;
			infoMae.encuestados:= infoMae.encuestados + min.encuestados;
			minimo(det1, det2, infoDet1, infoDet2, min);
		end;
		seek(mae, filepos(mae)-1;
		write(mae, infoMae);
	end;
	close(mae);
	close(det1);
	close(det2);
end;
