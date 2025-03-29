program CrearArchivoNumeros;
type
	archivo_enteros = file of integer;

var
	enteros: archivo_enteros;
	num: integer;
	nombre_fisico: string[12];
begin
	write('Ingrese el nombre del archivo: ');
	readln(nombre_fisico);
	assign(enteros, nombre_fisico);
	rewrite(enteros);
	write('Ingrese un numero entero: ');
	readln(num);
	while (num <> 30000) do begin
		write(enteros, num);
		write('Ingrese otro numero entero o 30000 para terminar: ');
		readln(num);
	end;
	close(enteros);
end.
