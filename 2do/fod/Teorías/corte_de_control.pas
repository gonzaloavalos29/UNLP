program ejemplo;
const
	valor_alto = 'ZZZ';
type
	nombre = string[30];
	reg_venta = record
		vendedor: integer;
		monto: real;
		sucursal: nombre;
		ciudad: nombre;
		provincia: nombre;
	end;
	ventas = file of reg_venta;

procedure leer(var archivo: ventas; var dato: reg_venta);
begin
	if (not EOF(archivo)) then
		read(archivo, dato)
	else
		dato.provincia:= valor_alto;
end;	
VAR
	reg: reg_venta;
	archivo: ventas;
	total, totProv, totCiudad, totSuc: real;
	prov, ciudad, sucursal: nombre;
BEGIN
	assign(archivo, 'archivo_ventas');
	reset(archivo);
	leer(archivo, reg);
	total:= 0;
	while (reg.provincia <> valor_alto) do begin
		writeln('Provincia: ', reg.provincia);
		prov:= reg.provincia;
		totProv:= 0;
		while (prov = reg.provincia) do begin
			writeln('Ciudad: ', reg.ciudad);
			ciudad:= reg.ciudad;
			totCiudad:= 0;
			while (prov = reg.provincia) and (ciudad = reg.ciudad) do begin
				writeln('Sucursal: ', reg.sucursal);
				sucursal:= reg.sucursal;
				totSuc:= 0;
				while (prov = reg.provincia) and (ciudad = reg.ciudad) and (sucursal = reg.sucursal) do begin
					write('Vendedor: ', reg.vendedor);
					writeln(reg.monto);
					totSuc:= totSuc + reg.nombre;
					leer(archivo, reg);
				end;
				writeln('Total sucursal: ', totSuc);
				totCiudad:= totCiudad + totSuc;
			end; { while (prov = reg.provincia) and (ciudad = reg.ciudad) }
			writeln('Total ciudad: ', totCiudad);
			totProv:= totProv + totCiudad;
		end; { while (prov = reg.provincia) }
		writeln('Total provincia: ', totProv);
		total:= total + totProv;
	end; { while (reg.provincia <> valor_alto) }
	writeln('Total empresa: ', total);
	close(archivo);
END.
