program ej10;
function esVocal(ch: char): boolean;
	begin
		esVocal:= (ch='a') or (ch='e') or (ch='i') or (ch='o') or (ch='u');
	end;
function esConsonante(ch: char): boolean;
	begin
		esConsonante:= ((ch >= 'b') and (ch <= 'z')) and (not esVocal(ch));
	end;
procedure seCumpleSecx(var verif: boolean);
	var
		ch: char;
	begin
		writeln(' --- SECUENCIA X --- ');
		write('Ingrese una vocal: '); readln(ch);
		while(ch <> '$') and (verif) do begin
			if (not esVocal(ch)) then begin
				verif:= false;
			end
			else begin
				write('Ingrese otra vocal: '); readln(ch);
			end;
		end;
	end;
procedure seCumpleSecY(var verif: boolean);
	var
		ch: char;
	begin
		writeln('                    ');
		writeln(' --- SECUENCIA Y ---');
		write('Ingrese una consonante: '); readln(ch);
		while (ch <> '#') and (verif) do begin
			if (not esConsonante(ch)) then begin
				verif:= false;
			end
			else begin
				write('Ingrese otra consonante: '); readln(ch);
			end;
		end;
	end;
var
	verif: boolean;
begin
	verif:= true;
	seCumpleSecX(verif);
	if (verif) then begin
		seCumpleSecY(verif);
		if (verif) then begin
			write('SE CUMPLE LA SECUENCIA');
		end
		else begin
			write('NO SE CUMPLE LA SECUENCIA Y');
		end;
	end
	else begin
		write('NO SE CUMPLE LA SECUENCIA X');
	end;
end.
