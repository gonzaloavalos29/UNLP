program ProgramaListas;

type
  Lista = ^nodo;
 
  nodo= record
    dato: integer;
    sig:lista
    end;

procedure CargarLista(var L: lista; a, b: integer);
var
  ale: integer;
  aux:lista;
begin
  randomize;  { Inicializa la generación de números aleatorios }
  ale := random(b - a + 1) + a;
  L:=nil;
      while (ale <> 120) do
        begin
          new(aux);
          aux^.dato:=ale;
          aux^.sig:=nil;
             if (L= nil)then
               L:=aux
                 else begin
                 aux^.sig:=L;
                 L:=aux;
                end;
          ale := random(b - a + 1) + a;
         end;
     end;


procedure ImprimirLista(L: lista);
var
  aux:lista;
begin
  aux:=L;
  while (aux<>nil)do begin
  writeln (aux^.dato);
  aux:=aux^.sig;
  end;
end;

function buscar(l: lista; num: integer): boolean;
begin
	buscar:= False;
	while ((l <> nil) and (buscar = false)) do begin
		if (l^.dato = num) then
			buscar:= True
		else
			l:= l^.sig;
	end;
end;

// Programa principal
var
  a: integer;
  b: integer;
  esta: boolean;
  L:lista;
begin
  writeln('Ingrese un número 100 para min a: ');
  readln(a);

  writeln('Ingrese un número 150 para max b: ');
  readln(b);

  CargarLista( L, a, b);
  ImprimirLista(L);
  esta:= buscar(l, 110);
  writeln(esta);
End. 
