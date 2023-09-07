program potencias;

Function potencia(x,n:integer): integer;
begin
  if (n = 0) then 
	potencia:= 1
  else if (n = 1) then 
	potencia:= x
  else
    potencia:= x * potencia(x, n-1); 
end;

begin
	writeln(potencia(4, 3));
end.

