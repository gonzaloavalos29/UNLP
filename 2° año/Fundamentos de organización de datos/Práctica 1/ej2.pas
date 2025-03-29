program ej2;
type
	archivo = file of integer;
	
procedure procesarArchivo(var arc: archivo; var cant: integer; var prom: real);
var
	nro: integer;
begin
	while (not EOF(arc)) do begin
		read(arc, nro);
		writeln(nro);
		if (nro < 1500) then
			cant+= 1;
		prom+= nro;
	end;
	prom:= prom / fileSize(arc);
end;

VAR
	nombre: string[15];
	arc: archivo;
	cantMenores1500: integer;
	promArchivo: real;
BEGIN
	writeln('Ingrese un nombre de archivo');
	readln(nombre);
	assign(arc, nombre);
	reset(arc);
	cantMenores1500:= 0;
	promArchivo:= 0;
	procesarArchivo(arc, cantMenores1500, promArchivo);
	writeln('Cantidad de numeros menores a 1500: ', cantMenores1500);
	writeln('Promedio de los numeros ingresados: ', promArchivo:0:2);
END.
