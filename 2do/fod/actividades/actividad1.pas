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
		read(arc, cabecera); // leo la cabecera
		if (cabecera.cod = 0) then begin
			seek(arc, filesize(arc)); // voy al fin del archivo para agregar la nueva mascota debido a que no tengo espacios libres en el archivo
			write(arc, mas); // agrego la nueva mascota
		end else begin
			seek(arc, cabecera.cod * -1); // voy a la posición donde tengo libre un espacio que me indica el registro cabecera (en negativo)
			read(arc, cabecera); // leo el nuevo registro cabecera
			seek(arc, filepos(arc)-1); // vuelvo a la posición anterior para dar de alta el registro mascota
			write(arc, mas); // agrego la nueva mascota
			seek(arc, 0); // voy a la cabecera
			write(arc, cabecera); // escribo el nuevo registro cabecera
		end;
		close(arc);
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
		read(arc, cabecera); // leo el registro cabecera.
		seek(arc, pos); // voy a la posición donde tengo el registro a eliminar.
		read(arc, mas); // leo el registro a eliminar (nuevo espacio libre) que será la nueva dirección del registro cabecera.
		seek(arc, filepos(arc)-1); // vuelvo al registro a eliminar.
		write(arc, cabecera); // sobreescribo con mi registro cabecera para guardar la posición del próximo espacio libre del archivo (en el campo código).
		mas.cod:= (filepos(arc)-1) * -1; // guardo la posición del nuevo espacio libre.
		seek(arc, 0); // voy al registro cabecera.
		write(arc, mas); // escribo el nuevo registro cabecera.
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
