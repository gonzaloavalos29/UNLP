const
	va = 9999;
type
	str30 = string[30];
	mascota = record
		cod: integer;
		nom: str30;
		especie: str30;
		edad: integer;
		duenio: str30;
		tel: longInt;
	end;
	
	archivo = file of mascota;
	
procedure leerMascota(var arc: archivo; var mas: mascota);
begin
	if (not EOF(arc)) then
		read(arc, mas)
	else
		mas.cod:= va;
end;

function ExisteMascota(var arc: archivo; codMas: integer): integer;
var
	reg: mascota;
begin
	reset(arc);
	ExisteMascota:= 0;
	leerMascota(arc, reg);
	while (reg.cod <> va) and (ExisteMascota = 0) do begin
		if (codMas = reg.cod) then
			ExisteMascota:= filepos(arc)-1;
		leerMascota(arc, reg);
	end;
	close(arc);
end;

procedure AltaMascota(var arc: archivo);
var
	mas, cabecera: mascota;
	pos: integer;
begin
	writeln('Ingrese una mascota: '); readln(mas.cod, mas.nom, mas.especie, mas.edad, mas.duenio, mas.tel);
	pos:= ExisteMascota(arc, mas.cod);
	if (pos = 0) then begin
		reset(arc);
		read(arc, cabecera);
		if (cabecera.cod = 0) then begin
			seek(arc, filesize(arc));
			write(arc, mas);
		end else begin
			seek(arc, cabecera.cod * -1);
			read(arc, cabecera);
			seek(arc, filepos(arc)-1);
			write(arc, mas);
			seek(arc, 0);
			write(arc, cabecera);
			close(arc);
		end;
		writeln('Se dio de alta la nueva mascota');
	end else
		writeln('La mascota ya existe');
end;

procedure BajaMascota(var arc: archivo);
var
	cabecera, mas: mascota;
	codMas, pos: integer;
begin
	write('Ingrese el codigo de una mascota a eliminar'); readln(codMas);
	pos:= ExisteMascota(arc, codMas);
	if (pos = 0) then 
		writeln('No existe la mascota con codigo ', codMas)
	else begin
		reset(arc);
		read(arc, cabecera);
		seek(arc, pos);
		read(arc, mas);
		seek(arc, filepos(arc)-1);
		write(arc, cabecera);
		cabecera.cod:= (filepos(arc)-1) * -1;
		seek(arc, 0);
		write(arc, cabecera);
		close(arc);
		writeln('Se elimino del archivo la mascota con codigo: ', codMas);
	end;
end;

VAR
	arc: archivo;
BEGIN
	assign(arc, 'mascotas');
	AltaMascota(arc);
	BajaMascota(arc);
END.
