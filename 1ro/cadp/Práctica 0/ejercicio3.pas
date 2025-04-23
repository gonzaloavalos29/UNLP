Program ejercicio3;
var
 numero1, numero2, division: Real;
begin
 writeln('Ingrese dos numeros');
 numero1:= 0.00;
 numero2:= 0.00;
 division:= 0.00;
 read(numero1, numero2);
 writeln('Se ingresaron los valores: ', numero1, ' y ', numero2);
 division := (numero1 / numero2);
 writeln(division:1:2);
end.
