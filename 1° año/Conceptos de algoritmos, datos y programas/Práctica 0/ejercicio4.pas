Program ejercicio4;
Const
 pi = 3.14;
var
 diametro, area, perimetro: real;
begin
 writeln('Ingrese un diametro');
 read(diametro);
 perimetro := pi * (diametro/2);
 area := pi * Exp((2)*Ln(diametro/2));
 writeln('El diametro es: ', diametro:1:1, ' El perimetro es ', perimetro:1:1, ' El area es: ', area:1:1); 
end.
