Program ejercicio5;
var
 cantidad_clientes, cantidad_caramelos, cant_cliente,cant_sobrante: integer;
begin
 writeln('Ingrese la cantidad de clientes, y a continuacion, la cantidad de caramelos:');
 readln(cantidad_clientes, cantidad_caramelos);
 cant_cliente := cantidad_caramelos div cantidad_clientes;
 cant_sobrante := cantidad_caramelos mod cantidad_clientes;
 write('clientes: ', cantidad_clientes, ' caramelos: ', cantidad_caramelos, ' cantidad por cliente: ', cant_cliente, ' cantidad sobrante: ', cant_sobrante);
end.
