Program ejercicio8;
const
	MAX_CARACTERES = 3;
var
	letra: char;
	i, cant_vocales, cant_caracteres: integer;
	son_vocales, uno_es_vocal: boolean;
begin
	i:= 0;
	cant_vocales:= 0;
	while (i<MAX_CARACTERES) do begin
		writeln('Ingrese un caracter');
		readln(letra);
		if ((letra='a') or (letra='e') or (letra='i') or (letra='o') or (letra='u')) then
			cant_vocales:= cant_vocales+1;
		i := i+1;
	end;
	if (cant_vocales = 3) then
		writeln('Los tres son vocales')
	else
		if (cant_vocales>0) then
			writeln('al menos un caracter no era vocal')
		else
			writeln('Ningun caracter era vocal')
End.
