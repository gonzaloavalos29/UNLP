program ejercicio2;
const
	corte = 0;
function descomponerNumero(n: integer): integer;
begin
	if (n <> corte) then begin // Verificar que el número no sea 0
		descomponerNumero(n div 10); // Pasar de manera recursiva el mismo número dividido por 10
		writeln((n mod 10));
	end;
	descomponerNumero:= 0;
end;
var
	numero: integer;
begin
	randomize;
	numero:= Random(1000);
	write('Número: ', numero);
	descomponerNumero(numero);
end.
