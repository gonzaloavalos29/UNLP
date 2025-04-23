{
   Ej2P3.pas
   
   2. Escribir un programa que:
a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee
código de producto, fecha y cantidad de unidades vendidas. La lectura finaliza con el código de
producto 0. Un producto puede estar en más de una venta. Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendida.
Nota: El módulo debe retornar los dos árboles.
b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.
c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.
   
}


program untitled;
const
  FIN=0;
type
  producto=record
    codProd:integer;
    unidadesVendidas:integer;
   end;
  venta=record//falta lista de ventas y el cod de venta va afuera ya que luego es mas facil generar el arbol de productos
    dato:producto;
    fecha:integer;
   end;
  raizProducto=^nodoProducto;
  nodoProducto=record
    dato:producto;
    HI:raizProducto;
    HD:raizProducto;
   end;
  raiz=^nodo;
  nodo=record
    dato:venta;//todas las ventas de ese codigo de producto
    HI:raiz;
    HD:raiz;
   end;
procedure leerVenta(var v:venta);
  begin
    write('ingrese cod de producto: ');readln(v.dato.codProd);
    if(v.dato.codProd<>FIN)then
      begin
        write('ingrese cantidad de unidades vendidas: ');readln(v.dato.unidadesVendidas);
        write('ingrese fecha: ');readln(v.fecha);
      end;
  end;
procedure agregarArbol(var a:raiz;v:venta);
  begin
    if(a=nil)then
      begin
        new(a);
        a^.dato:=v;
        a^.HD:=nil;a^.HI:=nil;
      end
    else
      if(v.dato.codProd>a^.dato.dato.codProd)then
        agregarArbol(a^.HD,v)
      else
        if(v.dato.codProd<=a^.dato.dato.codProd)then
          agregarArbol(a^.HI,v);
  end;
procedure llenarProducto(var p:producto;v:venta);
  begin
    p.codProd:=v.dato.codProd;
    p.unidadesVendidas:=v.dato.unidadesVendidas;
  end;
procedure agregarArbolProductos(var a:raizProducto;p:producto);
  begin
    if(a=nil)then
      begin
        new(a);
        a^.dato:=p;
        a^.HD:=nil;a^.HI:=nil;
      end
    else
      if(p.codProd=a^.dato.codProd)then
        a^.dato.unidadesVendidas:=a^.dato.unidadesVendidas+p.unidadesVendidas
      else
        if(p.codProd>a^.dato.codProd)then
          agregarArbolProductos(a^.HD,p)
        else
          if(p.codProd<=a^.dato.codProd)then
            agregarArbolProductos(a^.HI,p);
  end;
procedure generarArboles(var a:raiz;var aProd:raizProducto);
  var
    v:venta;
    p:producto;
  begin
    leerVenta(v);
    llenarProducto(p,v);
    while(v.dato.codProd<>FIN)do
      begin
        agregarArbol(a,v);
        agregarArbolProductos(aProd,p);
        leerVenta(v);
        llenarProducto(p,v);
      end;
  end;
procedure cantArbolVentas(a:raiz;cod:integer;var cantVendidas:integer;var ok:boolean);//esta bien ???//hacer como funcion
  begin
    //ok:=true;//por referencia
    if((a<>nil)and(ok))then
      begin
        if(a^.dato.dato.codProd=cod)then
          begin
            cantVendidas:=cantVendidas+a^.dato.dato.unidadesVendidas;
            cantArbolVentas(a^.HI,cod,cantVendidas,ok);
            ok:=false;
          end
        else
          if(cod>a^.dato.dato.codProd)then
            cantArbolVentas(a^.HD,cod,cantVendidas,ok)
          else
            if(cod<a^.dato.dato.codProd)then
              cantArbolVentas(a^.HI,cod,cantVendidas,ok) 
      end;
  end;
function cantArbolProductos(a:raizProducto;cod:integer):integer;
  var
    tot:integer;
  begin
    if(a<>nil)then
      begin
        if(cod=a^.dato.codProd)then
          begin
            tot:=a^.dato.unidadesVendidas;
            cantArbolProductos:=tot;
          end
        else
          if(cod>a^.dato.codProd)then
            cantArbolProductos:=cantArbolProductos(a^.HD,cod)
          else
            if(cod<a^.dato.codProd)then
             cantArbolProductos:=cantArbolProductos(a^.HI,cod);
      end
    else
      cantArbolProductos:=-1;
  end;
procedure imprimirArbolProductos(a:raizProducto);
  begin
    if(a<>nil)then
      begin
        imprimirArbolProductos(a^.HI);
        write('|cod:',a^.dato.codProd,' cant:',a^.dato.unidadesVendidas,'|');
        imprimirArbolProductos(a^.HD);
      end;
  end;
var
  arbol:raiz;
  arbolP:raizProducto;
  cantVendidas:integer;
  ok:boolean;
BEGIN
  arbol:=nil;arbolP:=nil;cantVendidas:=0;ok:=false;
  generarArboles(arbol,arbolP);	
  cantArbolVentas(arbol,1,cantVendidas,ok);
  write('arbol ventas: ');
  writeln('cantidad de ventas del cod de producto 1 es de :',cantVendidas);writeln();
  imprimirArbolProductos(arbolP);writeln();
  write('arbol prodcutos: ');
  writeln('cantidad de ventas del cod de producto 1 es de :',cantArbolProductos(arbolP,1));
END.

