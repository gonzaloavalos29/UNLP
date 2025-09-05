program prueba;

VAR
	rand, i: integer;
BEGIN
	Randomize;
	for i:= 1 to 100 do begin
		rand:= Random(10-1)+1;
		writeln(rand);
	end;
END.
