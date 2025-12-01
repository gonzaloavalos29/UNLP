{El responsable de Sistemas de un negocio con varias sucursales obtiene mensualmente
un archivo binario de cada una de ellas con el registro de facturas de ventas del mes pasado.
Un programa que ya existe extrae de los registros de cada archivo de sucursal el c�digo
de producto, cantidad vendida y precio de venta de cada producto que aparezca en una factura,
dejando esta informaci�n en otro archivo binario por cada sucursal, que luego ordena por
c�digo de producto.
El procedimiento Reporte recibe estos archivos de ventas mensuales ordenadas por producto
(asignados y sin abrir) y, recorri�ndolos una �nica vez, reporta en un archivo de texto
(que tambi�n se recibe asignado y sin abrir) y en una l�nea por cada producto:
el c�digo de producto, la cantidad de unidades vendidas del mismo en cada sucursal
(una columna por sucursal) y el total de pesos obtenido en el mes por ventas de ese producto
(el precio de venta del mismo producto puede variar entre sucursales y entre registros
de la misma sucursal). Se generaliza la soluci�n para 5 sucursales, pero el procedimiento
recibe el n�mero real se sucursales con las que se trabaja. Se codifica tambi�n la funci�n
para obtener el �ndice al m�nimo c�digo de producto.}

Const CGSS = 5; {Cantidad General de Sucursales}
      MaxCod = 65535; {M�ximo C�digo de Producto (inalcanzable)}

Type
    tReg = Record codProd: Word; cant: Byte; pv: Real end;

    tArch = File of tReg; {ordenado por codProd y con repeticiones del mismo
    codProd}

	tCtrlArch = Record a: tArch; r: tReg; prodActual: Word end; {control de
    archivo de sucursal}

	tCtlMerge = Record
		crss: 1..CGSS; {cantidad real de sucursales}
		suc: Array[1..CGSS] of tCtrlArch
		end;

Procedure Reporte( var ctl: tCtlMerge; var ventas: Text );

     Function min( var ctl: tCtlMerge ): Byte;
     var m, i: Byte;
     begin
          m:=1;
          for i:=2 to ctl.crss do
              if ctl.suc[i].r.codProd > ctl.suc[m].r.codProd then m:=i;
          min:=m
     end; {Min}

     Procedure leer( var a: tArch; var r: tReg );
     begin
          if eof(a) then r.codProd:=MaxCod else read(a, r)
     end;

var s, sm: Byte; {n�meros de sucursal para recorrido y con codprod m�nimo}
    codProdAct: Word;
    cant: Array[1..CGSS] of Word;
    totPesosPA: Real; {pesos producto actual}

begin {Reporte}

{Inicializaci�n}
for s:=1 to ctl.crss do with ctl.suc[s] do begin
    reset(a); leer(a, r); prodActual:=r.codProd;
    end;

rewrite(ventas);
for s:=1 to ctl.crss do write(ventas, 'Suc.', s:2); {columnas de 6 espacios}
writeln(ventas, ' Total Pesos');

sm:=min(ctl); {�ndice de sucursal con codProd m�nimo}

{Proceso}
while ctl.suc[sm].r.codProd<>maxCod do begin {ciclo de recorrido de productos}

     {inicializaci�n producto actual}
     codProdAct:=ctl.suc[sm].r.codProd; totPesosPA:=0;
     for s:=1 to ctl.crss do with ctl.suc[s] do cant[s]:=0;

     while ctl.suc[sm].r.codProd=codProdAct do begin {ciclo de recorrido de
     sucursales con codProdAct}
           while ctl.suc[sm].r.codProd=ctl.suc[sm].prodActual do begin {ciclo
           de recorrido por sucursal para procesamiento del producto actual}
                 cant[sm]:=cant[sm]+ctl.suc[sm].r.cant;
                 totPesosPA:=totPesosPA+cant[sm]*ctl.suc[sm].r.pv;
                 leer(ctl.suc[sm].a, ctl.suc[sm].r)
                 end;
           {corte de control por sucursal}
           ctl.suc[sm].prodActual:=ctl.suc[sm].r.codProd;
           sm:=min(ctl);
           end;
     {corte de control por producto}
     for s:=1 to ctl.crss do write(ventas, cant[s]:6);
     writeln(ventas, totPesosPA:6:2)
     end;

{Finalizaci�n}
for s:=1 to ctl.crss do with ctl.suc[s] do close(a);
close(ventas)

end; {Reporte}

begin

end.
