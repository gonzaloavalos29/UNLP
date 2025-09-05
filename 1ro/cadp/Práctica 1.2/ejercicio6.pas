Program ejercicio6;
const
	max_productos= 5;
var
	i, precio, codigo, codigo1, codigo2, cantProductosPar: integer;
begin
	codigo1:= 9999; codigo2:= 9999; cantProductosPar:= 0;
	for i:= 1 to max_productos do begin
		writeln('Ingrese codigo de producto y precio: ');
		readln(codigo, precio);
		while((codigo<1) or (codigo>200)) do begin
			writeln('Por favor ingrese un codigo valido:');
			readln(codigo, precio);
		end;
		if(codigo < codigo1) then begin
			codigo2:= codigo1;
			codigo1:= codigo;
		end
		else
			if(codigo<codigo2) then
				codigo2:= codigo;
		if((precio>16) and ((codigo mod 2) = 0)) then
			cantProductosPar := cantProductosPar+1;
	end;
	writeln('Los codigos de los dos productos mas baratos son: ', codigo1, ' y ', codigo2);
	writeln('La cantidad de productos de mas de 16 pesos con codigo par es: ', cantProductosPar);
End.
