program maestro_detalle;
const
	valoralto = 'ZZZZ';
type
	str4 = string[4];
	producto = record	
		cod: str4;
		descripcion: string[30];
		pu: real;
		stock: integer;
	end;
	venta_prod = record
		cod: str4;
		cant_vendida: integer;
	end;
	detalle = file of venta_prod;
	maestro = file of producto;
	
procedure leer(var archivo: detalle; var dato: venta_prod);
begin
	if (not EOF(archivo)) then
		read(archivo, dato)
	else
		dato.cod:= valoralto;
end;

VAR
	mae: maestro;
	det: detalle;
	total: integer;
	regm: producto;
	regd: venta_prod;
	aux: str4;
BEGIN
	assign(mae, 'maestro');
	assign(det, 'detalle');
	reset(mae);
	reset(det);
	read(mae, regm);
	leer(det, regd);
	{ Se procesan todos los registros del archivo detalle }
	while (regd.cod <> valoralto) do begin
		aux:= regd.cod;
		total:= 0;
		{ Se totaliza la cantidad vendida de productos iguales en el archivo de detalle }
		while (aux = regd.cod) do begin
			total:= total + regd.cant_vendida;
			leer(det, regd);
		end;
		{ Se busca el producto del detalle en el maestro }
		while (regm.cod <> aux) do
			read(mae, regm);
		{ Se modifica el stock del producto con la cantidad total vendida de ese producto }
		regm.cant:= regm.cant - total;
		{ Se reubica el puntero en el maestro }
		seek(mae, filepos(mae)-1);
		{ Se actualiza el maestro }
		write(mae, regm);
		{ Se avanza en el maestro }
		if (not EOF(mae)) then
			read(mae, regm);
	end;
	close(det);
	close(mae);
END.
