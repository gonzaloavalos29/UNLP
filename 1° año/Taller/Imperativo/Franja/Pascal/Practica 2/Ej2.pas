program ej2p2;

procedure impDig(n:integer);
var
	dig: integer;
begin
	if (n <> 0)then begin
		dig:= n MOD 10;
		n:= n DIV 10;
		impDig(n);
		write(dig,' ');
		//impDig(n);
	end;
end;

var
	num: integer;
Begin
	write('Ingresar un numero: ');readln(num);
	while(num <> 0)do begin
		impDig(num);
		writeln('');
		write('Ingresar otro numero: ');readln(num);
	end;
end.
