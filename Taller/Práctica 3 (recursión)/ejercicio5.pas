// Búsqueda dicotómica iterativa
procedure busquedaDicotomica(v: vector; ini, fin: indice; dato: integer; var pos: indice);
var
	medio: integer;
begin
	medio:= (ini + fin) div 2;
	pos:= 0;
	while (ini <= fin) and (dato <> v[medio]) do begin
		if (dato < v[medio]) then
			fin:= medio-1
		else
			ini:= medio+1;
		medio:= (ini + fin) div 2;
	end;
	if (ini <= fin) and (valor = v[medio]) then
		pos:= medio
	else
		pos:= -1;
end;
// Búsqueda dicotómica recursiva
procedure busquedaDicotomica(v: vector; ini, fin: indice; dato: integer; var pos: integer);
    var
        mitad: integer;
    begin
        if (ini <= fin) then begin
            mitad:= (ini + fin) div 2;
            writeln('Dato: ',v[mitad], ' posición: ',mitad);
            if (v[mitad] > dato) then begin
                busquedaDicotomica(v, ini, mitad - 1, dato, pos);
            end else if (v[mitad] < dato) then begin
                busquedaDicotomica(v, mitad + 1, fin, dato, pos);
            end else begin
                pos:= mitad;
                writeln('Dato: ',v[pos]);
            end;
        end;
    end;
