uses UProductos, CRT;

var opc: char;

begin
writeln('Programa de mantenimiento de productos');
writeln;
write('Desea crear un nuevo archivo? (s|n): ');
readln(opc);
writeln;
if (opc='s') or (opc='S') then Crear(ctlArch);
Abrir(ctlArch);
repeat
ClrScr;
writeln('1. Incorporar un producto');
writeln('2. Eliminar un producto');
writeln('3. Listar productos en productos.txt');
writeln('4. Ver estado del archivo');
writeln('5. Terminar el programa');
writeln;
write('Ingrese opcion: ');
readln(opc);
case opc of
'1': begin
	writeln;
	producto.valido:=True;
	write('Identificador: '); readln(producto.id);
	write('Descripcion: '); readln(producto.descrip);
	write('Precio: '); readln(producto.precio);
	write('Cantidad en stock: '); readln(producto.stock);
	Insertar(ctlArch, producto, resultado);
	if resultado=duplicado
	then write('Ya existe un producto con ese identificador. ')
	else write('Producto agregado exitosamente. ');
	write('Pulse Enter para continuar.'); readln
	end;
'2': begin
	writeln;
	write('Identificador del producto a eliminar: '); readln(idProducto);
	Eliminar(ctlArch, idProducto, resultado);
	if resultado=inexistente
	then write('No existe producto con ese identificador. ')
	else write('Producto eliminado exitosamente. ');
	write('Pulse Enter para continuar.'); readln
	end;
'3': begin
	Reportar(ctlArch, listado);
	writeln;
	write('El listado ya esta disponible. Pulse Enter para continuar.');
	readln
	end;
'4': begin
	with ctlArch do begin
		writeln;
		seek(arch, 0);
		repeat
			read(arch, r);
			if not r.valido
			then writeln('siguiente libre: ', r.proxLibre)
			else writeln(r.id:5, r.descrip:30, r.precio:10:2, r.stock:5)
			until eof(arch)
		end;
	writeln;
	write('Pulse Enter para continuar.');
	readln
	end;
'5': begin
	Cerrar(ctlArch);
	writeln;
	write('Fin del programa. Pulse Enter para salir.');
	readln
	end
end {case}
until opc='5'
end.
