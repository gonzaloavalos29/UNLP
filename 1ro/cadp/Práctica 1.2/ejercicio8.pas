Program ejercicio8;
const
	fin = 0;
var
	montoTot, diaVenta, mayorVenta, dia: integer;
begin
	montoTot:= 0; mayorVenta:= -99;
	repeat
		writeln('Por favor ingrese el dia y el monto de venta total del dia: ');
		readln(dia, diaVenta);
		while((dia<0) or (dia>31)) do begin
			writeln('Datos invalidos, vuelva a ingresar dia y monto de venta total del dia:');
			readln(dia, diaVenta);
		end;
		if (diaVenta > mayorVenta) then
			mayorVenta:= diaVenta;
		montoTot := montoTot+diaVenta;
	until (dia = 0);
	writeln('Monto total: ', montoTot);
	writeln('Dia de mayor venta: ', mayorVenta);
End.
