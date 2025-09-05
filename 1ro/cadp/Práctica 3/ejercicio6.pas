program Prac3Ejerc6;
const 
  corte = 0;
type
 str40 = string[40];
 micro = record
  marca : str40;
  linea : str40;
  cantCores: integer;
  velocidad: real;
  transistores: integer;
 end;
procedure leer(var m : micro);
begin
 read(m.marca);
 read(m.linea);
 read(m.cantCores);
 read(m.velocidad);
 read(m.transistores);
end;
procedure maximos(marca: str40; cant: integer; var marcaMax1, marcaMax2: str40; 
      var cantMax1, cantMax2: integer);
begin
 if(cant > cantMax1) then
 begin 
  marcaMax2 := marcaMax1;
  cantMax2 := cantMax1;
  marcaMax1 := marca;
  cantMax1 := cant;
 end
 else if(cant > cantMax2) then
      begin
          marcaMax2 := marca;
          cantMax2 := cant;
      end;
end;

var
  m: micro;
  marcaAux, marcaMax1, marcaMax2 : str40;
  cant, cantMulticore, cantMax1, cantMax2: integer;
begin
    cantMax1 := -9999;
    cantMax2 := -9999;
    cantMulticore := 0;
    leer(m);
    while (m.cantCores <> corte) do
    begin
      cant := 0;
      marcaAux := m.marca;
      while ((m.cantCores <> corte) AND (marcaAux = m.marca)) do
      begin
        if(((m.marca = 'Intel') OR (m.marca = 'AMD')) AND (m.velocidad >= 2)) then
         cantMulticore := cantMulticore +1;
       if (m.transistores = 14) then cant := cant + 1;
       if((m.cantCores > 2) AND (m.transistores <= 22)) then
        writeln(m.marca, ' ', m.linea)
        
       leer(m);
      end;
      maximos(marcaAux, cant, marcaMax1, marcaMax2, cantMax1, cantMax2)
     
    end;
    
    writeln('Las dos marcas con mayor cantidad de procesadores con ', 
             'transistores de 14 nm son: ', marcaMax1, ' y ', marcaMax2)
    writeln(cantMulticore);
end.

