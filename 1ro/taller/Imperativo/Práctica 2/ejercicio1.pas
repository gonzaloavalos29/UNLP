{1.- Implementar un programa que invoque a los siguientes modulos.
a. Un modulo recursivo que retorne un vector de a lo sumo 15 numeros enteros (random) mayores a 10 y menores a 155 (incluidos ambos). La carga finaliza con 
el valor 20.
b. Un modulo no recursivo que reciba el vector generado en a) e imprima el contenido del vector.
c. Un modulo recursivo que reciba el vector generado en a) e imprima el contenido del vector.
d. Un modulo recursivo que reciba el vector generado en a) y devuelva la suma de los valores pares contenidos en el vector.
e. Un modulo recursivo que reciba el vector generado en a) y devuelva el maximo valor del vector.
f. Un modulo recursivo que reciba el vector generado en a) y un valor y devuelva verdadero si dicho valor se encuentra en el vector o falso en caso contrario.
g. Un modulo que reciba el vector generado en a) e imprima, para cada numero contenido en el vector, sus digitos en el orden en que aparecen en el numero. 
Debe implementarse un modulo recursivo que reciba el numero e imprima lo pedido. Ejemplo si se lee el valor 142, se debe imprimir 1  4  2
}

Program Clase2MI;
const dimF = 15;
      min = 10;
      max = 155;
type vector = array [1..dimF] of integer;
     

procedure CargarVector (var v: vector; var dimL: integer);

  procedure CargarVectorRecursivo (var v: vector; var dimL: integer);
  var valor: integer;
  begin
    valor:= min + random (max - min + 1);
    if ((valor <> 20 ) and (dimL < dimF)) 
    then begin
          dimL:= dimL + 1;
          v[dimL]:= valor;
          CargarVectorRecursivo (v, dimL);
         end;
  end;
  
begin
  dimL:= 0;
  CargarVectorRecursivo (v, dimL);
end;
 
procedure ImprimirVector (v: vector; dimL: integer);
var
   i: integer;
begin
     for i:= 1 to dimL do
         write ('----');
     writeln;
     write (' ');
     for i:= 1 to dimL do begin
        write(v[i], ' | ');
     end;
     writeln;
     for i:= 1 to dimL do
         write ('----');
     writeln;
     writeln;
End;     

procedure ImprimirVectorRecursivo (v: vector; dimL: integer);
begin    
     if (dimL > 0) then begin
		writeln('El numero es: ', v[dimL]);
		imprimirVectorRecursivo(v, dimL-1);
	end;
end; 
    
function Sumar (v: vector; dimL: integer): integer; 

  function SumarRecursivo (v: vector; pos, dimL: integer): integer;
  Begin
    if (pos <= dimL)  
    then SumarRecursivo:= SumarRecursivo (v, pos + 1, dimL) + v[pos]  
    else SumarRecursivo:=0  
  End;
  
var pos: integer; 
begin
 pos:= 1;
 Sumar:= SumarRecursivo (v, pos, dimL);
end;

function  ObtenerMaximo (v: vector; dimL: integer): integer;

  function maximoRecursivo(v: vector; dimL: integer; var num: integer): integer;
  begin
	if (dimL = 0) then
		maximoRecursivo:= num // caso base: cuando lelgamos al final del vector
	else begin
		if (v[dimL] > num) then
			num:= v[dimL]; // actualiza el máximo si encontramos un valor mayor
		maximoRecursivo:= maximoRecursivo(v, dimL-1, num); // Llamada recursiva
	end;
  end;

var
	max: integer;
begin
	max:= 0;
	ObtenerMaximo:= maximoRecursivo(v, dimL, max);
end;     
     
function  BuscarValor (v: vector; dimL, valor: integer): boolean;

	function buscarValorRecursivo(v: vector; dimL, valor: integer): boolean;
	begin
		if (dimL = 0) then
			buscarValorRecursivo:= false
		else begin
			if (v[dimL] = valor) then
				buscarValorRecursivo:= true
			else
				buscarValorRecursivo:=buscarValorRecursivo(v, dimL-1, valor); // continúa buscando
		end;
	end;
	
begin
  buscarValor:= buscarValorRecursivo(v, dimL, valor);
end; 

procedure ImprimirDigitos (v: vector; dimL: integer);

	procedure imprimir(num: integer);
	begin
		if (num < 10) then
			write(num, ' ')
		else begin
			imprimir(num DIV 10); { LLAMA RECURSIVO }
			write(num MOD 10, ' '); { IMPRIME EL ÚLTIMO DÍGITO DESPUÉS DEL RECURSIÓN }
		end;
	end;

begin    
     if (dimL > 0) then begin
		imprimir(v[dimL]);
		writeln;
		imprimirDigitos(v, dimL-1);
	end;
end; 

VAR
	dimL, suma, maximo, valor: integer; 
    v: vector;
    encontre: boolean;
BEGIN
	suma:= 0; maximo:= -1; valor:= 0;
	CargarVector (v, dimL);
	writeln;
	if (dimL = 0) then 
		writeln ('--- Vector sin elementos ---')
    else begin
        ImprimirVector (v, dimL); {  ImprimirVectorRecursivo (v, dimL);}
    end;
    writeln;
    writeln;                   
    suma:= Sumar(v, dimL);
    writeln;
    writeln;
    writeln('La suma de los valores del vector es ', suma); 
    writeln;
    writeln;
    maximo:= ObtenerMaximo(v, dimL);
    writeln;
    writeln;
    writeln('El maximo del vector es ', maximo); 
    writeln;
    writeln;
    write ('Ingrese un valor a buscar: ');
    read (valor);
    encontre:= BuscarValor(v, dimL, valor);
    writeln;
    writeln;
    if (encontre) then 
		writeln('El ', valor, ' esta en el vector')
    else 
		writeln('El ', valor, ' no esta en el vector');
                
    writeln;
    writeln;
    ImprimirDigitos (v, dimL);
end.
