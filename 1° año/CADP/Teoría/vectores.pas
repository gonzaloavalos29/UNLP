program uno;
const
	fisica = 10;
type
	numeros = array [1..fisica] of integer;
	
// Agregar
procedure agregar(var a: numeros; var dL: integer; var num:boolean; pude: integer);
begin
	pude:= false;
	if ((dL + 1) <= fisica) then // verifico si hay espacio
		begin
			pude:= true;
			dL:= dL + 1;
			a[dL]:= num;
		end;
	end;
	
// Insertar
	
procedure insertar (var a: numeros; var dL: integer; var pude: boolean; num: integer; pos: integer);
var
	i: integer;
begin
	pude:= false;
	if ((dL + 1) <= fisica) and (pos>=1) and (pos <= dL)) then begin // verifico si hay espacio y que la posicion sea valida
		for i:= dL downto pos do
			a[i+1]:= a[i]; // hacer lugar para insertar el elemento
		pude:= true;
		a[pos]:= valor;
		dL:= dL + 1;
	end;
end;
	
// Eliminar
procedure eliminar (var a: numeros; var dL: integer; var pude: boolean; pos integer);
var
	i: integer;
begin
	pude:= false;
	if ((pos >= 1) and (pos <= dL)) then begin // verifico que la posicion esté entre la dF y la dL
		for i:= pos to (dL-1) do
			a[i]:= a[i+1]; // corrimiento de la posicion hasta el final
		pude:= true;
		dL:= dL - 1; // Decremento
	end;
end;
	
var
	VN: numeros;
	dimL, valor: integer;
	ok: boolean;
begin
	cargar(VN, dimL);
	read(valor);
	agregar(VN, dimL, valor, ok);
	insertar(VN, dimL, valor, ok, pos);
	eliminar(VN, dimL, ok, pos);
end.
