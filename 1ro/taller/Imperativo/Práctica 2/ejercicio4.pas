program p2ej4;

procedure binario(num: integer);
begin
	if (num > 0) then begin
		binario(num DIV 2);
		writeln(num MOD 2);
	end;
end;

procedure decimalABinario();
var
	num: integer;
begin
	writeln('Ingrese numero en sistema decimal: ');
	readln(num);
	while (num <> 0) do begin
		binario(num);
		writeln('Ingrese numero en sistema decimal: ');
		readln(num);
	end;
end;

BEGIN
	decimalABinario();
END.
